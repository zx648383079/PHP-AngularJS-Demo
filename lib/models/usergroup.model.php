<?php
class usergroup extends Model {
	public $_primary_key = 'id';
	public $_table_name = 'usergroup';
	public $_columns = array (
		'id',
		'name',
		'functions',
		'levels',
		'status',
		'memo'
	);
	public $relationships = array ();
	public function findByLevels($levels) {
		$sql = "SELECT * FROM $this->_table_name WHERE levels = ?";
		$param = array (
			$levels 
		);
		return $this->findObject ( $sql, $param );
	}
}
?>