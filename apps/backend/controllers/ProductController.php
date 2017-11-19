<?php

namespace Multiple\Backend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Posts;
use Multiple\Models\Category;
use Multiple\PHOClass\PhoLog;
class ProductController extends PHOController
{

    public function initialize()
    {        
        $this->check_loginadmin();
    }
	public function indexAction()
	{
		try{
			$param = $this->get_Gparam(array('ctgid','pid','fdate','tdate','status','page'));
			$db = new Posts();
			$ctg = new Category();
			
			$page = 1;
			$param['limit'] = 50;
	      	if(isset($param['page']) && strlen($param['page']) > 0){
	            $page=$param['page'];
	        }       
	        $start_row = 0;
	        if( $page > 1){
	            $start_row = ( $page-1)*$param['limit'] ;
	        }

	        $param['page'] = $page;
	        //$param['ctg_name'] ='Kết quả tìm';
	        //PhoLog::debug_var('--url---',$_GET);
	        $param['ctg_no'] = str_replace('/','', $_SERVER['REQUEST_URI']);
        	$exp = explode('&page',$param['ctg_no'])  ;
        	$param['ctg_no']=  $exp[0]; 
	        
	        //if(isset($param['addr']) && strlen($param['addr']) > 0){
	        //    $param['address_ascii'] = $this->convert_ascii($param['addr']);
	        //}   
	        //$param['post']=$db->get_list_all($param,$start_row);
	        $param['total_post'] = $db->get_list_all_count($param);
	        $param['total_page']= round($param['total_post']/$param['limit']);
	        
	        $start = $page - 2;
	        $end = $page + 2;
	        if($page < 3){
	            $start = 1;
	            $end = $start + 4;
	            if($end > $param['total_page']){
	               $end = $param['total_page'];
	            }
	        }
	        if($param['total_page']< $page + 2 ){
	            $end = $param['total_page'];
	            $start = $param['total_page'] - 4;
	            if($start < 1){
	               $start = 1;
	            }
	        }
	        $param['start'] = $start;
	        $param['end'] = $end;
			
			
			$result = 	$param;	
			$result['list']= $db->get_list_all($param,$start_row);
			$result['categorys']= $ctg->get_category_rows(0);
			//$this->set_template_share();
		} catch (\Exception $e) {
			PhoLog::debug_var('---Error---','------------------------------');
			PhoLog::debug_var('---Error---',$e);
		}
		//PhoLog::debug_var('---result---',$result);
		$this->ViewVAR($result);
	}
	public function apprAction($id){
		$db = new Posts();
		$db->update_status($id,1);
		return $this->ViewJSON('OK');
	}
	public function unapprAction($id){
		$db = new Posts();
		$db->update_status($id,2);
		return $this->ViewJSON('OK');
	}
}
