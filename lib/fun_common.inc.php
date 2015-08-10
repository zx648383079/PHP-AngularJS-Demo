<?php

function getUid(){
	session_save_path(dirname(dirname(__FILE__)) . "/tmp/");
	session_start();
	
	$uid = intval($_SESSION[SESSION_UID]);
	
	return $uid;
}

function callApi($data){
	/*
	1	source_name	varchar	 	30	来源-由ACXIOM提供给网站
	2	username	varchar		60	用户名
	3	password	varchar		128	密码—需要MD5加密
	4	mail		varchar		256	电子邮箱
	5	status		int			4	Whether the user is active(1) or blocked(0)
	6	timezone	int	 	 	8
	7	language	varchar		12	zh-cn
	8	nickname	varchar		128	default same as username
	9	description	text
	10	gender		varchar		4	M:Male；F：Female
	11	brithday	varchar		128	生日-YYYYMMDD
	12	province	varchar		20	直接输入省份名称
	13	city		varchar		20	直接输入城市名称
	14	address		text
	15	postcode	int			20
	16	cellphone	varchar		128	 手机号码
	17	company		varchar		256
	18	openId		varchar		128	Weichat openId。
	19	opt_in		int	 		0:不退订;1:退订
	*/

	/*
	{
	"acxiom_id": "3739732",
	"uuid": "5ce351f9ea7317ae6cd269b5abd4ee65386c4e23",
	"WS_RESPONSE": {
	"RETURN_CODE": "000",
	"RETURN_MSG": "ok"
	}
	}
	*/
	
	$callResult = false;
	$post = array(
		'source_name' => API_SOURCE_NAME,
		'username' => urlencode($data['name']),
		'cellphone' => urlencode($data['phone'])
	);
	//$post[''] = '';
	
	$obj = json_encode($post);
	$url = API_URL . '?obj=' . $obj;
	
	$response = null;
	try {
		$response = httpGet($url);
	} catch (Exception $e) {
		//die(json_encode($e));
		try {
			$response = httpGet($url);
		} catch (Exception $e) {
			try {
				$response = httpGet($url);
			} catch (Exception $e) {}
		}
	}
	
	/*$ctx = stream_context_create(array('http' => array(
		'timeout' => 3 //Seconds
	)));
	$response = file_get_contents($url, false, $ctx);*/
	
	//log
	access_log($response, 10, $data['uid'], $obj);
	
	//do data
	if(isset($response) && !empty($response)){
		$responseArray = json_decode ( $response, true );
		$returnCode = $responseArray['WS_RESPONSE']['RETURN_CODE'];
		switch ($returnCode) {
			case '000': //成功
				$callResult = true;
				break;
			case '606': //该手机号码已经被注册
				$callResult = true;
				break;
			default:
				;
				break;
		}
		//$returnMsg = $responseArray['WS_RESPONSE']['RETURN_MSG'];
	}
	
	return $callResult;
}

/**
 * 日志记录
 */
function log_my($msg){
	error_log(date('Y-m-d H:i:s') . "\t" . $msg . "\r\n", 3, '/log.log');
}

/**
 * php跳转
 */
function location($url){
	header ( 'Location: ' . APP_URL . $url );
	exit;
}

/**
 * 遍历文件夹
 */
function ergodicDir($dir, &$files = array()){
	//$files = array();
	$dir_list = @scandir($dir);
	foreach($dir_list as $file){
		if ( $file != ".." && $file != "." ){
			if ( is_dir($dir . $file) ){
				ergodicDir($dir . $file . '/', $files);
			}
			else{
				$files[] = "'" . APP_URL . $dir .  $file . "'";
			}
		}
	}
}

/**
 * 获取图片文件夹路径(单级)
 */
function getImagesUrl($dir){
	$files = array();
	$dir_list = @scandir($dir);
	foreach($dir_list as $file){
		if ( $file != ".." && $file != "." ){
			if ( !is_dir($dir . $file) ){
				$files[] = "'" . APP_URL . $dir .  $file . "'";
			}
		}
	}
	return $files;
}

/**
 * 分页数据处理
 */
