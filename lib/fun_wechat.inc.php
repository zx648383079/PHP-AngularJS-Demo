<?php

function getWxOpenid($code = null, $state = null) {
	//优先从session中获取
	session_save_path(dirname(dirname(__FILE__)) . "/tmp/");
	session_start();
	if(isset($_SESSION[SESSION_OPENID])){
		$openid = $_SESSION[SESSION_OPENID];
		return $openid;
	}
	unset($_SESSION[SESSION_OPENID]);
	
	$appId = WX_APP_ID;
	$appSecret = WX_APP_SECRET;
	$redirectUri = WX_REDIRECT_URI;
	
	if(isset($code)){
		//获取openid
		$url = "https://api.weixin.qq.com/sns/oauth2/access_token";
		$url .= "?appid=$appId";
		$url .= "&secret=$appSecret";
		$url .= "&code=$code";
		$url .= "&grant_type=authorization_code";
		
		$res = json_decode ( httpGet ( $url ), true );
		$openid = $res['openid'];
		
		//保存到session
		session_save_path(dirname(dirname(__FILE__)) . "/tmp/");
		session_start();
		$_SESSION[SESSION_OPENID] = $openid;
		
		//跳转之前的url
		/*if(isset($state)){
			header ( 'Location: ' . $state );
			exit;
		}
		else{*/
			header ( 'Location: ' . APP_URL . 'index.php' );
			exit;
		//}
		
		//TODO 不能直接使用ajax获取到openid,需要先URL重定向获取到openid或保存到session
		return $openid;
	}
	
	$url = "https://open.weixin.qq.com/connect/oauth2/authorize";
	$url .= "?appid=" . $appId;
	$url .= "&redirect_uri=" . urlencode($redirectUri);
	$url .= "&response_type=code";
	$url .= "&scope=snsapi_base"; //snsapi_base/snsapi_userinfo
	$url .= "&state=" . urlencode($_SERVER['REQUEST_URI']);
	$url .= "#wechat_redirect";
	//die($url);
	
	header ( 'Location: ' . $url );
}

//根据openid构造用户
function getUserByOpenId($openid) {
	if(empty($openid)){
		return null;
	}
	$_user = new user ();
	$user = $_user->findByOpenid($openid);
	if(!isset($user) || !isset($user['id'])){ //生成用户
		$__id = time();
		
		$user = array (
			'openid' => $openid,
			'levels' => DicConst::$TYPE_USER_LEVELS_20,
			'username' => 'username_' . $__id,
			'password' => $__id,
			'name' => 'name_' . $__id
		);
		$_user->save ( $user );
		$uid = $_user->lastInsertId;
		
		$user = $_user->findById($uid);
	}
	return $user;
}

function getWxAccessToken() {
	$access_token_file = "access_token.json";
	$data = json_decode ( file_get_contents ( $access_token_file ) );
	if(isLocal()){
		$access_token = $data->access_token;
		return $access_token;
	}
	if ($data->expire_time < time ()) {
		$appId = WX_APP_ID;
		$appSecret = WX_APP_SECRET;
		
		// 如果是企业号用以下URL获取access_token
		// $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$appId&corpsecret=$appSecret";
		$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appId&secret=$appSecret";
		$res = json_decode ( httpGet ( $url ) );
		$access_token = $res->access_token;
		if ($access_token) {
			$data->expire_time = time () + 7000;
			$data->access_token = $access_token;
			$fp = fopen ( $access_token_file, "w" );
			fwrite ( $fp, json_encode ( $data ) );
			fclose ( $fp );
		}
	} else {
		$access_token = $data->access_token;
	}
	return $access_token;
}

function getWxAccessToken_db() {
	$_setting = new setting();
	$setting = $_setting->findByName('access_token');
	
	/*if(isset($isCache) && $isCache == true){
		$access_token = getWxAccessToken_http();
		$_setting->updateValue('access_token', $access_token, (time() + 7000));
		return $access_token;
	}*/
	
	if(isset($setting) && isset($setting['value']) && !empty($setting['value'])
		&& isset($setting['udate']) && intval($setting['udate']) > time()){
		$access_token = $setting['value'];
	}else{
		$access_token = getWxAccessToken_http();
		$_setting->updateValue('access_token', $access_token, (time() + 7000));
	}
	
	return $access_token;
}

function getWxAccessToken_http() {
	$appId = WX_APP_ID;
	$appSecret = WX_APP_SECRET;
	
	// 如果是企业号用以下URL获取access_token
	// $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$appId&corpsecret=$appSecret";
	$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appId&secret=$appSecret";
	$res = json_decode ( httpGet ( $url ) );
	$access_token = $res->access_token;
	
	return $access_token;
}

