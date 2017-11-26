<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;
use Multiple\PHOClass\PHOArray;
use Multiple\PHOClass\PhoLog;
class PostsMore extends DBModel
{
    public $posts_more_id;
	public $post_id;
	public $air_bag;
	public $brake;
	public $car_lock;
	public $safety;
	public $standard_equipment;
	public $chair_stuff;
	public $audio_video;
	public $other_equipment;
	public $length_width_heigh;
	public $basic_length;
	public $basic_width;
	public $weight;
	public $engine;
	public $engine_type;
	public $cylinder_vol;
	public $brake_des;
	public $absorber;
	public $tyre;
	public $rim;
	public $other_tech_para;
	public $fuel_capacity;
  
    public function initialize()
    {
        $this->setSource("posts_more");
    }
    public function get_all(){
        return PostsMore::find();
    }
    public function _insert($param){
		try{
			
			$this->post_id = $param['post_id'];
			
			$this->chair_stuff = $param['chair_stuff'];
			$this->audio_video = $param['audio_video'];
			$this->other_equipment = $param['other_equipment'];		
			$this->engine = $param['engine'];
			$this->engine_type = $param['engine_type'];
			$this->cylinder_vol = $param['cylinder_vol'];
			$this->brake_des = $param['brake_des'];
			$this->absorber = $param['absorber'];
			$this->tyre = $param['tyre'];
			$this->rim = $param['rim'];
			$this->other_tech_para = $param['other_tech_para'];
			$this->fuel_capacity = $param['fuel_capacity'];
			if(is_array($param['air_bag'])){				
				$this->air_bag =json_encode($param['air_bag']);
			}
			if(is_array($param['brake'])){				
				$this->brake =json_encode($param['brake']);
			}
			if(is_array($param['car_lock'])){				
				$this->car_lock =json_encode($param['car_lock']);
			}
			if(is_array($param['safety'])){				
				$this->safety =json_encode($param['safety']);
			}
			if(is_array($param['standard_equipment'])){				
				$this->standard_equipment =json_encode($param['standard_equipment']);
			}
			if(strlen($param['length_width_heigh'])>0){
				$this->length_width_heigh  = $param['length_width_heigh'];
			}
			if(strlen($param['basic_length'])>0){
				$this->basic_length  = $param['basic_length'];
			}
			if(strlen($param['basic_width'])>0){
				$this->basic_width  = $param['basic_width'];
			}
			if(strlen($param['weight'])>0){
				$this->weight  = $param['weight'];
			}
			
			$this->save();
		} catch (\Exception $e) {
			PhoLog::debug_var('insert_error----',$e);
		}
	}
	public function _update($param){
		try{
			$sql="update posts_more set 
					air_bag= :air_bag
					,brake= :brake
					,car_lock= :car_lock
					,safety= :safety
					,standard_equipment= :standard_equipment
					,chair_stuff= :chair_stuff
					,audio_video= :audio_video
					,other_equipment= :other_equipment
					,length_width_heigh= :length_width_heigh
					,basic_length= :basic_length
					,basic_width= :basic_width
					,weight= :weight
					,engine= :engine
					,engine_type= :engine_type
					,cylinder_vol= :cylinder_vol
					,brake_des= :brake_des
					,absorber= :absorber
					,tyre= :tyre
					,rim= :rim
					,other_tech_para= :other_tech_para
					,fuel_capacity =:fuel_capacity
				where posts_more_id= :posts_more_id
					";
			$upd = PHOArray::filter($param, array(                  
	                    'posts_more_id',					
						'air_bag',
						'brake',
						'car_lock',
						'safety',
						'standard_equipment',
						'chair_stuff',
						'audio_video',
						'other_equipment',
						'length_width_heigh',
						'basic_length',
						'basic_width',
						'weight',
						'engine',
						'engine_type',
						'cylinder_vol',
						'brake_des',
						'absorber',
						'tyre',
						'rim',
						'other_tech_para',
						'fuel_capacity'
	                    ));
	        if(strlen($upd['length_width_heigh'])==0){
				$upd['length_width_heigh']=NULL;
			}
			if(strlen($upd['basic_length'])==0){
				$upd['basic_length']=NULL;
			}
			if(strlen($upd['basic_width'])==0){
				$upd['basic_width']=NULL;
			}
			if(strlen($upd['weight'])==0){
				$upd['weight']=NULL;
			}
			if(is_array($param['air_bag'])){
				$upd['air_bag'] =json_encode($param['air_bag']);
			}else{
				$upd['air_bag']='';
			}
			if(is_array($param['brake'])){
				$upd['brake'] =json_encode($param['brake']);
			}else{
				$upd['brake']='';
			}
			if(is_array($param['car_lock'])){
				$upd['car_lock'] =json_encode($param['car_lock']);
			}else{
				$upd['car_lock']='';
			}
			if(is_array($param['safety'])){
				$upd['safety'] =json_encode($param['safety']);
			}else{
				$upd['safety']='';
			}
			if(is_array($param['standard_equipment'])){
				$upd['standard_equipment'] =json_encode($param['standard_equipment']);
			}else{
				$upd['standard_equipment']='';
			}
			
			$this->pho_execute($sql,$upd);
			//PhoLog::debug_var('update_error----',$param);
			//PhoLog::debug_var('update_error----',$upd);
		} catch (\Exception $e) {
			PhoLog::debug_var('update_error----',$e);
		}
	}
}