function listPages(){
	$page = isset($_GET['page']) ? $_GET['page'] : 1;
	$page = $page < 1 ? 1 : $page;
	$limitstart = ($page - 1) * 20;
	
	$pages = array();
	$pages['page'] = $page;
	$pages['limitstart'] = $limitstart;
	
	return $pages;
}

/**
 * 脏字判断
 */
function filterWord($word) {
	if(empty($word)){
		return true;
	}
	
	$words = file_get_contents("words.txt");
	$wordsArray = explode(",", $words);
	
	$isErgic = true;
	for ($i = 0; $i < count($wordsArray); $i++) {
		$isin = explode(trim($wordsArray[$i]), $word);
		if($isin && count($isin) > 1){
			$isErgic = false;
			break;
		}
	}
	
	return $isErgic;
}

/**
 * 判断是否登录
 */
function isLogin() {
	if (!isset($_SESSION[SESSION_USER]) || !isset($_SESSION[SESSION_UID])) {
		$result = array ();
		$result["success"] = false;
		$result["msg"] = 'Please login.';
		return $result;
	}
	return true;
}

/**
 * 获取IP地址
 */
function getRealIp() {
	if($HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"]){
		$ip = $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
	}elseif($HTTP_SERVER_VARS["HTTP_CLIENT_IP"]){
		$ip = $HTTP_SERVER_VARS["HTTP_CLIENT_IP"];
	}elseif ($HTTP_SERVER_VARS["REMOTE_ADDR"]){
		$ip = $HTTP_SERVER_VARS["REMOTE_ADDR"];
	}elseif (getenv("HTTP_X_FORWARDED_FOR")){
		$ip = getenv("HTTP_X_FORWARDED_FOR");
	}elseif (getenv("HTTP_CLIENT_IP")){
		$ip = getenv("HTTP_CLIENT_IP");
	}elseif (getenv("REMOTE_ADDR")){
		$ip = getenv("REMOTE_ADDR");
	}else{
		$ip = "0.0.0.0";
	}
	return $ip;
}

function showtime($ts) {
	$ts = strtotime($ts);
	//return date("F j g:i A", $ts);
	//return date('Y年m月d日H时i分s秒', $ts);
	return date('Y/m/d H:i:s', $ts);
}

function getDateTime($time, $format = 'Y-m-d H:i:s') {
	if(!isset($time)){
		$time = time();
	}
	return date($format, $time);
}

/**
 * array转json
 */
function array2json($arr) {
	if (function_exists('json_encode')){
		return json_encode($arr); //Lastest versions of PHP already has this functionality.
	}
	$parts = array ();
	$is_list = false;

	//Find out if the given array is a numerical array
	$keys = array_keys($arr);
	$max_length = count($arr) - 1;
	if (($keys[0] == 0) and ($keys[$max_length] == $max_length)) { //See if the first key is 0 and last key is length - 1
		$is_list = true;
		for ($i = 0; $i < count($keys); $i++) { //See if each key correspondes to its position
			if ($i != $keys[$i]) { //A key fails at position check.
				$is_list = false; //It is an associative array.
				break;
			}
		}
	}

	foreach ($arr as $key => $value) {
		if (is_array($value)) { //Custom handling for arrays
			if ($is_list){
				$parts[] = array2json($value); /* :RECURSION: */
			}else{
				$parts[] = '"' . $key . '":' . array2json($value); /* :RECURSION: */
			}
		} else {
			$str = '';
			if (!$is_list){
				$str = '"' . $key . '":';
			}
			//Custom handling for multiple data types
			if (is_int($value)){
				$str .= $value; //Int
			}else if (is_numeric($value)){
				$str .= $value; //Numbers
			}elseif ($value === false) {
				$str .= 'false'; //The booleans
			}elseif ($value === true) {
				$str .= 'true';
			}else{
				$str .= '"' . addslashes($value) . '"'; //All other things
			}
			// :TODO: Is there any more datatype we should be in the lookout for? (Object?)
			$parts[] = $str;
		}
	}
	$json = implode(',', $parts);

	if ($is_list){
		return '[' . $json . ']'; //Return numerical JSON
	}
	return '{' . $json . '}'; //Return associative JSON
}

