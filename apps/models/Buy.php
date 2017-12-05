<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;
use Multiple\PHOClass\PhoLog;
class Buy extends DBModel
{
    public $buy_id;
    public $buy_no;
    public $buy_name;
  	public $content;
  	public $price_range;
  	public $add_date;
  	public $add_user;
  	public $upd_date;
  	public $upd_user;
  	public $status;
  	public $del_flg;
    public function initialize()
    {
        $this->setSource("buy");
    }
    public function get_all(){
        return Buy::find();
    }
    public function _insert($param){
		//$this->buy_id = $param['buy_id'];
		$this->buy_no = $param['buy_no'];
		$this->buy_name = $param['buy_name'];
		$this->content = $param['content'];
		$this->price_range = $param['price_range'];
		$this->add_user = $param['user_id'];
		$this->upd_user = $param['user_id'];
		$this->status = 1;
		$this->del_flg = 0;
		$this->save();
		return $this->buy_id;
	}
	public function _update($param){
		$sql="update buy set buy_no =:buy_no
					,buy_name = :buy_name
					,content = :content
					,price_range = :price_range
					,upd_user = :user_id
					,upd_date= now()
			  where buy_id = :buy_id";
		$this->pho_execute($sql,$param);
	}
	public function get_row($id){
		$sql ="select * from buy where buy_id = :buy_id";
		return $this->query_first($sql,array('buy_id'=>$id));
	}
	public function get_top_rows($limit=5){
		$sql="select buy_id,buy_no,buy_name,content,
				(case price_range when 1 then 'Dưới 200 triệu'
									when 2 then 'Từ 200-400 triệu'
									when 3 then 'Từ 400-600 triệu'
									when 4 then 'Từ 600-800 triệu'
									when 5 then 'Từ 800 triệu - 1tỉ'
									when 6 then 'Trên 1tỉ' end) price_range
					,DATE_FORMAT(b.add_date ,'%d/%m/%Y')  add_date
					,p.m_provin_name
				from buy b
				INNER JOIN user u on u.user_id = b.add_user
				LEFT JOIN m_provincial p on p.m_provin_id = u.city
				where b.del_flg = 0 
				order by b.buy_id desc
				limit  $limit";
		return $this->pho_query($sql);
	}
	public function get_info($id){
		$sql="select buy_id,buy_no,buy_name,
				(case price_range when 1 then 'Dưới 200 triệu'
									when 2 then 'Từ 200-400 triệu'
									when 3 then 'Từ 400-600 triệu'
									when 4 then 'Từ 600-800 triệu'
									when 5 then 'Từ 800 triệu - 1tỉ'
									when 6 then 'Trên 1tỉ' end) price_range
					,DATE_FORMAT(add_date ,'%d/%m/%Y')  add_date
				from buy
				where buy_id = :buy_id ";
		return $this->query_first($sql,array('buy_id'=>$id));
	}
	public function get_list_byuser($param,$start_row){
		$sql = "select buy_id,buy_no,buy_name,
				(case price_range when 1 then 'Dưới 200 triệu'
									when 2 then 'Từ 200-400 triệu'
									when 3 then 'Từ 400-600 triệu'
									when 4 then 'Từ 600-800 triệu'
									when 5 then 'Từ 800 triệu - 1tỉ'
									when 6 then 'Trên 1tỉ' end) price_range
					,DATE_FORMAT(add_date ,'%d/%m/%Y')  add_date
					,(case b.`status` when 0 THEN 'Chờ duyệt' when 1 THEN 'đã duyệt' when 2 THEN 'Không duyệt' when 3 THEN 'Đã xóa' end) status
				from buy b
				where b.del_flg = 0 
				and add_user = :user_id 
		";
		$search['user_id'] = $param['user_id'];
		if(isset($param['buyno']) && strlen($param['buyno'])>0 ){
			$sql .=" and b.buy_id = :buyno";
			$search['buyno'] = $param['buyno'];
		}else{			
			if(isset($param['status']) && strlen($param['status'])>0 ){
				$sql .=" and b.`status` = :status";
				$search['status'] = $param['status'];
								
			}			
			if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
				$search['fdate'] = $param['fdate'];
				$search['tdate'] = $param['tdate'];
			}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
				$sql .=" and add_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
				$search['fdate'] = $param['fdate'];
			}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
				$search['tdate'] = $param['tdate'];
			}
		}
		$limit = PAGE_SEARCH_LIMIT_RECORD;
		$sql .=" ORDER BY buy_id DESC
				limit $limit
				OFFSET $start_row";
		PhoLog::debug_var('--search1----',$sql);
		//PhoLog::debug_var('--search1----',$search);
		return $this->pho_query($sql, $search);
	}
	public function get_byuser_count($param){
		$sql = "select count(buy_id) cnt
				from buy b
				where b.del_flg = 0 
				and add_user = :user_id 
		";
		$search['user_id'] = $param['user_id'];
		if(isset($param['buyno']) && strlen($param['buyno'])>0 ){
			$sql .=" and b.buy_id = :buyno";
			$search['buyno'] = $param['buyno'];
		}else{			
			if(isset($param['status']) && strlen($param['status'])>0 ){
				$sql .=" and b.`status` = :status";
				$search['status'] = $param['status'];
								
			}			
			if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
				$search['fdate'] = $param['fdate'];
				$search['tdate'] = $param['tdate'];
			}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
				$sql .=" and add_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
				$search['fdate'] = $param['fdate'];
			}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
				$search['tdate'] = $param['tdate'];
			}
		}		
		$res =  $this->query_first($sql, $search);
		if(isset($res['cnt'])){
			return $res['cnt'];
		}
		return 0;		
	}
	public function _delete($id){
		$sql="update buy set del_flg = 1 where buy_id = :buy_id";
		return $this->pho_execute($sql,array('buy_id'=>$id));
	}
	public function search_buy($param,$start_row){
		$sql = "select buy_id,buy_no,buy_name,
				(case price_range when 1 then 'Dưới 200 triệu'
									when 2 then '200-400 triệu'
									when 3 then '400-600 triệu'
									when 4 then '600-800 triệu'
									when 5 then '800-1tỉ'
									when 6 then 'Trên 1tỉ' end
				 ) price_range
				,b.content
				,DATE_FORMAT( b.add_date ,'%d/%m/%Y' )  add_date
				,p.m_provin_name
				,u.user_name
				,u.address
				,u.mobile
				from buy b
				INNER JOIN user u on u.user_id = b.add_user
				LEFT JOIN m_provincial p on p.m_provin_id = u.city
				where b.del_flg = 0 	
				and b.`status` = 1		
		";	
		$search = array();			
		if(isset($param['provin']) && strlen($param['provin'])>0 ){
			$sql .=" and u.city = :provin";
			$search['provin'] = $param['provin'];
		}
		if(isset($param['pricerange']) && strlen($param['pricerange'])>0 ){
			$sql .=" and b.price_range = :pricerange";
			$search['pricerange'] = $param['pricerange'];
		}		
				
		if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
			$sql .=" and add_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
			$search['fdate'] = $param['fdate'];
			$search['tdate'] = $param['tdate'];
		}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
			$sql .=" and add_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
			$search['fdate'] = $param['fdate'];
		}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
			$sql .=" and add_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
			$search['tdate'] = $param['tdate'];
		}
		
		$limit = PAGE_SEARCH_LIMIT_RECORD;
		$sql .=" ORDER BY buy_id DESC
				limit $limit
				OFFSET $start_row";
		PhoLog::debug_var('--search1----',$sql);
		//PhoLog::debug_var('--search1----',$search);
		return $this->pho_query($sql, $search);
	}
	public function search_buy_count($param){
		$sql = "select count(buy_id) cnt
				from buy b
				where b.del_flg = 0 
		";
		$search = array();
		if(isset($param['buyno']) && strlen($param['buyno'])>0 ){
			$sql .=" and b.buy_id = :buyno";
			$search['buyno'] = $param['buyno'];
		}else{			
			if(isset($param['status']) && strlen($param['status'])>0 ){
				$sql .=" and b.`status` = :status";
				$search['status'] = $param['status'];
			}			
			if(isset($param['fdate']) && strlen($param['fdate'])>0 && isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date between STR_TO_DATE(:fdate,'%d/%m/%Y') and STR_TO_DATE(:tdate,'%d/%m/%Y')";
				$search['fdate'] = $param['fdate'];
				$search['tdate'] = $param['tdate'];
			}elseif(isset($param['fdate']) && strlen($param['fdate'])>0){
				$sql .=" and add_date >= STR_TO_DATE(:fdate,'%d/%m/%Y') ";
				$search['fdate'] = $param['fdate'];
			}elseif(isset($param['tdate']) && strlen($param['tdate'])>0){
				$sql .=" and add_date <= STR_TO_DATE(:tdate,'%d/%m/%Y') ";
				$search['tdate'] = $param['tdate'];
			}
		}	
		PhoLog::debug_var('--search2----',$sql);	
		$res =  $this->query_first($sql, $search);
		if(isset($res['cnt'])){
			return $res['cnt'];
		}
		return 0;		
	}
}
