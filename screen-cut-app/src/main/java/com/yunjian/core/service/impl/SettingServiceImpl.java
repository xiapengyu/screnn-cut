package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Setting;
import com.yunjian.core.mapper.SettingMapper;
import com.yunjian.core.service.ISettingService;

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
            //第一个参数配置默认使用
            List<Setting> list = this.list(new QueryWrapper<Setting>().eq("account_id", account.getId()));
            int isUse = list.isEmpty() ? 1 : 0;
            if(param.getId() == null || param.getId() <= 0){
                param.setCreateTime(new Date());
                param.setUpdateTime(new Date());
                param.setAccountId(account.getId());
                param.setIsUse(isUse);
                this.saveOrUpdate(param);
            }else{
                Setting setting = this.getOne(new QueryWrapper<Setting>().eq("id", param.getId()));
                if(setting == null){
                    return new ResponseDto(Constant.FAIL_CODE, null, "未查询到参数配置信息");
                }else{
                    setting.setName(param.getName());
                    setting.setSpeed(param.getSpeed());
                    setting.setPressure(param.getPressure());
                    setting.setUpdateTime(new Date());
                    this.saveOrUpdate(setting);
                }
            }
        } catch (Exception e) {
        	logger.error("保存参数设置失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "保存参数设置失败");
        }
        return response;
    }
}
