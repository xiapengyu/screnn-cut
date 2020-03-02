package com.yunjian.core.admin;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.*;
import com.yunjian.core.dto.GoodsImageDto;
import com.yunjian.core.entity.*;
import com.yunjian.core.service.IGoodsImgService;
import com.yunjian.core.service.IGoodsService;
import com.yunjian.core.service.IGoodsTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品信息表 前端控制器
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@RestController
@RequestMapping("/sys/goods")
public class SysGoodsController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private IGoodsService goodsService;
	@Autowired
	private IGoodsTypeService goodsTypeService;
	@Autowired
	private IGoodsImgService goodsImgService;
	
	/**
     * 分页查询商品列表
     */
    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        logger.info("分页查询商品列表{}", JsonUtil.toJsonString(params));

        SysUserEntity user = (SysUserEntity) HttpContextUtils.getLoginUser().get("sysUser");
        SysRoleEntity role = (SysRoleEntity) HttpContextUtils.getLoginUser().get("role");
        int isDealer = 0;
        if(role!=null && role.getRoleId()==2) { //2：经销商
            params.put("creatorId", user.getUserId());
            isDealer = 1;
        }

        PageUtils page = goodsService.queryPage(params);
        return R.ok().put("page", page).put("isDealer", isDealer);
    }

    /**
     * 查询商品详情
     */
    @PostMapping("/info")
    public R info(@RequestBody Map<String, Object> params){
        logger.info("查询商品详情{}", JsonUtil.toJsonString(params));
        String id = StringUtil.obj2String(params.get("id"));
        if(!StringUtils.isEmpty(id)){
        	Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", id));
        	List<GoodsType> typeList = goodsTypeService.list(new QueryWrapper<GoodsType>().eq("delete_flag", 1));
			if(typeList.isEmpty()) {
				return R.error("获取商品类型失败");
			}
			String[] ids = goods.getType().split(",");
			List<Integer> typeIdList = new ArrayList<>();
			for(String item : ids) {
				typeIdList.add(Integer.parseInt(item));
			}
			
			List<GoodsImageDto> imageDtoList = new ArrayList<>();
			List<String> goodsImageList = new ArrayList<>();
			List<GoodsImg> imageList = goodsImgService.list(new QueryWrapper<GoodsImg>().eq("goods_id", id));
			imageList.forEach(item -> {
				imageDtoList.add(new GoodsImageDto(item.getImageUrl()));
				goodsImageList.add(item.getImageUrl());
			});
            return R.ok().put("goods", goods)
            		.put("typeIdList", typeIdList)
            		.put("typeList", typeList)
            		.put("imageDtoList", imageDtoList)
            		.put("goodsImageList", goodsImageList);
        }else{
            return R.error("参数错误");
        }
    }

    /**
     * 删除商品（逻辑删除）
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Map<String, Object> params){
        logger.info("删除商品{}", JsonUtil.toJsonString(params));
        try {
            String id = StringUtil.obj2String(params.get("id"));
            if(!StringUtils.isEmpty(id)){
                Goods goods = goodsService.getOne(new QueryWrapper<Goods>().eq("id", id));
                goods.setDeleteFlag(0);
                goodsService.saveOrUpdate(goods);
                return R.ok();
            }else{
                return R.error("参数错误");
            }
        } catch (Exception e) {
            logger.error("删除商品错误", e);
            return R.error("删除商品错误");
        }	
    }
    
    /**
     * 新增商品
     */
    @PostMapping("/newGoods")
    public R newGoods(@RequestBody Map<String, Object> params){
        logger.info("新增商品{}", JsonUtil.toJsonString(params));
        return goodsService.newGoods(params);
    }

    /**
     * 保存商品
     */
    @PostMapping("/saveGoods")
    public R saveGoods(@RequestBody Map<String, Object> params){
        logger.info("保存商品{}", JsonUtil.toJsonString(params));
        return goodsService.saveGoods(params);
    }
    
    /**
     * 查询商品分类
     * @return
     */
    @PostMapping("/queryGoodsTypeList")
    public R queryGoodsTypeList() {
    	logger.info("查询商品分类");
    	try {
			List<GoodsType> typeList = goodsTypeService.list(new QueryWrapper<GoodsType>().eq("delete_flag", 1));
			if(typeList.isEmpty()) {
				return R.error("获取商品类型失败");
			}
			return R.ok().put("typeList", typeList);
		} catch (Exception e) {
			logger.error("获取商品类型失败", e);
			return R.error("获取商品类型失败");
		}
    }

}
