package com.yunjian.core.admin;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Ad;
import com.yunjian.core.entity.AdPosition;
import com.yunjian.core.service.IAdPositionService;
import com.yunjian.core.service.IAdService;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author xiapengyu
 * @since 2020-01-29
 */

@Api("广告管理api")
@RestController
@RequestMapping("/sys/ad")
public class SysAdController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IAdService adService;

    @Autowired
    private IAdPositionService adPositionService;

    /**
     * 所有广告位列表
     */
    @PostMapping("/adPositionList")
    public R adPositionList(@RequestBody Map<String, Object> params){
        logger.info("查询广告位列表{}", JsonUtil.toJsonString(params));
        PageUtils page = adPositionService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 所有广告位列表
     */
    @PostMapping("/queryTotalPosition")
    public R queryTotalPosition(){
        logger.info("查询全部广告位列表");
        List<AdPosition> list = adPositionService.list(new QueryWrapper<AdPosition>()
                .eq("delete_flag", 1)
                .orderByDesc("create_time"));
        return R.ok().put("positionList", list);
    }

    /**
     * 逻辑删除广告位
     */
    @PostMapping("/deleteAdPosition")
    public R deleteAdPosition(@RequestBody Map<String, Object> params){
        logger.info("逻辑删除广告位{}", JsonUtil.toJsonString(params));
        String positionId = StringUtil.obj2String(params.get("positionId"));
        if(!StringUtils.isEmpty(positionId)){
            return adPositionService.deleteAdPosition(positionId);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 查询广告位详情
     */
    @PostMapping("/queryPositionInfo")
    public R queryPositionInfo(@RequestBody Map<String, Object> params){
        logger.info("查询广告位详情{}", JsonUtil.toJsonString(params));
        String positionId = StringUtil.obj2String(params.get("positionId"));
        if(!StringUtils.isEmpty(positionId)){
            AdPosition adPosition = adPositionService.getOne(new QueryWrapper<AdPosition>().eq("id", positionId));
            return R.ok().put("adPosition", adPosition);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 保存广告位信息
     */
    @PostMapping("/saveAdPosition")
    public R saveAdPosition(@RequestBody Map<String, Object> params){
        logger.info("保存广告位信息{}", JsonUtil.toJsonString(params));
        return adPositionService.adPositionInfoSave(params);
    }

    /**
     * 所有广告信息列表
     */
    @PostMapping("/adInfoList")
    public R adInfoList(@RequestBody Map<String, Object> params){
        logger.info("查询广告信息列表{}", JsonUtil.toJsonString(params));
        PageUtils page = adService.queryPage(params);
        List<AdPosition> positionList = adPositionService.list(new QueryWrapper<AdPosition>().eq("delete_flag", 1));
        return R.ok().put("page", page).put("positionList", positionList);
    }

    /**
     * 查询广告详情
     */
    @PostMapping("/queryAdInfo")
    public R queryAdInfo(@RequestBody Map<String, Object> params){
        logger.info("查询广告详情{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                Ad ad = adService.getOne(new QueryWrapper<Ad>().eq("id", id));
                return R.ok().put("adInfo", ad);
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("查询广告详情错误", e);
            return R.error("查询广告详情错误");
        }
    }

    /**
     * 删除广告
     */
    @PostMapping("/deleteAdInfo")
    public R deleteAdInfo(@RequestBody Map<String, Object> params){
        logger.info("删除广告{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                adService.remove(new QueryWrapper<Ad>().eq("id", id));
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除广告错误", e);
            return R.error("删除广告错误");
        }
    }

    /**
     * 保存广告信息
     */
    @PostMapping("/saveAdInfo")
    public R saveAdInfo(@RequestBody Map<String, Object> params){
        logger.info("保存广告信息{}", JsonUtil.toJsonString(params));
        return adService.saveAdInfo(params);
    }

}
