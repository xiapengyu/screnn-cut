package com.yunjian.core.admin;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.service.IPhoneModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 * 手机机型信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@RestController
@RequestMapping("/sys/phone")
public class SysPhoneModelController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPhoneModelService phoneModelService;

    /**
     * 分页查询手机机型列表
     */
    @PostMapping("/phoneModelList")
    public R phoneModelList(@RequestBody Map<String, Object> params){
        logger.info("分页查询手机机型列表{}", JsonUtil.toJsonString(params));
        PageUtils page = phoneModelService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 查询手机机型详情
     */
    @PostMapping("/queryPhoneModelInfo")
    public R queryPhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("查询手机机型详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
            PhoneModel model = phoneModelService.getOne(new QueryWrapper<PhoneModel>().eq("id", id));
            return R.ok().put("model", model);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 删除手机机型
     */
    @PostMapping("/deletePhoneModelInfo")
    public R deletePhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("删除手机机型{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                phoneModelService.remove(new QueryWrapper<PhoneModel>().eq("id", id));
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
     * 保存手机机型信息
     */
    @PostMapping("/savePhoneModelInfo")
    public R savePhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("保存手机机型信息{}", JsonUtil.toJsonString(params));
        return phoneModelService.savePhoneModelInfo(params);
    }

}
