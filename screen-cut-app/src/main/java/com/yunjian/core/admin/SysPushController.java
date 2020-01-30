package com.yunjian.core.admin;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
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
    private IPushMsgService pushMsgService;

    /**
     * 分页查询推送消息列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询推送消息列表{}", JsonUtil.toJsonString(params));
        PageUtils page = pushMsgService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 查询推送消息详情
     */
    @PostMapping("/info")
    public R info(@RequestBody Map<String, Object> params){
        logger.info("查询推送消息详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	PushMsg pushMsg = pushMsgService.getOne(new QueryWrapper<PushMsg>().eq("id", id));
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
            	pushMsgService.remove(new QueryWrapper<PushMsg>().eq("id", id));
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
     * 保存手推送消息
     */
    @PostMapping("/savePushMsg")
    public R savePushMsg(@RequestBody Map<String, Object> params){
        logger.info("保存手推送消息{}", JsonUtil.toJsonString(params));
        return pushMsgService.savePushMsg(params);
    }

}