/**
 * object转Array
 */
function object2array($object) {
	if (!is_object($object) && !is_array($object)) {
		return $object;
	}
	if (is_object($object)) {
		$object = get_object_vars($object);
	}
	return array_map('object2array', $object);
}

/**
 * 翻译列表
 * @param $list 待翻译列表  array(stdClass1, stdClass2, stdClass3 ...)
 * @param $field 待翻译字段
 * @param $dic_list 字典列表  array(stdClass1, stdClass2, stdClass3 ...)
 * @param $div_key_field 字典字段,必须等于$field才能翻译
 * @param $dic_value_field 字典值字段
 * @return $list
 */
function mapping_list($list, $field, $dic_list, $div_key_field, $dic_value_field) {
	if(empty($list) || count($list) == 0){
		return $list;
	}
	if(empty($dic_list) || count($dic_list) == 0){
		return $list;
	}
	$field_name = $field . '_name';
	foreach ($list as $value) {
		if(empty($value)){
			continue;
		}
		$field_value = $value->$field;
		if(empty($field_value)){
			continue;
		}
		foreach ($dic_list as $dic) {
			if(empty($dic)){
				continue;
			}
			if($field_value == $dic->$div_key_field){
				$value->$field_name = $dic->$dic_value_field;
				break;
			}
		}
	}
	return $list;
}

/**
 * 翻译列表
 * @param $list 待翻译列表  array(stdClass1, stdClass2, stdClass3 ...)
 * @param $field 待翻译字段
 * @param $dic_list 字典列表  array(stdClass1, stdClass2, stdClass3 ...)
 * @param $div_key_field 字典字段,必须等于$field才能翻译
 * @param $dic_value_field 字典值字段
 * @param $dic_key_field 字典键字段
 * @return $list
 */
function mapping_list_3($list, $field, $dic_list, $div_key_field, $dic_value_field, $dic_key_field) {
	if(empty($list) || count($list) == 0){
		return $list;
	}
	if(empty($dic_list) || count($dic_list) == 0){
		return $list;
	}
	if(!isset($dic_key_field)){
		$dic_key_field = $dic_value_field;
	}
	foreach ($list as $value) {
		if(empty($value)){
			continue;
		}
		$field_value = $value->$field;
		if(empty($field_value)){
			continue;
		}
		foreach ($dic_list as $dic) {
			if(empty($dic)){
				continue;
			}
			if($field_value == $dic->$div_key_field){
				$value->$dic_key_field = $dic->$dic_value_field;
				break;
			}
		}
	}
	return $list;
}

/**
 * 翻译列表
 * @param $list
 * @param $field
 * @param $dic_array array (1 => '是', 0 => '否')
 * @return $list
 */
function mapping_list_2($list, $field, $dic_array) {
	if(empty($list) || count($list) == 0){
		return $list;
	}
	if(empty($dic_array) || count($dic_array) == 0){
		return $list;
	}
	$field_name = $field . '_name';
	foreach ($list as $value) {
		if(empty($value)){
			continue;
		}
		$field_value = $value->$field;
		//if(empty($field_value)){ //需要考虑为0的情况
		//	continue;
		//}
		$value->$field_name = $dic_array[$field_value];
	}
	return $list;
}

/**
 * 翻译单个对象
 */
function mapping_array($array, $field, $dic_array) {
	if(empty($array)){
		return $array;
	}
	if(empty($dic_array) || count($dic_array) == 0){
		return $array;
	}
	$field_name = $field . '_name';
	$array->$field_name = $dic_array[$array->$field];
	return $array;
}

/**
 * ajax操作成功
 */
function ajax_success($msg = null, $data = array()) {
	$result = array ();
	$result ['success'] = true;
	$result ['msg'] = empty ( $msg ) ? 'success' : $msg;
	$result ['data'] = $data;
	return $result;
}
/**
 * ajax操作失败
 */
function ajax_failure($msg = null) {
	if(empty($msg)){
		$msg = 'failure';
	}
	$result = array ();
	$result ['success'] = false;
	$result ['msg'] = $msg;
	return $result;
}
/**
 * ajax返回
 */
