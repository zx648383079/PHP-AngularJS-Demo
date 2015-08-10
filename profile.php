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
		//获取用户id
		$uid = getUid();
		$uid = ($uid == 0) ? intval($_POST['uid']) : $uid;
		
		$_profile = new profile ();
		
		//判断是否曾经预留信息
		$profile = $_profile->findByUid($uid);
		if(isset($profile)){ //覆盖现有信息
			//$_profile = new profile (intval($profile['id']));
			//提交以第一次为准,第二次返回已经注册
			die ( ajax_return ( ajax_success ('', array(
				'status' => 20
			)) ) );
		}
		
		//数据处理
		$name = stripslashes($_POST ['nickname']);
		$phone = stripslashes($_POST ['phone']);
		
		//验证
		//号码输入不正确，会被提示手机输入格式不对需要重新输入
		if(empty($name) || empty($phone)){
			die ( ajax_return ( ajax_success ('', array(
				'status' => 10
			)) ) );
		}
		//判断是否已输入过手机号
		if(isset($profile) && isset($profile['phone']) && !empty($profile['phone']) && $profile['phone'] != $phone){
			die ( ajax_return ( ajax_success ('', array(
				'status' => 20
			)) ) );
		}
		//判断手机号是否已存在
		$phonesArray = $_profile->findByPhone($phone);
		if(isset($phonesArray) && count($phonesArray) > 0 && intval($phonesArray[0]['uid']) !== $uid){
			die ( ajax_return ( ajax_success ('', array(
				'status' => 30
			)) ) );
		}
		
		$data = array (
			'uid' => $uid,
			'name' => $name,
			'phone' => $phone,
			'udate' => getDateTime(time())
		);
		
		access_log(urlencode(json_encode($data)), 20);
		
		$_profile->save ( $data );
		
		//Call API
		/* if(isset($profile) && intval($profile['status']) == 10){
			$callResult = callApi($data);
			if($callResult == true){
				$profileId = intval($profile['id']);
				$_profile = new profile($profileId);
				$_profile->save ( array(
					'status' => 99
				) );
			}
		} */
		
		die ( ajax_return ( ajax_success ('', array(
			'status' => 0
		)) ) );
	}
	
}

run ( $urls );
?>
