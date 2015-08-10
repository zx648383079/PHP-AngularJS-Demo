<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*' => 'indexAction',
);

class indexAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function POST() {
		$uid = getUid();
		
		$type = isset($_POST ['type']) ? intval($_POST['type']) : 0;
		$url = isset($_POST ['url']) ? stripslashes($_POST['url']) : '';
		$memo = isset($_POST ['memo']) ? stripslashes($_POST['memo']) : '';
		
		$_share = new share ();
		$data = array (
			'uid' => $uid,
			'type' => $type,
			'url' => $url,
			'memo' => $memo
		);
		$_share->save ( $data );
		
		die ( ajax_return ( ajax_success () ) );
	}
}

run ( $urls );
?>
