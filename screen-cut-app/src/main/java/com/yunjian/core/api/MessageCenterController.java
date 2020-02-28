package com.yunjian.core.api;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.MessageCenter;
import com.yunjian.core.service.IMessageCenterService;

/**
 * <p>
 * 用户消息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-11
 */
@RestController
@RequestMapping("/api/message")
public class MessageCenterController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IMessageCenterService messageCenterServiceImpl;

    /**
     * 分页用户消息列表信息
     *
     * @param param
     * @return
     */
    @RequestMapping(value = "/queryPage", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryPage(@RequestBody Map<String, Object> param) {
        logger.info("分页用户消息列表信息{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            PageUtils page = messageCenterServiceImpl.queryPage(param);
            response.setData(page);
        } catch (Exception e) {
            logger.error("分页用户消息列表信息失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "分页用户消息列表信息失败");
        }
        return response;
    }

    /**
     * 查询用户消息列表信息
     *
     * @return
     */
    @RequestMapping(value = "/queryMsgList", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryMsgList() {
        logger.info("查询用户消息列表信息");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();
            List<MessageCenter> list = messageCenterServiceImpl.list(new QueryWrapper<MessageCenter>()
                    .eq("account_id", account.getId()).orderByDesc("create_time"));
            response.setData(list);
        } catch (Exception e) {
            logger.error("查询用户消息列表信息失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "查询用户消息列表信息失败");
        }
        return response;
    }

    /**
     * 查看消息详情
     *
     * @param param
     * @return
     */
    @RequestMapping(value = "/viewMessageDetail", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto viewMessageDetail(@RequestBody MessageCenter param) {
        logger.info("查看消息详情{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            MessageCenter msg = messageCenterServiceImpl.getOne(new QueryWrapper<MessageCenter>().eq("id", param.getId()));
            response.setData(msg);
            logger.info("查看消息详情结果{}", JsonUtil.toJsonString(response));

            //更新已读标记
            msg.setIsRead(1);
            messageCenterServiceImpl.saveOrUpdate(msg);
        } catch (Exception e) {
            logger.error("查看消息详情失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "查看消息详情失败");
        }
        return response;
    }

    /**
     * 删除消息通知信息
     *
     * @param param
     * @return
     */
    @RequestMapping(value = "/deleteMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto deleteMsg(@RequestBody Map<String, Object> param) {
        logger.info("删除消息通知信息{}", JsonUtil.toJsonString(param));
        if(param.get("idList") == null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "未选择要删除的信息");
        }
        List<Integer> idList = (List<Integer>)param.get("idList");
        if(idList.isEmpty()){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "未选择要删除的信息");
        }
        return messageCenterServiceImpl.deleteMsg(idList);
    }

    /**
     * 生成消息通知信息
     *
     * @param param
     * @return
     */
    @RequestMapping(value = "/saveMsg", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto saveMsg(@RequestBody MessageCenter param) {
        logger.info("生成消息通知信息{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        param.setCreatorId(0L);
        param.setUpdateTime(new Date());
        param.setDeleteFlag(1);
        param.setCreateTime(new Date());
        param.setIsRead(0);
        messageCenterServiceImpl.save(param);
        return response;
    }

}
