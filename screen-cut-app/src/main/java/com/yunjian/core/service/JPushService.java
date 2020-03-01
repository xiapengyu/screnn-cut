package com.yunjian.core.service;

import com.yunjian.core.dto.JpushDataDto;

import java.util.List;

public interface JPushService {

    public void pushByAlias(JpushDataDto requestDto);

}
