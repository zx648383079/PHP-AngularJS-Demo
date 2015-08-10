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
		$code = isset ( $_GET ['code'] ) ? $_GET ['code'] : null;
		$state = isset ( $_GET ['state'] ) ? $_GET ['state'] : null;
		//print_r('|code=' . $code);
		//print_r('|state=' . $state);
		//exit;
		return getWxOpenid ( $code, $state );
	}
}

run ( $urls );
?>
