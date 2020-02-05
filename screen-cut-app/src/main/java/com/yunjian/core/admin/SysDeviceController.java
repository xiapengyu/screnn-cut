package com.yunjian.core.admin;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Device;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.service.IDeviceService;
import com.yunjian.core.service.IDistributorService;

/**
 * <p>
 * 设备信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@RestController
@RequestMapping("/sys/device")
public class SysDeviceController {
	
private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IDeviceService deviceService;
	
	@Autowired
	private IDistributorService distributorService;
	
	/**
     * 分页查询设备列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询设备列表{}", JsonUtil.toJsonString(params));
        PageUtils page = deviceService.queryPage(params);
        return R.ok().put("page", page);
    }
    
    /**
     * 删除设备
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Map<String, Object> params){
        logger.info("删除设备{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	return deviceService.deleteDevice(id);
        }else{
            return R.error("参数错误");
        }
    }
    
    /**
     * 查询设备详情
     */
    @PostMapping("/info")
    public R queryInfo(@RequestBody Map<String, Object> params){
        logger.info("查询设备详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	Device device = deviceService.getOne(new QueryWrapper<Device>().eq("id", id));
        	 List<Distributor> distributorList = distributorService.list(new QueryWrapper<Distributor>().eq("delete_flag", 1));
            return R.ok().put("device", device).put("distributorList", distributorList);
        }else{
            return R.error("参数错误");
        }
    }
    
    /**
     * 保存设备信息
     */
    @PostMapping("/saveDeviceInfo")
    public R saveDeviceInfo(@RequestBody Map<String, Object> params){
        logger.info("保存设备信息{}", JsonUtil.toJsonString(params));
        return deviceService.saveDeviceInfo(params);
    }

}
