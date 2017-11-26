<?php

namespace Multiple\Frontend\Controllers;

use Multiple\PHOClass\PHOController;
use Multiple\Models\Users;
use Multiple\Models\Define;
use Multiple\Models\Provincial;
use Multiple\Library\Mail;
use Multiple\PHOClass\PhoLog;
use Multiple\Library\FilePHP;
class UsersController extends PHOController
{
	public function indexAction()
	{		
	}
	public function registerAction(){
		$result['provin_list'] = Provincial::get_all();	
		$this->set_template_share();
		$this->ViewVAR($result);	
	}
	public function successAction(){
		$this->set_template_share();
	}
	public function loginAction(){
		$this->set_template_share();
	}
	public function activeAction(){
		$param = $this->get_Gparam(array('email','rd'));
		$db = new Users();
		if($db->active($param['email'],$param['rd'])){
			$res['active_msg'] = 'Kích hoạt tài khoản thành công !';
		}else{
			$res['active_msg'] = 'Link kích hoạt tài khoản không đúng !';
		}		
		$this->set_template_share();
		$this->ViewVAR($res);
	}
	public function logoutAction()
	{
		$this->session->set('auth', null);
        return $this->_redirect('dang-nhap');
	}
	public function authAction(){
		
        $result['status']='NOT';
        $result['msg']='';        
        if ($this->request->isPost()) {
        	$param = $this->get_param(array('email','password'));
        	//PhoLog::debug_var('---test---',$param);  
            $db = new Users();
            $user = $db->get_user($param['email'], $param['password']);                   
            $result['msg'] = 'Tên đăng nhập hoặc mật khẩu không đúng !';
            if ($user != false) {
            	if($user->status== 1){
            		$this->_registerSession($user);
                	$result['status'] ='OK';
                	$result['msg'] = 'Đăng nhập thành công !';
            	}else if($user->status== 0){
            		$result['status'] ='NOT';
                	$result['msg'] = 'Tài khoản của bạn chưa kích hoạt, vui lòng kiểm tra mail và click vào link kích hoạt tài khoản !';
            	}
                
            }
        }

        return $this->ViewJSON($result);
	}
	private function _registerSession(Users $user)
    {
        $this->session->set('auth', $user);
    }
	public function updateAction(){
		$param = $this->get_param(array('user_no','user_name','email','mobile','address','pass','sex','city'));
		$result = array('status' => 'OK');
		$result['status'] = 'OK';	
		$result['msg'] = 'Cập nhật thành công!';		
		$db = new Users();
	
		$msg = $db->get_validation($param);
		
		if($msg === true){
			$db->_insert($param);
			$this->sendmail($db);
		}else{			
			$result = $msg;
			$result['status'] = 'NOT';	
		}
		return $this->ViewJSON($result);
	}
	public function sendmail($usr){
		$email = new Mail();
		
		$body_tmp = $this->get_body($usr);		
		$replacements['HEADER'] = '<h3><strong>Chúc mừng bạn đã đăng kí thành công tài khoản trên '.DOMAIN_NAME.'!</strong></h3>';
		$replacements['BODY'] = $body_tmp;
		$db = new Define();
		$data = $db->get_info(DEFINE_KEY_EMAIL);
		//$mail_to[]['mail_address']= $data->define_val;
		$mail_to[]['mail_address']= $usr->email;	
		//ACWLog::debug_var('--mail',$mail_to);	
		//ACWLog::debug_var('--mail',$data);
		$email->AddListAddress($mail_to);
		$email->add_replyto($data->define_val,DOMAIN_NAME);
                
		$email->Subject = 'Đăng ký tài khoản thành công - '.date('d/m/Y H:i:s');                
		$email->loadbody('template_mail.html');
		$email->replaceBody($replacements);
		$result = $email->send();
	}
	public function get_body($usr){
		$url = BASE_URL_NAME."users/active?email=".$usr->email."&rd=".$usr->user_id;
		$html="<p>Dưới đây là thông tin đăng nhập của bạn: </p>
			   <p><strong>Tên đăng nhập:</strong> ".$usr->user_no."</p>
			   <p><strong>Email:</strong> ".$usr->email."</p>
			   <p><strong>Điện thoại:</strong> ".$usr->mobile." </p>
			   <br/>
			   <p>Vui lòng kích vào đường link dưới đây để kích hoạt tài khoản của bạn:</p>
			  <a href='".$url ."'>".$url ."</a> 

			<p>Nếu đường link trên không hoạt động, vui lòng copy đường link đó, rồi paste lên thanh địa chỉ của trình duyệt để link tới trang kích hoạt trên hệ thống. </p>
			<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>";
		return $html;
	}
	public function updatepassAction(){
		$param = $this->get_param(array('pass_old','pass_new'));
		$result = array('status' => 'OK');
		$result['status'] = 'OK';	
		$result['msg'] = 'Cập nhật thành công!';	
		$user = $this->session->get('auth');	
		$db = new Users();
		if($db->get_user($user->user_no,$param['pass_old']) != FALSE){
			$db->updatepass($user->user_id,$param['pass_old'],$param['pass_new']);			
		}else{
			$result['status'] = 'NOT';	
			$result['msg'] = 'Mật khẩu cũ không đúng!';
		}
				
		return $this->ViewJSON($result);
	}
	public function updateinfoAction(){
		$param = $this->get_param(array('user_name','address','mobile','facebook','skype','sex','avata','folder_tmp'));
		$result = array('status' => 'OK');
		$result['status'] = 'OK';	
		$result['msg'] = 'Cập nhật thành công!';	
		$user = $this->session->get('auth');	
		$db = new Users();
		$param['user_id'] = $user->user_id;
		if(strlen($param['avata'])>0){
			$file = new FilePHP();
			$ext = $file->GetExtensionName($param['avata']);
			if($user->avata != ''){
				$file->DeleteFile(PHO_PUBLIC_PATH.'images/users/'.$user->avata);
			}	
			$file_name = uniqid('',TRUE).'.'.$ext;	
			$file->CopyFile(PHO_PUBLIC_PATH.$param['avata'],PHO_PUBLIC_PATH.'images/users/'.$file_name);
			$file->DeleteFolder(PHO_PUBLIC_PATH.$param['folder_tmp']);
			$param['avata'] =$file_name;
		}
		$db->updateinfo($param);
		$this->_registerSession($db->get_info($user->user_id));
		return $this->ViewJSON($result);
	}
}
