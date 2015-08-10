<?php
class codes extends Model {
	public $_primary_key = 'id';
	public $_table_name = 'codes';
	public $_columns = array (
		'id',
		'code',
		'cid',
		'uid',
		'status',
		'udate',
		'cdate',
		'startdate',
		'enddate',
		'orderid'
	);
	public $relationships = array ();
	
	function findPreCatchCode() { //查询12小时内被领走的codes
		$sql = "SELECT * FROM $this->_table_name WHERE status = ? AND (udate >= NOW() - INTERVAL 12 HOUR) ORDER BY id DESC LIMIT 0,1";
		$param = array (
			DicConst::$STATUS_CODE_20
		);
		return $this->findObject ( $sql, $param );
	}
	
	function findByCode($code) {
		$sql = "SELECT * FROM $this->_table_name WHERE code = ?";
		$param = array (
			$code 
		);
		return $this->findObject ( $sql, $param );
	}
	
	function findByOrderid($orderid) {
		$sql = "SELECT * FROM $this->_table_name WHERE orderid = ?";
		$param = array (
			$orderid
		);
		return $this->findObject ( $sql, $param ); //TODO return list
	}
	
	function findValidCodes($date) {
		$sql = "SELECT * FROM $this->_table_name t WHERE t.startdate <= ? AND t.enddate >= ? ORDER BY id";
		$param = array (
			$date,
			$date
		);
		return $this->findList ( $sql, $param );
	}
}
?>