<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*' => 'indexAction'
);
class indexAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function GET() {
		if(!isLocal() && MobileHelper::isWeixin() == false){
			//location('single.php');
			render_sub ("pc");
			exit;
		}
		if(!isLocal() && (!isset($_GET['debug']) || intval($_GET['debug']) !== 1)){
			updateWxUserinfo(); //获取微信用户信息
		}
		
		$uid = getUid();
		
		//判断是否曾经预留信息
		$hasProfile = false;
		$_profile = new profile ();
		$profile = $_profile->findByUid($uid);
		if(isset($profile)){ //覆盖现有信息
			$hasProfile = true;
		}
		//exit(123);
		
		//imgpreload
		$imgpreload = array();
		ergodicDir('asset/img/', $imgpreload);
		
		$p = array();
		$p['imgpreload'] = implode(",", $imgpreload);
		$p['uid'] = $uid;
		$p['hasProfile'] = $hasProfile;
		
		render ( "index", $p );
	}
}

run ( $urls );
?>