function ajax_return($result = array ()) {
	if (! isset ( $result ) || count ( $result ) == 0) {
		$result = ajax_failure ();
	}
	return array2json ( $result );
}
/**
 * ajax返回分页数据
 */
function ajax_page($list = array(), $total = 0) {
	$result = array ();
	$result['rows'] = $list;
	$result['total'] = $total->total;
	return $result;
}

/**
 * 登录信息
 */
function session_user($user) {
	global $_SESSION;
	
	$_SESSION [SESSION_UID] = $user['id'];
	$_SESSION [SESSION_USERNAME] = $user['username'];
	$_SESSION [SESSION_LEVELS] = $user['levels'];
	
	$_SESSION [SESSION_LOGGED] = true;
	$_SESSION [SESSION_USER] = $user;
}

/**
 * 登录日志
 */
function access_login($user) {
	try {
		$_accesslog = new accesslog ();
		$accesslog = array (
			'name' => $user['id'],
			'ip' => getRealIp(),
			'type' => 99,
			'data' => 'login'
		);
		$_accesslog->save ( $accesslog );
	} catch ( Exception $e ) {
		log($e->getMessage());
	}
}

/**
 * 其他日志
 */
function access_log($data, $type = 10, $name = null, $memo = null) {
	try {
		$_accesslog = new accesslog ();
		$data = array (
			'data' => $data,
			'type' => $type,
			'name' => $name,
			'memo' => $memo,
			'ip' => getRealIp()
		);
		$_accesslog->save ( $data );
	} catch ( Exception $e ) {}
}

/**
 * 登录session
 */
function log_adminsession($user) {
	try {
		$uid = $user->id;
		$_adminsession = new adminsession ($uid);
		$adminsession = array (
			'uid' => $uid,
			'username' => $user->username,
			'sessionid' => session_id(),
			'ip' => getRealIp(),
			'status' => DicConst::$STATUS_1
		);
		$_adminsession->save ( $adminsession );
	} catch ( Exception $e ) {
		
	}
}

/**
 * 读取服务器session
 */
function get_server_session() {
	$handle = opendir(session_save_path());
	$server_sess  = array();
	while (false !== ($file = readdir($handle))) {
		if(!in_array($file, array('.', '..', 'session_dir'))){
			$server_sess[] = $file;
		}
	}
	closedir($handle);
	return $server_sess;
}

/**
 * 获取所有在线用户
 */
function get_online_adminsession($user) {
	//
	$server_sess  = get_server_session();
	$sess_arr = array();
	foreach ( $server_sess as $sess ) {
		if('sess_' === substr($sess, 0, 5)){
			$sess_arr[] = '\'' . substr($sess, 5) . '\'';
		}
	}
	$sess_str = implode(',', $sess_arr);
	if(empty($sess_str)){
		return array();
	}
	
	$_adminsession = new adminsession();
	$list = $_adminsession->get_all_online ($sess_str);
	return $list;
}

/**
 * 判断用户是否在线
 */
function is_online($uid) {
	$_adminsession = new adminsession();
	$result = $_adminsession->get_by_uid($uid);
	if(empty($result)){
		return false;
	}
	$sessionid = $result->sessionid;
	
	//
	$server_sess  = get_server_session();
	$sess_arr = array();
	foreach ( $server_sess as $sess ) {
		if(sess_ . $sessionid === $sess){
			return true;
		}
	}
	return false;
}

/**
 * 获取views文件title
 */
function getViewsTitle($file_name) {
	$title = '';
	try {
		@ $fp = fopen('views/' . $file_name, 'r');
		if ($fp) {
			$content = fread($fp, 1024);
			$_pos2 = strpos($content, "<title>");
			$_pos3 = strpos($content, "</title>");
			if ($_pos3 > $_pos2){
				$title = substr($content, $_pos2 + 7, $_pos3 - $_pos2 - 7);
				$title .= ' - ';
			}
			fclose($fp);
		}
	} catch (Exception $e) {
	}
	return $title;
}

function var_dumpx($p) {
	echo '<pre>';
	var_dump ( $p );
	echo '</pre>';
}

?>
