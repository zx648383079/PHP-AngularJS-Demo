<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*'	=> 'workspaceAction' 
);
//工作空间
class workspaceAction extends Common {
	//GET执行的操作
	function GET()
	{
		
		$mode=isset($_GET['mode'])?$_GET['mode']:0;
		switch($mode)
		{
			case 0:
				render_admin ( 'workspace');
				break;
			case 1:
				$this->getList();
				break;
			case 3:
				$this->del();
				break;
			default:
				render_admin ( 'workspace');
				break;
		}
	}
	
	//展示数据
	function getList()
	{
		$_collect = new collect();
		$sql="SELECT `id`,`name`,`phone`,`udate` FROM `".DB_TABLEPRE."profile`";
		$list = $_collect->findList($sql);
		die(ajax_return(ajax_success(null, $list)));
	}
	
	//POST提交数据后执行的操作
	function POST()
	{
		$mode=isset($_GET['mode'])?$_GET['mode']:0;
		switch($mode)
		{
			case 2:
				$this->add();
				break;
			case 4:
				$this->update();
				break;
			default:
				render_admin ( 'workspace');
				break;
		}
	}
	
	//增加数据
	function add()
	{
		//获取用户id
		$uid = getUid();
		
		
		
		//数据处理
		$name = stripslashes($_POST ['name']);
		$phone = stripslashes($_POST ['phone']);
		
		//验证
		//号码输入不正确，会被提示手机输入格式不对需要重新输入
		if(empty($name) || empty($phone)){
			die ( ajax_return ( ajax_success ('', array(
				'status' => 10
			)) ) );
		}
		
		$_profile = new profile ();
		
		$data = array (
			'uid' => $uid,
			'name' => $name,
			'phone' => $phone,
			'udate' => getDateTime(time())
		);
		$_profile->save ( $data );
		
		die ( ajax_return ( ajax_success ('', array(
			'status' => 0
		)) ) );
	}
	
	//删除操作
	function del()
	{
		if(isset($_GET['id']))
		{
			$id=$_GET['id'];
			$_profile = new profile ();
			$_profile->deleteById($id);
			die(ajax_return(ajax_success(null, array('status'=>0))));
		}
		die(ajax_return(ajax_success(null, array('status'=>10))));
	}
	
	//修改操作
	function update()
	{
		$id=$_POST['id'];
		
		//数据处理
		$name = stripslashes($_POST ['name']);
		$phone = stripslashes($_POST ['phone']);
		
		$_profile = new profile (intval($id));
		
		$data = array (
			'name' => $name,
			'phone' => $phone,
			'udate' => getDateTime(time())
		);
		$_profile->new_record=false;
		$_profile->save ( $data );
		
		die ( ajax_return ( ajax_success ('', array(
			'status' => 0
		)) ) );
	}
	
}

run ( $urls );