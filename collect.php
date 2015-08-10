<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*' => 'indexAction'
);

class indexAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function POST() {
		//only wechat post
		if(!isLocal() && !MobileHelper::isWeixin()){
			die(ajax_return(ajax_failure('Only wechat.')));
		}
		
		$uid = getUid();
		$uid = ($uid == 0) ? intval($_POST['uid']) : $uid;
		if(!isLocal() && (!isset($uid) || empty($uid))){
			die(ajax_return(ajax_failure('Not find openid.')));
		}
		
		$times = stripslashes($_POST['times']);
		$complete = stripslashes($_POST['complete']);
		
		//记录数据
		$_collect = new collect ();
		$collectData = array (
			'uid' => $uid,
			'codes' => $times,
			'complete' => $complete,
			'ip' => getRealIp(),
			'useragent' => $_SERVER['HTTP_USER_AGENT']
		);
		$_collect->save ( $collectData );
		$collectId = $_collect->lastInsertId;
		
		//返回
		$result = array(
			'id' => $collectId,
			'times' => $times
		);
		
		die(ajax_return(ajax_success(null, $result)));
	}
}

run ( $urls );
?>