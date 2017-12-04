<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Buy;
use Multiple\PHOClass\PhoLog;
use Multiple\Models\Provincial;
class VbuyController extends PHOController
{

	public function indexAction($url)
	{
		try{				
			$exp  = explode('_', $url)	;	
			$id = $exp[count($exp)-1];			
			
			$db = new Posts();
			$result = $db->get_vpost($id);
			$result['des']= substr($result['content'],0,150).'...';
			//PhoLog::debug_var('view----',__LINE__);
			$img = new PostsImg();
			$result['imglist'] = $img->get_img_bypost($id);
			
			$time = time();
			$traffic['time'] = $time;//-600;  //10phut		
			$traffic['section_id'] = session_id();
			//PhoLog::debug_var('view----',__LINE__);
			$traffic['ip'] = $this->get_client_ip_server();
			$traffic['post_id'] =$id;
			
			$rel['make_id'] = $result['make_id'];
			//$rel['m_district_id'] = $result['m_district_id'];
			$rel['post_id'] = $result['post_id'];
			PhoLog::debug_var('view----',$rel);
			$result['relations']= $db->get_post_relation($rel);			
			
			$param['provin'] = $result['m_provin_id'];
			
			$this->ViewVAR($result);	
		} catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
	}
	public function listAction()
	{   
		try{
	        $param = $_GET;
	        //PhoLog::debug_var('--testse---',$param);
	        $page = 1;
	      	if(isset($param['page']) && strlen($param['page']) > 0){
	            $page=$param['page'];
	        }
	        $db = new Buy();       
	        $start_row = 0;
	        if( $page > 1){
	            $start_row = ( $page-1)*PAGE_LIMIT_RECORD ;
	        }
			PhoLog::debug_var('---$s2--',__LINE__);
	        $param['page'] = $page;
	        $param['ctg_name'] ='Tìm mua ôtô';
	        $param['ctg_no'] = str_replace('/','', $_SERVER['REQUEST_URI']);
	        $exp = explode('&page',$param['ctg_no'])  ;
	        $param['ctg_no']=  $exp[0]; 
	        PhoLog::debug_var('---$s2--',__LINE__);
	        if(isset($param['addr']) && strlen($param['addr']) > 0){
	            $param['address_ascii'] = $this->convert_ascii($param['addr']);
	        }   
	        $param['list']= $db->search_buy($param,$start_row);
	        $param['total_post'] = $db->search_buy_count($param);
	        $param['total_page']= round($param['total_post']/PAGE_LIMIT_RECORD);
	        PhoLog::debug_var('---$s2--',__LINE__);
	        $start = $page - 2;
	        $end = $page + 2;
	        if($page < 3){
	            $start = 1;
	            $end = $start + 4;
	            if($end > $param['total_page']){
	               $end = $param['total_page'];
	            }
	        }
	        PhoLog::debug_var('---$s2--',__LINE__);
	        if($param['total_page']< $page + 2 ){
	            $end = $param['total_page'];
	            $start = $param['total_page'] - 4;
	            if($start < 1){
	               $start = 1;
	            }
	        }
	        PhoLog::debug_var('---$s2--',__LINE__);
	        $param['start'] = $start;
	        $param['end'] = $end;
	        $param['dstlist'] = array();
	        PhoLog::debug_var('---$s2--',__LINE__);
	        $cache = $this->createCache( ['lifetime' => 86400 ]); 
	        $cacheKey = 'buy_list.cache';
	        $pa_s = $cache->get($cacheKey);
	        if($pa_s === null){               
	            $pa_s['provin_list'] = Provincial::get_all();                
	            $cache->save($cacheKey,$pa_s);
	        }
	        PhoLog::debug_var('---$s2--',__LINE__);
	        $s2['fyear']='';
	        $s2['tyear']='';       
	        $s2['provin']='';       
	        //PhoLog::debug_var('---$s2--',$param);
	        $param = array_merge($s2,$param);
	        //PhoLog::debug_var('---$s2--',$param);
	        $param = array_merge($param,$pa_s);
	        //$this->set_template_share();
	        PhoLog::debug_var('---$s2--',__LINE__);
	        $this->ViewVAR($param);
        }catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
	}
}
