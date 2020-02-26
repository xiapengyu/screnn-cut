package com.yunjian.core.admin;


import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yunjian.common.utils.R;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IImageService;

import io.swagger.annotations.Api;

/**
 * @author xiapengyu
 * @since 2020-01-29
 */

@Api("图片管理api")
@RestController
@RequestMapping("/sys/image")
public class SysImageController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${tomcat.file.server}")
    private String fileUploadServer = "";

    @Autowired
    private IImageService imageService;

    /**
     * 上传广告图片(多处复用)
     */
    @PostMapping("/uploadImage")
    public R uploadAdInfoImage(@RequestParam("file") MultipartFile file){
        try {
            String name = file.getOriginalFilename();
            String extName = "";
            logger.info("上传图片[{}]", name);
            if (name.lastIndexOf(".") >= 0){
                extName = name.substring(file.getOriginalFilename().lastIndexOf("."));
            }
            ResponseDto response = imageService.uploadImage(file.getBytes(), fileUploadServer + "ad/", extName);
            return R.ok().put("imagePath", response.getData());
        } catch (IOException e) {
            logger.info("上传文件失败", e);
            return R.error("上传图片失败");
        }
    }

}
