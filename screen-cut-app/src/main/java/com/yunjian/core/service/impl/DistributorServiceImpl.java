package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.PageUtils;
import com.yunjian.common.utils.Query;
import com.yunjian.common.utils.R;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.mapper.DistributorMapper;
import com.yunjian.core.service.IDistributorService;

import javax.annotation.Resource;

/**
 * <p>
 * 经销商信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@Service
public class DistributorServiceImpl extends ServiceImpl<DistributorMapper, Distributor> implements IDistributorService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private DistributorMapper distributorMapper;

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String name = StringUtil.obj2String(params.get("name"));

		QueryWrapper<Distributor> queryWrapper = new QueryWrapper<Distributor>();
		queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
		if (!StringUtils.isEmpty(name)) {
			queryWrapper.like("name", name);
		}
		IPage<Distributor> page = this.page(new Query<Distributor>().getPage(params), queryWrapper);
		return new PageUtils(page);
	}

	@Override
	public R delete(String id) {
		try {
			Distributor distributor = this.getOne(new QueryWrapper<Distributor>().eq("id", id));
			distributor.setDeleteFlag(0);
			this.saveOrUpdate(distributor);
			return R.ok();
		} catch (Exception e) {
			logger.error("逻辑删除经销商失败", e);
			return R.error("逻辑删除经销商失败");
		}
	}

	@Override
	public R saveDistributorInfo(Map<String, Object> params) {
		String id = StringUtil.obj2String(params.get("id"));
		try {
			String identifier = StringUtil.obj2String(params.get("identifier"));
			Distributor tmp = this.getOne(new QueryWrapper<Distributor>().eq("identifier", identifier));
			if (StringUtils.isEmpty(id)) { // 新增
				if (tmp != null && !StringUtils.isEmpty(identifier)) {
					return R.error("运营商标识已经存在");
				}
				Distributor distributor = new Distributor();
				distributor.setName(StringUtil.obj2String(params.get("name")));
				distributor.setAddress(StringUtil.obj2String(params.get("address")));
				distributor.setContact(StringUtil.obj2String(params.get("contact")));
				distributor.setPhone(StringUtil.obj2String(params.get("phone")));
				distributor.setEmail(StringUtil.obj2String(params.get("email")));
				distributor.setIdentifier(StringUtil.obj2String(params.get("identifier")));
				distributor.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
				distributor.setCreateTime(new Date());
				distributor.setUpdateTime(new Date());
				distributor.setDeleteFlag(1);
				this.save(distributor);
			} else { // 修改
				Distributor distributor = this.getOne(new QueryWrapper<Distributor>().eq("id", Integer.parseInt(id)));
				if (tmp != null && !StringUtils.isEmpty(identifier) && tmp.getId() != Integer.parseInt(id)) {
					return R.error("运营商标识已经存在");
				}
				distributor.setName(StringUtil.obj2String(params.get("name")));
				distributor.setAddress(StringUtil.obj2String(params.get("address")));
				distributor.setContact(StringUtil.obj2String(params.get("contact")));
				distributor.setPhone(StringUtil.obj2String(params.get("phone")));
				distributor.setEmail(StringUtil.obj2String(params.get("email")));
				distributor.setIdentifier(StringUtil.obj2String(params.get("identifier")));
				distributor.setStatus(Integer.parseInt(StringUtil.obj2String(params.get("status"))));
				distributor.setUpdateTime(new Date());
				this.saveOrUpdate(distributor);
			}
		} catch (Exception e) {
			logger.error("保存经销商信息失败", e);
			return R.error("保存经销商信息失败");
		}
		return R.ok();
	}

	@Override
	public R saveBatchRecord(List<Distributor> resultList) {
		// 校验是否有重复数据
		List<String> identifierList = distributorMapper.queryIdentifierList();
		List<String> nameList = distributorMapper.queryNameList();
		logger.info("导入经销商数量{}", resultList.size());
		resultList.forEach(item -> {
			if(identifierList.contains(item.getIdentifier())){
				logger.info("经销商标识已经存在{}", item);
				resultList.remove(item);
			}
			if(nameList.contains(item.getName())){
				logger.info("经销商名称已经存在{}", item);
				resultList.remove(item);
			}
		});

		logger.info("过滤后经销商数量{}", resultList.size());
		if(resultList.size() > 0){
			this.saveBatch(resultList);
		}
		return R.ok();
	}

}
