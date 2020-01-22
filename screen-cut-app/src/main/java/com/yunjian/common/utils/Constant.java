package com.yunjian.common.utils;

public class Constant {
	
	public static final long CODE_EXPIRE_TIME = 1000 * 60 * 5;

	/** 超级管理员ID */
	public static final int SUPER_ADMIN = 1;

	/**
	 * 当前页码
	 */
	public static final String CURPAGE = "curPage";


	/**
	 * 菜单类型
	 * 
	 */
	public enum MenuType {
		/**
		 * 目录
		 */
		CATALOG(0),
		/**
		 * 菜单
		 */
		MENU(1),
		/**
		 * 按钮
		 */
		BUTTON(2);

		private int value;

		MenuType(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	/**
	 * 定时任务状态
	 * 
	 */
	public enum ScheduleStatus {
		/**
		 * 正常
		 */
		NORMAL(0),
		/**
		 * 暂停
		 */
		PAUSE(1);

		private int value;

		ScheduleStatus(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	/**
	 * 云服务商
	 */
	public enum CloudService {
		/**
		 * 七牛云
		 */
		QINIU(1),
		/**
		 * 阿里云
		 */
		ALIYUN(2),
		/**
		 * 腾讯云
		 */
		QCLOUD(3);

		private int value;

		CloudService(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	public static final String SESSION_USER_TOKEN = "SESSION_USER_TOKEN";

	public static final String SESSION_USER_INFO = "SESSION_USER_INFO";

	public static final String SESSION_KEY_VERIFYCODE = "SESSION_AUTH_VERIFYCODE";

	public static final String SESSION_CART_INFO = "SESSION_CART_INFO";

	public static final String REDIS_CART_INFO = "REDIS_CART_INFO_";

	public static final String REDIS_KEY_USER = "AUTH:USER_";

	public static final String REDIS_KEY_PHONE = "AUTH:PHONE_";

	/**
	 * 手机验证码登录验证码
	 */
	public static final String REDIS_KEY_VERIFYCODE = "AUTH:VERIFYCODE_";

	/**
	 * 重置交易密码验证码
	 */
	public static final String REDIS_KEY_RESET_TRADE_VERIFYCODE = "AUTH:RESET_TRADE_PWD_CODE_";

	/**
	 * 用户注册验证码
	 */
	public static final String REDIS_KEY_REGISTER_VERIFYCODE = "AUTH:REGISTER_CODE_";

	/**
	 * 重置密码验证码
	 */
	public static final String REDIS_KEY_RESET_PWD_VERIFYCODE = "AUTH:RESET_PWD_CODE_";

	public static final String REDIS_KEY_CART = "CART:GOODS_";

	public static final String REDIS_KEY_GOODS = "GOODS:REMAIN";

	public static final int expireTime = 60 * 60 * 24;

	public static final String PARMS_ERROR_CODE = "00001";
	public static final String PARMS_ERROR_MSG = "参数错误";
	public static final String SYSTEM_ERROR_MSG = "系统内部错误";
	public static final String PARMS_CHECK_MSG = "参数填写有误,请检查各项参数是否正确";

	public static final String SUCCESS_CODE = "00000";
	public static final String SUCCESS_MESSAGE = "SUCCESS";

	public static final String FAIL_CODE = "10000";
	public static final String FAIL_MESSAGE = "FAIL";

	public static final String COMMON_ERROR_CODE = "00002";
	public static final String NO_LOGIN_ERROR_MESSAGE = "没有用户权限";

	public static final String OTHER_ERROR_CODE = "10000";
	public static final String UPDATE_FAIL = "update fail";

	public static final int DELETE_FLAG_VALUE_1 = 1;
	public static final int DELETE_FLAG_VALUE_0 = 0;
	public static final String JOB_RUN_FAIL = "JOB执行失败";

	public static final int PAY_WAY_WX = 1;
	public static final int PAY_WAY_ALIPAY = 2;

	/**
	 * 当前页码
	 */
	public static final String PAGE = "page";
	/**
	 * 每页显示记录数
	 */
	public static final String LIMIT = "limit";
	/**
	 * 排序字段
	 */
	public static final String ORDER_FIELD = "sidx";
	/**
	 * 排序方式
	 */
	public static final String ORDER = "order";
	/**
	 * 升序
	 */
	public static final String ASC = "asc";

	// ****订单状态********//
	/**
	 * 充电状态(1:建立订单;2:充电中;3:正在停止充电;4:充电结束;5:预约中;55:断线重连中)';
	 */
	public static final short CS_STARING = 1;// 创建订单
	public static final short CS_CHARGING = 2;// 充电中
	public static final short CS_STOPING = 3;// 停止充电中
	public static final short CS_FINISH = 4;// 充电已停止
	public static final short CS_SCHEDULING = 5;// 预约中
	public static final short CS_RECONNECT = 55;// 断线重连中

	/**
	 * 对账状态
	 */
	public static final int BILL_UNCHECK = 0;// 未对账
	public static final int BILL_CHECKED = 1;// 已对账

	/**
	 * 支付状态
	 */
	public static final int PAY_STATUS_0 = 0;// 未支付
	public static final int PAY_STATUS_1 = 1;// 已支付

	/**
	 * 支付方式
	 */
	public static final int PAY_TYPE_WEIXIN = 1;// 微信支付
	public static final int PAY_TYPE_ALIPAY = 2;// 支付宝支付

	public static final String ALIPAY = "alipay";
	public static final String WECHAT = "wechat";

	public static final String PLATFORM_ALIPAY = "ALIPAY";
	public static final String PLATFORM_WECHAT = "WECHAT";

	public final static String PAYMENT_REDIS_KEY_PRE = "PAYMENT_CONFIG:";

	public final static long PAYMENT_REDIS_EXPIRE = 12 * 60 * 60L;

	public static final String SIGN_TYPE_MD5 = "MD5";

	public static final String TRADE_TYPE_APP = "APP";

	public static final String DEFAULT_SYS_ERROR_CODE = "00099";

	public static final String DEFAULT_SYS_ERROR_MSG = "00099:系统内部错误";

	/**
	 * 数据库保存标志,更多的可直接扩充，另外在不指定支付方式，以下为默认保存方式
	 */
	public static final String WECHAT_ZSJ = "wechat_zsj";

	public static final String ALIPAY_ZSJ = "alipay_zsj";

	/**
	 * 支付方式名称
	 */
	public static final String PAY_TYPE_WEIXIN_NAME = "微信";
	public static final String PAY_TYPE_ALIPAY_NAME = "支付宝";

	public static final String BILL_TYPE_RECHARGESTATEMENT = "rechargeStatement";
	public static final String BILL_TYPE_RECHARGE = "recharge";
	public static final String BILL_TYPE_CONSUMESTATEMENT = "consumeStatement";
	public static final String BILL_TYPE_CONSUME = "consume";
	public static final String TRANSFORMER_REPORT_DATA = "transformerReport";

	/**
	 * 充电桩启用命令参数
	 */
	public static final String SWITCH_ENABLE_COMMOND = "enable";
	/**
	 * 充电桩禁用命令参数
	 */
	public static final String SWITCH_DISABLE_COMMOND = "disable";
	/**
	 * 充电桩启用命令参数
	 */
	public static final String SWITCH_SUSPEND_COMMOND = "suspend";
	/**
	 * 充电桩禁用命令参数
	 */
	public static final String SWITCH_RESUME_COMMOND = "resume";

	/**
	 * 计费规则在redis中存储的主键前缀
	 */
	public static final String REDIS_KEY_CHARGING_RULES_INFO = "RESPCMD:CHARGINGRULES:INFO-";

	public static final String DEFAULT_STATION_UUID = "0";

	/**
	 * 在线离线状态
	 */
	public static final short ONOFFLINE_STATE_OFFLINE = 0;// 离线
	public static final short ONOFFLINE_STATE_ONLINE = 1;// 在线

	public static final short CHARGING_STATE_ISCHARGING = 1;// 充电中
	public static final short CHARGING_STATE_IDEL = 0;// 空闲

	public static final String INNER_ERROR = "内部错误，请联系工作人员处理";

	public static final String PILE_OCCUPIED_ERROR = "该充电插座被占用，请更换充电插座";

	public static final String CHARGING_END_ERROR = "非常抱歉，充电插座发生异常，充电已停止。";

	/**
	 * 订单已经建立但还未开始充电
	 */
	public static final Short CREATED_BILL = 1;

	/**
	 * 订单正在充电、正在停止之中、正在预约中
	 */
	public static final Short RUNNING_BILL = 2;

	public static final int CONSUME_AMOUNT_LIMIT = 5;

	public static final String SUCCESS_MSG = "success";
	public static final String ERROR_MSG = "fail";
	/**
	 * 设备状态开始升级
	 */
	public static final short DEVICE_STATUS_FAULT_UPGRADE = 2;
	/**
	 * 设备状态升级成功
	 */
	public static final short DEVICE_STATUS_FAULT_UPGRADE_SUCCESS = 3;
	/**
	 * 设备状态升级失败
	 */
	public static final short DEVICE_STATUS_FAULT_UPGRADE_FAILED = 4;
	/**
	 * 高峰
	 */
	public static final short FEE_RULE_STAGE_1 = 1;
	/**
	 * 平峰
	 */
	public static final short FEE_RULE_STAGE_2 = 2;
	/**
	 * 低谷
	 */
	public static final short FEE_RULE_STAGE_3 = 3;

	/**
	 * 集团大屏REDISkey
	 */
	// 用户活跃度
	public static final String USER_RACTIVITY = "USER:USER_ACTIVITY";

	// 最近24小时数据
	public static final String HOUR_STATISTICS_DATA = "SCREENGROUP:HOURSTATISTICSDATA";

	// 最近30天数据
	public static final String DAY30_STATISTICS_DATA = "SCREENGROUP:DAY30STATISTICSDATA";
	// 最近180天数据
	public static final String DAY180_STATISTICS_DATA = "SCREENGROUP:DAY180STATISTICSDATA";
	// 充电电量
	public static final String CHARGE_POWER = "SCREENGROUP:CHARGEPOWER";
	// 居民用电功率
	public static final String HOUSE_POWER = "SCREENGROUP:HOUSEPOWER";
	// 存储分钟统计次数
	// 总的
	public static final String MINUTE_COUNT1 = "SCREENGROUP:MINUTE_COUNT1";
	// 各个小区
	public static final String MINUTE_COUNT2 = "SCREENGROUP:MINUTE_COUNT2";
	// 小区数据redis缓存
	public static final String COURT_LIST = "SCREENGROUP:COURTLIST";
	// 存储各小区充电的瞬时功率
	public static final String COURT_CHARGEPOWER = "SCREENGROUP:COURTCHARGEPOWER";
	// 存储各小区房屋用电的瞬时功率
	public static final String COURT_HOUSEPOWER = "SCREENGROUP:COURTHOUSEPOWER";
	// 集团大屏总的数据,stationUuid
	public static final String ALLCOURTNAME = "00000000000000000000000000000000";
	// 三级页面小区设备变压器负载情况
	public static final String TRANSFORMER_LOAD = "SCREENGROUP:TRANSFORMERLOAD";
	// 三级页面回路负载情况
	public static final String ELEC_LOAD = "SCREENGROUP:ELECLOAD";
	// 变压器回路映射关系
	public static final String AMMETER_LOAD = "SCREENGROUP:AMMETER_LOAD";
	// 回路负载排名列表
	public static final String ELEC_RANK = "SCREENGROUP:ELECRANK";
	// 储存24小时调峰电量
	public static final String CONTROL_KWH = "SCREENGROUP:CONTROL_KWH";
	// 储存设备的信息
	public static final String CHARGEPILE_INFO_PRE = "CHA:SCREENGROUP:CHARGEPILE_INFO:";
	// ============================================

}
