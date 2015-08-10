<?php
require_once ('lib/common_run.inc.php');

$urls = array (
	'.*'	=> 'backendAction' 
);

class backendAction extends Common {
	function GET() {
		if(isset($_GET ['id'])){
			$id =  isset ( $_GET ['id'] ) ? intval($_GET ['id']) : 0;
			$_collect = new collect();
			$collects = $_collect->findByUidStatus($id, 10);
			die ( ajax_return ( ajax_success (null, $collects) ) );
		}
		
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
		$sql .= "p.name, p.phone, p.cdate AS postdate, p.status, IFNULL(t.pnumber, 0) AS pnumber ";
		$sql .= "FROM " . DB_TABLEPRE . "user u ";
		$sql .= "LEFT JOIN " . DB_TABLEPRE . "profile p ON u.id = p.uid ";
		$sql .= "LEFT JOIN ( ";
		$sql .= "SELECT c.uid, COUNT(c.id) AS pnumber ";
		$sql .= "FROM " . DB_TABLEPRE . "collect c WHERE c.status = 10 GROUP BY c.uid ";
		$sql .= ") t ON u.id = t.uid ";
		$sql .= "WHERE u.levels = 20 ";
		$sql .= $wheresql;
		//$sql .= "ORDER BY p.udate DESC ";
		
		if(isset($_GET ['export']) && intval($_GET ['export']) == 1){
			$sqlExcel .= $sql;
			$sqlExcel .= " ORDER BY p.cdate DESC ";
			$list = $_collect->findList($sqlExcel);
			
			foreach($list as $key => $value){
				$codesstr = '';
				if(isset($value['pnumber']) && intval($value['pnumber']) > 0){
					$codes = $_collect->findCodeStrByUid($value['uid'], ', ');
					if(isset($codes)){
						$codesstr = $codes['codes'] . '';
					}
				}
				$value['collects'] = $codesstr;
				$list[$key] = $value;
			}
			
			$this->getExcel($list);
			//$this->getExcel2($list);
		}
		
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
	
	function getExcel2($result, $name = 'backend.xls'){
		/** Error reporting */
		//error_reporting(E_ALL);
		//ini_set('display_errors', TRUE);
		//ini_set('display_startup_errors', TRUE);
		//date_default_timezone_set('Europe/London');
		
		if (PHP_SAPI == 'cli'){
			die('This example should only be run from a Web Browser');
		}
		
		/** Include PHPExcel */
		//require_once dirname(__FILE__) . '/../Classes/PHPExcel.php';
		//require_once ('/lib/PHPExcel.php');
		require_once dirname(__FILE__) . '/lib/PHPExcel.php';
		
		// Create new PHPExcel object
		$objPHPExcel = new PHPExcel();
		
		// Set document properties
		$objPHPExcel->getProperties()->setCreator("Nways")
			 ->setLastModifiedBy("Nways")
			 ->setTitle("Office 2007 XLSX Test Document")
			 ->setSubject("Office 2007 XLSX Test Document")
			 ->setDescription("Backend list file for Office 2007 XLSX.")
			 ->setKeywords("office 2007 openxml php")
			 ->setCategory("Backend list file");
		
		
		// Add data
		$objPHPExcel->setActiveSheetIndex(0)
			->setCellValue('A1', 'No.')
			->setCellValue('B1', 'Openid')
			->setCellValue('C1', 'Play times')
			->setCellValue('D1', 'Collects')
			->setCellValue('E1', 'Form name')
			->setCellValue('F1', 'Mobile')
			->setCellValue('G1', 'Post Date')
			->setCellValue('H1', 'To CRM');
		
		$objPHPExcel->getActiveSheet()->getStyle('A1:H1')->getFont()->setBold(true);
		
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(40); //X * 7px
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(15);
		$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
		$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
		
		for ($i = 0; $i < count($result); $i++) {
			$objPHPExcel->getActiveSheet(0)->setCellValue('A' . ($i + 2), ($i + 1));
			$objPHPExcel->getActiveSheet(0)->setCellValue('B' . ($i + 2), $result[$i]['openid']);
			$objPHPExcel->getActiveSheet(0)->setCellValue('C' . ($i + 2), $result[$i]['pnumber']);
			$objPHPExcel->getActiveSheet(0)->setCellValue('D' . ($i + 2), '');
			$objPHPExcel->getActiveSheet(0)->setCellValue('E' . ($i + 2), $result[$i]['name']);
			$objPHPExcel->getActiveSheet(0)->setCellValue('F' . ($i + 2), $result[$i]['phone']);
			$objPHPExcel->getActiveSheet(0)->setCellValue('G' . ($i + 2), $result[$i]['postdate']);
			if(intval($result[$i]['status']) == 99){
				$objPHPExcel->getActiveSheet(0)->setCellValue('H' . ($i + 2), 'T');
			}
			else{
				$objPHPExcel->getActiveSheet(0)->setCellValue('H' . ($i + 2), 'F');
			}
			
			$objPHPExcel->getActiveSheet()->getStyle('A' . ($i) . ':H' . ($i + 2))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
			$objPHPExcel->getActiveSheet()->getStyle('A' . ($i) . ':H' . ($i + 2))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
			$objPHPExcel->getActiveSheet()->getRowDimension($i)->setRowHeight(18);
		}
		
		// Rename worksheet
		$objPHPExcel->getActiveSheet()->setTitle('backend');
		
		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$objPHPExcel->setActiveSheetIndex(0);
		
		ob_end_clean();
		
		// Redirect output to a client’s web browser (Excel5)
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="backend.xls"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');
		exit;
	}
	
	function getExcel($list){
		header ( "Content-type:application/vnd.ms-excel" );
		header ( "Content-Disposition:filename=backend.xls" );
		echo "
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>backend list</title>
<style>
td{
    text-align:left;
    font-size:12px;
    font-family:Arial, Helvetica, sans-serif;
    border:#000000 1px solid;
    color:#000000;
    width:100px;
}
table,tr{
    border-style:none;
}
.title{
    font-weight:bold;
}
</style>
</head>
<body>
<table width='1200' border='1'>
  <tr>
    <td class='title'>No.</td>
    <td class='title'>openid</td>
    <td class='title'>Play times</td>
    <td class='title'>Collects</td>
    <td class='title'>Form name</td>
    <td class='title'>Mobile</td>
    <td class='title'>Post Date</td>
    <td class='title'>To CRM</td>
  </tr>
";
		$i = 1;
		foreach($list as $key => $value){
			$isPost = intval($value['status']) == 99 ? "T" : "F";
			echo "
			  <tr>
			    <td>" . $i . "</td>
			    <td>" . $value['openid'] . "</td>
			    <td>" . $value['pnumber'] . "</td>
			    <td>" . $value['collects'] . "</td>
			    <td>" . $value['name'] . "</td>
			    <td>" . $value['phone'] . "</td>
			    <td>" . $value['postdate'] . "</td>
			    <td>" . $isPost . "</td>
			  </tr>
			";
			$i ++;
		}
		
echo "
</table>
</body>
</html>
";
		exit;
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

run ( $urls );
?>
