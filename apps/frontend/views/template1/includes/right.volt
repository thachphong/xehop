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
					<a href="{{url.get('dang-tin-mua-xe/0')}}" class="btn2">Đăng tin mua xe ôtô</a>
				</div>
				<div class="col-md-6">
					<a href="{{url.get('thanh-vien/regvip')}}" class="btn2">Thành viên cao cấp</a>
				</div>
				<div class="col-md-6">
					<a href="p/huong-dan-su-dung" class="btn2">Hướng dẫn sử dụng</a>
				</div>
			</div>
		</div>	
		{% set banners_right= elements.get_banner(4)%}
        <div class="row margin_top banner">
        	{%if banners_right[0] is defined %}
		   		<a href="{{url.get(banners_right[0].link_page)}}">
		   			<img src="{{url.get(banners_right[0].img_path)}}" style="margin-bottom: 5px"/>
		   		</a>
		    {%endif%}
		    {%if banners_right[1] is defined %}
		   		<a href="{{url.get(banners_right[1].link_page)}}">
		   			<img src="{{url.get(banners_right[1].img_path)}}" style="margin-bottom: 5px"/>
		   		</a>
		    {%endif%}
        </div> 
        <div class="row margin_top" >
            <div class="dm_title">               
               <h3>Tìm mua ôtô</h3>               
            </div>
            <div class="pn_border_2" style="padding:0px" id="cssmenu">
            	<ul class="boxright" >
            	{{ elements.gettinmuaxe() }}
            	</ul>
            </div>
        </div> 
        {%if banners_right[2] is defined %}
        <div class="row margin_top banner">        	
		   		<a href="{{url.get(banners_right[2].link_page)}}">
		   			<img src="{{url.get(banners_right[2].img_path)}}" style="margin-bottom: 5px"/>
		   		</a>		   	    
        </div> 
        {%endif%}
        <div class="row margin_top" >
            <div class="dm_title">               
               <h3>Câu hỏi thường gặp</h3>               
            </div>
            <div class="pn_border_2" style="padding:0px" id="cssmenu">
            	<ul class="boxright" >
            		<li><i class="fa fa-circle"></i><a>Xehop.net.vn là gì</a></li>
            		<li><i class="fa fa-circle"></i><a>Làm sao để trở thành thành viên của Xehop.net.vn</a></li>
            		<li><i class="fa fa-circle"></i><a>Làm thế nào để đăng tin bán xe trên Xehop.net.vn</a></li>
            		<li><i class="fa fa-circle"></i><a>Làm thế nào để tìm xe phù hợp nhất cho bạn</a></li>
            		<li><i class="fa fa-circle"></i><a>Làm thế nào để liên hệ với xehop.net.vn</a></li>
            	</ul>
            </div>
        </div> 	
</div>
