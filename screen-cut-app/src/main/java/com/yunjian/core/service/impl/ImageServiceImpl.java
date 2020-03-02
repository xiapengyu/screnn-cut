package com.yunjian.core.service.impl;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.UUIDUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IImageService;

import java.io.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
@Service
public class ImageServiceImpl implements IImageService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${nginx.file.host}")
    private String nginxHost = "";

    @Value("${nginx.file.location}")
    private String location = "";

    @Value("${nginx.file.alias}")
    private String alias = "";

    @Override
    public ResponseDto uploadImage(byte[] bytes, String serverUrl, String extName) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Client client = Client.create();
            String destFilePath = serverUrl + UUIDUtil.getUUID().replaceAll("-", "") + extName;
            WebResource resource = client.resource(destFilePath);
            resource.put(String.class, bytes);
            logger.info("图片上传成功>>>[{}]", destFilePath);
            response.setData(destFilePath);
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            response = new ResponseDto(Constant.FAIL_CODE, null, "上传文件失败");
        }
        return response;
    }

    @Override
    public ResponseDto uploadFile(byte[] bytes, String serverUrl, String extName) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            Client client = Client.create();
            String destFilePath = serverUrl + UUIDUtil.getUUID().replaceAll("-", "") + extName;
            WebResource resource = client.resource(destFilePath);
            String str = resource.put(String.class, bytes);
            logger.info("文件上传成功>>>[{}]", str);
            response.setData(destFilePath);
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            response = new ResponseDto(Constant.FAIL_CODE, null, "上传文件失败");
        }
        return response;
    }

    @Override
    public ResponseDto uploadFilesToNginx(byte[] bytes, String extName) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
            String fileName = UUIDUtil.getUUID().replaceAll("-", "") + extName;
            String filePath = alias + fileName;
            logger.info("文件上传到服务器绝对地址[{}]", filePath);
            String uri = nginxHost + location + fileName;
            logger.info("文件上传的服务器URI[{}]", uri);

            //目标目录
            File targetDir = new File(alias);
            if(!targetDir.exists()) {
                targetDir.mkdirs();
            }

            File uploadFile = new File(filePath);
            InputStream in = new ByteArrayInputStream(bytes);
            FileUtils.copyInputStreamToFile(in, uploadFile);

            response.setData(uri);
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            response = new ResponseDto(Constant.FAIL_CODE, null, "上传文件失败");
        }
        return response;
    }
}
