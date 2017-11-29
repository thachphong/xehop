<?php

namespace Multiple\Models;

use Multiple\Models\TagsPosts;
use Multiple\Models\DBModel;
use Multiple\PHOClass\PHOArray;
use Multiple\PHOClass\PhoLog;
class Posts extends DBModel
{
    public  $post_id;
	public  $post_no;
	public  $post_name;
	public  $model_id;
	public  $make_id;
	public  $status;
	public  $submodel;
	public  $car_year;
	public  $from_type;
	public  $car_status;
	public  $mileage;
	public  $body_style_id;
	public  $price;
	public  $unit_price;
	public  $exterior_color_id;
	public  $interior_color_id;
	public  $address_ascii;
	public  $content;
	public  $add_date;
	public  $add_user;
	public  $upd_date;
	public  $upd_user;
	public  $del_flg;
	public  $num_doors;
	public  $num_seats;
	public  $transmission_id;
	public  $drivetrain;
	public  $fueltype_id;
	public  $fuel_system;
	public  $fuel_consumer;	
	public  $total_view;
	public  $m_provin_id;
    public function initialize()
    {
        $this->setSource("posts");
    }
    
    public function get_by_id($id){
	 	return Posts::findFirst(array("post_id = :post_id:  ",'bind' => array('post_id' => $id) ));
	}
	public function get_info($id){
		$sql="select p.post_id,p.post_name,p.post_no, v.post_level,v.total_day post_date_num ,post_view_id
				from posts p
				INNER JOIN posts_view v on v.post_id = p.post_id
				where p.post_id = :post_id
				and v.hide_flg = 0
				ORDER BY post_view_id DESC
				limit 1";
		return $this->query_first($sql,array('post_id'=>$id));
	}
	public function get_post_row($id){
		$sql = "select p.post_id,p.post_name,p.post_no,
				  p.make_id,
				  p.model_id,
				  p.status,
				  p.m_provin_id,				
				  (trim(p.price)+0) price,
				  p.unit_price,					
				  p.content,  
				  p.del_flg,
				  p.num_doors,
				  p.num_seats,
				  p.mileage,
				  p.fuel_system,
				  p.fuel_consumer,
				  p.submodel,
				  p.car_year,
				  p.from_type,
				  p.car_status,
				  p.mileage,
				  p.body_style_id,
				  p.interior_color_id,
				  p.exterior_color_id,
				  p.fueltype_id,
				  p.drivetrain,
				  p.transmission_id,
				 v.post_level,				
				 DATE_FORMAT(v.end_date ,'%d/%m/%Y')  end_date,
				 DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date,	
				 v.post_view_id,
				c.post_contract_id,		
				c.full_name,
				c.address contract_address,
				c.phone,
				c.mobie,
				c.email,
				pm.*
				from posts p
				INNER JOIN posts_view v on v.post_id = p.post_id
				INNER JOIN posts_contract c on c.post_id = p.post_id
				left join posts_more pm on pm.post_id = p.post_id
				where p.post_id = :post_id
				and v.hide_flg = 0";
		return $this->query_first($sql,array('post_id'=>$id));
	}	
	public function _insert($param){
		//$this->post_id = $param[''];
		//PhoLog::debug_var('update----','param');
		//PhoLog::debug_var('update----',$param);
		try {
			$this->post_no = $param['post_no'];
		    $this->post_name   = $param['post_name'];
			$this->model_id= $param['model_id'];
			$this->make_id= $param['make_id'];
			$this->status = 0;
			$this->submodel = $param['submodel'];
			$this->car_year = $param['car_year'];
			$this->from_type = $param['from_type'];
			$this->car_status = $param['car_status'];
			$this->mileage = $param['mileage'];
			$this->body_style_id = $param['body_style_id'];
			$this->price = $param['price'];
			$this->unit_price = $param['unit_price'][0];
			$this->exterior_color_id = $param['exterior_color_id'];
			$this->interior_color_id = $param['interior_color_id'];
			
			$this->content = $param['content'];		
			$this->add_user = $param['user_id'];		
			$this->upd_user = $param['user_id'];
			$this->del_flg = 0;
			$this->num_doors = $param['num_doors'];
			$this->num_seats = $param['num_seats'];
			$this->transmission_id = $param['transmission_id'];
			$this->drivetrain = $param['drivetrain'];
			$this->fueltype_id = $param['fueltype_id'];
			$this->fuel_system = $param['fuel_system'];
			$this->fuel_consumer = $param['fuel_consumer'];
			$this->total_view = 0 ;
			$this->m_provin_id = $param['m_provin_id'];



	    
	    // if(strlen($param['unit_price'])>0){
			// $this->unit_price  = $param['unit_price'];
		// }
		
	    	    	   
	    	$this->save();
	    } catch (\Exception $e) {
			PhoLog::debug_var('update_error----',$e);
		}
	    //PhoLog::debug_var('update----','save');
	    return $this->post_id;
	}
	public function _update($param){
		$sql = "update posts
					set post_no= :post_no,
					post_name= :post_name,
					model_id= :model_id,
					make_id= :make_id,					
					submodel= :submodel,
					car_year= :car_year,
					from_type= :from_type,
					car_status= :car_status,
					mileage= :mileage,
					body_style_id= :body_style_id,
					price= :price,
					unit_price= :unit_price,
					exterior_color_id= :exterior_color_id,
					interior_color_id= :interior_color_id,					
					content= :content,
					num_doors= :num_doors,
					num_seats= :num_seats,
					transmission_id= :transmission_id,
					drivetrain= :drivetrain,
					fueltype_id= :fueltype_id,
					fuel_system= :fuel_system,
					fuel_consumer= :fuel_consumer,
					m_provin_id= :m_provin_id,
					upd_user= :user_id,
					upd_date =now()

				where post_id =:post_id
				";
		$pasql = PHOArray::filter($param, array(
                    'post_id',
					'post_no',
					'post_name',
					'model_id',
					'make_id',				
					'submodel',
					'car_year',
					'from_type',
					'car_status',
					'mileage',
					'body_style_id',
					'price',
					'unit_price',
					'exterior_color_id',
					'interior_color_id',	
					'content',	
					'num_doors',
					'num_seats',
					'transmission_id',
					'drivetrain',
					'fueltype_id',
					'fuel_system',
					'fuel_consumer',
					'm_provin_id',
					'user_id'
                    ));
		if(strlen($pasql['from_type'])==0){
			$pasql['from_type'] =NULL;
		}
		if(strlen($pasql['car_status'])==0){
			$pasql['car_status']=NULL;
		}
		if(strlen($pasql['mileage'])==0){
			$pasql['mileage']=NULL;
		}
	    if(strlen($pasql['body_style_id'])==0){
			$pasql['body_style_id']=NULL;
		}
	    if(strlen($pasql['exterior_color_id'])==0){
			$pasql['exterior_color_id']=NULL;
		}
	    if(strlen($pasql['interior_color_id'])==0){
			$pasql['interior_color_id']=NULL;
		}
	    if(strlen($pasql['num_doors'])==0){
			$pasql['num_doors']=NULL;
		}
		if(strlen($pasql['num_seats'])==0){
			$pasql['num_seats']=NULL;
		}
		if(strlen($pasql['transmission_id'])==0){
			$pasql['transmission_id']=NULL;
		}
		if(strlen($pasql['drivetrain'])==0){
			$pasql['drivetrain']=NULL;
		}
	    if(strlen($pasql['fueltype_id'])==0){
			$pasql['fueltype_id']=NULL;
		}
		if(strlen($pasql['fuel_consumer'])==0){
			$pasql['fuel_consumer']=NULL;
		}
		
		$this->pho_execute($sql, $pasql);  
        return TRUE;
	}
	public function get_list_new($post_type= '',$limit = 10){
		$where ="";
		if($post_type !=''){
			$where =" and v.post_level = $post_type";
		}
		$sql ="select p.post_id,p.post_name,p.post_no,v.post_level,
		(trim(p.price)+0) price,
	pro.m_provin_name,
				(case p.unit_price when 1 then 'Triệu' else 'USD' end) unit_name,
				(case p.from_type when 1 then 'nhập khẩu' else 'lắp ráp trong nước' end) from_type,
				(case p.transmission_id when 1 then 'số tay' when 2 then 'số tự động' else '' end) transmission_name,
				(case p.car_status when 1 then 'Xe mới' when 2 then 'Xe cũ' else '' end) car_status,
				
				lower(cl.m_color_name) color_name,
				lower(fl.m_fueltype_name) fueltype_name,
				p.mileage,
				p.content,
				p.car_year,
				pc.full_name,pc.address,
				pc.mobie,
				NULLIF(im.img_path,'') img_path,
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date
	
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id
				
				INNER JOIN posts_view v on v.post_id = p.post_id
				INNER JOIN posts_contract pc on pc.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				LEFT JOIN m_color cl on cl.m_color_id = p.exterior_color_id 
				LEFT JOIN m_fueltype fl on fl.m_fueltype_id = p.fueltype_id  
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				and v.end_date >= NOW()
				and v.start_date <= now()
				and v.post_level =1
				order by v.post_level DESC, DATE_FORMAT(v.start_date ,'%Y%m%d') DESC
				limit $limit";
//		PhoLog::debug_var('vip',$sql);
		return $this->pho_query($sql);
	}
	public function get_post_byctgno($ctg_no,$start_row=0){
		$limit = PAGE_LIMIT_RECORD;
		$where ="";
		$param = array();
		if($ctg_no != 'allnew'){
			$where =" and p.ctg_id in (
					select ctg_id from category 
					where del_flg =0
					and ctg_no = :ctg_no
					union all
					select ctg_id from category 
					where parent_id =(select ctg_id from category where del_flg =0  and ctg_no = :ctg_no)
					)	";
			$param['ctg_no'] = $ctg_no;
		}
		$sql="select p.post_id,p.post_name,p.post_no,v.post_level,
				(trim(p.price) +0) price,
				(trim(p.acreage) +0) acreage,
				pro.m_provin_name,dis.m_district_name,
				NULLIF(un.m_unit_name,'') m_unit_name,
				NULLIF(im.img_path,'') img_path,
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date
				,rd.m_ward_name,p.youtube_key
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id
				INNER JOIN m_district dis on dis.m_district_id = p.m_district_id
				INNER JOIN posts_view v on v.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				LEFT JOIN m_unit un on un.m_unit_id = p.unit_price 
				LEFT JOIN m_ward rd on rd.m_ward_id = p.m_ward_id
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				and v.end_date >= NOW()
				and v.start_date <= now()
				$where			
				order by v.post_level DESC,DATE_FORMAT(v.start_date ,'%Y%m%d') DESC		
				limit $limit
				OFFSET $start_row
				";
		return $this->pho_query($sql,$param);
	}
	public function get_post_byctgno_count($ctg_no){	
		$where ="";
		$param = array();
		if($ctg_no != 'allnew'){
			$where =" and p.ctg_id in (
					select ctg_id from category 
					where del_flg =0
					and ctg_no = :ctg_no
					union all
					select ctg_id from category 
					where parent_id =(select ctg_id from category where del_flg =0  and ctg_no = :ctg_no)
					)	";
			$param['ctg_no'] = $ctg_no;
		}	
		$sql="select count(p.post_id) cnt
				from posts p
				INNER JOIN posts_view v on v.post_id = p.post_id				
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				and v.end_date >= NOW()
				and v.start_date <= now()
				$where
				";
		$res = $this->query_first($sql,$param);
		return $res['cnt'];
	}
	public function get_vpost($post_id){
		$sql="select p.post_id,p.post_name,p.post_no,
				  m.ctg_name make_name,	
					md.ctg_name model_name,
				  (case p.unit_price when 1 then 'Triệu' else 'USD' end) unit_name,
				(case p.from_type when 1 then 'Nhập khẩu' else 'Lắp ráp trong nước' end) from_type,
				(case p.transmission_id when 1 then 'số tay' when 2 then 'số tự động' else '' end) transmission_name,
				(case p.car_status when 1 then 'Xe mới' when 2 then 'Xe cũ' else '' end) car_status,
				inl.m_color_name interior_color_name,
				(cl.m_color_name) exterior_color_name,
				(fl.m_fueltype_name) fueltype_name,
					b.m_body_type_name,
					dr.m_drivetrain_name,
				  p.make_id,
				  p.model_id,
				  p.status,
				  p.m_provin_id,				
				  (trim(p.price)+0) price,
				  p.unit_price,					
				  p.content,  
				  p.del_flg,
				  p.num_doors,
				  p.num_seats,
				  p.mileage,
				  p.fuel_system,
				  p.fuel_consumer,
				  p.submodel,
				  p.car_year,
				  p.mileage,				 
				  p.fueltype_id,
				  p.drivetrain,
				  p.transmission_id,
				 v.post_level,				
				 DATE_FORMAT(v.end_date ,'%d/%m/%Y')  end_date,
				 DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date,	
				 v.post_view_id,
				c.post_contract_id,		
				c.full_name,
				c.address contract_address,
				c.phone,
				c.mobie,
				c.email,
				pm.*
				from posts p
				INNER JOIN posts_view v on v.post_id = p.post_id
				INNER JOIN posts_contract c on c.post_id = p.post_id
				INNER JOIN category m on m.ctg_id = p.make_id
				INNER JOIN category md on md.ctg_id = p.model_id	
				INNER JOIN m_body_type b on b.m_body_type_id=p.body_style_id
				left join posts_more pm on pm.post_id = p.post_id
				LEFT JOIN m_color cl on cl.m_color_id = p.exterior_color_id 
				LEFT JOIN m_color inl on inl.m_color_id = p.interior_color_id 
				LEFT JOIN m_fueltype fl on fl.m_fueltype_id = p.fueltype_id 
				LEFT JOIN m_drivetrain dr on dr.m_drivetrain_id =p.drivetrain
				where p.post_id = :post_id
				and v.hide_flg = 0
				";
		return $this->query_first($sql,array('post_id'=>$post_id));
	}
	public function search_posts($param,$start_row=0){
		$limit = PAGE_LIMIT_RECORD;
		$where ="";
		$search = array();

		if(isset($param['makeid']) && strlen($param['makeid']) > 0){
			$where .=" and p.make_id =:make_id";	
			$search['make_id'] =	$param['makeid'];			
		}
		if(isset($param['modid']) && strlen($param['modid']) > 0){
			$where .=" and p.model_id = :model_id";	
			$search['model_id'] =	$param['modid'];			
		}
		if(isset($param['carsta']) && strlen($param['carsta']) > 0){
			$where .=" and p.car_status = :car_status";	
			$search['car_status'] =	$param['carsta'];			
		}
		if(isset($param['fyear']) && strlen($param['fyear']) > 0){
			$where .=" and p.car_year >= :fyear";	
			$search['fyear'] =	$param['fyear'];			
		}
		if(isset($param['tyear']) && strlen($param['tyear']) > 0){
			$where .=" and p.car_year <= :fyear";	
			$search['tyear'] =	$param['tyear'];			
		}
		if(isset($param['smissi']) && strlen($param['smissi']) > 0){
			$where .=" and p.transmission_id =:transmission_id";	
			$search['transmission_id'] =	$param['smissi'];			
		}
		if(isset($param['fprice']) && strlen($param['fprice']) > 0 && $param['fprice'] != 1000000){ //min price
			$where .=" and p.price  >= :fprice";	
			$search['fprice'] =	$param['fprice'];			
		}
		if(isset($param['tprice']) && strlen($param['tprice']) > 0 && $param['tprice'] != 2100000000){ //max price			
			$where .=" and p.price  <= :tprice";	
			$search['tprice'] =	$param['tprice'];								
		}
		if(isset($param['fuelid']) && strlen($param['fuelid']) > 0){
			$where .=" and p.fueltype_id  = :fueltype_id";	
			$search['fueltype_id'] =	$param['fuelid'];			
		}
		if(isset($param['ftype']) && strlen($param['ftype']) > 0){
			$where .=" and p.from_type  = :from_type";	
			$search['from_type'] =	$param['ftype'];			
		}
		if(isset($param['color']) && strlen($param['color']) > 0){
			$where .=" and p.exterior_color_id  = :exterior_color_id";	
			$search['exterior_color_id'] =	$param['color'];			
		}
		if(isset($param['bodyid']) && strlen($param['bodyid']) > 0){
			$where .=" and p.body_style_id  like :body_style_id";	
			$search['body_style_id'] =	$param['bodyid'];			
		}
		if(isset($param['nseat']) && strlen($param['nseat']) > 0){
			switch ($param['nseat']) {
			    case 1:  $where .=" and p.num_seats between 1 and 3";break;
				case 2:  $where .=" and p.num_seats between 4 and 6";break;
				case 3:  $where .=" and p.num_seats between 7 and 8";break;
				case 4:  $where .=" and p.num_seats between 9 and 16";break;
				case 5:  $where .=" and p.num_seats >16";break;
			}	
		}
		if(isset($param['drive']) && strlen($param['drive']) > 0){
			$where .=" and p.drivetrain  = :drivetrain";	
			$search['drivetrain'] =	$param['drive'];			
		}
		//$where ="";
		$sql="select p.post_id,p.post_name,p.post_no,v.post_level,
		(trim(p.price)+0) price,
	pro.m_provin_name,
				(case p.unit_price when 1 then 'Triệu' else 'USD' end) unit_name,
				(case p.from_type when 1 then 'nhập khẩu' else 'lắp ráp trong nước' end) from_type,
				(case p.transmission_id when 1 then 'số tay' when 2 then 'số tự động' else '' end) transmission_name,
				(case p.car_status when 1 then 'Xe mới' when 2 then 'Xe cũ' else '' end) car_status,
				
				lower(cl.m_color_name) color_name,
				lower(fl.m_fueltype_name) fueltype_name,
				p.mileage,
				p.content,
				p.car_year,
				pc.full_name,pc.address,
				pc.mobie,
				NULLIF(im.img_path,'') img_path,
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date
	
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id
				
				INNER JOIN posts_view v on v.post_id = p.post_id
				INNER JOIN posts_contract pc on pc.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				LEFT JOIN m_color cl on cl.m_color_id = p.exterior_color_id 
				LEFT JOIN m_fueltype fl on fl.m_fueltype_id = p.fueltype_id  
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				and v.end_date >= NOW()
				and v.start_date <= now()				
				$where			
				order by v.post_level DESC, DATE_FORMAT(v.start_date ,'%Y%m%d') DESC		
				limit $limit
				OFFSET $start_row
				";
		//PhoLog::debug_var('--search----',$param);
		PhoLog::debug_var('--search----',$sql);
		PhoLog::debug_var('--search----',$search);
		return $this->pho_query($sql,$search);
	}
	public function search_posts_count($param){
		$limit = PAGE_LIMIT_RECORD;
		$where ="";
		$search = array();

		if(isset($param['ctgid']) && strlen($param['ctgid']) > 0){
			$where .=" and p.ctg_id =:ctg_id";	
			$search['ctg_id'] =	$param['ctgid'];			
		}
		if(isset($param['provin']) && strlen($param['provin']) > 0){
			$where .=" and p.m_provin_id =:m_provin_id";	
			$search['m_provin_id'] =	$param['provin'];			
		}
		if(isset($param['district']) && strlen($param['district']) > 0){
			$where .=" and p.m_district_id =:m_district_id";	
			$search['m_district_id'] =	$param['district'];			
		}
		if(isset($param['ward']) && strlen($param['ward']) > 0){
			$where .=" and p.m_ward_id =:m_ward_id";	
			$search['m_ward_id'] =	$param['ward'];			
		}
		if(isset($param['street']) && strlen($param['street']) > 0){
			$where .=" and p.m_street_id =:m_street_id";	
			$search['m_street_id'] =	$param['street'];			
		}
		if(isset($param['roomnum']) && strlen($param['roomnum']) > 0){
			$where .=" and p.room_num  > :room_num";	
			$search['room_num'] =	$param['roomnum'];			
		}
		if(isset($param['directional']) && strlen($param['directional']) > 0){
			$where .=" and p.m_directional_id  = :m_directional_id";	
			$search['m_directional_id'] =	$param['directional'];			
		}
		if(isset($param['address_ascii']) && strlen($param['address_ascii']) > 0){
			$where .=" and p.address_ascii  like :address_ascii";	
			$search['address_ascii'] =	'%'.str_replace(' ','%',$param['address_ascii']).'%';						
		}
		
		if(isset($param['acreage']) && $param['acreage']> 0){
			switch ($param['acreage']) {
			    case 1:  $where .=" and p.acreage <=30";break;
				case 2:  $where .=" and p.acreage between 30 and 50";break;
				case 3:  $where .=" and p.acreage between 50 and 80";break;
				case 4:  $where .=" and p.acreage between 80 and 100";break;
				case 5:  $where .=" and p.acreage between 100 and 150";break;
				case 6:  $where .=" and p.acreage between 150 and 200";break;
				case 7:  $where .=" and p.acreage between 200 and 250";break;
				case 8:  $where .=" and p.acreage between 250 and 300";break;
				case 9:  $where .=" and p.acreage between 300 and 500";break;
				case 10: $where .=" and p.acreage > 500";break;   
			}						
		}
		
		if(isset($param['price']) && $param['price']> 0){
			switch ($param['price']) {
			    case 2:  $where .=" and p.price <=500 and p.unit_price = 2";break;
				case 3:  $where .=" and p.price between 500 and 800 and p.unit_price = 2";break;
				case 4:  $where .=" and p.price between 800 and 1000 and p.unit_price = 2";break;
				case 5:  $where .=" and p.price between 1 and 2 and p.unit_price = 3";break;
				case 6:  $where .=" and p.price between 2 and 3 and p.unit_price = 3";break;
				case 7:  $where .=" and p.price between 5 and 7 and p.unit_price = 3";break;
				case 8:  $where .=" and p.price between 7 and 10 and p.unit_price = 3";break;
				case 9:  $where .=" and p.price between 10 and 20 and p.unit_price = 3";break;
				case 10:  $where .=" and p.price between 20 and 30 and p.unit_price = 3";break;
				case 11:  $where .=" and p.price >30 and p.unit_price = 3";break;
				case 12:  $where .=" and p.price between 1 and 2 and p.unit_price = 3";break;
				//case 13:  $where .=" and p.price between 1 and 2 and p.unit_price = 3";break;
				case 14:  $where .=" and p.price <1000 and p.unit_price = 10";break;
				case 15:  $where .=" and p.price between 1 and 3 and p.unit_price = 10";break;
				case 16:  $where .=" and p.price between 3 and 5 and p.unit_price = 10";break;
				case 17:  $where .=" and p.price between 5 and 10 and p.unit_price = 10";break;
				case 18:  $where .=" and p.price between 10 and 40 and p.unit_price = 10";break;
				case 19:  $where .=" and p.price between 40 and 70 and p.unit_price = 10";break;
				case 20:  $where .=" and p.price between 70 and 100 and p.unit_price = 10";break;
				case 21:  $where .=" and p.price > 100 and p.unit_price = 10";break;

			}						
		}
		$where="";
		$sql="select count(p.post_id) cnt
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id				
				INNER JOIN posts_view v on v.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				$where	
				";
		//PhoLog::debug_var('--search----',$sql);
		//PhoLog::debug_var('--search----',$search);
		$res = $this->query_first($sql,$search);
		return $res['cnt'];
	}
	public function get_list_byuser($param,$start_row){
		$sql = "select p.post_id,p.post_name,p.post_no,p.price,
			 pro.m_provin_name,
				NULLIF(un.m_unit_name,'') m_unit_name,
				NULLIF(im.img_path,'') img_path,
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date,
				DATE_FORMAT(v.end_date ,'%d/%m/%Y')  end_date
				,p.add_user,
				(case p.`status` when 0 THEN 'Chờ duyệt' when 1 THEN 'đã duyệt' when 2 THEN 'Không duyệt' when 3 THEN 'Đã xóa' end) status,(case when v.end_date < now() then '1' else '0' end ) as end_flg
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id		
				INNER JOIN posts_view v on v.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				LEFT JOIN m_unit un on un.m_unit_id = p.unit_price
				where p.del_flg = 0
				and v.hide_flg = 0
				and p.add_user = :user_id";
		$search['user_id'] = $param['user_id'];
		if(isset($param['postno']) && strlen($param['postno'])>0 ){
			$sql .=" and p.post_id = :postno";
			$search['postno'] = $param['postno'];
		}else{
			if(isset($param['plevel']) && strlen($param['plevel'])>0 ){
				$sql .=" and v.post_level = :post_level";
				$search['post_level'] = $param['plevel'];
			}
			if(isset($param['status']) && strlen($param['status'])>0 ){
				if($param['status'] == '4'){
					$sql .=" and v.end_date < now() ";
				}else{
					$sql .=" and p.status = :status";
					$search['status'] = $param['status'];
				}				
			}
			
			if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and v.start_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
				$search['fdate'] = $param['fdate'];
				$search['tdate'] = $param['tdate'];
			}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
				$sql .=" and v.start_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
				$search['fdate'] = $param['fdate'];
			}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and v.start_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
				$search['tdate'] = $param['tdate'];
			}
		}
		$limit = PAGE_SEARCH_LIMIT_RECORD;
		$sql .=" ORDER BY p.post_id DESC
				limit $limit
				OFFSET $start_row";
		PhoLog::debug_var('--search1----',$sql);
		//PhoLog::debug_var('--search1----',$search);
		return $this->pho_query($sql, $search);
	}	
	public function get_byuser_count($param){
		$sql = "select count(p.post_id) cnt
				from posts p				
				INNER JOIN posts_view v on v.post_id = p.post_id
				where p.del_flg = 0
				and v.hide_flg = 0
				and p.add_user = :user_id";
		$search['user_id'] = $param['user_id'];
		if(isset($param['plevel']) && strlen($param['plevel'])>0 ){
			$sql .=" and v.post_level = :post_level";
			$search['post_level'] = $param['plevel'];
		}
		if(isset($param['status']) && strlen($param['status'])>0 ){
				if($param['status'] == '4'){
					$sql .=" and v.end_date < now() ";
				}else{
					$sql .=" and p.status = :status";
					$search['status'] = $param['status'];
				}				
		}
		if(isset($param['postno']) && strlen($param['postno'])>0 ){
			$sql .=" and p.post_no = :postno";
			$search['postno'] = $param['postno'];
		}
		if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
			$sql .=" and v.start_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
			$search['fdate'] = $param['fdate'];
			$search['tdate'] = $param['tdate'];
		}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
			$sql .=" and v.start_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
			$search['fdate'] = $param['fdate'];
		}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
			$sql .=" and v.start_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
			$search['tdate'] = $param['tdate'];
		}
		$sql .=" ORDER BY p.post_id DESC";
		$res =  $this->query_first($sql, $search);
		if(isset($res['cnt'])){
			return $res['cnt'];
		}
		return 0;
	}
	public function _delete($id){
		$sql="update posts set del_flg = 1 where post_id = :post_id";
		return $this->pho_execute($sql,array('post_id'=>$id));
	}
	public function get_list_all($param,$start_row=0){
		$limit = 50;
		$del_flg = 0;
		if(strlen($param['limit']) > 0){
			$limit = $param['limit'];
		}
		if(isset($param['del_flg']) && strlen($param['del_flg']) > 0){
			$del_flg = $param['del_flg'];
		}
		$pasql = array();	
		$sql = "select p.post_id,p.post_name,p.post_no,p.price,
			 c.ctg_name,		
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date,
				DATE_FORMAT(v.end_date ,'%d/%m/%Y')  end_date,
			  p.add_user,
				(case p.status when 0 THEN 'Chờ duyệt' when 1 THEN 'đã duyệt' when 2 THEN 'Không duyệt' when 3 THEN 'Đã xóa' end) status_name,p.status
				from posts p
				LEFT JOIN category c on c.ctg_id = p.make_id
				INNER JOIN posts_view v on v.post_id = p.post_id and v.hide_flg = 0

				where p.del_flg = $del_flg	";
		if(strlen($param['status']) > 0){
			$sql .=" and p.status = :status";	
			$pasql['status'] = $param['status'];		
		}
		/*$pasql['fdate'] ='00/00/0000';        
        if (isset($param['fdate']) && empty($param['fdate'])==FALSE) {
			$pasql['fdate'] = $param['fdate'];
		}*/
        if (isset($param['fdate']) && empty($param['fdate'])==FALSE && isset($param['tdate']) && empty($param['tdate'])==FALSE) {
			$pasql['tdate'] = $param['tdate'].' 23:59';
			$pasql['fdate'] = $param['fdate'];
            $sql .= " and v.start_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y %H:%i')";
		}elseif(isset($param['fdate']) && empty($param['fdate'])==FALSE){
            $sql .= " and v.start_date >= STR_TO_DATE(:fdate,'%d/%m/%Y %H:%i')";
            $pasql['fdate'] = $param['fdate'];
        }elseif(isset($param['tdate']) && empty($param['tdate'])==FALSE){
			$pasql['tdate'] = $param['tdate'].' 23:59';
			$sql .= " and v.start_date <= STR_TO_DATE(:tdate,'%d/%m/%Y %H:%i')";
		}
        if(strlen($param['ctgid']) > 0){
			$sql .=" and p.ctg_id in (
					select ctg_id from category 
					where del_flg =0
					and ctg_id = :ctg_id
					union all
					select ctg_id from category 
					where parent_id = :ctg_id
					)	";
			$pasql['ctg_id'] = $param['ctgid'];
		}
		if(strlen($param['pid']) > 0){
			$sql .=" and p.post_id = :post_id";	
			$pasql['post_id'] = $param['pid'];
		}
		$sql .=	"		
				ORDER BY p.post_id DESC
				limit $limit
				OFFSET $start_row";
		PhoLog::debug_var('query----',$sql);
		PhoLog::debug_var('query----',$pasql);
		return $this->pho_query($sql,$pasql);
	}
	public function get_list_all_count($param){
		$limit = 50;
		$del_flg = 0;
		if(strlen($param['limit']) > 0){
			$limit = $param['limit'];
		}
		if(strlen(isset($param['del_flg']) && $param['del_flg']) > 0){
			$del_flg = $param['del_flg'];
		}
		$pasql = array();	
		$sql = "select count(p.post_id) cnt
				from posts p
				LEFT JOIN category c on c.ctg_id = p.make_id
				INNER JOIN posts_view v on v.post_id = p.post_id and v.hide_flg = 0

				where p.del_flg = $del_flg	";
		if(strlen($param['status']) > 0){
			$sql .=" and p.status = :status";	
			$pasql['status'] = $param['status'];		
		}
		if (isset($param['fdate']) && empty($param['fdate'])==FALSE && isset($param['tdate']) && empty($param['tdate'])==FALSE) {
			$pasql['tdate'] = $param['tdate'].' 23:59';
			$pasql['fdate'] = $param['fdate'];
            $sql .= " and v.start_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y %H:%i')";
		}elseif(isset($param['fdate']) && empty($param['fdate'])==FALSE){
            $sql .= " and v.start_date >= STR_TO_DATE(:fdate,'%d/%m/%Y %H:%i')";
            $pasql['fdate'] = $param['fdate'];
        }elseif(isset($param['tdate']) && empty($param['tdate'])==FALSE){
			$pasql['tdate'] = $param['tdate'].' 23:59';
			$sql .= " and v.start_date <= STR_TO_DATE(:tdate,'%d/%m/%Y %H:%i')";
		}
        if(strlen($param['ctgid']) > 0){
			$sql .=" and p.ctg_id in (
					select ctg_id from category 
					where del_flg =0
					and ctg_id = :ctg_id
					union all
					select ctg_id from category 
					where parent_id = :ctg_id
					)	";
			$pasql['ctg_id'] = $param['ctgid'];
		}
		if(strlen($param['pid']) > 0){
			$sql .=" and p.post_id = :post_id";	
			$pasql['post_id'] = $param['pid'];
		}
		//PhoLog::debug_var('query-count---',$sql);
		//PhoLog::debug_var('query-count---',$pasql);
		$res = $this->query_first($sql,$pasql);
		return $res['cnt'];
	}
	public function get_bydistrict($param){	
		$pa_s = array();
		$where_join = "c.ctg_id = t.m_type_id";
		$ctgid ="'ctgid=";
		if(isset($param['ctgid']) && strlen($param['ctgid'])>0)
		{
			$where_join = "c.ctg_id = t.ctg_id and c.ctg_id= :ctgid";		
			$pa_s['ctgid'] = $param['ctgid'];	
			$ctgid .=$param['ctgid'];
		}
		$ctgid .="'";
		if(isset($param['district']) && strlen($param['district'])>0){
			$sql="select d.m_district_name title,c.ctg_name,t.m_type_id, p.m_ward_name dst_name,CONCAT($ctgid,'&district=',p.m_district_id,'&ward=', p.m_ward_id) dst_id,count(t.post_id) cnt 
						from posts t
			inner join m_ward p on p.m_ward_id = t.m_ward_id
			inner join m_district d on d.m_district_id = p.m_district_id
			inner JOIN category c on $where_join
			where t.status = 1
			and p.m_district_id = :district
			and t.m_type_id = :type
			group by p.m_ward_name,p.m_ward_id,c.ctg_name
			ORDER BY cnt desc";
			$pa_s['district'] = $param['district'];
		}else if(isset($param['provin']) && strlen($param['provin'])>0){
			$sql="select d.m_provin_name title,c.ctg_name,t.m_type_id,p.m_district_name dst_name,CONCAT($ctgid,'&district=', p.m_district_id) dst_id,count(t.post_id) cnt 
			from posts t
			inner join m_district p on p.m_district_id = t.m_district_id
			inner join m_provincial d on d.m_provin_id = p.m_provin_id
			inner JOIN category c on $where_join
			where t.status = 1			
			and t.m_type_id = :type
			and p.m_provin_id = :provin
			group by p.m_district_name,p.m_district_id,c.ctg_name
			ORDER BY cnt desc  ";	
			$pa_s['provin'] = $param['provin'];	
		}else{
			$sql="select '' title,c.ctg_name,t.m_type_id,d.m_provin_name dst_name,CONCAT($ctgid,'&provin=', d.m_provin_id) dst_id,count(t.post_id) cnt 
			from posts t
			
			inner join m_provincial d on d.m_provin_id = t.m_provin_id
			inner JOIN category c on $where_join
			where t.status = 1			
			and t.m_type_id = :type
			group by d.m_provin_name ,d.m_provin_id,c.ctg_name
			ORDER BY d.sort  ";	
		}	
		$pa_s['type'] = $param['type'];
		PhoLog::debug_var('---abc--',$sql);
		PhoLog::debug_var('---abc--',$pa_s);
		return $this->pho_query($sql,$pa_s);	
	}
	public function update_status($post_id,$status){
		$sql="update posts set status =:status where post_id = :post_id";
		return $this->pho_execute($sql,array('status'=>$status,'post_id'=>$post_id));
	}
	public function update_traffic($param){
		$sql="select update_traffic_post(:post_id,:section_id,:time,:ip)";
		return $this->pho_execute($sql,$param);
	}
	public function extract_youtube_key($url_link){
		if(strlen($url_link)==0) return '';
		$position=strpos( $url_link, 'v=',1) + 2;
	    return substr($url_link ,$position,11);
	}
	public function get_post_relation($param,$limit=10){
		$sql="select p.post_id,p.post_name,p.post_no,v.post_level,
		(trim(p.price)+0) price,
	pro.m_provin_name,
				(case p.unit_price when 1 then 'Triệu' else 'USD' end) unit_name,
				(case p.from_type when 1 then 'nhập khẩu' else 'lắp ráp trong nước' end) from_type,
				(case p.transmission_id when 1 then 'số tay' when 2 then 'số tự động' else '' end) transmission_name,
				(case p.car_status when 1 then 'Xe mới' when 2 then 'Xe cũ' else '' end) car_status,
				
				lower(cl.m_color_name) color_name,
				lower(fl.m_fueltype_name) fueltype_name,
				p.mileage,
				p.content,
				p.car_year,
				pc.full_name,pc.address,
				pc.mobie,
				NULLIF(im.img_path,'') img_path,
				DATE_FORMAT(v.start_date ,'%d/%m/%Y')  start_date
	
				from posts p
				INNER JOIN m_provincial pro on pro.m_provin_id = p.m_provin_id
				
				INNER JOIN posts_view v on v.post_id = p.post_id
				INNER JOIN posts_contract pc on pc.post_id = p.post_id
				LEFT JOIN posts_img im on im.post_id = p.post_id and im.avata_flg = 1
				LEFT JOIN m_color cl on cl.m_color_id = p.exterior_color_id 
				LEFT JOIN m_fueltype fl on fl.m_fueltype_id = p.fueltype_id  
				where p.del_flg = 0
				and p.status =1
				and v.hide_flg = 0
				and v.end_date >= NOW()
				and v.start_date <= now()
				and v.post_level =1
				and p.make_id = :make_id
				and p.post_id <> :post_id
				order by v.post_level DESC, DATE_FORMAT(v.start_date ,'%Y%m%d') DESC
				limit $limit";
		return $this->pho_query($sql,$param);
	}
}
