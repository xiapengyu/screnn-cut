package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.thread.JpushThread;
import com.yunjian.common.utils.*;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.MessageCenter;
import com.yunjian.core.entity.PushMsg;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.mapper.PushMsgMapper;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IMessageCenterService;
import com.yunjian.core.service.IPushMsgService;
import com.yunjian.core.service.JPushService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * <p>
 * 推送消息管理表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@Service
public class PushMsgServiceImpl extends ServiceImpl<PushMsgMapper, PushMsg> implements IPushMsgService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IAccountService accountServiceImpl;
    @Autowired
    private JPushService jPushServiceImpl;
    @Autowired
    private IMessageCenterService messageCenterServiceImpl;

    private static ExecutorService executorService = Executors.newCachedThreadPool();



    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String title = (String) params.get("title");
        String content = (String) params.get("content");

        QueryWrapper<PushMsg> queryWrapper = new QueryWrapper<PushMsg>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if (StringUtils.isNotBlank(title)) {
            queryWrapper.like("title", title);
        }
        if (StringUtils.isNotBlank(content)) {
            queryWrapper.like("content", content);
        }

        String userId = StringUtil.obj2String(params.get("creatorId"));
        if(!StringUtils.isEmpty(userId)){
            queryWrapper.eq("creator_id", Integer.parseInt(userId));
        }

        IPage<PushMsg> page = this.page(new Query<PushMsg>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public R savePushMsg(Map<String, Object> params) {
        String id = StringUtil.obj2String(params.get("id"));

        SysUserEntity loginUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        try {
            PushMsg msg = null;
            if (StringUtils.isEmpty(id)) { // 新增
                msg = new PushMsg();
                msg.setCreateTime(new Date());
                msg.setPushTime(null);
                msg.setDeleteFlag(1);
                msg.setCreatorId(loginUser.getUserId());
            } else { // 修改
                msg = this.getOne(new QueryWrapper<PushMsg>().eq("id", id));
            }
            msg.setTitle(StringUtil.obj2String(params.get("title")));
            msg.setContent(StringUtil.obj2String(params.get("content")));
            msg.setUpdateTime(new Date());
            this.saveOrUpdate(msg);
        } catch (Exception e) {
            logger.error("保存推送信息失败", e);
            return R.error("保存推送信息失败");
        }
        return R.ok();
    }

    /**
     * 极光推送(根据别名推送，别名为用户注册的邮箱地址)
     * @param aliasList
     * @param title
     * @param content
     */
    @Override
    public void pushByAlias(List<String> aliasList, String title, String content) {
        logger.info("推送消息Title:[{}], Content:[{}], 推送对象:[{}]", title, content, JsonUtil.toJsonString(aliasList));
        try {
            if(aliasList.isEmpty()){
                logger.info("没有指定推送的对象");
                return;
            }
            List<Account> accounts = accountServiceImpl.list(new QueryWrapper<Account>().in("email", aliasList));
            //存入消息记录
            List<MessageCenter> msgList = new ArrayList<>();
            for(Account item : accounts){
                MessageCenter msg = new MessageCenter();
                msg.setAccountId(item.getId());
                msg.setAccountEmail(item.getEmail());
                msg.setContent(content);
                msg.setTitle(title);
                msg.setIsRead(0);
                msg.setCreateTime(new Date());
                msg.setUpdateTime(new Date());
                msg.setDeleteFlag(1);
                msg.setCreatorId(0L);
                msgList.add(msg);
            }
            messageCenterServiceImpl.saveBatch(msgList);

            //推送消息到APP
            Map<String, String> pushJson = new HashMap<>();
            pushJson.put("content", "[" + title + "]" + content);
            executorService.execute(new JpushThread(jPushServiceImpl, aliasList, "[" + title + "]" + content, "", pushJson));
        } catch (Exception e) {
            logger.error("极光推送消息失败", e);
        }
    }

}
