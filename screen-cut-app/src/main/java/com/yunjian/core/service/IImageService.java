package com.yunjian.core.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Ad;

import java.util.Map;

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

}
