package com.yunjian.core.dto;

import com.yunjian.core.entity.Ad;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class IndexInfoDto {

    private List<Ad> adList = new ArrayList<>();

    private Integer accountType;

    private Integer useAmount = 0;

    private Integer unUseAmount = 0;

}
