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
     * @param array|null $_param 条件
	 * @return 返回查询结果,
	 */ 
	public function getList( Array $_param = array()) {  

        $_sql = $this->sqlCheck($_param); 
		
		return $this->findList($_sql);
	}
	
	/*********************************************************************************/
	
	/**
	 * 根据SQL关键字拼接语句
	 *
	 * @access private
	 *
	 * @param string $key 关键字.
	 * @param string|array $value 值.
	 * @return 返回拼接后的SQL语句,
	 */
	private function sqlJoin($key,$value)
	{
		$result=' ';
		switch($key)
		{
			/*case 'create':
				$result.='CREATE TABLE '.$this->sqlCheck($value,',');
				break;
			case 'alter':
				$result.='ALTER TABLE '.sqlCheck($value,',');
				break;
			case 'drop':
				$result.='DROP TABLE '.sqlCheck($value,',');
				break;*/
			case 'exec':
				$result.='EXEC '.$this->sqlCheck($value);
				break;
			case 'select':
				$result.='SELECT '.$this->sqlCheck($value,',');
				break;
			case 'from':
				$result.='FROM '.$this->sqlCheck($value,',');
				break;
			case 'update':
				$result.='UPDATE '.$this->sqlCheck($value,',');
				break;
			case 'set':
				$result.='SET '.$this->sqlCheck($value,',');
				break;
			case 'delete':
				$result.='DELETE FROM '.$this->sqlCheck($value,',');
				break;
			case 'insert':
				$result.='INSERT INTO '.$this->sqlCheck($value);
				break;
			case 'values':
				$result.='VALUES '.$this->sqlCheck($value,',');
				break;
			case 'limit':
				$result.='LIMIT '.$this->sqlCheck($value);
				break;
			case 'order':
				$result.='ORDER BY '.$this->sqlCheck($value);
				break;
			case 'group':
				$result.='GROUP BY '.$this->sqlCheck($value);
				break;
			case 'having':
				$result.='HAVING '.$this->sqlCheck($value);
				break;
			case 'where':
				$result.='WHERE '.$this->sqlCheck($value,' AND ');
				break;
			case 'or':
				$result.='OR '.$this->sqlCheck($value);
				break;
			case 'and':
				$result.='AND '.$this->sqlCheck($value);
				break;
			default:															//默认为是这些关键词 'left','right','inner'
				$result.=strtoupper($value).' JOIN '.$this->sqlCheck($value,' ON ');
				break;
		}
		
		return $result;
	}
	
	/**
	 * SQL关键字检测
	 *
	 * @access private
	 *
	 * @param string|array $value 要检查的语句或数组.
	 * @param string $link 数组之间的连接符.
	 * @return 返回拼接的语句,
	 */
	private function sqlCheck($value,$link=' ')
	{
		$sqlkey=array('select','from','update','set','delete','insert','values','limit','order','group','having','where','or','and','left','right','inner','exec'/*,'alter','drop','create'*/);
		$result='';
		
		if(is_array($value))
		{
			foreach($value as $key=>$v)
			{
				$space=' ';
				
				//把关键字转换成小写进行检测
				$low=strtolower($key);
				if(in_array($low,$sqlkey,true))
				{
					$space.=$this->sqlJoin($low,$v);
				}else{
					if(is_numeric($key))
					{
						if(empty($result))
						{
							$space.=$this->sqlCheck($v);
						}else{
							$space.=$link.$this->sqlCheck($v);
						}
					}else{
						$space.=$key.$link.$this->sqlCheck($v);
					}
				}
				
				$result.=$space;
			}
			
		}else{
			$unsafe=$sqlkey;
			array_push($unsafe,';');                        //替换SQL关键字和其他非法字符，
			$safe=$this->safeCheck($value,'\'',$unsafe,' ');
			$safe=$this->safeCheck($value,'"',$unsafe,' ');
			$result.=$safe;
		}
		
		$result=preg_replace('/\s+/', ' ', $result);
		$result =str_replace("WHERE AND","WHERE",$result);
		$result =str_replace("WHERE OR","WHERE",$result);
		
		return $result;
	}
	
	 /**
	 * 检查是否是字符串语句
	 *
	 * @access private
	 *
	 * @param string $unsafe 要检查的语句.
	 * @param string $scope 排除语句的标志.
	 * @param string|array $find 要查找的关键字.
	 * @param string|array $enresplace 替换的字符或数组.
	 * @return 返回完成检查的语句,
	 */
	private function safeCheck($unsafe,$scope,$find,$enresplace)
	{
		$safe='';
		$arr=explode($scope,$unsafe);
		$len=count($arr);
		if($len==1)
		{
			$safe=$unsafe;
		}else{
			foreach($arr as $key=>$val)
			{
				if($key%2==0)
				{
					$low=strtolower($val);                      //转化为小写
					$safe.=str_replace($find,$enresplace,$low);
				}else{
					//如果排除标志不是成对出现，默认在最后加上
					$safe.=$scope.$val.$scope;
				}
			}
		}
		
		return $safe;
	}
	
	
	/*********************************************************************************/
	
	
	
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