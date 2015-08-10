<?php
class collect extends Model {
	public $_primary_key = 'id';
	public $_table_name = 'collect';
	public $_columns = array (
		'id',
		'uid',
		'codes',
		'collects',
		'complete',
		'memo',
		'ip',
		'useragent',
		'status',
		'type',
		'cdate' 
	);
	public $relationships = array ();
	
	function findCodeStrByUid($uid, $separator = ',') {
		$sql = "SELECT GROUP_CONCAT(c.codes SEPARATOR '$separator') AS codes FROM $this->_table_name c WHERE c.uid = ?";
		$param = array (
			$uid
		);
		return $this->findObject($sql, $param);
	}
	
	function findTimesByUidInterval($uid, $interval) {
		$sql = "SELECT id, type, memo, cdate FROM $this->_table_name WHERE uid = ? AND TIMESTAMPDIFF(SECOND, cdate, now()) <= ? ORDER BY id DESC";
		$param = array (
			$uid,
			$interval 
		);
		return $this->findList ( $sql, $param );
	}
	function findByUid($uid) {
		$sql = "SELECT id, codes, cdate, status FROM $this->_table_name WHERE uid = ?";
		$param = array (
			$uid 
		);
		return $this->findList ( $sql, $param );
	}
	function findByUidStatus($uid, $status) {
		$sql = "SELECT id, codes, cdate, status FROM $this->_table_name WHERE uid = ? AND status = ? ORDER BY cdate DESC";
		$param = array (
			$uid,
			$status 
		);
		return $this->findList ( $sql, $param );
	}
	function findByUidStatusCdate($uid, $status, $startdate, $enddate) {
		$sql = "SELECT id, codes, cdate, status FROM $this->_table_name WHERE uid = ? AND status = ? AND cdate BETWEEN ? AND ? ORDER BY cdate DESC";
		$param = array (
			$uid,
			$status,
			$startdate,
			$enddate
		);
		return $this->findList ( $sql, $param );
	}
}
?>