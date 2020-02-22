package com.yunjian.core.dto;

import lombok.Data;

@Data
public class GoodsReqDto {

    private Integer limit = 10;

    private Integer currPage = 1;

    private Integer isAsc = 0;

    private String sortField = "create_time";

    private String name = "";
}
