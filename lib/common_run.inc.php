<?php
require_once ('config.inc.php');
require_once ('const.inc.php');

require_once ('lib/Common.php');
require_once ('lib/web.php');
require_once ('lib/dbx.php');

require_once ('lib/session.middleware.php');
require_once ('lib/jssdk.php');
require_once ('lib/fun_common.inc.php');
require_once ('lib/fun_wechat.inc.php');

require_once ('lib/models/model.model.php');

require_once ('lib/helper/MobileHelper.php');

error_reporting ( E_ALL & ~ E_NOTICE ); // 0 E_ALL
//error_reporting ( E_ALL );
date_default_timezone_set ( 'PRC' );

session_save_path(dirname(dirname(__FILE__)) . "/tmp/");
session_start();

/* $paths = array ();
$paths [] = get_include_path ();
$paths [] = APP_DIR . 'lib/models';
set_include_path ( implode ( PATH_SEPARATOR, $paths ) ); */

function __autoload($class) {
	$classpath = APP_DIR . 'lib/models/' . strtolower ( $class ) . '.model.php';
	if(file_exists($classpath)){
		require_once($classpath);
	}
}

function db() {
	static $_dbx = null;
	if (! isset ( $_dbx )) {
		$dbDsn = 'mysql:host=' . DB_HOST . ';port='.DB_PORT.';dbname=' . DB_NAME;
		$_dbx = new dbx ( $dbDsn, DB_USER, DB_PASSWORD );
	}
	return $_dbx;
}

function render($file_name, $params = array ()) {
	getWxJssdk ( $params );
	
	extract ( $params );
	
	$file_name .= '.html';
	
	$__title = getViewsTitle ( $file_name );
	
	include 'views/header.html';
	include 'views/' . $file_name;
	include 'views/footer.html';
}
function render_admin($file_name, $params = array ()) {
	getWxJssdk ( $params );
	
	extract ( $params );
	
	$file_name .= '.html';
	
	$__title = getViewsTitle ('admin/'.$file_name );
	
	include 'views/admin/header.html';
	include 'views/admin/' . $file_name;
	include 'views/admin/footer.html';
}
function render_sub($file_name, $params = array ()) {
	getWxJssdk ( $params );
	
	extract ( $params );
	
	$file_name .= '.html';
	
	include 'views/' . $file_name;
}

function run($urls) {
	$web = new web ();
	$web->middleware ['session'] = new SessionMiddleware ();
	// $web->middleware['i18n'] = new i18nMiddleware();
	// $web->middleware['loadtime'] = new LoadTimeMiddleware();
	// $web->middleware['request'] = new RequestMiddleware();
	$web->run ( $urls );
}

?>
