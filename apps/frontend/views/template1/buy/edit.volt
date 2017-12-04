<div class="row">
	<div class="container">
		{{ partial('includes/user_left') }}
		<div class="col-md-9 col-sm-12 col-xs-12 margin_top">
			<div class="pn_title margin_top">
					<span class="bg_icon"><i class="fa post-pencil"></i></span>
					<h1>Đăng tin mua xe </h1>
			</div>
			<div class="row margin_top pn_background pn_border post_pn" >
            <div class="post_head">
               <div class="row pn_content">
				<form id="from_user">
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Phân hạng mức tiền<span class="lab_red">(*)</span></label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<label class="select_icon">
								<select name="price_range" id="price_range" required>
									<option value="">--Chọn mức tiền--</option>
									<option value="1" {%if price_range== '1'%}selected{%endif%}>Dưới 200 triệu</option>
									<option value="2" {%if price_range== '2'%}selected{%endif%}>Từ 200-400 triệu</option>
									<option value="3" {%if price_range== '3'%}selected{%endif%}>Từ 400-600 triệu</option>
									<option value="4" {%if price_range== '4'%}selected{%endif%}>Từ 600-800 triệu</option>
									<option value="5" {%if price_range== '5'%}selected{%endif%}>Từ 800 triệu - 1tỉ</option>
									<option value="6" {%if price_range== '6'%}selected{%endif%}>Trên 1tỉ</option>
								</select>
								</label>
							<label class="lab_red lab_invisible" id="price_range_error">Bạn cần chọn phân hạng mức tiền</label>
						</div>
					</div>
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Tiêu đề<span class="lab_red">(*)</span></label>
						<div class="col-md-8 col-sm-8 col-xs-12">
							<input type="hidden" name="buy_id"  value="{{buy_id}}" id="buy_id" required>
							<input type="text" name="buy_name"  value="{{buy_name}}" id="buy_name" required>
							<label class="lab_red lab_invisible" id="buy_name_error">Bạn cần nhập tiêu đề</label>
						</div>
					</div>
					<div class="row row-margin-bottom">
						<label class="col-md-3 col-sm-3 col-xs-12 align_right title_col">Nội dung<span class="lab_red">(*)</span></label>
						<div class="col-md-8 col-sm-8 col-xs-12">							
							<textarea name="content" required style="height:150px" id="content">{{content}}</textarea>
							<label class="lab_red lab_invisible" id="content_error">Bạn cần nhập nội dung</label>
						</div>
					</div>
				</form>	
				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">		
					<button  class="btn_dangtin btn_red" id="btn_cancel"><i class="fa fa-times"></i>Hủy bỏ</button>
					<button class="btn_dangtin" id="btn_save" style="width: 100px"><i class="fa fa-save"></i>Đăng tin</button>
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
		$(document).off('click','#btn_save'); 
        $(document).on('click','#btn_save',function(event){
        	var msg = check_validate_update();
          	if(!msg){
            	topFunction();
            	return;
          	}
          	var arr = $('#from_user').serializeArray();
	      	Pho_json_ajax('POST',"{{url.get('buy/update')}}" ,arr,function(datas){
		        if(datas.status =="OK"){
		          //Pho_modal_close("modal1");
		          //Pho_message_box("Thông báo",'Thay đổi mật khẩu thành công !');
		          Pho_direct("{{url.get('buy/success/')}}" + datas.msg);
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
        	$('input:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});        	       	
        	        	
        	return flg;
        }	
       
		$(document).off('click','#btn_cancel'); 
        $(document).on('click','#btn_cancel',function(event){
        	location.href="{{url.get('tin-mua')}}";
        });	
	});
</script>
