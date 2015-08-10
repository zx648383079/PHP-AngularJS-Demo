<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.backend' 		=> 'backendAction',
	'.viewcodes' 	=> 'viewcodesAction',
	'.updatepwd' 	=> 'updatepwdAction',
	'.logout' 		=> 'logoutAction',
	'.*' 			=> 'loginAction' 
);

class backendAction extends Common {
	function GET() {
		//$this->getExcel();
		
		$wheresql = "";
		
		$keys = isset($_GET['keys']) ? trim(stripslashes($_GET['keys'])) : null;
		if(!empty($keys)){
			$wheresql .= " AND ( ";
			$wheresql .= " u.openid LIKE '%$keys%' ";
			$wheresql .= " OR p.name LIKE '%$keys%' ";
			$wheresql .= " OR p.phone LIKE '%$keys%' ";
			$wheresql .= " ) ";
		}
		
		$_collect = new collect();
		
		//分页处理
		$pages = listPages();
		$page = $pages['page'];
		$limitstart = $pages['limitstart'];
		
		$sql = "";
		$sql .= "SELECT u.id AS uid, u.openid, u.name AS wename, u.cdate, ";
		$sql .= "p.name, p.phone, p.email, p.cdate AS postdate, IFNULL(t.pnumber, 0) AS pnumber ";
		$sql .= "FROM " . DB_TABLEPRE . "user u ";
		$sql .= "LEFT JOIN " . DB_TABLEPRE . "profile p ON u.id = p.uid ";
		$sql .= "LEFT JOIN ( ";
		$sql .= "SELECT c.uid, COUNT(c.id) AS pnumber ";
		$sql .= "FROM " . DB_TABLEPRE . "collect c WHERE c.status = 10 GROUP BY c.uid ";
		$sql .= ") t ON u.id = t.uid ";
		$sql .= "WHERE u.levels = 20 ";
		$sql .= $wheresql;
		//$sql .= "ORDER BY p.udate DESC ";
		
		$sqlpage = "SELECT COUNT(tp.uid) AS pnumber FROM ($sql) tp";
		$pagedata = $_collect->findObject($sqlpage);
		$total = $pagedata['pnumber'];
		$pagenum = ceil($total/20);
		
		$sqllist .= $sql;
		$sqllist .= " ORDER BY p.cdate DESC ";
		$sqllist .= " limit $limitstart , " . 20;
		$list = $_collect->findList($sqllist);
		
		foreach($list as $key => $value){
			if(isset($value['mintimes'])){
			//	$value['mintimes'] = formatScore($value['mintimes']);
			}
			$list[$key] = $value;
		}
		
		$p = array();
		$p['list'] = $list;
		$p['page'] = $page;
		$p['pagenum'] = $pagenum;
		$p['total'] = $total;
		$p['keys'] = $keys;
		
		render_admin ( 'backend', $p );
	}
	function getExcel(){
		header("Content-type:application/vnd.ms-excel;charset=UTF-8");
		header("Content-Disposition:filename=backend.xls");
		
		$sql = "";
		$sql .= "SELECT u.id AS uid, u.name AS wename, ";
		$sql .= "p.name, p.phone, p.address, p.postcode, p.udate AS postdate, ";
		$sql .= "t2.mintimes, t2.newtimes, t2.succnums ";
		$sql .= "FROM user u ";
		$sql .= "LEFT JOIN profile p ON u.id = p.uid ";
		$sql .= "LEFT JOIN ( ";
		$sql .= "SELECT t.uid, t.mintimes, c2.times AS newtimes, t.succnums ";
		$sql .= "FROM ( ";
		$sql .= "SELECT c.uid, MIN(c.times) AS mintimes, MAX(c.id) AS maxid, COUNT(c.id) AS succnums ";
		$sql .= "FROM collect c WHERE c.complete = 1 ";
		$sql .= "GROUP BY c.uid ";
		$sql .= ") t LEFT JOIN collect c2 ON t.maxid = c2.id ";
		$sql .= ") t2 ON t2.uid = u.id ";
		$sql .= "WHERE u.levels = 20 ";
		$sql .= "ORDER BY p.udate DESC ";
		
		$_collect = new collect();
		$_codes = new codes();
		$list = $_collect->findList($sql);
		
		$i = 1;
		foreach($list as $key => $value){
			$this->outColumn($i);
			$this->outColumn($value['wename']);
			$this->outColumn($value['newtimes']);
			$this->outColumn($value['mintimes']);
			$this->outColumn($value['succnums']);
			
			//$this->outColumn('Click to view');
			$codesstr = '';
			$codes = $_codes->findCodeStrByUid($value['uid'], ', ');
			if(isset($codes)){
				$codesstr = $codes['codes'] . '';
			}
			$this->outColumn($codesstr);
			
			$this->outColumn($value['name']);
			$this->outColumn($value['phone'] . '');
			$this->outColumn($value['address']);
			$this->outColumn($value['postcode'] . '');
			$this->outColumn($value['postdate'] . '');
			
			$this->outRow();
			
			$i ++;
		}
		
		die();
	}
	function outColumn($val) {
		echo iconv("UTF-8", "GB18030", $val) . "\t";
	}
	function outRow() {
		echo "\n";
	}
}

