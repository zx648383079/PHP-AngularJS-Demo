<?php
class accesslog extends Model {
	public $_primary_key = 'id';
	public $_table_name = 'accesslog';
	public $_columns = array (
		'id',
		'name',
		'ip',
		'data',
		'memo',
		'type',
		'status',
		'cdate' 
	);
	public $relationships = array ();
}
?>