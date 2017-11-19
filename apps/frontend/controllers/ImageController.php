<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Phalcon\Image\Adapter\GD;
use Multiple\PHOClass\PhoLog;
use Multiple\Library\Captcha;
class ImageController extends PHOController
{

	public function indexAction()
	{
		
	}
	public function cropAction($size){
		$QUERY_STRING = $_SERVER['QUERY_STRING'];
		$url = str_replace('_url=/crop/'.$size.'/', '', $QUERY_STRING);
		$url = str_replace('&', '', $url);
		//PhoLog::debug_var('---img---',$url);
		$file_name =PHO_PUBLIC_PATH. $url;
		//PhoLog::debug_var('---img---',$file_name);
		$exp = explode('x', $size);
		$img = new GD($file_name);
		//PhoLog::debug_var('---img---',$exp);
		$img->resize($exp[0],null,\Phalcon\Image::WIDTH)->crop($exp[0],$exp[1]);
		//echo ;
		$this->view->disable();
        $this->response->setContent($img->render('jpg'));
        return $this->response;
	}
	public function capchaAction(){
		try{
			$this->view->disable();
			$captcha = new Captcha();
			$code ="";
			$this->response->setContent( $captcha->get_and_show_image($code));
			//PhoLog::debug_var('---img---',$code);
			$this->session->set('captcha_code', $code);	
			return $this->response;
		}catch (\Exception $e) {
			PhoLog::debug_var('---Error---',$e);
		}

	}
}
