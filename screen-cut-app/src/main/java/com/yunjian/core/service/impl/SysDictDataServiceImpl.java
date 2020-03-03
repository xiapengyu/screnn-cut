

package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.core.dao.SysDictDataDao;
import com.yunjian.core.entity.SysDictDataEntity;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.service.SysDictDataService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
