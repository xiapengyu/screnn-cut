package com.yunjian.core.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yunjian.common.utils.*;
import com.yunjian.core.entity.SysUserEntity;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.dto.GoodsDetailDto;
import com.yunjian.core.dto.GoodsDto;
import com.yunjian.core.dto.GoodsReqDto;
import com.yunjian.core.entity.Goods;
import com.yunjian.core.entity.GoodsImg;
import com.yunjian.core.entity.GoodsType;
import com.yunjian.core.mapper.GoodsMapper;
import com.yunjian.core.service.IGoodsImgService;
import com.yunjian.core.service.IGoodsService;
import com.yunjian.core.service.IGoodsTypeService;

/**
 * <p>
 * 商品信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-02
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IGoodsImgService goodsImgService;
	@Autowired
	private IGoodsTypeService goodsTypeService;

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String name = (String) params.get("name");

		QueryWrapper<Goods> queryWrapper = new QueryWrapper<Goods>();
		queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
		if (StringUtils.isNotBlank(name)) {
			queryWrapper.like("name", name);
		}

		SysUserEntity loginUser = HttpContextUtils.getLoginSysUserEntity();
		if(loginUser.getUserId() != Constant.SUPER_ADMIN){
			queryWrapper.eq("creator_id", loginUser.getUserId());
		}

		IPage<Goods> page = this.page(new Query<Goods>().getPage(params), queryWrapper);
		return new PageUtils(page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public R saveGoods(Map<String, Object> params) {
		String id = StringUtil.obj2String(params.get("id"));
		try {
			Goods goods = this.getOne(new QueryWrapper<Goods>().eq("id", id));
			goods.setName(StringUtil.obj2String(params.get("name")));
			goods.setComment(StringUtil.obj2String(params.get("comment")));
			goods.setPrice(BigDecimal.valueOf(Double.parseDouble(StringUtil.obj2String(params.get("price")))));
			goods.setDiscountPrice(BigDecimal.valueOf(Double.parseDouble(StringUtil.obj2String(params.get("discountPrice")))));
			goods.setIsDiscount(Integer.parseInt(StringUtil.obj2String(params.get("isDiscount"))));
			goods.setSaleAmount(0);
			goods.setStock(Integer.parseInt(StringUtil.obj2String(params.get("stock"))));
			List<Integer> typeIdList = (List<Integer>) params.get("typeIdList");
			String ids = "";
			for(Integer item : typeIdList) {
				ids = ids + item + ",";
			}
			goods.setType(ids.substring(0, ids.lastIndexOf(",")));
			goods.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
			goods.setCreateTime(new Date());
			goods.setUpdateTime(new Date());
			goods.setDeleteFlag(1);
			if(this.saveOrUpdate(goods)) {
				//删除旧图片
				goodsImgService.remove(new QueryWrapper<GoodsImg>().eq("goods_id", id));
				//插入新图片
				List<GoodsImg> imgList = new ArrayList<GoodsImg>();
				List<String> goodsImageList = (List<String>) params.get("goodsImageList");
				for(String url : goodsImageList) {
					GoodsImg img = new GoodsImg();
					img.setGoodsId(goods.getId());
					img.setImageUrl(url);
					img.setCreateTime(new Date());
					img.setUpdateTime(new Date());
					img.setDeleteFlag(1);
					imgList.add(img);
				}
				goodsImgService.saveBatch(imgList);
			}else {
				logger.error("新增商品信息失败{}", goods);
				return R.error("新增商品信息失败");
			}
		} catch (Exception e) {
			logger.error("保存商品信息失败", e);
			return R.error("保存商品信息失败");
		}
		return R.ok();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public R newGoods(Map<String, Object> params) {
		try {
			Goods goods = new Goods();
			goods.setName(StringUtil.obj2String(params.get("name")));
			goods.setComment(StringUtil.obj2String(params.get("comment")));
			goods.setPrice(BigDecimal.valueOf(Double.parseDouble(StringUtil.obj2String(params.get("price")))));
			goods.setDiscountPrice(BigDecimal.valueOf(Double.parseDouble(StringUtil.obj2String(params.get("discountPrice")))));
			goods.setIsDiscount(Integer.parseInt(StringUtil.obj2String(params.get("isDiscount"))));
			goods.setSaleAmount(0);
			goods.setStock(Integer.parseInt(StringUtil.obj2String(params.get("stock"))));
			List<Integer> typeIdList = (List<Integer>) params.get("typeIdList");
			String ids = "";
			for(Integer item : typeIdList) {
				ids = ids + item + ",";
			}
			goods.setType(ids.substring(0, ids.lastIndexOf(",")));
			goods.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
			goods.setCreateTime(new Date());
			goods.setUpdateTime(new Date());
			goods.setDeleteFlag(1);
			SysUserEntity loginUser = HttpContextUtils.getLoginSysUserEntity();
			goods.setCreatorId(loginUser.getUserId());
			if(this.saveOrUpdate(goods)) {
				List<GoodsImg> imgList = new ArrayList<GoodsImg>();
				List<String> goodsImageList = (List<String>) params.get("goodsImageList");
				for(String url : goodsImageList) {
					GoodsImg img = new GoodsImg();
					img.setGoodsId(goods.getId());
					img.setImageUrl(url);
					img.setCreateTime(new Date());
					img.setUpdateTime(new Date());
					img.setDeleteFlag(1);
					imgList.add(img);
				}
				goodsImgService.saveBatch(imgList);
			}else {
				logger.error("新增商品信息失败{}", goods);
				return R.error("新增商品信息失败");
			}
		} catch (Exception e) {
			logger.error("新增商品信息失败", e);
			return R.error("新增商品信息失败");
		}
		return R.ok();
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageUtils queryGoodsByPage(GoodsReqDto params) {
		QueryWrapper<Goods> query = new QueryWrapper<Goods>();
		if(!StringUtils.isEmpty(params.getName())){
			query.like("name", params.getName());
		}
		boolean isAsc = (params.getIsAsc() == null || params.getIsAsc() == 0) ? false : true;
		if(!StringUtils.isEmpty(params.getSortField())){
			if("name".equals(params.getSortField())){
				query.orderBy(true, isAsc, "name");
			}else if("saleAmount".equals(params.getSortField())){
				query.orderBy(true, isAsc, "saleAmount");
			}else{
				query.orderByDesc("create_time");
			}
		}else{
			query.orderByDesc("create_time");
		}
		Map<String, Object> map = JsonUtil.toMap(JsonUtil.toJsonString(params));
		IPage<Goods> page = this.page(new Query<Goods>().getPage(map), query);
		List<GoodsDto> result = new ArrayList<>();
		page.getRecords().forEach(item -> {
			GoodsDto dto = new GoodsDto();
			BeanUtils.copyProperties(item, dto);
			List<GoodsImg> imgList = goodsImgService.list(
					new QueryWrapper<GoodsImg>()
							.eq("goods_id", item.getId()).orderByAsc("create_time"));
			if(!imgList.isEmpty()){
				dto.setCoverImg(imgList.get(0).getImageUrl());
			}
			result.add(dto);
		});
		return new PageUtils(result, (int)page.getTotal(), (int)page.getSize(), (int)page.getCurrent());
	}

	@Override
	public GoodsDetailDto queryGoodsDetail(String id) {
		GoodsDetailDto dto = new GoodsDetailDto();
		Goods goods = this.getOne(new QueryWrapper<Goods>().eq("id", Integer.parseInt(id)));
		BeanUtils.copyProperties(goods, dto);
		List<GoodsImg> imgList = goodsImgService.list(
				new QueryWrapper<GoodsImg>()
						.eq("goods_id", Integer.parseInt(id)).orderByAsc("create_time"));

		//商品类型信息
		List<String> typeIds = Arrays.asList(goods.getType().split(","));
		List<GoodsType> typeList = goodsTypeService.list(new QueryWrapper<GoodsType>().in("id", typeIds));
		/*String typeDesc = "";
		for(GoodsType type : typeList){
			typeDesc = typeDesc + type.getName() + " ";
		}*/
		dto.setTypeList(typeList);

		//商品图片信息
		List<String> imgUrlList = new ArrayList<>();
		if(!imgList.isEmpty()){
			imgList.forEach(item -> {
				imgUrlList.add(item.getImageUrl());
			});
			dto.setImageList(imgUrlList);
			dto.setCoverImg(imgUrlList.get(0));
		}
		return dto;
	}

}
