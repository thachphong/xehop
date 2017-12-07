<style>
.talkbubble {  
  /* height: 80px;*/
   background: #fcedc4;;
   position: relative;
   -moz-border-radius:    10px;
   -webkit-border-radius: 10px;
   border-radius:         10px;
   padding: 10px;
}
.talkbubble:before {
   content:"";
   position: absolute;
   right: 100%;
   top: 9px;
   width: 0;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid #fcedc4;
   border-bottom: 13px solid transparent;
}
#msg_vip2:before{
	top: 38px;
} 
.talkbubble p{
	margin: 0px;
}
.comment_vip{
	padding-left: 45px;
	font-size: 13px;
}
</style>
<div class="row">
	<div class="container">
		{{ partial('includes/user_left') }}
		<div class="col-md-9 col-sm-12 col-xs-12 margin_top">
			<div class="pn_title margin_top">
					<span class="bg_icon"><i class="fa post-pencil"></i></span>
					<h1>Đăng ký thành viên cao cấp (VIP)</h1>
			</div>
			<div class="row margin_top pn_background pn_border post_pn" >
            <div class="post_head">
               <div class="row pn_content">
				<form id="from_user">
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col" style="padding-top: 10px">Cấp độ thành viên<span class="lab_red">(*)</span></label>
						<div class="col-md-1 col-sm-1 col-xs-12" style="padding-top: 10px">
							
							<label class="control control-radio">
							        VIP1
							        <input type="radio" name="level" checked="checked" value="1" class="viptype" />
							        <div class="control_indicator"></div>
							</label>
							<label class="control control-radio">
							        VIP2
							        <input type="radio" name="level"  value="2" class="viptype" />
							        <div class="control_indicator"></div>
							</label>
						</div>							
						<div class="col-md-8 col-sm-8 col-xs-12 comment_vip no_padding_right">
							<div class="talkbubble" id="msg_vip1">
								<p>Phí: 200,000 VND/tháng</p>
								<p><strong>Đối tượng:</strong> Dành cho các cá nhân có số lượng xe bán ít. Quyền lợi khi là thành viên <strong>VIP1</strong>:</p>
								<p>- Số lượng xe bán tối đa(tại 1 thời điểm) là 5 xe.</p>
								<p>- Mỗi ngày được cấp 3 lần up tin.</p>
								<p>- Có thể thay đổi thông tin liên hệ khác nhau cho từng tin đăng.</p>
								<p>- Có thể Up / làm mới tin tự động.</p>
							</div>
							<div class="talkbubble" id="msg_vip2" style="display: none;">
								<p>Phí: 360,000 VND/tháng</p>
								<p><strong>Đối tượng:</strong> Dành cho các cá nhân/tổ chức có lượng xe bán nhiều.Quyền lợi khi là thành viên <strong>VIP2</strong>:</p>
								<p>- Số lượng xe bán tối đa(tại 1 thời điểm) là 10 xe.</p>
								<p>- Mỗi ngày được cấp 6 lần up tin.</p>
								<p>- Có thể Up / làm mới tin tự động.</p>
								<p>- Có thể thay đổi thông tin liên hệ khác nhau cho từng tin đăng.</p>
								<p>- Tin đăng hiển thị ngay không cần kiểm duyệt.</p>
							</div>
						</div>
					</div>
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Thời hạn<span class="lab_red">(*)</span></label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<label class="select_icon">
								<select name="num_month" id="num_month" required>
									<option value="">-- Chọn mức thời hạn --</option>	
									<option value="1">-- 1 tháng (tăng 25%) --</option>
									<option value="3">-- 3 tháng --</option>
									<option value="6">-- 6 tháng (giảm 5%) --</option>
									<option value="12">-- 1 năm (giảm 10%) --</option>
								</select>
							</label>
							<label class="lab_red lab_invisible" id="num_month_error">Bạn cần chọn thời hạn</label>
						</div>
					</div>
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Tổng chi phí</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="hidden" name="amount"  value="" id="amount">
							<input type="text" value="" id="amount_lb" disabled>							
						</div>
					</div>
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Đề xuất/yêu cầu khác (Nếu có):</label>
						<div class="col-md-8 col-sm-8 col-xs-12">
							<textarea  name="note" style="height: 150px"></textarea>
						</div>
					</div>
				</form>	
				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">								
					<button class="btn_dangtin" id="btn_save" ><i class="fa fa-save"></i>Đăng ký</button>
				</div>		
			   </div>
            </div>
            <!--<hr class="line" />-->
            
         </div>			
		</div>
	</div>
</div>
{{ partial('includes/pho_ajax') }}
<script type="text/javascript">
	$(document).ready(function() {		
		function topFunction() {
		    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
		    document.documentElement.scrollTop = 0; // For IE and Firefox
		}
		$(document).off('change','.viptype'); 
        $(document).on('change','.viptype',function(event){
        	$('.talkbubble').hide();
        	$('#msg_vip'+$(this).val()).show();
        	cal_amount();
        });
        $(document).off('change','#num_month'); 
        $(document).on('change','#num_month',function(event){
        	cal_amount();
        });
        var cal_amount=function(){
        	var level = $('input[name=level]:checked').val();
        	var num_month = $('#num_month').val();
        	var price = {{constant("USER_PRICE_VIP_2")}};
        	if(level =='1'){
        		price = {{constant("USER_PRICE_VIP_1")}};
        	}
        	var amount = 0;
        	if(num_month =='1'){
        		amount = price + price*0.25;
        	}else if(num_month =='6'){
        		amount = num_month*(price*0.95);
        	}else if(num_month =='12'){
        		amount = num_month*(price*0.90);
        	}else{
        		amount = price*num_month;
        	}
        	$('#amount').val(currency_format(amount));
        	$('#amount_lb').val(currency_format(amount)+ ' VNĐ');
        }
		$(document).off('click','#btn_save'); 
        $(document).on('click','#btn_save',function(event){
        	var msg = check_validate_update();
          	if(!msg){
            	topFunction();
            	return;
          	}
          	var arr = $('#from_user').serializeArray();
	      	Pho_json_ajax('POST',"{{url.get('users/uservip')}}" ,arr,function(datas){
		        if(datas.status =="OK"){
		          //Pho_modal_close("modal1");
		          Pho_message_box("Thông báo",datas.msg,function(){
		          		Pho_direct("{{url.get('')}}");
		          });
		          //Pho_direct("{{url.get('dang-nhap/')}}" + datas.msg);
		        }else{
		        	/*if(datas.code=='email'){ // trung email
		        		$('#email_validate').text(datas.msg);
		        		$('#email_validate').show();
		        	}else if(datas.code =='userno'){ // trung ten dang nhap
		        		$('#user_no_validate').show();
		        	}else{*/
		        		Pho_message_box_error("Lỗi",datas.msg);
		        	//}		        	
		        }	                
	        });
        });
        var check_validate_update = function(){
        	var flg = true;
        	//$('#user_no_validate').hide();
        	$('select:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});        	       	
        	        	
        	return flg;
        }	
        function validateEmail($email) {
		  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		  return emailReg.test( $email );
		}	
	});
function currency_format(n) {
    return n.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
};
</script>
