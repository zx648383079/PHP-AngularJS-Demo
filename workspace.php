<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.delete' => 'deleteAction',
	'.getList'=> 'getListAction',
	'.update' => 'updateAction',
	'.add'	  => 'addAction',
	'.*'	  => 'workspaceAction' 
);
//工作空间
class workspaceAction extends Common {
	//GET执行的操作
	function GET()
	{
		render_admin ( 'workspace');
	}
}	

class getListAction extends Common{
	//展示数据
	function GET()
	{
		$_profile = new profile();
		$total = $_profile->getCount();
		
		
		$page=isset($_GET['page'])?$_GET['page']:0;
		$index=$page*5;
		
		$list = $_profile->getListByPage($index,5);
		
		die(ajax_return(ajax_success(null, array(
			'data'=>$list,
			'more'=>($total > ($index+5))
			))));
	}
}	

class addAction extends Common{
	
	//增加数据
	function POST()
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
		
		
		$id=$_profile->save ( $data );
		
		die ( ajax_return ( ajax_success ('', array(
			'status' => 0,
			'data'=>array(
				'id'=>$id,
				'name'=>$name,
				'phone' => $phone,
				'udate' => $data['udate']
			)
		)) ) );
	}	
}

class deleteAction extends Common{
	//删除操作
	function GET()
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
}

class updateAction extends Common{	

	//修改操作
	function POST()
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
			'status' => 0,
			'data'=>array(
				'id'=>$id,
				'name'=>$name,
				'phone' => $phone,
				'udate' => $data['udate']
			)
		)) ) );
	}
	
}

run ( $urls );