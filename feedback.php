<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*'	=> 'feedbackAction' 
);
//工作空间
class feedbackAction extends Common {
	function GET()
	{
		
		render_admin ( 'feedback');
	}
	function POST()
	{
		die(ajax_return(ajax_success(null, array(
			'status' => 0
			))));
	}
}

run ( $urls );