<?php
class Model {
	
	public $new_record = true;
	public $pid = null;
	public $__profix = DB_TABLEPRE;
	
	public function __construct($pid = null) {
		$this->_table_name = $this->__profix . $this->_table_name;
		
		if (isset($pid)) {
			$this->pid = $pid;
			
			$sql = "SELECT * FROM {$this->_table_name} WHERE {$this->_primary_key} = ?";
			$param = array (
				$pid
			);
			$result = $this->runObject($sql, $param);
			
			if (isset($result)) {
				$this->data = new stdClass();
				$this->populate($result);
				$this->new_record = false;
			}
		}
	}
	
	public function save($data) {
		if ($this->new_record) {
			$sql = "INSERT INTO {$this->_table_name} (" . implode(', ', array_keys($data)) . ") VALUES ('" . implode("', '", $data) . "')";
			$db = db();
			$result = $db->run($sql);
			$this->lastInsertId = $db->lastInsertId();
		} else {
			$sql = "UPDATE {$this->_table_name} SET ";
			foreach ($data as $key => $val) {
				$sql .= " $key = '$val',";
			}
			$sql = substr($sql, 0, -1);
			$sql .= " WHERE {$this->_primary_key} = ?";

			$db = db();
			$result = $db->run($sql, $this->data-> {$this->_primary_key});
			$this->lastInsertId = $db->lastInsertId();
		}
		return $this->lastInsertId;
	}

	public function populate($row_data) {
		foreach ($row_data as $field => $value) {
			$this->data-> { $field } = $value;
			$this->new_record = false;
		}
	}

	public function getField($field) {
		if (isset ($this->data)){
			return $this->data-> { $field };
		}
	}
	//获取表数据的行数
	public function getCount()
	{
		$sql="SELECT COUNT(*) as num FROM $this->_table_name";
		return $this->findObject($sql)['num'];
	}
	 /**
	 * 得到查询的数据
	 *
	 * @access public
	 *
     * @param array $_fileld 要显示的字段
     * @param array|null $_param 条件
	 * @return 返回查询结果,
	 */ 
	public function getList( Array $_param = array(),Array $_fileld=array()) {  
        $_limit = $_order =$_group = $_where='';  
        if (is_array($_param) && !empty($_param)) {  
            $_limit = isset($_param['limit']) ? 'LIMIT '.$_param['limit'] : '';  
            $_order = isset($_param['order']) ? 'ORDER BY '.$_param['order'] : '';  
            $_group = isset($_param['group']) ? 'GROUP BY '.$_param['group'] : '';  
            if (isset($_param['where'])) {  
                foreach ($_param['where'] as $_key=>$_value) {  
                    if(empty($_where))
                    {
                        $_where='WHERE '.$_value;
                    }else{
                        if(is_array($_value))
                        {
                            switch($_value[1])
                            {
                                case "or":
                                    $_where .= ' OR '.$_value;
                                case "and":
                                    $_where .= ' AND '.$_value;
                            }
                        }else{
                            $_where .= ' AND '.$_value;
                        }
                    }
                }  
            }
        }  
        $_selectFields = empty($_fileld)?"*":implode(',', $_fileld);  
        $_sql = "SELECT $_selectFields FROM {$this->_table_name} $_where $_group $_order $_limit"; 
		
		return $this->findList($_sql);
	}
	
	public function setField($field, $value) {
		if (isset ($this->data) && isset ($this->data-> { $field })){
			$this->data-> { $field } = $value;
		}
	}
	
	public function deleteById($id) {
		$sql = "DELETE FROM $this->_table_name WHERE id = ?";
		$param = array($id);
		$this->run($sql, $param);
	}
	
	public function findAll() {
		$sql = "SELECT * FROM $this->_table_name";
		$param = array();
		return $this->findList($sql, $param);
	}
	
	public function findByField($field, $value) {
		$sql = "SELECT * FROM $this->_table_name WHERE $field = ?";
		$param = array($value);
		return $this->findList($sql, $param);
	}
	
	public function findById($id) {
		$sql = "SELECT * FROM $this->_table_name WHERE id = ?";
		$param = array($id);
		return $this->findObject($sql, $param);
	}
	
	public function findObject($sql, $param = array()) {
		$result = $this->runObject($sql, $param);
		return $this->populateArray($result);
	}
	
	public function findList($sql, $param = array()) {
		$results = $this->runList($sql, $param);
		$list = array ();
		foreach ($results as $key => $result) {
			$list[] = $this->populateArray($result);
		}
		return $list;
	}
	
	public function run($sql, $param = array()) {
		$db = db();
		$result = $db->run($sql, $param);
		$db = null;
		//return $db->lastInsertId();
	}
	
	public function runObject($sql, $param = array()) {
		$db = db();
		$results = $db->run($sql, $param)->fetchall(PDO :: FETCH_OBJ);
		$db = null;
		if(isset($results) && count($results) > 0){
			return $results[0];
		}
		return null;
	}
	
	public function runList($sql, $param = array()) {
		$db = db();
		$results = $db->run($sql, $param)->fetchall(PDO :: FETCH_OBJ);
		$db = null;
		return $results;
	}
	
	public function populateArray($result) {
		if(isset($result)){
			$row = array();
			foreach ($result as $field => $value) {
				$row[$field] = $value;
			}
			return $row;
		}
		return null;
	}

}
?>