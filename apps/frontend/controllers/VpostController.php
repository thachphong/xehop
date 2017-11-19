<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Posts;
use Multiple\Models\PostsView;
use Multiple\Models\PostsImg;
use Multiple\Models\PostsContract;

use Multiple\Models\Tags;
use Multiple\Models\CheckView;
use Multiple\Models\Provincial;
use Multiple\Models\District;
use Multiple\Models\Ward;
use Multiple\Models\Street;
use Multiple\Models\Directional;
use Multiple\Models\Unit;
use Multiple\Models\Category;
use Multiple\Library\FilePHP;
use Multiple\PHOClass\PhoLog;
class VpostController extends PHOController
{
	public function initialize()
    {        
        //$this->check_login();
    }
	public function indexAction($url)
	{
		try{	
			//PhoLog::debug_var('view----',__LINE__);
			//PhoLog::debug_var('view----',$url);
			$exp  = explode('_', $url)	;	
			$id = $exp[count($exp)-1];
			//PhoLog::debug_var('view----',$id);
			
			$db = new Posts();
			$result = $db->get_vpost($id);
			$result['des']= substr($result['content'],0,150).'...';
			//PhoLog::debug_var('view----',__LINE__);
			$img = new PostsImg();
			$result['imglist'] = $img->get_img_bypost($id);
			//update traffic
			//PhoLog::debug_var('view----',__LINE__);
			$time = time();
			$traffic['time'] = $time;//-600;  //10phut		
			$traffic['section_id'] = session_id();
			//PhoLog::debug_var('view----',__LINE__);
			$traffic['ip'] = $this->get_client_ip_server();
			$traffic['post_id'] =$id;
			//PhoLog::debug_var('view----',__LINE__);
			$db->update_traffic($traffic);
			
			//$this->set_template_share();
			$rel['m_type_id'] = $result['m_type_id'];
			$rel['m_provin_id'] = $result['m_provin_id'];
			$rel['m_district_id'] = $result['m_district_id'];
			$rel['post_id'] = $result['post_id'];
			PhoLog::debug_var('view----',$rel);
			$result['relations']= $db->get_post_relation($rel);
			
			$result['type'] = $result['m_type_id'];
			$param['type'] = $result['m_type_id'];
			$param['ctgid'] = $result['ctg_id'];
			$param['provin'] = $result['m_provin_id'];
			$param['district'] = $result['m_district_id'];					      
	        $result['dstlist'] = $db->get_bydistrict($param);
	        
			$this->ViewVAR($result);	
		} catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
	}
	public function check_online(){
		
		
	}
	public function viewAction($id)
	{
		//$url =  $this->request->getURI();
        //$abc =1;
       // $post_data= Posts::findFirst
        $this->set_template_share();
		//$this->ViewVAR($result);
	}
	
	
	
}
