package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.yunjian.core.entity.Device;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.mapper.DistributorMapper;
import com.yunjian.core.service.IDeviceService;
import com.yunjian.core.service.IDistributorService;

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

	@Autowired
	private IDeviceService deviceService;

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
			List<Device> deviceList = deviceService.list(new QueryWrapper<Device>()
					.eq("distributor_id", id)
					.eq("delete_flag", 1));
			if(!deviceList.isEmpty()){
				return R.error("经销商有关联的设备，无法删除");
			}
			this.remove(new QueryWrapper<Distributor>().eq("id", id));
			return R.ok();
		} catch (Exception e) {
			logger.error("删除经销商失败", e);
			return R.error("删除经销商失败");
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
		for (Distributor distributor : resultList){
			Distributor record = this.getOne(new QueryWrapper<Distributor>().eq("identifier", distributor.getIdentifier()));
			if (record == null){
				this.saveOrUpdate(distributor);
			}else{
				logger.info("经销商标识已经存在{}", distributor);
				continue;
			}
		}
		return R.ok();
	}

}
