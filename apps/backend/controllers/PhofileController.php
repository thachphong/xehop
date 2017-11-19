<?php

namespace Multiple\Backend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\PHOClass\PhoLog;
use Multiple\Library\FilePHP;
use Multiple\Library\Images;
class PhofileController extends PHOController
{

    public function initialize()
    {        
        $this->check_loginadmin();
    }
	
	public function uploadAction($folder_tmp){
		$param = $_FILES['file'];
		$name = $param['name'];
		$size = $param['size'];
		$file_tmp = $param['tmp_name'];
		$file_lb = new FilePHP();
		$folder_name = IMG_TMP_PATH.$folder_tmp;// "data/product/".date('Ym');
		if(is_dir($folder_name)==false){
			 @mkdir($folder_name, 0777, true);
		}
		// $folder_name .= '/'.date('d');
		// if(is_dir($folder_name)==false){
		// 	@mkdir($folder_name, 0777, true);
		// }
		
		$file_name ='tmp/'.$folder_tmp.'/'.uniqid('',true).'.'.$file_lb->GetExtensionName($name);
		//PhoLog::debug_var('file---','from:'.$file_tmp);
		//PhoLog::debug_var('file---','to:'.PHO_PUBLIC_PATH.$file_name);
		//PhoLog::debug_var('file---',$param);
		$file_lb->CopyFile($file_tmp,PHO_PUBLIC_PATH.$file_name);
		//$img = new Images();
		//$img->add_logo(PHO_PUBLIC_PATH.$file_name,PHO_LOGO_ADD,5);
		$file_lb->DeleteFile($file_tmp);
		$result['link'] = BASE_URL_NAME.$file_name;
		return $this->ViewJSON($result);
	}
	public static function uplproductAction(){
		$param = $_FILES;
		$result['status']='OK';
		if(count($param)==0){
			$result['status']='NOT';
			$result['msg']='Không có file nào được chọn !';
		}
		$file_lb = new FilePHP();
		foreach($param as $item){
			$name = $item['name'];
			$size = $item['size'];
			$file_tmp = $item['tmp_name'];			
			$folder_name = date('Ym');
			if(is_dir(DATA_TMP_PATH.'/'.$folder_name)==false){
				 @mkdir(DATA_TMP_PATH.'/'.$folder_name, 0777, true);
			}
			$folder_name .='/'. date('d');
			if(is_dir(DATA_TMP_PATH.'/'.$folder_name)==false){
				 @mkdir(DATA_TMP_PATH.'/'.$folder_name, 0777, true);
			}
			$img_name = uniqid().'.'.$file_lb->GetExtensionName($name);
			$file_name =$folder_name.'/'. $img_name;
			$file_lb->CopyFile($file_tmp,DATA_TMP_PATH.'/'.$file_name);
			$img_thumb = self::thumb_image($img_name,IMG_THUMB_SIZE_WIDTH,IMG_THUMB_SIZE_HEIGHT,DATA_TMP_PATH.'/'.$folder_name.'/');
			$file_lb->DeleteFile($file_tmp);
			$result['link'][] = str_replace($img_name,$img_thumb,ACW_BASE_URL_DATA_TMP.$file_name);
		}
		
		return ACWView::json($result);
	}
	public static function action_uploadslides(){
		$param = $_FILES['file'];
		$name = $param['name'];
		$size = $param['size'];
		$file_tmp = $param['tmp_name'];
		$file_lb = new FilePHP();
		$folder_name = "data/slides";
		if(is_dir($folder_name)==false){
			 @mkdir($folder_name, 0777, true);
		}
		$file_name =$folder_name.'/'.uniqid().'.'.$file_lb->GetExtensionName($name);
		$file_lb->CopyFile($file_tmp,ACW_ROOT_DIR.'/'.$file_name);
		$file_lb->DeleteFile($file_tmp);
		$result['link'] = ACW_BASE_URL.$file_name;
		return ACWView::json($result);
	}
	public static function thumb_image($file, $width, $height, $folder){	

		if(!file_exists($folder.$file))	return false; // không tìm thấy file
		
		if ($cursize = getimagesize ($folder.$file)) {					
			$newsize = self::setWidthHeight($cursize[0], $cursize[1], $width, $height);
			$info = pathinfo($file);
			
			$dst = imagecreatetruecolor ($newsize[0],$newsize[1]);
			
			$types = array('jpg' => array('imagecreatefromjpeg', 'imagejpeg'),
						'gif' => array('imagecreatefromgif', 'imagegif'),
						'jpeg' => array('imagecreatefromjpeg', 'imagejpeg'),
						'png' => array('imagecreatefrompng', 'imagepng'),
						'GIF' => array('imagecreatefromGIF', 'imageGIF'),
						'JPG' => array('imagecreatefromjpeg', 'imagejpeg'),
						'JPEG' => array('imagecreatefromJPEG', 'imageJPEG'),
						'PNG' => array('imagecreatefromPNG', 'imagePNG'));
			$func = $types[$info['extension']][0];
			$src = $func($folder.$file); 
			imagecopyresampled($dst, $src, 0, 0, 0, 0,$newsize[0], $newsize[1],$cursize[0], $cursize[1]);
			$func = $types[$info['extension']][1];
			$new_file = str_replace('.'.$info['extension'],'_thumb.'.$info['extension'],$file);
			
			return $func($dst, $folder.$new_file) ? $new_file : false;
		}
	}
	public static function setWidthHeight($width, $height, $maxWidth, $maxHeight){
		$ret = array($width, $height);
		$ratio = $width / $height;
		if ($width > $maxWidth || $height > $maxHeight) {
			$ret[0] = $maxWidth;
			$ret[1] = $ret[0] / $ratio;
			if ($ret[1] > $maxHeight) {
				$ret[1] = $maxHeight;
				$ret[0] = $ret[1] * $ratio;
			}
		}
		return $ret;
	}
	
}
