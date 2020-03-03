package com.yunjian.core.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.UUIDUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IImageService;

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

    @Override
    public ResponseDto uploadImage(byte[] bytes, String serverUrl, String extName) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        try {
        	String destFilePath = serverUrl + UUIDUtil.getUUID().replaceAll("-", "") + extName;
        	logger.info("创建客户端连接，开始上传图片{}", destFilePath);
        	ClientConfig cc = new DefaultClientConfig();
            cc.getClasses().add(MultipartFile.class);
            Client client = Client.create(cc);
            client.setConnectTimeout(5000);
            client.setReadTimeout(5000);
            
            logger.info("客户端连接创建成功[{}]", JsonUtil.toJsonString(client));
            WebResource resource = client.resource(destFilePath);
            logger.info("文件的上传到文件主机上");
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
	
}
