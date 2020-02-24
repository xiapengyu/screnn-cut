package com.yunjian.core.admin;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.ExcelUtil;
import com.yunjian.common.utils.FileUtil;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Device;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.service.IDeviceService;
import com.yunjian.core.service.IDistributorService;

import net.sf.json.JSONArray;

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

    @Value("${template.device.url}")
    private String deviceTemplate = "";
	
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

    /**
     * 下载设备信息模板
     */
    @PostMapping("/downDeviceTemplate")
    public R downDeviceTemplate() {
        logger.info("设备信息模板文件地址：{}", deviceTemplate);
        return R.ok().put("deviceTemplate", deviceTemplate);
    }

    /**
     * 导入并保存设备信息
     */
    @SuppressWarnings("unchecked")
	@PostMapping("/uploadDeviceFile")
    public R importDevice(@RequestParam("file") MultipartFile file) {
        File uploadFile = FileUtil.multipartFileToFile(file);
        JSONArray array = ExcelUtil.readExcel(uploadFile);
        logger.info("解析数据{}", JsonUtil.toJsonString(array));
        uploadFile.delete();
        List<Device> resultList = new ArrayList<>();
        try {
            if(array.size() > 0){
            	for(Object item : array) {
                    logger.info("解析对象{}", item.toString());
                    Map<String, Object> map = JsonUtil.toMap(item.toString());
                    Device device = new Device();
                    device.setSerialNo(map.get("0").toString().trim());
                    device.setType((int)Double.parseDouble(map.get("1").toString().trim()));
                    device.setEmail(map.get("2").toString().trim());
                    device.setRemainTimes((int)Double.parseDouble(map.get("3").toString().trim()));
                    device.setIdentifier(map.get("4").toString().trim());
                    device.setBuyTime(new Date());
                    device.setStatus(1);
                    device.setCreateTime(new Date());
                    device.setUpdateTime(new Date());
                    device.setDeleteFlag(1);
                    Distributor distributor = distributorService.getOne(new QueryWrapper<Distributor>().eq("identifier", map.get("4").toString().trim()));
                    if(distributor != null){
                        device.setDistributorId(distributor.getId());
                        device.setDistributorName(distributor.getName());
                        resultList.add(device);
                    }
            	}
                return deviceService.saveBatchRecord(resultList);
            }else{
                return R.error("经销商内容为空");
            }
        } catch (Exception e) {
            logger.error("导入经销商信息失败", e);
            return R.error("导入经销商信息失败");
        }
    }

}
