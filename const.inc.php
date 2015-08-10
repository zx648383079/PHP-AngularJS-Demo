<?php
/**
 * 字典常量
 */
final class DicConst {
	
	public static $SERIAL_CN = array('一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
	public static $DAYS_ARR = array(8, 7, 7, 7, 7, 7, 7, 7, 7, 7);
	
	/**
	 * collect状态
	 */
	public static $COLLECT_CODE = array (
		10 => '正常',
		20 => '已覆盖'
	);
	/** 正常*/
	public static $COLLECT_CODE_10 = 10;
	/** 已覆盖*/
	public static $COLLECT_CODE_20 = 20;
	
	
	/**
	 * code状态
	 */
	public static $STATUS_CODE = array (
		10 => '已发布',
		20 => '已领取',
		30 => '已使用'
	);
	/** 已发布*/
	public static $STATUS_CODE_10 = 10;
	/** 已领取*/
	public static $STATUS_CODE_20 = 20;
	/** 已使用*/
	public static $STATUS_CODE_30 = 30;
	
	
	/**
	 * 用户类型
	 */
	public static $TYPE_USER_LEVELS = array (
		99 => 'admin',
		10 => '后台用户',
		20 => '微信用户'
	);
	/** admin */
	public static $TYPE_USER_LEVELS_99 = 99;
	/** 后台用户 */
	public static $TYPE_USER_LEVELS_10 = 10;
	/** 微信用户 */
	public static $TYPE_USER_LEVELS_20 = 20;
}
?>
