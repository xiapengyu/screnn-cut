package com.yunjian.core.admin;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
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
import com.yunjian.core.entity.RedeemCode;
import com.yunjian.core.service.IRedeemCodeService;

/**
 * <p>
 * 兑换码信息表 前端控制器
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@RestController
@RequestMapping("/sys/redeemCode")
public class SysRedeemCodeController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IRedeemCodeService redeemCodeService;

    /**
     * 分页查询兑换码列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询兑换码列表{}", JsonUtil.toJsonString(params));
        PageUtils page = redeemCodeService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 删除兑换码
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Map<String, Object> params){
        logger.info("删除兑换码{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                RedeemCode code = redeemCodeService.getOne(new QueryWrapper<RedeemCode>().eq("id", id));
                if(code.getStatus() == 1){
                    return R.error("启用中的兑换码不能删除");
                }else{
                    redeemCodeService.remove(new QueryWrapper<RedeemCode>().eq("id", id));
                    return R.ok();
                }
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除兑换码发生异常", e);
            return R.error("删除兑换码发生异常");
        }
    }

    /**
     * 批量删除兑换码
     */
    @SuppressWarnings("unchecked")
	@PostMapping("/batchDelete")
    public R batchDelete(@RequestBody Map<String, Object> params){
        logger.info("批量删除兑换码{}", JsonUtil.toJsonString(params));
        try {
            List<Integer> idList = (List<Integer>) params.get("idList");
            if(!idList.isEmpty()){
                //删除选中的非启用状态的兑换码
                redeemCodeService.remove(new QueryWrapper<RedeemCode>()
                        .in("id", idList).ne("status", 1));
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("批量删除兑换码发生异常", e);
            return R.error("批量删除兑换码发生异常");
        }
    }

    /**
     * 批量启用兑换码
     */
    @SuppressWarnings("unchecked")
    @PostMapping("/batchEnable")
    public R batchEnable(@RequestBody Map<String, Object> params){
        logger.info("批量启用兑换码{}", JsonUtil.toJsonString(params));
        try {
            List<Integer> idList = (List<Integer>) params.get("idList");
            if(!idList.isEmpty()){
                //启用选中的不是已兑换状态的兑换码
                UpdateWrapper updateQuery = new UpdateWrapper<RedeemCode>().in("id", idList).ne("status", 2);
                RedeemCode code = new RedeemCode();
                code.setStatus(1);
                redeemCodeService.update(code, updateQuery);
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("量启用兑换码发生异常", e);
            return R.error("量启用兑换码发生异常");
        }
    }

    /**
     * 批量禁用兑换码
     */
    @SuppressWarnings("unchecked")
    @PostMapping("/batchDisable")
    public R batchDisable(@RequestBody Map<String, Object> params){
        logger.info("批量启用兑换码{}", JsonUtil.toJsonString(params));
        try {
            List<Integer> idList = (List<Integer>) params.get("idList");
            if(!idList.isEmpty()){
                //启用选中的不是已兑换状态的兑换码
                UpdateWrapper updateQuery = new UpdateWrapper<RedeemCode>().in("id", idList).ne("status", 2);
                RedeemCode code = new RedeemCode();
                code.setStatus(0);
                redeemCodeService.update(code, updateQuery);
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("批量禁用兑换码发生异常", e);
            return R.error("批量禁用兑换码发生异常");
        }
    }

    /**
     * 查询兑换码详情
     */
    @PostMapping("/info")
    public R queryInfo(@RequestBody Map<String, Object> params){
        logger.info("查询兑换码详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
            RedeemCode redeemCode = redeemCodeService.getOne(new QueryWrapper<RedeemCode>().eq("id", id));
            return R.ok().put("redeemCode", redeemCode);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 新增兑换码
     */
    @PostMapping("/newRedeemCode")
    public R newRedeemCode(@RequestBody Map<String, Object> params){
        logger.info("新增兑换码{}", JsonUtil.toJsonString(params));
        String times = StringUtil.obj2String(params.get("times"));
        String count = StringUtil.obj2String(params.get("count"));
        if(StringUtils.isEmpty(times) || StringUtils.isEmpty(count)){
            return R.error("参数错误");
        }
        return redeemCodeService.saveRedeemCode(params);
    }

    /**
     * 修改兑换码信息
     */
    @PostMapping("/modifyRedeemCode")
    public R modifyRedeemCode(@RequestBody Map<String, Object> params){
        logger.info("修改兑换码信息{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        String status = StringUtil.obj2String(params.get("status"));
        if(StringUtils.isEmpty(id) || StringUtils.isEmpty(status)){
            return R.error("参数错误");
        }
        RedeemCode code = redeemCodeService.getOne(new QueryWrapper<RedeemCode>().eq("id", Integer.parseInt(id)));
        code.setStatus(Integer.parseInt(status));
        redeemCodeService.saveOrUpdate(code);
        return R.ok();
    }

}
