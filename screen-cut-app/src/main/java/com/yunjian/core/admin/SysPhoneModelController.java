package com.yunjian.core.admin;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.common.utils.UUIDUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.PhoneBrand;
import com.yunjian.core.entity.PhoneModel;
import com.yunjian.core.service.IImageService;
import com.yunjian.core.service.IPhoneBrandService;
import com.yunjian.core.service.IPhoneModelService;

/**
 * <p>
 * 手机机型信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@RestController
@RequestMapping("/sys/phone")
public class SysPhoneModelController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IPhoneModelService phoneModelService;

    @Autowired
    private IPhoneBrandService phoneBrandService;

    @Value("${tomcat.file.server}")
    private String fileUploadServer = "";

    @Autowired
    private IImageService imageService;

    /**
     * 分页查询手机机型列表
     */
    @PostMapping("/phoneModelList")
    public R phoneModelList(@RequestBody Map<String, Object> params){
        logger.info("分页查询手机机型列表{}", JsonUtil.toJsonString(params));
        PageUtils page = phoneModelService.queryPage(params);
        List<PhoneBrand> brandList = phoneBrandService.list();
        return R.ok().put("page", page).put("brandList", brandList);
    }

    /**
     * 查询手机机型详情
     */
    @PostMapping("/queryPhoneModelInfo")
    public R queryPhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("查询手机机型详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
            PhoneModel model = phoneModelService.getOne(new QueryWrapper<PhoneModel>().eq("id", id));
            List<PhoneBrand> brandList = phoneBrandService.list();

            Map<String, Object> plt = new HashMap<>();
            plt.put("uid", UUIDUtil.getUUID());
            plt.put("url", model.getPltUrl());
            plt.put("name", model.getOriginName());
            return R.ok().put("model", model).put("brandList", brandList).put("plt", plt);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 查询全部手机品牌列表
     */
    @PostMapping("/queryTotalBrand")
    public R queryTotalBrand(@RequestBody Map<String, Object> params){
        logger.info("查询全部手机品牌列表");
        List<PhoneBrand> brandList = phoneBrandService.list();
        return R.ok().put("brandList", brandList);
    }

    /**
     * 删除手机机型
     */
    @PostMapping("/deletePhoneModelInfo")
    public R deletePhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("删除手机机型{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                phoneModelService.remove(new QueryWrapper<PhoneModel>().eq("id", id));
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除手机机型错误", e);
            return R.error("删除手机机型错误");
        }
    }

    /**
     * 保存手机机型信息
     */
    @PostMapping("/savePhoneModelInfo")
    public R savePhoneModelInfo(@RequestBody Map<String, Object> params){
        logger.info("保存手机机型信息{}", JsonUtil.toJsonString(params));
        return phoneModelService.savePhoneModelInfo(params);
    }

    /**
     * 导入plt文件信息
     */
    @PostMapping("/uploadPltFile")
    public R uploadPltFile(@RequestParam("file") MultipartFile file){
        try {
            String originName = file.getOriginalFilename();
            String extName = "";
            logger.info("上传plt文件信息[{}]", originName);
            if (originName.lastIndexOf(".") >= 0){
                extName = originName.substring(file.getOriginalFilename().lastIndexOf("."));
            }
            ResponseDto response = imageService.uploadFile(file.getBytes(), fileUploadServer + "plt/", extName);
            Map<String, Object> plt = new HashMap<>();
            plt.put("uid", UUIDUtil.getUUID());
            plt.put("url", response.getData());
            plt.put("name", originName);
            return R.ok().put("plt", plt);
        } catch (IOException e) {
            logger.info("导入plt文件失败", e);
            return R.error("导入plt文件失败");
        }
    }

}
