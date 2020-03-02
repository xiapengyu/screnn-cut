package com.yunjian.core.api;

import java.util.ArrayList;
import java.util.List;

import com.yunjian.core.service.IAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.core.dto.IndexInfoDto;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Account;
import com.yunjian.core.entity.Ad;
import com.yunjian.core.entity.Device;
import com.yunjian.core.service.IAdService;
import com.yunjian.core.service.IDeviceService;

@RestController
@RequestMapping("/api/index")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IAdService adService;

    @Autowired
    private IDeviceService deviceService;

    @Autowired
    private IAccountService accountService;

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
        List<Ad> adList = adService.list(new QueryWrapper<Ad>().eq("status", 1)
                .orderByAsc("sort_num"));
        List<String> adImageList = new ArrayList<>();
        adList.forEach(item -> {
            adImageList.add(item.getAdImage());
        });
        dto.setAdList(adImageList);
        //切割次数信息
        Account account = SecurityContext.getUserPrincipal();
        Account a = accountService.getOne(new QueryWrapper<Account>().eq("id", account.getId()));
        if(a.getType() == 1){
            dto.setAccountType(1);
        }else{
            dto.setAccountType(2);
            dto.setUnUseAmount(a.getRemainTimes());
            dto.setUseAmount(a.getUseTimes());
        }
        response.setData(dto);
        return response;
    }
}
