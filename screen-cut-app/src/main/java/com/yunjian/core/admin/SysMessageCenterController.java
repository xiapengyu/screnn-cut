package com.yunjian.core.admin;

import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.service.IMessageCenterService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/sys/message")
public class SysMessageCenterController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IMessageCenterService messageCenterServiceImpl;

    @PostMapping("/pushMessage")
    public R pushMessage(@RequestBody Map<String, Object> params){
        logger.info("推送信息{}", JsonUtil.toJsonString(params));
        String title = StringUtil.obj2String(params.get("title"));
        String content = StringUtil.obj2String(params.get("content"));
        
        return null;
    }

}
