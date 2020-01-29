package com.yunjian.core.service.impl;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.yunjian.common.utils.*;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.service.IImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
            Client client = Client.create();
            String destFilePath = serverUrl + UUIDUtil.getUUID().replaceAll("-", "") + extName;
            WebResource resource = client.resource(destFilePath);
            String str = resource.put(String.class, bytes);
            logger.info("图片上传成功>>>[{}]", str);
            response.setData(destFilePath);
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            response = new ResponseDto(Constant.FAIL_CODE, null, "上传文件失败");
        }
        return response;
    }
}