function updateWxUserinfo() {
	if(isLocal()){
		return;
	}
	//$access_token = getWxAccessToken();
	$access_token = getWxAccessToken_db();
	$openid = getWxOpenid();
	
	getWxUserinfo($access_token, $openid, true);
}

function getWxUserinfo($access_token, $openid, $updateUser = false) {
	$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$access_token&openid=$openid&lang=zh_CN";
	$userinfo = json_decode ( httpGet ( $url ), true );
	if(isset($userinfo['errcode'])){
		die('GetWxUserinfo error [errcode:' . $userinfo['errcode'] . ']');
		//$access_token = getWxAccessToken_db(true);
		//getWxUserinfo($access_token, $openid, true);
	}
	//die(print_r($userinfo));
	//更新user
	if(isset($updateUser) && $updateUser == true){
		updateUser($openid, $userinfo);
	}
	
	return $userinfo;
}

function updateUser($openid, $userinfo) {
	$user = getUserByOpenId($openid); //记录新用户(只有openid)
	if(isset($user)){
		$_SESSION[SESSION_UID] = $user['id'];
	}
	
	if(isset($userinfo)){
		$subscribe = $userinfo['subscribe']; //0未关注，1已关注
		if($subscribe !== 1){
			return false;
		}
		$uid = (isset($user) && isset($user['id'])) ? $user['id'] : 0;
		$_user = new user ($uid);
		
		$user = array (
			'iswechat' 		=> 1, //已获取到资料
			'name' 			=> isset($userinfo['nickname']) ? $userinfo['nickname'] : '',
			'sex' 			=> isset($userinfo['sex']) ? $userinfo['sex'] : '',
			'headimgurl' 	=> isset($userinfo['headimgurl']) ? $userinfo['headimgurl'] : ''
		);
		
		$_user->save ( $user );
	}
}

function getWxJssdk(&$p) {
	$jssdk = new JSSDK();
	$signPackage = $jssdk->GetSignPackage();
	
	$p['signPackage'] = $signPackage;
}

function httpGet($url) {
	/* $curl = curl_init (); //需要服务器支持
	curl_setopt ( $curl, CURLOPT_RETURNTRANSFER, true );
	curl_setopt ( $curl, CURLOPT_TIMEOUT, 500 );
	curl_setopt ( $curl, CURLOPT_SSL_VERIFYPEER, false );
	curl_setopt ( $curl, CURLOPT_SSL_VERIFYHOST, false );
	curl_setopt ( $curl, CURLOPT_URL, $url );

	$res = curl_exec ( $curl );
	curl_close ( $curl ); */
	
	//$ctx = stream_context_create(array('http' => array(
	//	'timeout' => 3 //Seconds
	//)));
	//$res = file_get_contents($url, false, $ctx);
	$res = file_get_contents($url);
	
	return $res;
}

/**
 * GET 请求
 * @param string $url
 */
function http_get($url){
	$oCurl = curl_init();
	if(stripos($url,"https://") !== FALSE){
		curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
	}
	curl_setopt($oCurl, CURLOPT_URL, $url);
	curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
	$sContent = curl_exec($oCurl);
	$aStatus = curl_getinfo($oCurl);
	curl_close($oCurl);
	if(intval($aStatus["http_code"]) == 200){
		return $sContent;
	}else{
		return false;
	}
}

/**
 * POST 请求
 * @param string $url
 * @param array $param
 * @param boolean $post_file 是否文件上传
 * @return string content
 */
function http_post($url, $param, $post_file = false){
	$oCurl = curl_init();
	if(stripos($url,"https://")!==FALSE){
		curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
	}
	if (is_string($param) || $post_file) {
		$strPOST = $param;
	} else {
		$aPOST = array();
		foreach($param as $key=>$val){
			$aPOST[] = $key."=".urlencode($val);
		}
		$strPOST =  join("&", $aPOST);
	}
	curl_setopt($oCurl, CURLOPT_URL, $url);
	curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
	curl_setopt($oCurl, CURLOPT_POST,true);
	curl_setopt($oCurl, CURLOPT_POSTFIELDS,$strPOST);
	$sContent = curl_exec($oCurl);
	$aStatus = curl_getinfo($oCurl);
	curl_close($oCurl);
	if(intval($aStatus["http_code"])==200){
		return $sContent;
	}else{
		return false;
	}
}

function isLocal() {
	if(isset($_GET['debug']) && intval($_GET['debug']) == 1){
		return true;
	}
	$httpHost = strtolower($_SERVER['HTTP_HOST']);
	if(stristr($httpHost, "localhost") != false || stristr($httpHost, "8080") != false){
		return true;
	}
	return false;
}

function out($text, $live = true) {
	header("Content-Type:text/html;charset=utf-8");
	if (isLocal() || $live == false) {
		echo '<pre>' . $text . '</pre>';
	}
}

?>