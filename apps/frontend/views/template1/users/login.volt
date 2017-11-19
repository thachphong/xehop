<div class="row">
	<div class="container register_form">		
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="pn_posts">
				<div class="pn_title2">
					<i class="fa post-pencil"></i>
					<h1>Đăng nhập </h1>
				</div>				
				<div class="pn_content pn_background pn_border_2 login_form">
					<!-- <div style="text-align:center">
						<h3>Tin của bạn đã được hiển thị trên website</h3>
					</div>
					<div class="row">
						
					</div> -->
					<form enctype="multipart/form-data" id="from_post">
						<div class="row row-margin-bottom" style="text-align: center;">
							<label class="col-md-12 col-sm-12 col-xs-12 title_col lab_red" id="msg_err"></label>
							
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-4 col-sm-4 col-xs-12 title_col align_right">Tên đăng nhập hoặc mail</label>
							<div class="col-md-7 col-sm-7 col-xs-12">
								<input type="text" name="email"  value="" id="user_no" required>							
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-4 col-sm-4 col-xs-12 title_col align_right">Mật khẩu</label>
							<div class="col-md-7 col-sm-7 col-xs-12">
								<input type="password" name="password"  value="" id="password" required>								
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-4 col-sm-4 col-xs-12 title_col"></label>
							<div class="col-md-7 col-sm-7 col-xs-12 remember">
								<label><input type="checkbox" name="">Ghi nhớ mật khẩu</label>
								<a class="link_color" href="{{url.get('quen-mat-khau')}}"> | Quên mật khẩu</a>
							</div>
						</div>						
					</form>
					<div class="row row-margin-bottom" style="margin-top:20px">
							<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">								
								<button class="btn_dangtin" id="btn_login" style="width:120px" ><i class="fa fa-sign-in"></i>Đăng nhập</button>
							</div>
					</div>
					<div class="row row-margin-bottom" style="text-align: center;">
							<label class="col-md-12 col-sm-12 col-xs-12 title_col">Nếu bạn chưa có tài khoản của {{constant("DOMAIN_NAME")}}, vui lòng <a class="link_color" href="{{url.get('dang-ky')}}"><strong>đăng ký tại đây</strong></a></label>
							
					</div>
				</div>
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
		$(document).off('click','#btn_login'); 
        $(document).on('click','#btn_login',function(event){        	
          	var arr = $('#from_post').serializeArray();
	      	Pho_json_ajax('POST',"{{url.get('users/auth')}}" ,arr,function(datas){
		        if(datas.status =="OK"){
		          //Pho_modal_close("modal1");
		          //Pho_message_box("Thông báo",'Đăng tin thành công !');
		          Pho_direct("{{url.get('thanh-vien')}}" );
		        }else{
		        	//Pho_message_box_error("Lỗi",datas.msg);
		        	$('#msg_err').text(datas.msg);
		        	$('#msg_err').show();
		        }	                
	        });
        }); 
        $(document).off('keydown','#password'); 
        $(document).on('keydown','#password',function(event){   
        	if ( event.which == 13 ) {
			   event.preventDefault();
			   $('#btn_login').click();
			}  
        });      	
	});
</script>