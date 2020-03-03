package com.yunjian.core.api;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Setting;
import com.yunjian.core.service.ISettingService;

/**
 * <p>
 * 切割参数设置表 前端控制器
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-23
 */
@RestController
@RequestMapping("/api/setting")
public class SettingController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ISettingService settingService;

    /**
     *查询用户参数列表
     * @return
     */
    @RequestMapping(value="/list", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto list() {
        logger.info("查询用户参数列表");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        Account account = SecurityContext.getUserPrincipal();
        List<Setting> settingList = settingService.list(new QueryWrapper<Setting>()
                .eq("account_id", account.getId()).orderByDesc("create_time"));
        response.setData(settingList);
        return response;
    }

    /**
     *保存参数设置(新增/修改)
     * @return
     */
    @RequestMapping(value="/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto save(@RequestBody Setting param) {
        logger.info("保存参数设置(新增/修改){}", JsonUtil.toJsonString(param));
        if(StringUtils.isEmpty(param.getName()) || param.getSpeed() == null || param.getPressure() == null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        /*if((param.getSpeed() < 100 || param.getSpeed() > 800)
                || (param.getPressure() < 300 || param.getPressure() > 1000)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "切割速度或切割压力不在规定区间");
        }*/
        return settingService.saveSetting(param);
    }
    
    /**
     *设置参数设置为使用中
     * @return
     */
    @RequestMapping(value="/setDefaultSetting", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto setDefaultSetting(@RequestBody Setting param) {
        logger.info("设置参数设置为使用中{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(param.getId()== null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        Account account = SecurityContext.getUserPrincipal();
        List<Setting> list = settingService.list(new QueryWrapper<Setting>().eq("account_id", account.getId()));
        Setting defaultSetting = list.get(0);
        defaultSetting.setIsUse(0);
        settingService.saveOrUpdate(defaultSetting);
        
        Setting setting = settingService.getOne(new QueryWrapper<Setting>().eq("id", param.getId()));
        setting.setIsUse(1);
        settingService.saveOrUpdate(setting);
        return response;
    }
    
    /**
     *查询正在使用中的参数设置
     * @return
     */
    @RequestMapping(value="/getDefaultSetting", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto getDefaultSetting() {
        logger.info("查询默认使用的参数设置");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        Account account = SecurityContext.getUserPrincipal();
        List<Setting> list = settingService.list(new QueryWrapper<Setting>().eq("account_id", account.getId()).eq("is_use", 1));
        if(list.isEmpty()) {
        	response.setData(null);
        }else {
        	Setting defaultSetting = list.get(0);
            response.setData(defaultSetting);
        }
        return response;
    }

    /**
     *删除参数设置
     * @return
     */
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto delete(@RequestBody Setting param) {
        logger.info("删除参数设置{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(param.getId()== null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        settingService.remove(new QueryWrapper<Setting>().eq("id", param.getId()));
        return response;
    }

    /**
     *查询参数设置详情
     * @return
     */
    @RequestMapping(value="/info", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto info(@RequestBody Setting param) {
        logger.info("查询参数设置详情{}", JsonUtil.toJsonString(param));
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        if(param.getId()== null){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, Constant.PARMS_ERROR_MSG);
        }
        Setting setting = settingService.getOne(new QueryWrapper<Setting>().eq("id", param.getId()));
        response.setData(setting);
        return response;
    }

}
