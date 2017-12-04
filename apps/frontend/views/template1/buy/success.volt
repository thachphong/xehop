<div class="row">
	<div class="container">
		{{ partial('includes/user_left') }}
		<div class="col-md-9 col-sm-12 col-xs-12">
			<div class="pn_posts">
				<div class="pn_title">
					<span class="bg_icon"><i class="fa post-pencil"></i></span>
					<h1>ĐĂNG TIN THÀNH CÔNG </h1>
				</div>				
				<div class="pn_content pn_background pn_border margin_top">
					<div style="text-align:center">
						<h3>Tin của bạn đã được hiển thị trên website</h3>
					</div>
					<div class="row">
						<table class="table table-bordered">
							<tbody>
						      <tr>
						        <td>Mã đăng tin</td>
						        <td>{{buy_id}}</td>						       
						      </tr>
						      <tr>
						        <td>Tiêu đề</td>
						        <td>{{buy_name}}
						        </td>						        
						      </tr>						      
						      <tr>
						        <td>Phân hạng mức tiền</td>
						        <td>{{price_range}}</td>						        
						      </tr>
						      <tr>
						        <td>Ngày đăng tin</td>
						        <td>{{add_date}}</td>						        
						      </tr>
						    </tbody>
						</table>
					</div>
					<div class="row" style="text-align: center;">
						<a class="btn_dangtin" href="{{url.get('')}}">Trở lại trang chủ</a>
						<a class="btn_dangtin" href="{{url.get('tin-mua')}}">Quản lý tin đăng</a>
						<a class="btn_dangtin" href="{{url.get('dang-tin-mua-xe/0')}}">Tiếp tục đăng tin</a>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
