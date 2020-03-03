package com.yunjian.core.service;

import com.yunjian.core.dto.ResponseDto;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-01-29
 */
public interface IImageService{

    ResponseDto uploadImage(byte[] bytes, String s, String extName);

    ResponseDto uploadFile(byte[] bytes, String s, String extName);
    
}
