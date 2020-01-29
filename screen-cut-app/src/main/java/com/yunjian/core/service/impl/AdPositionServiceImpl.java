package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Ad;
import com.yunjian.core.entity.AdPosition;
import com.yunjian.core.entity.SysConfigEntity;
import com.yunjian.core.mapper.AdPositionMapper;
import com.yunjian.core.service.IAdPositionService;
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
 * @since 2020-01-29
 */
@Service
public class AdPositionServiceImpl extends ServiceImpl<AdPositionMapper, AdPosition> implements IAdPositionService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String name = (String)params.get("name");

        QueryWrapper<AdPosition> queryWrapper = new QueryWrapper<AdPosition>();
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        if(StringUtils.isNotBlank(name)){
            queryWrapper.eq("name", name);
        }

        IPage<AdPosition> page = this.page(new Query<AdPosition>().getPage(params),queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public R deleteAdPosition(String positionId) {
        try {
            AdPosition position = this.getOne(new QueryWrapper<AdPosition>().eq("id", positionId));
            position.setDeleteFlag(0);
            this.saveOrUpdate(position);
            return R.ok();
        } catch (Exception e) {
            logger.error("逻辑删除广告位", e);
            return R.error("逻辑删除广告位");
        }
    }

    @Override
    public R adPositionInfoSave(Map<String, Object> params) {
        String id = StringUtil.obj2String(params.get("id"));
        try {
            if(StringUtils.isEmpty(id)){   //新增
                AdPosition adPosition = new AdPosition();
                adPosition.setName(StringUtil.obj2String(params.get("name")));
                adPosition.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
                adPosition.setDeleteFlag(1);
                adPosition.setCreateTime(new Date());
                adPosition.setUpdateTime(new Date());
                adPosition.setPositionType(1);
                this.save(adPosition);
            }else{  //修改
                AdPosition adPosition = this.getOne(new QueryWrapper<AdPosition>().eq("id", id));
                adPosition.setName(StringUtil.obj2String(params.get("name")));
                adPosition.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
                adPosition.setUpdateTime(new Date());
                this.saveOrUpdate(adPosition);
            }
        } catch (Exception e) {
            logger.error("保存广告位信息失败", e);
            return R.error("保存广告位信息失败");
        }
        return R.ok();
    }
}
