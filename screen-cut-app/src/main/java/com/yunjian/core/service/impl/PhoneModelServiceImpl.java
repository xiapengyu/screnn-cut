package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.mapper.PhoneModelMapper;
import com.yunjian.core.service.IPhoneModelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * 手机机型信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@Service
public class PhoneModelServiceImpl extends ServiceImpl<PhoneModelMapper, PhoneModel> implements IPhoneModelService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String phoneBrand = (String)params.get("phoneBrand");
        String phoneModel = (String)params.get("phoneModel");

        QueryWrapper<PhoneModel> queryWrapper = new QueryWrapper<PhoneModel>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if(StringUtils.isNotBlank(phoneBrand)){
            queryWrapper.like("phone_brand", phoneBrand);
        }
        if(StringUtils.isNotBlank(phoneModel)){
            queryWrapper.like("phone_model", phoneModel);
        }

        IPage<PhoneModel> page = this.page(new Query<PhoneModel>().getPage(params),queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public R savePhoneModelInfo(Map<String, Object> params) {
        String id = StringUtil.obj2String(params.get("id"));
        try {
            PhoneModel model = null;
            if(org.springframework.util.StringUtils.isEmpty(id)){   //新增
                model = new PhoneModel();
                model.setCreateTime(new Date());
                model.setDeleteFlag(1);
            }else{  //修改
                model = this.getOne(new QueryWrapper<PhoneModel>().eq("id", id));
            }
            model.setPhoneImage(StringUtil.obj2String(params.get("phoneImage")));
            model.setPhoneBrand(StringUtil.obj2String(params.get("phoneBrand")));
            model.setPhoneModel(StringUtil.obj2String(params.get("phoneModel")));
            model.setSortNum(Integer.parseInt(StringUtil.obj2String(params.get("sortNum"))));
            model.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
            model.setUpdateTime(new Date());
            this.saveOrUpdate(model);
        } catch (Exception e) {
            logger.error("保存手机型号失败", e);
            return R.error("保存手机型号失败");
        }
        return R.ok();
    }
}
