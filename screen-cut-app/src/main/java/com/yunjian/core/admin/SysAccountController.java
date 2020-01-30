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
import com.yunjian.core.entity.Account;
import com.yunjian.core.service.IAccountService;

import io.swagger.annotations.Api;

/**
 * @author xiapengyu
 * @since 2020-01-29
 */

@Api("用户管理api")
@RestController
@RequestMapping("/sys/account")
public class SysAccountController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private IAccountService accountService;

    /**
     * 分页查询用户列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询用户列表{}", JsonUtil.toJsonString(params));
        PageUtils page = accountService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 所有广告位列表
     */
//    @PostMapping("/queryTotalPosition")
//    public R queryTotalPosition(){
//        logger.info("查询全部广告位列表");
//        List<AdPosition> list = adPositionService.list(new QueryWrapper<AdPosition>()
//                .eq("delete_flag", 1)
//                .orderByDesc("create_time"));
//        return R.ok().put("positionList", list);
//    }

    /**
     * 删除用户
     */
    @PostMapping("/deleteAccount")
    public R deleteAccount(@RequestBody Map<String, Object> params){
        logger.info("删除用户{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	accountService.remove(new QueryWrapper<Account>().eq("id", id));
            return R.ok();
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 查询用户详情
     */
    @PostMapping("/queryAccountInfo")
    public R queryAccountInfo(@RequestBody Map<String, Object> params){
        logger.info("查询用户详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	Account account = accountService.getOne(new QueryWrapper<Account>().eq("id", id));
            return R.ok().put("account", account);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 保存用户信息
     */
    @PostMapping("/saveAccount")
    public R saveAccount(@RequestBody Map<String, Object> params){
        logger.info("保存用户信息{}", JsonUtil.toJsonString(params));
        return accountService.saveAccount(params);
    }
    
}
