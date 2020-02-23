package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Setting;
import com.yunjian.core.mapper.SettingMapper;
import com.yunjian.core.service.ISettingService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 切割参数设置表 服务实现类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-23
 */
@Service
public class SettingServiceImpl extends ServiceImpl<SettingMapper, Setting> implements ISettingService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public ResponseDto saveSetting(Setting param) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Account account = SecurityContext.getUserPrincipal();
            if(param.getId() == null){
                param.setCreateTime(new Date());
                param.setUpdateTime(new Date());
                param.setAccountId(account.getId());
                param.setIsUse(1);
                this.saveOrUpdate(param);
            }else{
                Setting setting = this.getOne(new QueryWrapper<Setting>().eq("id", param.getId()));
                setting.setName(param.getName());
                setting.setSpeed(param.getSpeed());
                setting.setPressure(param.getPressure());
                setting.setUpdateTime(new Date());
                this.saveOrUpdate(setting);
            }
        } catch (Exception e) {
            return new ResponseDto(Constant.FAIL_CODE, null, Constant.FAIL_MESSAGE);
        }
        return response;
    }
}
