<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Buy;
use Multiple\PHOClass\PhoLog;

class BuyController extends PHOController
{

	public function indexAction($url)
	{
        $db = new Project();
        $exp  = explode('_', $url)  ;   
        $id = $exp[count($exp)-1];
        $result = $db->get_info($id);		
        $result['relations'] = $db->get_project_relation($result['project_id']);
        $this->set_template_share();
        $this->ViewVAR($result);
	}
	public function editAction($id)
	{   
		if($id != 0){
			$db = new Buy();
			$result = $db->get_row($id);
		}else{
			$result['buy_id']='';			
			$result['buy_name']='';
			$result['content']='';
			$result['price_arange']='';		
		}
		$this->set_template_share();
        $this->ViewVAR($result);
	}
	public function viewAction($id)
	{
		$url =  $this->request->getURI();
        $abc =1;
       // $post_data= Posts::findFirst
	}
	public function updateAction()
	{
		try{
			$param = $_POST;
			PhoLog::debug_var('post----',$param);
			$result = array('status' => 'OK');
			$result['status'] = 'OK';	
			$result['msg'] = 'Cập nhật thành công!';		
			$db = new Buy();			
			$msg = $this->check_validate_update($param);			
			if($msg == ""){				
				$login_info =  $this->session->get('auth');
	        	$param['user_id'] = $login_info->user_id;	     
	        	
				if(strlen($param['buy_id'])==0){					
					$id = $db->_insert($param);					
					$result['msg'] = $id;
				}else{					
					$db->_update($param);	
					$result['msg'] = $param['buy_id'];				
				}				
				
			}else{
				$result['status'] = 'ER';	
				$result['msg'] = $msg;
			}
		} catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
		//PhoLog::debug_var('update----','end');
		return $this->ViewJSON($result);
	}
	public function check_validate_update(&$param){		
		$param['buy_no'] = $this->convert_url($param['buy_name']);		
		return "";
	}
	public function successAction($post_id){
		$db = new Buy();
		$result = $db->get_info($post_id);
		//$po['post_date_num'] =\DateTime::createFromFormat('d/m/Y', '09/08/2017')->format("m/d/Y"); //date_create('09/08/2017','d/m/Y');
		//$result['buys'] = $po;
		$this->set_template_share();
		$this->ViewVAR($result);	
	}
	public function listAction()
	{		
		$param = $_GET;        
        $page = 1;
      	if(isset($param['page']) && strlen($param['page']) > 0){
            $page=$param['page'];
        }
        $db = new Buy();
        //$ctg = new Category();
        $user = $this->session->get('auth');
		//$result['list']=$db->get_list_byuser($user->user_id);
		$param['user_id'] =$user->user_id;
        $start_row = 0;
        if( $page > 1){
            $start_row = ( $page-1)*PAGE_SEARCH_LIMIT_RECORD ;
        }

        $param['page'] = $page;
        //$param['ctg_name'] ='Kết quả tìm';
        $param['ctg_no'] = str_replace('/','', $_SERVER['REQUEST_URI']);
        $exp = explode('&page',$param['ctg_no'])  ;
        $param['ctg_no']=  $exp[0]; 
                  
        $param['list']=$db->get_list_byuser($param,$start_row);
        $param['total_post'] = $db->get_byuser_count($param);
        $param['total_page']= round($param['total_post']/PAGE_SEARCH_LIMIT_RECORD);
        
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
        if(!isset($param['plevel']) ){
			$param['plevel'] = '';
		}
		if(!isset($param['status']) ){			
			$param['status'] = '';
		}
		if(!isset($param['buyno']) ){			
			$param['buyno'] = '';
		}
		if(!isset($param['fdate'])){			
			$param['fdate'] = '';
		}
		if(!isset($param['tdate'])){			
			$param['tdate'] = '';
		}
        $this->set_template_share();
        $this->ViewVAR($param);		
		
	}
	public function deleteAction($id){
		$db = new Buy();
		$db->_delete($id);
		$this->_redirect('tin-mua');
	}
}
