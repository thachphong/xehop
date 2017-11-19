<div class="col-md-3 col-sm-6 col-xs-12 padding_top_20 no_padding_left">
	<div class="row pn_background pn_border">
		{% set login_info= elements.getuser()%}
	    <img src="{{url.get('images/users/')}}{{login_info.avata}}" style="width:100%; padding:20px" />
	    <h3 class="title_2" style="text-align:center">{{login_info.user_name}}</h3>
	    <div style="padding: 10px;">
	    <strong >Tài khoản : {{elements.currency_format(login_info.amount)}} VNĐ</strong>
	    </div>
	</div>
	<div class="huongdan">
	    <div class="pn_title">
	    	<span class="bg_icon"><i class="fa fa-question-circle"></i></span>
	        <h3>Thông tin tài khoản</h3>
	    </div>
	    <div class="row pn_background pn_border margin_top">
	    <ul>
	    <li><a href="{{url.get('thanh-vien')}}"><i class="fa-angle-double-right"></i>Thông báo</a></li>
	        <li><a href="{{url.get('thanh-vien/thongtin')}}"><i class="fa-angle-double-right"></i><span>Thay đổi thông tin cá nhân</span></a></li>
	        <li><a href="{{url.get('thanh-vien/pass')}}"><i class="fa-angle-double-right"></i>Thay đổi mật khẩu</a></li>
	        <li><a href="{{url.get('dang-tin/0')}}"><i class="fa-angle-double-right"></i>Đăng tin</a></li>
	        <li><a href="{{url.get('tin-da-dang')}}"><i class="fa-angle-double-right"></i>Quản lý tin đã đăng</a></li>
	        <li><a href="{{url.get('nap-tien')}}"><i class="fa-angle-double-right"></i>Nạp tiền</a></li>
	    </ul>
	    </div>
    </div>
</div>