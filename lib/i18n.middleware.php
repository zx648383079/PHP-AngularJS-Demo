<?php
class i18nMiddleware {
	public $require_login;
	public $lan_packs;
	function __construct() {
		$this->lan_packs = array (
			'en_EN' => array (
				1 => "SYS TD",
				2 => "中文",
				3 => "Home",
				4 => "Manage",
				5 => "Report",
				6 => "Logout",
				7 => "Log",
				8 => "Login",
				9 => "Email Address",
				10 => "Password" 
			),
			'cn_CN' => array (
				1 => "系统平台",
				2 => "english",
				3 => "首页",
				4 => "管理",
				5 => "报告",
				6 => "注销",
				7 => "日志",
				8 => "登录",
				9 => "电子邮件:",
				10 => "登录密码:" 
			) 
		);
	}
	function run_before() {
		global $_LAN_PACK;
		global $_LAN_PACK_EN;
		global $_LAN_PACK_CN;
		$locale = $_SESSION ['locale'];
		$_LAN_PACK = $this->lan_packs [$locale];
		$_LAN_PACK_EN = $this->lan_packs ['en_EN'];
		$_LAN_PACK_CN = $this->lan_packs ['cn_CN'];
	}
	function run_after() {
	}
}

include ("i18n.fun.php");
?>