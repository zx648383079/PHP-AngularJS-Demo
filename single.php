<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.over_campaign' => 'overCampaignAction',
	'.*' => 'indexAction'
);

//PC页面
class indexAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function GET() {
		if(MobileHelper::isWeixin()){ //微信跳转
			location('index.php');
		}
		render_sub ("pc");
	}
}

//活动已结束
class overCampaignAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function GET() {
		if (time() < strtotime(DEADLINE)) {
			location('index.php');
		}
		render ( "over_campaign");
	}
}

run ( $urls );
?>
