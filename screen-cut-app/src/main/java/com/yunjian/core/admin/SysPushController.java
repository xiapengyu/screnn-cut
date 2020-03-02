package com.yunjian.core.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yunjian.common.utils.*;
import com.yunjian.core.dto.PushDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.SysRoleEntity;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.service.IAccountService;
import com.yunjian.core.service.IMessageCenterService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.core.entity.PushMsg;
import com.yunjian.core.service.IPushMsgService;

/**
 * <p>
 * 推送消息管理表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-30
 */
@RestController
@RequestMapping("/sys/push")
public class SysPushController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IMessageCenterService messageCenterServiceImpl;
    @Autowired
    private IPushMsgService pushMsgServiceImpl;
    @Autowired
    private IAccountService accountServiceImpl;

    /**
     * 分页查询推送消息列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询推送消息列表{}", JsonUtil.toJsonString(params));

        SysUserEntity user = (SysUserEntity) HttpContextUtils.getLoginUser().get("sysUser");
        SysRoleEntity role = (SysRoleEntity) HttpContextUtils.getLoginUser().get("role");
        int isDealer = 0;
        if(role!=null && role.getRoleId()==2) { //2：经销商
            params.put("creatorId", user.getUserId());
            isDealer = 1;
        }

        PageUtils page = pushMsgServiceImpl.queryPage(params);
        return R.ok().put("page", page).put("isDealer", isDealer);
    }

    /**
     * 查询推送消息详情
     */
    @PostMapping("/info")
    public R info(@RequestBody Map<String, Object> params){
        logger.info("查询推送消息详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	PushMsg pushMsg = pushMsgServiceImpl.getOne(new QueryWrapper<PushMsg>().eq("id", id));
            return R.ok().put("pushMsg", pushMsg);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 删除推送消息
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Map<String, Object> params){
        logger.info("删除推送消息{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                pushMsgServiceImpl.remove(new QueryWrapper<PushMsg>().eq("id", id));
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除手机机型错误", e);
            return R.error("删除手机机型错误");
        }	
    }

    /**
     * 保存推送消息
     */
    @PostMapping("/savePushMsg")
    public R savePushMsg(@RequestBody Map<String, Object> params){
        logger.info("保存手推送消息{}", JsonUtil.toJsonString(params));
        return pushMsgServiceImpl.savePushMsg(params);
    }
    
    /**
     * 推送消息
     */
    @PostMapping("/pushMsg")
    public R pushMsg(@RequestBody Map<String, Object> params){
        logger.info("推送信息{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            String selectAll = StringUtil.obj2String(params.get("selectAll"));
            if(StringUtils.isEmpty(id) || StringUtils.isEmpty(selectAll)){
                return R.error("参数错误");
            }
            PushMsg pushMsg = pushMsgServiceImpl.getOne(new QueryWrapper<PushMsg>().eq("id", id));
            if(pushMsg == null){
                return  R.error("没有查询到消息内容");
            }

            pushMsg.setPushTime(new Date());
            pushMsgServiceImpl.saveOrUpdate(pushMsg);

            List<PushDto> pushUserList = JsonUtil.toList(JsonUtil.toJsonString(params.get("accoutList")), PushDto.class);
            List<String> emailList = new ArrayList<>();
            pushUserList.forEach(item -> {
                emailList.add(item.getName());
            });
            pushMsgServiceImpl.pushByAlias(emailList, pushMsg.getTitle(), pushMsg.getContent());
        } catch (Exception e) {
            logger.error("推送消息失败", e);
            return R.error("推送消息失败");
        }
        return R.ok();
    }

    /**
     * 全量推送
     * @param params
     * @return
     */
    @PostMapping("/pushAll")
    public R pushAll(@RequestBody Map<String, Object> params){
        logger.info("推送消息{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(StringUtils.isEmpty(id)){
                return R.error("参数错误");
            }

            PushMsg pushMsg = pushMsgServiceImpl.getOne(new QueryWrapper<PushMsg>().eq("id", id));
            if(pushMsg == null){
                return  R.error("没有查询到消息内容");
            }

            pushMsg.setPushTime(new Date());
            pushMsgServiceImpl.saveOrUpdate(pushMsg);

            SysUserEntity sysUserEntity = HttpContextUtils.getLoginSysUserEntity();
            List<Account> pushUserList = accountServiceImpl.list(new QueryWrapper<Account>()
                    .eq("dealer_id", sysUserEntity.getUserId()));
            List<String> emailList = new ArrayList<>();
            pushUserList.forEach(item -> {
                emailList.add(item.getEmail());
            });
            pushMsgServiceImpl.pushByAlias(emailList, pushMsg.getTitle(), pushMsg.getContent());
        } catch (Exception e) {
            logger.error("推送消息失败", e);
            return R.error("推送消息失败");
        }
        return R.ok();
    }

}
