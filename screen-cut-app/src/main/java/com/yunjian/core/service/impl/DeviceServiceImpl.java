package com.yunjian.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yunjian.common.utils.*;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.core.entity.Device;
import com.yunjian.core.entity.Distributor;
import com.yunjian.core.mapper.DeviceMapper;
import com.yunjian.core.service.IDeviceService;
import com.yunjian.core.service.IDistributorService;

/**
 * <p>
 * 设备信息表 服务实现类
 * </p>
 *
 * @author xiapengyu
 * @since 2020-02-05
 */
@Service
public class DeviceServiceImpl extends ServiceImpl<DeviceMapper, Device> implements IDeviceService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SysUserService sysUserService;

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String serialNo = StringUtil.obj2String(params.get("serialNo"));
		String creatorName = StringUtil.obj2String(params.get("creatorName"));
		String type = StringUtil.obj2String(params.get("type"));
		String status = StringUtil.obj2String(params.get("status"));

		QueryWrapper<Device> queryWrapper = new QueryWrapper<Device>();
		queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
		if (!StringUtils.isEmpty(serialNo)) {
			queryWrapper.like("serial_no", serialNo);
		}
		if (!StringUtils.isEmpty(creatorName)) {
			queryWrapper.like("creator_name", creatorName);
		}
		if (!StringUtils.isEmpty(type)) {
			queryWrapper.eq("type", type);
		}
		if (!StringUtils.isEmpty(status)) {
			queryWrapper.eq("status", status);
		}
		SysUserEntity loginUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
		if(loginUser.getUserId() != Constant.SUPER_ADMIN){
			queryWrapper.eq("creator_id", loginUser.getUserId().intValue());
		}
		IPage<Device> page = this.page(new Query<Device>().getPage(params), queryWrapper);
		return new PageUtils(page);
	}

	@Override
	public R saveDeviceInfo(Map<String, Object> params) {
		String id = StringUtil.obj2String(params.get("id"));
		try {
			//校验序列码是否重复
			String serialNo = StringUtil.obj2String(params.get("serialNo"));
			Device tmp = this.getOne(new QueryWrapper<Device>().eq("serial_no", serialNo));
			if (StringUtils.isEmpty(id)) { // 新增
				if(tmp != null  && !StringUtils.isEmpty(serialNo)) {
					return R.error("设备序列码已经存在");
				}
				Device device = new Device();
				device.setSerialNo(StringUtil.obj2String(params.get("serialNo")));
				device.setType(Integer.parseInt(StringUtil.obj2String(params.get("type"))));
				String creatorId = StringUtil.obj2String(params.get("creatorId"));
				SysUserEntity user = sysUserService.getOne(new QueryWrapper<SysUserEntity>().eq("user_id", Long.parseLong(creatorId)));
				device.setCreatorId(user.getUserId());
				device.setCreatorName(user.getCompany());
				device.setStatus(1);
				device.setBuyTime(null);
				device.setEmail(StringUtil.obj2String(params.get("email")));
				device.setRemainTimes(Integer.parseInt(StringUtil.obj2String(params.get("remainTimes"))));
				device.setCreateTime(new Date());
				device.setUpdateTime(new Date());
				device.setDeleteFlag(1);
				this.save(device);
			} else { // 修改
				Device device = this.getOne(new QueryWrapper<Device>().eq("id", Integer.parseInt(id)));
				if(tmp != null  && !StringUtils.isEmpty(serialNo) && tmp.getId() != Integer.parseInt(id)) {
					return R.error("设备序列码已经存在");
				}
				device.setSerialNo(StringUtil.obj2String(params.get("serialNo")));
				device.setType(Integer.parseInt(StringUtil.obj2String(params.get("type"))));
				String creatorId = StringUtil.obj2String(params.get("creatorId"));
				SysUserEntity user = sysUserService.getOne(new QueryWrapper<SysUserEntity>().eq("user_id", Long.parseLong(creatorId)));
				device.setCreatorId(user.getUserId());
				device.setCreatorName(user.getCompany());
				device.setStatus(1);
				device.setBuyTime(null);
				device.setEmail(StringUtil.obj2String(params.get("email")));
				device.setRemainTimes(Integer.parseInt(StringUtil.obj2String(params.get("remainTimes"))));
				device.setUpdateTime(new Date());
				this.saveOrUpdate(device);
			}
		} catch (Exception e) {
			logger.error("保存设备信息失败", e);
			return R.error("保存设备信息失败");
		}
		return R.ok();
	}

	@Override
	public R deleteDevice(String id) {
		try {
			Device device = this.getOne(new QueryWrapper<Device>().eq("id", Integer.parseInt(id)));
			device.setDeleteFlag(0);
			this.saveOrUpdate(device);
			return R.ok();
		} catch (Exception e) {
			logger.error("逻辑删除设备失败", e);
			return R.error("逻辑删除设备失败");
		}
	}

	@Override
	public R saveBatchRecord(List<Device> resultList) {
		// 校验设备是否已经
		for (Device device : resultList){
			Device record = this.getOne(new QueryWrapper<Device>().eq("serial_no", device.getSerialNo()));
			if(record == null){
				this.saveOrUpdate(device);
			}else{
				logger.info("设备序列号已经存在{}", device);
				continue;
			}
		}
		return R.ok();
	}

}
