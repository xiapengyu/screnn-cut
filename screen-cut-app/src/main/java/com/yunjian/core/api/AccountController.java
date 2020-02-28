package com.yunjian.core.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yunjian.common.utils.StringUtil;
import com.yunjian.core.dto.GoodsDetailDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.Device;
import com.yunjian.core.service.IDeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import com.yunjian.common.utils.Constant;
import com.yunjian.common.utils.JsonUtil;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.entity.Account;
import com.yunjian.core.service.IAccountService;

@RestController
@RequestMapping("/api/account")
public class AccountController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IAccountService accountServiceImpl;

	@Autowired
	private IDeviceService deviceService;
	
	/**
	 *修改用户信息
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/modifyAccountInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto modifyAccountInfo(@RequestBody Account param) {
		logger.info("修改用户信息{}", JsonUtil.toJsonString(param));
		return accountServiceImpl.modifyAccountInfo(param);
	}
	/**
	 *修改用户密码
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/modifyPassword", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDto modifyPassword(@RequestBody Account param) {
		logger.info("修改用户密码{}", JsonUtil.toJsonString(param));
		if(StringUtils.isEmpty(param.getPassword())) {
			return new ResponseDto(Constant.PARMS_ERROR_CODE, null, "请填写密码");
		}
		return accountServiceImpl.modifyPassword(param);
	}

	/**
	 * 切割成功通知用户
	 */
	@PostMapping("/successNotify")
	public ResponseDto successNotify(){
		logger.info("切割成功通知用户");
		ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
		try {
			//更新用户次数
			Account account = SecurityContext.getUserPrincipal();
			Account a = accountServiceImpl.getOne(new QueryWrapper<Account>().eq("id", account));
			Device device = deviceService.getOne(new QueryWrapper<Device>()
					.eq("serial_no", a.getSerialNo()));
			//有限次数的用户不更新切割次数
			if(device.getType() != 1){
				//更新设备次数
				device.setUseTimes(device.getUseTimes() + 1);
				device.setRemainTimes(device.getRemainTimes() - 1);
				deviceService.saveOrUpdate(device);
			}
		} catch (Exception e) {
			logger.info("切割成功通知用户失败", e);
			return new ResponseDto(Constant.FAIL_CODE, null, "切割成功通知用户失败");
		}
		return response;
	}
}
