

package com.yunjian.core.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.core.dao.SysDictDataDao;
import com.yunjian.core.entity.SysDictDataEntity;
import com.yunjian.core.service.SysDictDataService;

@Service("sysDictDataService")
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataDao, SysDictDataEntity> implements SysDictDataService {

    @Resource
    private SysDictDataDao sysDictDataDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String dictType = (String) params.get("dictType");
        String dictLabel = (String) params.get("dictLabel");

        IPage<SysDictDataEntity> page = this.page(
                new Query<SysDictDataEntity>().getPage(params),
                new QueryWrapper<SysDictDataEntity>()
                        .eq(StringUtils.isNotBlank(dictType), "dict_type", dictType)
                        .like(StringUtils.isNotBlank(dictLabel), "dict_label", dictLabel)
        );
        return new PageUtils(page);
    }

    @Override
    public void changeLocal(String language) {
        sysDictDataDao.sysDictDataDao(language);
    }
}
