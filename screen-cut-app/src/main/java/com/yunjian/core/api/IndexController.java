package com.yunjian.core.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.IndexInfoDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Ad;
import com.yunjian.core.entity.Device;
import com.yunjian.core.entity.Setting;
import com.yunjian.core.service.IAdService;
import com.yunjian.core.service.IDeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/setting")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IAdService adService;

    @Autowired
    private IDeviceService deviceService;

    /**
     *查询首页数据
     * @return
     */
    @RequestMapping(value="/indexInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto indexInfo() {
        logger.info("查询首页数据");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        IndexInfoDto dto = new IndexInfoDto();
        //广告列表
        List<Ad> adList = adService.list(new QueryWrapper<Ad>().eq("position_type", 1)
                .orderByDesc("create_time"));
        dto.setAdList(adList);
        //切割次数信息
        Account account = SecurityContext.getUserPrincipal();
        Device device = deviceService.getOne(new QueryWrapper<Device>().eq("serial_no", account.getSerialNo()));
        if(device.getType() == 1){
            dto.setAccountType(1);
        }else{
            dto.setAccountType(2);
            dto.setUnUseAmount(account.getUnuseAmount());
            dto.setUseAmount(account.getUseAmount());
        }
        response.setData(dto);
        return response;
    }
}