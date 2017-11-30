<?php
use Phalcon\Mvc\Url;
use Phalcon\Mvc\User\Component;
use Multiple\Models\Message;
use Multiple\Models\Menu;
use Multiple\Models\News;
use Multiple\Models\Posts;
use Multiple\Models\Category;
use Multiple\Models\Define;
use Phalcon\Cache\Backend\File as BackFile;
use Phalcon\Cache\Frontend\Data as FrontData;
use Multiple\PHOClass\PhoLog;
use Multiple\Models\Slide;
use Multiple\Models\Project;
use Multiple\Models\Provincial;
/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Component
{
	    
	public function get_message($screen){
		$db= new Message();
		$msg_lang =$db->get_all('LOGIN');
		return $msg_lang;
	}
    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {
    	$cacheKey = 'menu.cache';
		$menu_data  = $this->dataCache->get($cacheKey);
		if ($menu_data === null) {
			$menu_data ='';
            $db = new Menu();
		    $list_menu = $db->get_menus();
            $url = new Url();
            $url->setBaseUri(BASE_URL_NAME);            
	        $base_url = $url->get('');
            foreach($list_menu as $key=>$item){
                if($item['child_flg'] > 0){
	                $menu_data .='<li>';
                    $href = $base_url;
                    
                    if(strlen($item['link'])>0){                        
                        if($item['page_flg']==1){
                            $href .= 'p/';
                        }else if($item['page_flg']==2){
                            $href .= 'c/';
                        }else if($item['page_flg']==3){
                            $href .= 'dm/';
                        }else if($item['page_flg']==4){
                            $href .= 'la/';
                        }
                         $href .=$item['link'];
                    }else{
                        $href ='#';
                    }
                    $menu_data .='<a href="'.$href.'">'.$item['menu_name'].'</a><ul>';
                            
                    foreach($item['child'] as $sub1){                              
                        if($sub1['child_flg'] > 0){                               
                            $menu_data .='<li>';
                            $href = $base_url;
                            
                            if(strlen($sub1['link'])>0) {                       
                                if($sub1['page_flg']==1){
                                    $href .= 'p/';
                                }else if($sub1['page_flg']==2){
                                    $href .= 'c/';
                                }else if ($sub1['page_flg']==3){
                                    $href .= 'dm/';
                                }else if ($sub1['page_flg']==4){
                                    $href .= 'la/';
                                }
                                 $href .=$sub1['link'];
                            }else{
                               // $href ='#';
                            }
                            $menu_data .='<a href="'.$href.'">'.$sub1['menu_name'].'</a><ul>';
                            foreach($sub1['child'] as $sub2){                            
                                $href = $base_url;                    
                                if(strlen($sub2['link'])>0) {                       
                                    if( $sub2['page_flg']==1){
                                        $href .= 'p/';
                                    }else if( $sub2['page_flg']==2){
                                        $href .= 'c/';
                                    }else if ($sub2['page_flg']==3){
                                        $href .= 'dm/';
                                    }else if ($sub2['page_flg']==4){
                                    	$href .= 'la/';
                                	}
                                     $href .=$sub2['link'];
                                }else{
                                    //$href ='#';
                                }                
                                $menu_data .='<li><a href="'.$href.'">'.$sub2['menu_name'].'</a></li>';
                            }                   
                            $menu_data .='</ul></li>';
                        }else{                      
                            $href = $base_url;                    
                            if(strlen($sub1['link'])>0) {                       
                                if( $sub1['page_flg']==1){
                                    $href .= 'p/';
                                }else if( $sub1['page_flg']==2){
                                    $href .= 'c/';
                                }else if ($sub1['page_flg']==3){
                                    $href .= 'dm/';
                                }else if ($sub1['page_flg']==4){
                                    $href .= 'la/';
                                }
                                 $href .=$sub1['link'];
                            }else{
                                //$href ='#';
                            }                
                            $menu_data .='<li><a href="'.$href.'">'.$sub1['menu_name'].'</a></li>';
                        }              
                    }               
                    $menu_data .='</ul></li>';
                }else{
                    $href = $base_url;                    
                    if(strlen($item['link'])>0){                        
                        if( $item['page_flg']==1){
                            $href .= 'p/';
                        }else if( $item['page_flg']==2){
                            $href .= 'c/';
                        }else if ($item['page_flg']==3){
                            $href .= 'dm/';
                        }else if ($item['page_flg']==4){
                            $href .= 'la/';
                        }
                        $href .=$item['link'];
                    }else{
                        //$href ='#';
                    }   
                   // if($key>0){
						$menu_data .='<li><a href="'.$href.'">'.$item['menu_name'].'</a></li>';
					/*}else{											
						$menu_data .='<li><a href="'.$href.'" style="padding-top: 6px;padding-bottom: 13px;"><i class="fa fa-home"></i></a></li>';
					}*/             
                    
                }        
	        }
		    // Store it in the cache
		    $this->dataCache->save($cacheKey, $menu_data);
		    
		}
		echo $menu_data;

    }
    public function getMenu_mobi()
    {
    	$cacheKey = 'menu_mobi.cache';
		$menu_data  = $this->dataCache->get($cacheKey);
		if ($menu_data === null) {
			$menu_data ='';
            $db = new Menu();
		    $list_menu = $db->get_menus();
            $url = new Url();
            $url->setBaseUri(BASE_URL_NAME);            
	        $base_url = $url->get('');
            foreach($list_menu as $key=>$item){
                if($item['child_flg'] > 0){
	                $menu_data .='<li>';
                    $href = $base_url;
                    
                    if(strlen($item['link'])>0){                        
                        if($item['page_flg']==1){
                            $href .= 'p/';
                        }else if($item['page_flg']==2){
                            $href .= 'c/';
                        }else if($item['page_flg']==3){
                            $href .= 'dm/';
                        }else if ($item['page_flg']==4){
                            $href .= 'la/';
                        }
                         $href .=$item['link'];
                    }else{
                        $href ='#';
                    }
                    $menu_data .='<a href="'.$href.'">'.$item['menu_name'].'</a><ul>';
                            
                    foreach($item['child'] as $sub1){                              
                        if($sub1['child_flg'] > 0){                               
                            $menu_data .='<li>';
                            $href = $base_url;
                            
                            if(strlen($sub1['link'])>0) {                       
                                if($sub1['page_flg']==1){
                                    $href .= 'p/';
                                }else if($sub1['page_flg']==2){
                                    $href .= 'c/';
                                }else if ($sub1['page_flg']==3){
                                    $href .= 'dm/';
                                }else if ($sub1['page_flg']==4){
		                            $href .= 'la/';
		                        }
                                 $href .=$sub1['link'];
                            }else{
                               // $href ='#';
                            }
                            $menu_data .='<a href="'.$href.'">'.$sub1['menu_name'].'</a><ul>';
                            foreach($sub1['child'] as $sub2){                            
                                $href = $base_url;                    
                                if(strlen($sub2['link'])>0) {                       
                                    if( $sub2['page_flg']==1){
                                        $href .= 'p/';
                                    }else if( $sub2['page_flg']==2){
                                        $href .= 'c/';
                                    }else if ($sub2['page_flg']==3){
                                        $href .= 'dm/';
                                    }else if ($sub2['page_flg']==4){
                                        $href .= 'la/';
                                    }
                                     $href .=$sub2['link'];
                                }else{
                                    //$href ='#';
                                }                
                                $menu_data .='<li><a href="'.$href.'">'.$sub2['menu_name'].'</a></li>';
                            }                   
                            $menu_data .='</ul></li>';
                        }else{                      
                            $href = $base_url;                    
                            if(strlen($sub1['link'])>0) {                       
                                if( $sub1['page_flg']==1){
                                    $href .= 'p/';
                                }else if( $sub1['page_flg']==2){
                                    $href .= 'c/';
                                }else if ($sub1['page_flg']==3){
                                    $href .= 'dm/';
                                }else if ($sub1['page_flg']==4){
                                    $href .= 'la/';
                                }
                                 $href .=$sub1['link'];
                            }else{
                                //$href ='#';
                            }                
                            $menu_data .='<li><a href="'.$href.'">'.$sub1['menu_name'].'</a></li>';
                        }              
                    }               
                    $menu_data .='</ul></li>';
                }else{
                    $href = $base_url;                    
                    if(strlen($item['link'])>0){                        
                        if( $item['page_flg']==1){
                            $href .= 'p/';
                        }else if( $item['page_flg']==2){
                            $href .= 'c/';
                        }else if ($item['page_flg']==3){
                            $href .= 'dm/';
                        }else if ($item['page_flg']==4){
                            $href .= 'la/';
                        }
                        $href .=$item['link'];
                    }else{
                        //$href ='#';
                    } 
                   
					$menu_data .='<li><a href="'.$href.'">'.$item['menu_name'].'</a></li>';
					 
                }        
	        }
		    // Store it in the cache
		    $this->dataCache->save($cacheKey, $menu_data);
		    
		}
		echo $menu_data;

    }
    public function getdanhmucsp()
    {
    	$cacheKey = 'danhmucsp.cache';
		$menu_data  = $this->dataCache->get($cacheKey);
		if ($menu_data === null) {
			$menu_data ='';
            $db = new Category();
		    $list_menu = $db->get_danhmuc();
            $url = new Url();
            $url->setBaseUri(BASE_URL_NAME);            
	        $base_url = $url->get('');	      
            foreach($list_menu as $key=>$item){
                if($item['child_flg'] > 0){
	                $menu_data .="<li class='has-sub'>";
                                     
                    $menu_data .='<a href="'.$base_url.'tim?makeid='.$item['ctg_id'].'">'.$item['ctg_name'].'</a><ul>';                            
                    foreach($item['child'] as $sub1){ 
                        $menu_data .='<li><a href="'.$base_url.'tim?makeid='.$item['ctg_id'].'&modid='.$sub1['ctg_id'].'">'.$sub1['ctg_name'].'</a></li>';
                    }               
                    $menu_data .='</ul></li>';
                }else{                   
					$menu_data .='<li><a href="'.$base_url.'tim?makeid='.$item['ctg_id'].'">'.$item['ctg_name'].'</a></li>';					 
                }        
	        }
		    // Store it in the cache
		    $this->dataCache->save($cacheKey, $menu_data);
		    
		}
		echo $menu_data;

    }
    public function getMenu_bottom()
    {
    	$cacheKey = 'menu_bottom.cache';
		$menu_data  = $this->dataCache->get($cacheKey);
		if ($menu_data === null) {
			$menu_data ='';
            $db = new Menu();
		    $list_menu = $db->get_menus_bottom();
            $url = new Url();
            $url->setBaseUri(BASE_URL_NAME);            
	        $base_url = $url->get('');
            foreach($list_menu as $item){
                    $href = $base_url;                    
                    if(strlen($item['link'])>0){                        
                        if( $item['page_flg']==1){
                            $href .= 'p/';
                        }else if( $item['page_flg']==2){
                            $href .= 'c/';
                        }else if ($item['page_flg']==3){
                            $href .= 'dm/';
                        }
                        $href .=$item['link'];
                    }else{
                        //$href ='#';
                    }                
                    $menu_data .='<li><a href="'.$href.'">'.$item['menu_name'].'</a></li>';
                        
	        }
		    // Store it in the cache
		    $this->dataCache->save($cacheKey, $menu_data);
		    
		}
		echo $menu_data;

    }
    
    public function getuser(){
        return $this->session->get('auth');
    }	
    /**
     * Returns menu tabs
     */
    public function getTinxemnhieu()
    {    	
        $options = ['lifetime' => 300 ]; // thoi gian tinh bang giay 300:5phut       
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);
    	$cacheKey = 'tinxemnhieu.cache';
		$html  = $cache->get($cacheKey);

		if ($html === null) {
            $ne = new News();
            $data = $ne->get_news_pupular(6);	    	
	    	$html = '';
	    	foreach($data as $key=>$item){
				$html .= '<li class="news-item"> <i class="fa fa-circle"></i><a href="'.BASE_URL_NAME.'t/'.$item['news_no'].'_'.$item['news_id'].'">';
                $html .=$item['news_name'].'</a>                         
                        </li>';
                /*if ($key < count($data)-1){
                    $html .='<hr class="row_line" />';
                }  */
			}
			// Store it in the cache
		    $cache->save($cacheKey, $html);
		}
		echo $html;
    }
    public function getTindacbiet()
    { 
        $options = ['lifetime' => 300 ]; // thoi gian tinh bang giay 
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);

        $cacheKey = 'tindatbiet.cache';
        $html  = $cache->get($cacheKey);
        if ($html === null) {
            $db = new Posts();  
            $data = $db->get_list_new(3,10);      //type sieu vip      //8row
            $html = '';
            foreach($data as $key=>$item){
                $html .= '<li class="vipitem pn_background pn_border">';
                if(strlen($item['img_path'])>0){
                    $html .= '<img src="'.BASE_URL_NAME.'crop/60x50/'.$item['img_path'].'"><div>';
                }else{
                    $html .= '<img src="'.BASE_URL_NAME.'template1/images/post1.png"><div>';
                }
                
                $html .= '<a href="'.BASE_URL_NAME.'b/'.$item['post_no'].'_'.$item['post_id'].'">'.$item['post_name'].'</a>';
                $html .= '<div style="text-align:right">';
                if(strlen($item['price'])>0){
					$html .= '<span class="postprice_right"><strong>'.$item['price'].'</strong>'. $item['m_unit_name'].'</span>';
				}else{
					$html .= '<span class="postprice_right"><strong>Thỏa thuận</strong></span>';
				}
                
                $html .= '</div></div></li>';               
            }
            // Store it in the cache
            $cache->save($cacheKey, $html);
        }
        echo $html;
    }
    public function getduannoibac()
    { 
        $options = ['lifetime' => 600 ]; // thoi gian tinh bang giay ,10 phut
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);

        $cacheKey = 'duannoibac.cache';
        $html  = $cache->get($cacheKey);
        if ($html === null) {
            $ne = new Project();
            $data = $ne->get_project_rows(12);    
            $html = '';
            foreach($data as $key=>$item){
                $html .= '<div class="vipitem pn_background pn_border">';
                if(strlen($item['img_path'])>0){
                    $html .= '<img class="duan_img" src="'.BASE_URL_NAME.'crop/104x69/'.$item['img_path'].'"><div>';
                }else{
                    $html .= '<img class="duan_img" src="'.BASE_URL_NAME.'template1/images/post1.png"><div>';
                }
                
                $html .= '<a href="'.BASE_URL_NAME.'da/'.$item['project_no'].'_'.$item['project_id'].'">'.$item['project_name'].'</a>';
                //$html .= '<div>';
                //$html .= '<span>'. $item['des'].'</span>';
                //$html .= '</div></div></div>';    
                $html .= '</div></div>';              
            }
            // Store it in the cache
            $cache->save($cacheKey, $html);
        }
        echo $html;
    }
    public function getdanhmuc($ctg_id)
    {    	
        $options = ['lifetime' => 86400 ]; // thoi gian tinh bang giay  = 1ngay    
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);
    	$cacheKey = 'danhmuc_'.$ctg_id.'.cache';
		$html  = $cache->get($cacheKey);

		if ($html === null) {
            $ne = new Category();
            $data = $ne->get_child($ctg_id);	    	
	    	$html = '';
	    	foreach($data as $key=>$item){
				$html .= '<li class="news-item"> <i class="fa fa-circle"></i><a href="'.BASE_URL_NAME.'c/'.$item['ctg_no'].'">';
                $html .=$item['ctg_name'].'</a></li>';
			}
			// Store it in the cache
		    $cache->save($cacheKey, $html);
		}
		echo $html;
    }  
    public function getthanhpho()
    {    	
        $options = ['lifetime' => 86400 ]; // thoi gian tinh bang giay  = 1ngay    
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);
    	$cacheKey = 'thanhpho_list.cache';
		$html  = $cache->get($cacheKey);

		if ($html === null) {
            $ne = new Provincial();
            $data = $ne->get_post_count(100);	   //6 row 	
	    	$html = '';
	    	foreach($data as $key=>$item){
				//$html .= '<li class="news-item"> <i class="fa fa-circle"></i><a href="'.BASE_URL_NAME.'tim?provin='.$item['m_provin_id'].'">';
				//$html .=$item['m_provin_name'].'('.$item['cnt'].')</a></li>';
				$html .= '<div class="col-md-2 col-ms-4 col-xs-6"><a href="'.BASE_URL_NAME.'tim?provin='.$item['m_provin_id'].'">';
                $html .=$item['m_provin_name'].'('.$item['cnt'].')</a></div>';
			}
			// Store it in the cache
		    $cache->save($cacheKey, $html);
		}
		echo $html;
    }   
    public function get_define(){
    	$options = ['lifetime' => 24000 ]; // thoi gian tinh bang giay ,400 phut
        $frontendCache = new FrontData($options);   
        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);

        $cacheKey = 'alldefine.cache';
        $cdata  = $cache->get($cacheKey);
        if($cdata === NULL){
			$model = new Define();
			$res = $model->get_define_all();		
			foreach($res as $row){
				$cdata[$row['define_key']] = $row['define_val'];			
			}
			$cache->save($cacheKey, $cdata);
		}
		//PhoLog::debug_var('---checkdata---',$cdata);		
		return $cdata;
	}
	public function get_banner(){
		try{
	    	$options = ['lifetime' => 86400 ]; // thoi gian tinh bang giay ,1 ngay
	        $frontendCache = new FrontData($options);   
	        $cache = new BackFile( $frontendCache,  ['cacheDir' => PHO_CACHE_DIR ]);

	        $cacheKey = 'banner.cache';
	        $cdata  = $cache->get($cacheKey);
	        if($cdata === NULL){
				$model = new Slide();
				$cdata = $model->get_slides_list(1); //1 la banner		
				
				$cache->save($cacheKey, $cdata);
			}		
			return $cdata;
		}catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}
	}
    
    
    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo $this->tag->linkTo($option['controller'] . '/' . $option['action'], $caption), '</li>';
        }
        echo '</ul>';
    }
    public function formatdate($date,$time=''){
    	$source = $date.' '.$time;
		$date = new DateTime($source);
		echo $date->format('d/m/Y H:i'); 
		//return date_format($date.' '.$time,'d/m/Y H:i');
	}
	function to_slug($str) {
	    $str = trim(mb_strtolower($str));
	    $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
	    $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
	    $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
	    $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
	    $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
	    $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
	    $str = preg_replace('/(đ)/', 'd', $str);
	    $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
	    $str = preg_replace('/([\s]+)/', '-', $str);
	    $str = str_replace(array('"',':'), '', $str);
	    return $str;
	}
	public static function currency_format($str){
		if(strlen($str)> 0){
			return number_format($str,0,".",",");
		}
		return "";
	}
	public function substr_des($str){
		 $find = strrpos(substr($str,0,105), " ");
		 if($find > 0){
		 	return substr($str,0,$find);
		 }
		 return $str;		 
	}
}
