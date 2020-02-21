package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yunjian.common.utils.*;
import com.yunjian.core.entity.PhoneBrand;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.mapper.PhoneBrandMapper;
import com.yunjian.core.service.IPhoneBrandService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-19
 */
@Service
public class PhoneBrandServiceImpl extends ServiceImpl<PhoneBrandMapper, PhoneBrand> implements IPhoneBrandService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String brandName = StringUtil.obj2String(params.get("brandName"));
        QueryWrapper<PhoneBrand> queryWrapper = new QueryWrapper<PhoneBrand>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if(StringUtils.isNotBlank(brandName)){
            queryWrapper.like("brand_name", brandName);
        }
        IPage<PhoneBrand> page = this.page(new Query<PhoneBrand>().getPage(params),queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public AppPageUtils queryAppPage(Map<String, Object> param) {
        String brandName = StringUtil.obj2String(param.get("brandName"));
        QueryWrapper<PhoneBrand> queryWrapper = new QueryWrapper<PhoneBrand>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if(StringUtils.isNotBlank(brandName)){
            queryWrapper.like("brand_name", brandName);
        }
        IPage<PhoneBrand> page = this.page(new Query<PhoneBrand>().getPage(param),queryWrapper);
        return new AppPageUtils(page);
    }

    @Override
    public R savePhoneBrandInfo(Map<String, Object> params) {
        String id = StringUtil.obj2String(params.get("id"));
        try {
            PhoneBrand brand = null;
            if(StringUtils.isEmpty(id)){   //新增
                brand = new PhoneBrand();
                brand.setCreateTime(new Date());
                brand.setDeleteFlag(1);
            }else{  //修改
                brand = this.getOne(new QueryWrapper<PhoneBrand>().eq("id", id));
            }

            brand.setBrandName(StringUtil.obj2String(params.get("brandName")));
            brand.setBrandImg(StringUtil.obj2String(params.get("brandImg")));
            brand.setUpdateTime(new Date());
            this.saveOrUpdate(brand);
        } catch (Exception e) {
            logger.error("保存手机品牌失败", e);
            return R.error("保存手机品牌失败");
        }
        return R.ok();
    }

}
