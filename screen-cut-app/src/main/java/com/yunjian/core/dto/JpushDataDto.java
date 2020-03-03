package com.yunjian.core.dto;

import java.util.Collection;
import java.util.Map;

public class JpushDataDto {

    // 服务源（云呼叫）
    private String source;
    // 极光推送注册别名
    private Collection<String> alias;
    // 通知标题
    private String title;
    // 通知子标题
    private String subTitle;
    // 通知子标题
    @Deprecated
    private String body;
    // 推送消息体
    private Map<String, String> data;
    // 推送唤醒
    private boolean available;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getBody() {
        return body;
    }

    @Deprecated
    public void setBody(String body) {
        this.body = body;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public JpushDataDto() {
    }

    public Collection<String> getAlias() {
        return alias;
    }

    public void setAlias(Collection<String> alias) {
        this.alias = alias;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

}
