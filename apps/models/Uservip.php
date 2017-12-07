<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;

class Uservip extends DBModel
{
    public $user_vip_id;
    public $user_id;
    public $start_date;
    public $end_date;
    public $note;
    public $level;
    public $active_flg;
    public $amount;
    public $num_month;
    public function initialize()
    {
        $this->setSource("user_vip");
    }
    public function get_all(){
        return Uservip::find();
    }
    public function _insert($param){
		$this->user_id = $param['user_id'];
		$this->note = $param['note'];
		$this->level = $param['level'];
		$this->amount =str_replace(',','', $param['amount']);
		$this->num_month = $param['num_month'];
		$this->active_flg = 0;
		//$this->user_id = $param['user_id'];
		$this->save();
	}
	public function _update($param){
		$sql="update user_vip set start_date=now()
				,end_date = :end_date				
				,active_flg = 1
				where user_vip_id = :user_vip_id";
		$this->pho_execute($sql,$param);
	}
	public function hide_all($user_id){
		$sql="update user_vip set 	
				active_flg = 0
				where user_id = :user_id";
		$this->pho_execute($sql,array('user_id'=>$user_id));
	}
}
