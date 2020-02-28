package com.yunjian.core.admin;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.service.IDistributorService;

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

}
