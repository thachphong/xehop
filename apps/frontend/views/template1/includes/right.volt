<div class="col-md-4 col-sm-12 col-xs-12 margin_top no_padding_right">
		{% set login_info= elements.getuser()%}
		<div class="dm_border margin_top">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					{%if login_info is defined%}
						<a href="{{url.get('users/logout')}}" class="btn_dangtin">Thoát</a>
						<a href="{{url.get('tin-da-dang')}}" class="btn_dangtin">Quản lý tin</a>
					{%else%}
						<a href="{{url.get('dang-nhap')}}" class="btn_dangtin">Đăng nhập</a>
						<a href="{{url.get('dang-ky')}}" class="btn_dangtin">Đăng ký</a>
					{%endif%}
				</div>
				<div class="col-md-8 col-sm-8">
					<img src="{{url.get('template1/images/logo.png')}}"  style="width: 184px;" />  
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<a href="{{url.get('dang-tin/0')}}" class="btn2">Đăng tin bán xe ôtô</a>
				</div>
				<div class="col-md-6">
					<a href="#" class="btn2">Đăng tin mua xe ôtô</a>
				</div>
				<div class="col-md-6">
					<a href="#" class="btn2">Thành viên cao cấp</a>
				</div>
				<div class="col-md-6">
					<a href="#" class="btn2">Hướng dẫn sử dụng</a>
				</div>
			</div>
		</div>	
         <div class="row margin_top">
         </div>   
      </div>
