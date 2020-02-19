package com.yunjian.core.admin;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.PhoneBrand;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.service.IPhoneBrandService;
import com.yunjian.core.service.IPhoneModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-19
 */
@RestController
@RequestMapping("/sys/phoneBrand")
public class SysPhoneBrandController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPhoneBrandService phoneBrandService;

    @Autowired
    private IPhoneModelService phoneModelService;

    /**
     * 分页查询手机品牌列表
     */
    @PostMapping("/phoneBrandList")
    public R phoneBrandList(@RequestBody Map<String, Object> params){
        logger.info("分页查询手机品牌列表{}", JsonUtil.toJsonString(params));
        PageUtils page = phoneBrandService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 查询手机品牌详情
     */
    @PostMapping("/queryPhoneBrandInfo")
    public R queryPhoneBrandInfo(@RequestBody Map<String, Object> params){
        logger.info("查询手机品牌详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
            PhoneBrand brand = phoneBrandService.getOne(new QueryWrapper<PhoneBrand>().eq("id", id));
            return R.ok().put("brand", brand);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 删除手机品牌
     */
    @PostMapping("/deletePhoneBrand")
    public R deletePhoneBrand(@RequestBody Map<String, Object> params){
        logger.info("删除手机品牌{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                List<PhoneModel> modelList = phoneModelService.list(new QueryWrapper<PhoneModel>().eq("brand_id", Integer.parseInt(id)));
                if(modelList.isEmpty()){
                    phoneBrandService.remove(new QueryWrapper<PhoneBrand>().eq("id", id));
                    return R.ok();
                }else{
                    return R.error("该品牌有关联的机型，不能删除");
                }
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除手机品牌错误", e);
            return R.error("删除手机品牌错误");
        }
    }

    /**
     * 保存手机品牌信息
     */
    @PostMapping("/savePhoneBrandInfo")
    public R savePhoneBrandInfo(@RequestBody Map<String, Object> params){
        logger.info("保存手机品牌信息{}", JsonUtil.toJsonString(params));
        return phoneBrandService.savePhoneBrandInfo(params);
    }

}
