package com.yunjian.core.admin;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yunjian.common.utils.R;

@RestController
@RequestMapping("/sys/message")
public class SysMessageCenterController {

    @PostMapping("/pushMessage")
    public R pushMessage(@RequestBody Map<String, Object> params){
        return null;
    }

}
