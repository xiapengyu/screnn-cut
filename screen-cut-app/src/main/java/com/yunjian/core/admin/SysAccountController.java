package com.yunjian.core.admin;


import java.util.List;
import java.util.Map;

import com.yunjian.core.dto.OrderRespDto;
import com.yunjian.core.service.IPurchaseOrderService;
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
    @Autowired
    private IPurchaseOrderService purchaseOrderService;

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
     * 所有用户列表
     */
    @PostMapping("/queryTotalAccount")
    public R queryTotalAccount(){
        logger.info("所有用户列表");
        try {
			List<Account> list = accountService.list(new QueryWrapper<Account>()
			        .eq("delete_flag", 1)
			        .orderByDesc("create_time"));
			Account temp = new Account();
			temp.setId(0);
			temp.setEmail("全部");
			list.add(0, temp);
			return R.ok().put("accountList", list);
		} catch (Exception e) {
			logger.error("查询用户列表失败", e);
			return R.error("查询用户列表失败");
		}
    }

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

    /**
     * 分页查询客户采购需求列表
     */
    @PostMapping("/queryAccountOrderList")
    public R queryAccountOrderList(@RequestBody Map<String, Object> params){
        logger.info("分页查询客户采购需求列表{}", JsonUtil.toJsonString(params));
        PageUtils page = purchaseOrderService.queryAccountOrderList(params);
        return R.ok().put("page", page);
    }

    /**
     * 查询客户采购需求单详情
     */
    @PostMapping("/queryOrderInfo")
    public R queryOrderDetail(@RequestBody Map<String, Object> params){
        logger.info("查询客户采购需求单详情{}", JsonUtil.toJsonString(params));
        String orderNo = StringUtil.obj2String(params.get("orderNo"));
        OrderRespDto info = purchaseOrderService.queryOrderInfo(orderNo);
        return R.ok().put("order", info);
    }
    
}
