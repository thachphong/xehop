<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Posts;
use Multiple\Models\News;
use Multiple\Models\Provincial;
use Multiple\Models\District;
use Multiple\Models\Ward;
use Multiple\Models\Street;
use Multiple\Models\Directional;
use Multiple\Models\Unit;
use Multiple\Models\Sprice;
use Multiple\Models\Category;
use Multiple\Models\Slide;
use Multiple\PHOClass\PhoLog;
class IndexController extends PHOController
{

	public function indexAction()
	{
		try{	
			PhoLog::debug_var('test',__LINE__);
			$options = ['lifetime' => 900 ]; // thoi gian tinh bang giay 
			$cache = $this->createCache($options);
			PhoLog::debug_var('test',__LINE__);
	 		//$frontendCache = new FrontData($options); 	
	 		///$cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);	
	 		$cacheKey = 'index_index.cache';
	 		PhoLog::debug_var('test',__LINE__);
	 		$ne = new News();
	 		$param  = $this->dataCache->get($cacheKey);
	 		$param = $cache->get($cacheKey);
	 		PhoLog::debug_var('test',__LINE__);
	 		if($param === null){
	 			$param['provin_list'] =  Provincial::get_all();
				$cache->save($cacheKey, $param);
	 		}	
			//PhoLog::debug_var('test',__LINE__);
			$db = new Posts();		
			$param['newlist'] = $db->get_list_new('',12);
			//$param['viplist'] = $db->get_list_new(3);
			//$param['xemnhieu'] = $ne->get_news_pupular(5);
			$this->set_template_share();
			//PhoLog::debug_var('test',$param);
			$this->ViewVAR($param);	
		}catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
	}
	public function route404Action(){
		
	}
	public function districtAction(){		
		$ckey ="m_district_ward.cache";
		$cache = $this->createCache(['lifetime' => 86400 ]); // 1 ngay
		$data = $cache->get($ckey);
		if($data === null){			
			$db = new District();
			$mw = new Ward();
			$data['m_districts'] = $db->get_rows();
			$data['m_wards'] = $mw->get_rows();			
			$cache->save($ckey,$data);
		}	
	
		return $this->ViewJSON($data);
	}
	public function sbasicAction(){		
		$ckey ="seach_basic.cache";
		$cache = $this->createCache(['lifetime' => 86400 ]); // 1 ngay
		$data = $cache->get($ckey);
		if($data === null){			
			$db = new District();
			$data['m_districts'] = $db->get_rows();
			$data['m_provins'] = Provincial::get_all();			
			$data['categorys'] = Category::get_all();
			$data['sprices'] = Sprice::find();	
			$ndb = new News();
			$data['projects'] = $ndb->get_project_all();			
			$cache->save($ckey,$data);
		}		
		return $this->ViewJSON($data);
	}
	public function sadvanceAction(){		
		$ckey ="seach_advance.cache";
		$cache = $this->createCache(['lifetime' => 86400 ]); // 1 ngay
		$data = $cache->get($ckey);
		if($data === null){			
			$mw = new Ward();
			$data['directionals'] = Directional::find();
			$data['m_wards'] = $mw->get_rows();
			$cache->save($ckey,$data);
		}		
		return $this->ViewJSON($data);
	}
	
	public function wardAction($m_district_id){
		$db = new Provincial();
		$data['list'] =$db->get_byparent($m_district_id);
		return $this->ViewJSON($data);
	}
	public function streetAction($m_district_id){
		$ckey ="street_".$m_district_id;
		$cache = $this->createCache(['lifetime' => 86400 ]); // 1 ngay
		$data = $cache->get($ckey);
		if($data === null){			
			$mw = new Street();	
			$data['streets'] = $mw->get_list($m_district_id);
			$cache->save($ckey,$data);
		}
		PhoLog::debug_var('--data--',$data);		
		return $this->ViewJSON($data);
	}
}
