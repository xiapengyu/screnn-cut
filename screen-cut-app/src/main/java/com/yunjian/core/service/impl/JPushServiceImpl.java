package com.yunjian.core.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.JpushDataDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.JPushService;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

@Service
public class JPushServiceImpl implements JPushService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${jpush.appKey}")
    private String appKey = "";

    @Value("${jpush.masterSecret}")
    private String masterSecret = "";

    /*ios 推送环境*/
    @Value("${jpush.apnsproduction}")
    private boolean apnsproduction;

    @Override
    public void pushByAlias(JpushDataDto data) {
        // 构建推送对象
        PushPayload pushPayload;
        PushPayload.Builder builder = PushPayload.newBuilder().setPlatform(Platform.all());
        builder.setAudience(Audience.alias(data.getAlias()));
        builder = setNotification(builder, data.getTitle(), data.getSubTitle(), data.getData(), data.isAvailable());
        builder = setOptions(builder);
        pushPayload = builder.build();
        ResponseDto response = executorPush(pushPayload, data.getSource(), data.getData().get("type"), data.toString());
        logger.info("推送结果{}", response);
    }

    /**
     * 说明: 设置推送通知参数.
     *
     * @return Builder
     */
    public PushPayload.Builder setNotification(PushPayload.Builder builder, String title, String subTitle, Map<String, String> data, boolean available) {
        return builder.setNotification(Notification.newBuilder()
                .setAlert(title)
                .addPlatformNotification(
                        AndroidNotification.newBuilder()
                                .setTitle(subTitle)
                                .addExtras(data)
                                .build()
                )
                .addPlatformNotification(
                        IosNotification.newBuilder()
                                .incrBadge(1)
                                .addExtras(data)
                                .setContentAvailable(available)
                                .build()
                )
                .build());
    }

    /**
     * 说明: setOptions.
     *
     * @param builder
     * @return
     */
    public PushPayload.Builder setOptions(PushPayload.Builder builder){
        return builder.setOptions(Options.newBuilder().setApnsProduction(apnsproduction).build());
    }

    /**
     * 说明: 执行推送
     * @param pushPayload
     * @param source
     * @param type
     * @param data
     * @return
     */
    public ResponseDto executorPush(PushPayload pushPayload, String source, String type, String data) {
        ResponseDto responseDto = new ResponseDto();
        JPushClient jpushClient = new JPushClient(masterSecret, appKey);
        try {
            //发起推送
            PushResult result = jpushClient.sendPush(pushPayload);
            jpushClient.close();
            responseDto.setMessage(String.valueOf(result.getResponseCode()));
            logger.info("push result{}", result);
            responseDto.setCode(Constant.SUCCESS_CODE);
            responseDto.setMessage(Constant.SUCCESS_MESSAGE);
            responseDto.setData(result.toString());
        } catch (APIConnectionException e) {
            //推送失败时返回失败信息
            responseDto.setData(null);
            responseDto.setCode(Constant.FAIL_CODE);
            responseDto.setMessage(e.getMessage());
            logger.error("Connection error. Should retry later. ", e);
            //添加告警信息
            //this.monitor(MonitorConstant.JPUSH_CON_FAIL,"APIConnectionException error:"+e.getMessage());
        } catch (APIRequestException e) {
            //推送失败时返回失败信息
            responseDto.setData(null);
            responseDto.setCode(Constant.FAIL_CODE);
            responseDto.setMessage(e.getErrorMessage());
            logger.error("Error response from JPush server. Should review and fix it. ", e);
            logger.info("HTTP Status: " + e.getStatus());
            logger.info("Error Code: " + e.getErrorCode());
            logger.info("Error Message: " + e.getErrorMessage());
            //添加告警信息
            //this.monitor(MonitorConstant.JPUSH_REQ_FAIL,"APIRequestException error:"+e.getErrorMessage());
        } catch (Exception e) {
            //添加告警信息
            //this.monitor(MonitorConstant.JPUSH_FAIL,"Exception error:"+e.getMessage());
            logger.error("executorPush 异常",e);
        }
        return responseDto;
    }
}
