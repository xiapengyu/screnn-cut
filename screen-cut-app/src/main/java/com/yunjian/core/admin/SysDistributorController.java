package com.yunjian.core.admin;


import java.io.File;
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
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.service.IDistributorService;

import net.sf.json.JSONArray;

/**
 * <p>
 * 经销商信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@RestController
@RequestMapping("/sys/distributor")
public class SysDistributorController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IDistributorService distributorService;
	
	@Value("${template.distributor.url}")
    private String distributorTemplate = "";
	
	@Value("${template.device.url}")
    private String deviceTemplate = "";
	
	/**
     * 分页查询经销商列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("页查询经销商列表{}", JsonUtil.toJsonString(params));
        PageUtils page = distributorService.queryPage(params);
        return R.ok().put("page", page);
    }
    
    /**
     * 查询全部经销商列表
     */
    @PostMapping("/queryTotalDistributor")
    public R queryTotalDistributor(){
        logger.info("查询全部经销商列表");
        List<Distributor> distributorList = distributorService.list(new QueryWrapper<Distributor>().eq("delete_flag", 1));
        return R.ok().put("distributorList", distributorList);
    } 
    
    /**
     * 删除经销商
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Map<String, Object> params){
        logger.info("删除经销商{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	return distributorService.delete(id);
        }else{
            return R.error("参数错误");
        }
    }
    
    /**
     * 查询经销商详情
     */
    @PostMapping("/info")
    public R queryInfo(@RequestBody Map<String, Object> params){
        logger.info("查询经销商详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	Distributor distributor = distributorService.getOne(new QueryWrapper<Distributor>().eq("id", id));
            return R.ok().put("distributor", distributor);
        }else{
            return R.error("参数错误");
        }
    }
    
    /**
     * 保存经销商信息
     */
    @PostMapping("/saveDistributorInfo")
    public R saveDistributorInfo(@RequestBody Map<String, Object> params){
        logger.info("保存经销商信息{}", JsonUtil.toJsonString(params));
        return distributorService.saveDistributorInfo(params);
    }
    
    /**
     * 下载经销商信息模板
     */
    @PostMapping("/downDistributorTemplate")
    public R downTemplate() {
    	logger.info("经销商模板文件地址：{}", distributorTemplate);
    	return R.ok().put("distributorTemplate", distributorTemplate);
    }
    
    /**
     * 导入经销商信息
     */
    @PostMapping("/uploadDistributorFile")
    public R importDistributor(@RequestParam("file") MultipartFile file) {
    	File uploadFile = FileUtil.multipartFileToFile(file);
    	JSONArray array = ExcelUtil.readExcel(uploadFile);
    	logger.info("解析数据{}", JsonUtil.toJsonString(array));
    	return R.ok();
    }
    
    /**
     * 保存导入的经销商信息
     */
    @PostMapping("/batchSaveDistributorInfo")
    public R importDistributor(@RequestBody Map<String, Object> params) {
    	return null;
    }
    
    /**
     * 下载设备信息模板
     */
    @PostMapping("/downDeviceTemplate")
    public R downDeviceTemplate() {
    	return null;
    }
	
	 /**
     * 导入设备信息
     */
    @PostMapping("/importDevice")
    public R importDevice(@RequestParam("file") MultipartFile file) {
    	return null;
    }
    
}