class viewcodesAction extends Common {
	function GET() {
		$id =  isset ( $_GET ['id'] ) ? intval($_GET ['id']) : 0;
		
		$_collect = new collect();
		$collects = $_collect->findByUidStatus($id, 10);
		
		die ( ajax_return ( ajax_success (null, $collects) ) );
	}
	function POST() {
	}
}

class loginAction extends Common {
	function __construct($web) {
		$web->middleware ['session']->require_login = false;
	}
	function GET() {
		if(isset($_GET['act']) && stripslashes($_GET['act']) === 'logout'){
			$_SESSION = array ();
			if (isset ( $_COOKIE [session_name ()] )) {
				setcookie ( session_name (), '', time () - 42000, '/' );
			}
			session_destroy ();
			header ( "Location: " . APP_URL . "admin.php" );
		}
		
		render_admin ( 'login' );
	}
	function POST() {
		if (! isset ( $_POST ['password'] )) {
			die ( ajax_return ( ajax_failure ( 'The password is required.' ) ) );
		}
		$password = $_POST ['password'];
		
		$username = 'admin';
		if (isset ( $_POST ['username'] )) {
			$username = $_POST ['username'];
		}
		
		$_user = new user ();
		$user = $_user->findByUsernameLevels($username, DicConst::$TYPE_USER_LEVELS_99);
		if (! isset ( $user )) {
			die ( ajax_return ( ajax_failure ( 'Login account was not found.' ) ) );
		}
		if ($password != $user ['password']) {
			die ( ajax_return ( ajax_failure ( 'Login password does not match.' ) ) );
		}
		
		session_user ( $user );
		access_login($user);
		
		die ( ajax_return ( ajax_success () ) );
	}
}

class logoutAction {
	function GET() {
		$_SESSION = array ();
		if (isset ( $_COOKIE [session_name ()] )) {
			setcookie ( session_name (), '', time () - 42000, '/' );
		}
		session_destroy ();
		header ( "Location: " . APP_URL . "admin.php" );
	}
}

class updatepwdAction extends Common {
	function GET() {
		render_admin ( 'updatepwd' );
	}
	function POST() {
		if(!isset($_POST ['password']) || !isset($_POST ['oldpwd']) || !isset($_POST ['username'])){
			die ( ajax_return ( ajax_failure('参数传入有误') ) );
		}
		
		$_user = new user ();
		
		$username = stripslashes($_POST ['username']);
		$oldpwd = stripslashes($_POST ['oldpwd']);
		$password = stripslashes($_POST ['password']);
        
		$user = $_user->findByUsername($username);
		if(isset($user) && $user['password'] == $oldpwd){
			$_user = new user ($user['id']);
			$data = array (
				'password' => $password
			);
			$_user->save ( $data );
			
			die ( ajax_return ( ajax_success () ) );
		}else{
			die ( ajax_return ( ajax_failure('用户名不存在或原始密码输入错误') ) );
		}
	}
}

run ( $urls );
?>
