<?php
class profile extends Model {
	public $_primary_key = 'id';
	public $_table_name = 'profile';
	public $_columns = array (
		'id',
		'uid',
		'name',
		'phone',
		'email',
		'address',
		'postcode',
		'memo',
		'status',
		'udate',
		'cdate' 
	);
	public $relationships = array ();
	public function findByUid($uid) {
		$sql = "SELECT * FROM $this->_table_name WHERE uid = ?";
		$param = array (
			$uid 
		);
		return $this->findObject ( $sql, $param );
	}
	public function findByPhone($phone) {
		$sql = "SELECT * FROM $this->_table_name WHERE phone = ?";
		$param = array (
			$phone
		);
		return $this->findList ( $sql, $param );
	}
	//根据开始位置和取的个数去结果
	public function getListByPage($start,$count)
	{
		$where=array(
			'order'=>'id',
			'limit'=>$start.','.$count
		);
		
		$fileld=array(
			'id','name','phone','udate'
		);
		
		return $this->getList($where,$fileld);
	}
}
?>