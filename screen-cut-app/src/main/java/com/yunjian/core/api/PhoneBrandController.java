package com.yunjian.core.api;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.PhoneBrand;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.service.IPhoneBrandService;
import com.yunjian.core.service.IPhoneModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-19
 */
@RestController
@RequestMapping("/api/phoneBrand")
public class PhoneBrandController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPhoneBrandService phoneBrandService;

    @Autowired
    private IPhoneModelService phoneModelService;

    /**
     *查询品牌列表
     * @return
     */
    @RequestMapping(value="/queryBrandList", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryBrandList(@RequestBody Map<String, Object> param){
        logger.info("查询品牌列表");
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);

        String type = StringUtil.obj2String(param.get("type"));
        if(StringUtils.isEmpty(type)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "参数错误");
        }

        List<PhoneModel> modelList = phoneModelService.list(new QueryWrapper<PhoneModel>().eq("type", Integer.parseInt(type)));
        List<Integer> brandIdList = new ArrayList<>();
        modelList.forEach(item -> {
            if(!brandIdList.contains(item.getBrandId())){
                brandIdList.add(item.getBrandId());
            }
        });
        logger.info("有数据的品牌");
        if(brandIdList.isEmpty()){
            List<PhoneBrand> list = new ArrayList<>();
            response.setData(list);
        }else{
            List<PhoneBrand> list = phoneBrandService.list(new QueryWrapper<PhoneBrand>()
                    .in("id", brandIdList)
                    .eq("delete_flag", 1));
            response.setData(list);
        }
        return response;
    }

    /**
     *分页查询品牌列表
     * @return
     */
    @RequestMapping(value="/queryBrandListByPage", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryBrandListByPage(@RequestBody Map<String, Object> param){
        logger.info("分页查询品牌列表{}", param);
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            PageUtils page = phoneBrandService.queryPage(param);
            response.setData(page);
        } catch (Exception e) {
            logger.error("分页查询品牌列表失败", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "分页查询品牌列表失败");
        }
        return response;
    }

    /**
     *根据品牌查询机型
     * @return
     */
    @RequestMapping(value="/queryPhoneListByBrand", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryPhoneListByBrand(@RequestBody Map<String, Object> param){
        logger.info("根据品牌查询机型{}", param);
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        String brandId = StringUtil.obj2String(param.get("id"));
        String type = StringUtil.obj2String(param.get("type"));
        if(StringUtils.isEmpty(brandId)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "参数错误");
        }
        if(StringUtils.isEmpty(type)){
            return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "参数错误");
        }
        List<PhoneModel> list = phoneModelService.list(new QueryWrapper<PhoneModel>()
                .eq("brand_id", Integer.parseInt(brandId))
                .eq("type", Integer.parseInt(type))
                .orderByAsc("sort_num"));
        response.setData(list);
        return response;
    }

    /**
     *根据品牌分页查询机型
     * @return
     */
    @RequestMapping(value="/queryPagePhoneListByBrand", method = RequestMethod.POST)
    @ResponseBody
    public ResponseDto queryPagePhoneListByBrand(@RequestBody Map<String, Object> param){
        logger.info("根据品牌分页查询机型{}", param);
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        String brandId = StringUtil.obj2String(param.get("id"));
        if(StringUtils.isEmpty(brandId)){
            return new ResponseDto(Constant.FAIL_CODE, null, "参数错误");
        }
        try {
            PageUtils page = phoneModelService.queryAppPage(param);
            response.setData(page);
        } catch (Exception e) {
            logger.error("根据品牌分页查询机型", e);
            return new ResponseDto(Constant.FAIL_CODE, null, "根据品牌分页查询机型");
        }
        return response;
    }
}
