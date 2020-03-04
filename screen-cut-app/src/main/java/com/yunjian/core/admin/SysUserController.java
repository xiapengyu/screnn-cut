package com.yunjian.core.admin;

import com.yunjian.common.annotation.SysLog;
import com.yunjian.common.utils.*;
import com.yunjian.common.validator.Assert;
import com.yunjian.common.validator.ValidatorUtils;
import com.yunjian.common.validator.group.AddGroup;
import com.yunjian.common.validator.group.UpdateGroup;
import com.yunjian.core.entity.SysUserEntity;
import com.yunjian.core.form.PasswordForm;
import com.yunjian.core.service.SysUserRoleService;
import com.yunjian.core.service.SysUserService;
import net.sf.json.JSONArray;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 系统用户
 *
 *
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysUserRoleService sysUserRoleService;

	@Value("${template.distributor.url}")
	private String userTemplate = "";


	/**
	 * 所有用户列表
	 */
	@GetMapping("/list")
	@RequiresPermissions("sys:user:list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getUserId());
		}
		PageUtils page = sysUserService.queryPage(params);

		return R.ok().put("page", page);
	}
	
	/**
	 * 获取登录的用户信息
	 */
	@GetMapping("/info")
	public R info(){
		return R.ok().put("user", getUser());
	}
	
	/**
	 * 修改登录用户密码
	 */
	@SysLog("修改密码")
	@PostMapping("/password")
	public R password(@RequestBody PasswordForm form){
		Assert.isBlank(form.getNewPassword(), "新密码不为能空");
		
		//sha256加密
		String password = new Sha256Hash(form.getPassword(), getUser().getSalt()).toHex();
		//sha256加密
		String newPassword = new Sha256Hash(form.getNewPassword(), getUser().getSalt()).toHex();
				
		//更新密码
		boolean flag = sysUserService.updatePassword(getUserId(), password, newPassword);
		if(!flag){
			return R.error("原密码不正确");
		}
		
		return R.ok();
	}
	
	/**
	 * 用户信息
	 */
	@GetMapping("/info/{userId}")
	@RequiresPermissions("sys:user:info")
	public R info(@PathVariable("userId") Long userId){
		SysUserEntity user = sysUserService.getById(userId);
		
		//获取用户所属的角色列表
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);
		
		return R.ok().put("user", user);
	}
	
	/**
	 * 保存用户
	 */
	@SysLog("保存用户")
	@PostMapping("/save")
	@RequiresPermissions("sys:user:save")
	public R save(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, AddGroup.class);
		
		user.setCreateUserId(getUserId());
		sysUserService.saveUser(user);
		
		return R.ok();
	}
	
	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@PostMapping("/update")
	@RequiresPermissions("sys:user:update")
	public R update(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, UpdateGroup.class);

		user.setCreateUserId(getUserId());
		sysUserService.update(user);
		
		return R.ok();
	}
	
	/**
	 * 删除用户
	 */
	@SysLog("删除用户")
	@PostMapping("/delete")
	@RequiresPermissions("sys:user:delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}
		
		if(ArrayUtils.contains(userIds, getUserId())){
			return R.error("当前用户不能删除");
		}
		
		sysUserService.deleteBatch(userIds);
		
		return R.ok();
	}

	/**
	 * 下载经销商信息模板
	 */
	@PostMapping("/downUserInfoTemplate")
	public R downTemplate() {
		logger.info("经销商模板文件地址：{}", userTemplate);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String token = request.getHeader("token");
		return R.ok().put("userTemplate", userTemplate).put("token", token);
	}
	
	/**
	 * 切换语言
	 */
	@PostMapping("/changeLocal")
	public R changeLocal(@RequestBody Map<String, Object> params) {
		String language = (String) params.get("language");
		SysUserEntity user = (SysUserEntity) HttpContextUtils.getLoginUser().get("sysUser");
		user.setLanguage(language);
		sysUserService.changeLocal(user);
		return R.ok();
	}

	/**
	 * 导入并保存经销商信息
	 */
	@SuppressWarnings("unchecked")
	@PostMapping("/uploadUserInfoFile")
	public R importUserInfo(@RequestParam("file") MultipartFile file) {
		File uploadFile = FileUtil.multipartFileToFile(file);
		JSONArray array = ExcelUtil.readExcel(uploadFile);
		logger.info("解析数据{}", JsonUtil.toJsonString(array));
		uploadFile.delete();
		List<SysUserEntity> resultList = new ArrayList<>();
		SysUserEntity loginUser = HttpContextUtils.getLoginSysUserEntity();
		try {
			if(array.size() > 0){
				for(Object item : array) {
					logger.info("解析对象{}", item.toString());
					Map<String, Object> map = JsonUtil.toMap(item.toString());

					SysUserEntity sysUser = new SysUserEntity();
					sysUser.setUsername(map.get("0").toString().trim());
					String salt = RandomStringUtils.randomAlphanumeric(20);
					sysUser.setSalt(salt);
					sysUser.setPassword(new Sha256Hash(map.get("1").toString().trim(), salt).toHex());
					sysUser.setCompany(map.get("2").toString().trim());
					sysUser.setContact(map.get("3").toString().trim());
					sysUser.setMobile(map.get("4").toString().trim());
					sysUser.setEmail(map.get("5").toString().trim());
					sysUser.setStatus(1);
					sysUser.setCreateTime(new Date());
					sysUser.setCreateUserId(loginUser.getUserId());
					resultList.add(sysUser);
				}
				return sysUserService.saveBatchRecord(resultList);
			}else{
				return R.error("经销商内容为空");
			}
		} catch (Exception e) {
			logger.error("导入经销商信息失败", e);
			return R.error("导入经销商信息失败");
		}
	}
}
