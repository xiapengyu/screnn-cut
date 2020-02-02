package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yunjian.common.utils.*;
import com.yunjian.core.entity.Ad;
import com.yunjian.core.entity.AdPosition;
import com.yunjian.core.mapper.AdMapper;
import com.yunjian.core.service.IAdPositionService;
import com.yunjian.core.service.IAdService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@Service
public class AdServiceImpl extends ServiceImpl<AdMapper, Ad> implements IAdService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IAdPositionService adPositionService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String status = StringUtil.obj2String(params.get("status"));
        String positionId = StringUtil.obj2String(params.get("positionId"));

        QueryWrapper<Ad> queryWrapper = new QueryWrapper<Ad>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if(!StringUtils.isEmpty(status)){
            queryWrapper.eq("status", status);
        }
        if(!StringUtils.isEmpty(positionId)){
            queryWrapper.eq("position_id", positionId);
        }

        IPage<Ad> page = this.page(new Query<Ad>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public R saveAdInfo(Map<String, Object> params) {
        String id = StringUtil.obj2String(params.get("id"));
        try {
            Ad ad = null;
            if(StringUtils.isEmpty(id)){   //新增
                ad = new Ad();
                ad.setCreateTime(new Date());
                ad.setDeleteFlag(1);
            }else{  //修改
                ad = this.getOne(new QueryWrapper<Ad>().eq("id", id));
            }
            Integer positionId = Integer.parseInt(StringUtil.obj2String(params.get("positionId")));
            AdPosition adPosition = adPositionService.getOne(new QueryWrapper<AdPosition>().eq("id", positionId));
            ad.setAdImage(StringUtil.obj2String(params.get("adImage")));
            ad.setPositionId(positionId);
            ad.setPositionName(adPosition.getName());
            ad.setSortNum(Integer.parseInt(StringUtil.obj2String(params.get("sortNum"))));
            ad.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
            ad.setUpdateTime(new Date());
            this.saveOrUpdate(ad);
        } catch (Exception e) {
            logger.error("保存广告信息失败", e);
            return R.error("保存广告信息失败");
        }
        return R.ok();
    }

}
