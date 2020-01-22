

package com.yunjian.core.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 系统配置信息
 * 
 * @author chenshun
 *
 * @date 2016年12月4日 下午6:43:36
 */
@Data
@TableName("sys_dict_type")
public class SysDictTypeEntity {
	@TableId
	private Long dictId;
	@NotBlank(message="字典名称不能为空")
	private String dictName;
	@NotBlank(message="字典类型不能为空")
	private String dictType;
	private String remark;
	private String status;
}
