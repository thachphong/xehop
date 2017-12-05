<style>
#filedrag
{	
	font-weight: bold;
	text-align: center;	
	color: #555;
	border: 2px dashed rgb(169, 169, 169);
	border-radius: 7px;
	cursor: default;
	overflow: hidden;
	padding-top: 10px;
}

#filedrag.hover
{
	color: #f00;
	border-color: #f00;
	border-style: solid;
	box-shadow: inset 0 3px 4px #888;
}
</style>
<div class="row">
	<div class="container">
		{{ partial('includes/user_left') }}
		{% set define= elements.get_define()%}
		<div class="col-md-9 col-sm-12 col-xs-12 no_padding_right">
			<div class="pn_posts">
				<div class="pn_title">
					<span class="bg_icon"><i class="fa post-pencil"></i></span>
					<h1>ĐĂNG TIN BÁN XE</h1>
				</div>	
							
				<div class="pn_content pn_background pn_border margin_top">
					<div class="post_tab">
					  <ul>
               			<li>
               				<a href="javascript:void(0)" data-tab="#tab_detail_1" class="tab_item active">Thông số cơ bản</a>
               			</li>
		                <li>
               				<a href="javascript:void(0)" data-tab="#tab_detail_2" class="tab_item">An toàn</a>
               			</li>
               			<li>
               				<a href="javascript:void(0)" data-tab="#tab_detail_3" class="tab_item">Tiện nghi</a>
               			</li> 
               			<li>
               				<a href="javascript:void(0)" data-tab="#tab_detail_4" class="tab_item">Thông số kỹ thuật</a>
               			</li> 
		              </ul> 
            		</div>
            		<form enctype="multipart/form-data" id="from_post">
            		<div class="pn_border_2 tab_item_detail" id="tab_detail_1" style="display:block">
						<input type="hidden" name="folder_tmp" id="folder_tmp"  value="{{folder_tmp}}">
						<input type="hidden" name="post_id" id="post_id"  value="{{post_id}}">
						<input type="hidden" name="post_contract_id" value="{{post_contract_id}}">
						<input type="hidden" name="post_name" id="post_name"  value="{{post_name}}">
						<input type="hidden" name="posts_more_id" value="{{posts_more_id}}">
					<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left" style="border-right: 1px solid var(--color_panel)">	
						<div>
							<h3>Thông tin cơ bản</h3>
						</div>				

						<div class="row row-margin-bottom lab_invisible" id="lab_message_error" style="text-align:center">
							<label class="lab_red">Có một số thông tin chưa hợp lệ, vui lòng nhập lại !</label>
						</div>						
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Hãng chế tạo <span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="make_id" id="make_id" required>
										<option value="">--Chọn hãng--</option>
										{%for item in category_1%}
											<option value="{{item.ctg_id}}" {%if make_id==item.ctg_id%}selected{%endif%}>{{item.ctg_name}}</option>
										{%endfor%}
									</select>
								</label>
								<label class="lab_red lab_invisible" id="make_id_error">Bạn cần chọn hãng chế tạo !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Đời xe <span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="model_id" id="model_id" required>
										<option value="">--Chọn đời xe--</option>
									</select>
								</label>
								<label class="lab_red lab_invisible" id="model_id_error">Bạn cần chọn đời xe !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Phân hạng đời xe</label> 
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input type="text" maxlength="20" name="submodel" value="{{submodel}}" id="submodel">
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Năm sản xuất/đời<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding" >
								<label class="select_icon">
									<select name="car_year" id="car_year" required>
										<option value="">--Chọn năm sx--</option>
										{%for item in current_year..1989%}
											{%if item==1989%}
												<option value="{{item}}" {%if car_year=='1989'%}selected{%endif%}>Trước 1990</option>
											{%else%}
												<option value="{{item}}" {%if car_year==item%}selected{%endif%}>{{item}}</option>
											{%endif%}
										{%endfor%}
									</select>
								</label>
								<label class="lab_red lab_invisible" id="car_year_error">Bạn cần chọn năm sản xuất/đời !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Xuất xứ<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="from_type" id="from_type" required>
										<option value="">--Chọn xuất xứ--</option>
										<option value="1" {%if from_type=='1'%}selected{%endif%}>Nhập khẩu</option>
										<option value="2" {%if from_type=='2'%}selected{%endif%}>Lắp ráp trong nước</option>
									</select>
								</label>
								<label class="lab_red lab_invisible" id="from_type_error">Bạn cần chọn xuất xứ !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Tình trạng<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="car_status" id="car_status" required>
										<option value="">--Chọn--</option>
										<option value="1" {%if car_status=='1'%}selected{%endif%}>Xe mới</option>
										<option value="2" {%if car_status=='2'%}selected{%endif%}>Xe đã dùng</option>
									</select>
								</label>
								<label class="lab_red lab_invisible" id="car_status_error">Bạn cần chọn tình trạng !</label>
							</div>
						</div>
						<div class="row row-margin-bottom" id="div_mileage">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số Km đã đi<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input type="text" class="number_format" name="mileage" required value="{{mileage}}" id="mileage">
								<label class="lab_red lab_invisible" id="mileage_error">Bạn cần nhập số km đã đi !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Dòng xe<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="body_style_id" id="body_style_id" required>
										<option value="">--Chọn--</option>										
										{%for item in bodytype_list%}
											<option value="{{item.m_body_type_id}}" {%if body_style_id==item.m_body_type_id%}selected{%endif%}>{{item.m_body_type_name}}</option>
										{%endfor%}
									</select>
								</label>
								<label class="lab_red lab_invisible" id="body_style_id_error">Bạn cần chọn dòng xe !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Giá tiền<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input type="text" class="number_format" name="price" id="price" value="{{price}}" style="width:58%">
								<div class="donvi_tinh" style="vertical-align: center">
									<label><input type="hidden" name="unit_price" value="1">Triệu đồng</label>
									<!--<label><input type="radio" name="unit_price[]" value="2" {%if unit_price==2%}checked{%endif%} style="width: 20px;">USD</label>-->
								</div>
								<label class="lab_red lab_invisible" id="price_error">Bạn cần nhập giá tiền !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Ngoại thât:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding" >
								<label class="select_icon">
									<select name="exterior_color_id" id="exterior_color_id">
										<option value="">Chọn màu xe</option>
										{%for item in color_list%}
											<option value="{{item.m_color_id}}" {%if exterior_color_id==item.m_color_id%}selected{%endif%}>{{item.m_color_name}}</option>
										{%endfor%}
									</select>
								</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Nội thất:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="interior_color_id" id="interior_color_id">
										<option value="">--Chọn màu nội thất--</option>									
										{%for item in color_list%}
											<option value="{{item.m_color_id}}" {%if interior_color_id==item.m_color_id%}selected{%endif%}>{{item.m_color_name}}</option>
										{%endfor%}
									</select>
								</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số cửa:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">								
								<input name="num_doors" class="number_format" id="num_doors" value="{{num_doors}}">
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số chỗ ngồi:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input name="num_seats" class="number_format" id="num_seats" value="{{num_seats}}">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px;" >
						<div>
							<h3>Hộp số chuyển động</h3>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Hộp số:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="transmission_id" id="transmission_id">
										<option value="">--Chọn--</option>										
										<option value="1" {%if transmission_id=="1"%}selected{%endif%}>Số tay</option> 
										<option value="2" {%if transmission_id=="2"%}selected{%endif%}>tự động</option> 										
									</select>
								</label>
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">dẫn động:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
								<select name="drivetrain" id="drivetrain">
									<option value="">-- Chọn --</option>
									{%for item in drivetrain_list%}
										<option value="{{item.m_drivetrain_id}}" {%if drivetrain==item.m_drivetrain_id%}selected{%endif%}>{{item.m_drivetrain_name}}</option>
									{%endfor%}									
								</select>
								</label>
							</div>												
						</div>						
						<hr />
						<div>
							<h3>Nhiên liệu</h3>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Nhiên liệu:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">							
								<label class="select_icon">
								<select name="fueltype_id" id="fueltype_id">
									<option value="">- Chọn -</option>
									{%for item in fueltype_list%}
										<option value="{{item.m_fueltype_id}}" {%if fueltype_id==item.m_fueltype_id%}selected{%endif%}>{{item.m_fueltype_name}}</option>
									{%endfor%}
								</select>
								</label>								
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Hệ thống nạp nhiên liệu:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<input type="text" maxlength="50" name="fuel_system" value="{{fuel_system}}" id="fuel_system">
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Mức tiêu thụ nhiên liệu: </label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<input type="text" class="number_format" name="fuel_consumer" value="{{fuel_consumer}}" id="fuel_consumer" style="width:66%">
								<span>L/100Km </span>
							</div>												
						</div>
						<hr />
						<div>
							<h3>Thông tin mô tả<span class="lab_red">(*)</span></h3>
						</div>
						<div class="row row-margin-bottom">							
							<div class="col-md-12 col-sm-12 col-xs-12" style="margin:0px;padding:0px">
								<textarea style="height:200px" name="content" id="post_content" required >{{content}}</textarea> 
								<label class="lab_red lab_invisible" id="post_content_error">Bạn cần nhập nội dung mô tả!</label>
							</div>												
						</div>
					</div>
					</div>
					
					</div>
					<div class="pn_border_2 tab_item_detail" id="tab_detail_2" style="display:none">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left border_right">
								<h3>Túi khí an toàn</h3>
								{%if air_bag|length >0 %}
									{% set arr = air_bag|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
								<div class="row">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho người lái:</label>
									<input type="checkbox" name="air_bag[]" {%if 1 in arr%}checked="true"{%endif%} value="1" class="col-md-1 col-md-1 col-sm-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho hành khách phía trước:</label>
									<input type="checkbox" name="air_bag[]" {%if 2 in arr%}checked="true"{%endif%} value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho hành khách phía sau:</label>
									<input type="checkbox" name="air_bag[]" {%if 3 in arr%}checked="true"{%endif%} value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí hai bên hàng ghế:</label>
									<input type="checkbox" name="air_bag[]" {%if 4 in arr%}checked="true"{%endif%} value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí treo phía trên hai hàng ghế trước và sau:</label>
									<input type="checkbox" name="air_bag[]" {%if 5 in arr%}checked="true"{%endif%} value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<hr />
								<h3>Phanh - Điều khiển</h3>
								{%if brake|length >0 %}
									{% set arr = brake|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Chống bó cứng phanh (ABS):</label>
									<input type="checkbox" name="brake[]" {%if 1 in arr%}checked="true"{%endif%} value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Phân bố lực phanh điện tử (EBD):</label>
									<input type="checkbox" name="brake[]" {%if 2 in arr%}checked="true"{%endif%} value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Trợ lực phanh khẩn cấp (EBA):</label>
									<input type="checkbox" name="brake[]" {%if 3 in arr%}checked="true"{%endif%} value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Tự động cân bằng điện tử (ESP):</label>
									<input type="checkbox" name="brake[]" {%if 4 in arr%}checked="true"{%endif%} value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Điều khiển hành trình:</label>
									<input type="checkbox" name="brake[]" {%if 5 in arr%}checked="true"{%endif%}  value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Hỗ trợ cảnh báo lùi:</label>
									<input type="checkbox" name="brake[]" {%if 6 in arr%}checked="true"{%endif%}  value="6" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Hệ thống kiểm soát trượt:</label>
									<input type="checkbox" name="brake[]" {%if 7 in arr%}checked="true"{%endif%} value="7" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Khóa chống trộm</h3>
								{%if car_lock|length >0 %}
									{% set arr = car_lock|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Chốt cửa an toàn:</label>
									<input type="checkbox" name="car_lock[]" {%if 1 in arr%}checked="true"{%endif%}  value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa cửa tự động:</label>
									<input type="checkbox" name="car_lock[]" {%if 2 in arr%}checked="true"{%endif%} value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa cửa điện điều khiển từ xa:</label>
									<input type="checkbox" name="car_lock[]" {%if 3 in arr%}checked="true"{%endif%} value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa động cơ:</label>
									<input type="checkbox" name="car_lock[]" {%if 4 in arr%}checked="true"{%endif%} value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Hệ thống báo trộm ngoại vi:</label>
									<input type="checkbox" name="car_lock[]" {%if 5 in arr%}checked="true"{%endif%} value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<hr />
								<h3>Các thông số khác</h3>	
								{%if safety|length >0 %}
									{% set arr = safety|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn sương mù:</label>
									<input type="checkbox" name="safety[]" {%if 1 in arr%}checked="true"{%endif%} value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn cảnh báo thắt dây an toàn:</label>
									<input type="checkbox" name="safety[]" {%if 2 in arr%}checked="true"{%endif%} value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn phanh phụ thứ 3 lắp cao:</label>
									<input type="checkbox" name="safety[]" {%if 3 in arr%}checked="true"{%endif%} value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>							
							</div>
						</div>
					</div>
					<div class="pn_border_2 tab_item_detail" id="tab_detail_3" style="display:none">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left border_left border_right">
								<h3>Thiết bị tiêu chuẩn</h3>								
								{%if standard_equipment|length >0 %}
									{% set arr = standard_equipment|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Thiết bị định vị:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 1 in arr%}checked="true"{%endif%} value="1" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Cửa sổ nóc:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 2 in arr%}checked="true"{%endif%} value="2" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kính chỉnh điện:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 3 in arr%}checked="true"{%endif%}  value="3" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Tay lái trợ lực:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 4 in arr%}checked="true"{%endif%}  value="4" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Ghế:Chất liệu,tiện nghi..:</label>
									<input type="text" maxlength="50" name="chair_stuff" value="{{chair_stuff}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Điều hòa trước:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 5 in arr%}checked="true"{%endif%} value="5" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Điều hòa sau:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 6 in arr%}checked="true"{%endif%} value="6" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>								
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Hỗ trợ xe tự động:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 7 in arr%}checked="true"{%endif%} value="7" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Xấy kính sau:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 8 in arr%}checked="true"{%endif%} value="8" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Quạt kính phía sau:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 9 in arr%}checked="true"{%endif%} value="9" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kính mầu:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 10 in arr%}checked="true"{%endif%} value="10" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div> 
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Màn hình LCD:</label>
									<input type="checkbox" name="standard_equipment[]" {%if 11 in arr%}checked="true"{%endif%} value="11" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Thiết bị giải trí Audio, Video:</label>
									<input type="text" maxlength="50" name="audio_video" value="{{audio_video}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Thiết bị khác</h3>
								<div class="row">									
									<textarea maxlength="255" name="other_equipment" style="height: 200px" class="col-md-12 col-sm-12 col-xs-12">{{other_equipment}}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="pn_border_2 tab_item_detail" id="tab_detail_4" style="display:none">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left border_left border_right">
								<h3>Kích thước/Trọng lượng</h3>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Dài x Rộng x Cao (mm):</label>
									<input type="text" maxlength="25" name="length_width_heigh" value="{{length_width_heigh}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Chiều dài cơ sở:</label>
									<input type="text" name="basic_length" value="{{basic_length}}" class="col-md-6 col-sm-6 col-xs-6 number_format"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Chiều rộng cơ sở trước/sau (mm):</label>
									<input type="text" name="basic_width" value="{{basic_width}}" class="col-md-6 col-sm-6 col-xs-6 number_format"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Trọng lượng không tải (kg):</label>
									<input type="text" name="weight" value="{{weight}}" class="col-md-6 col-sm-6 col-xs-6 number_format"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Dung tích bình nhiên liệu (lít):</label>
									<input type="text" name="fuel_capacity" value="{{fuel_capacity}}" class="col-md-6 col-sm-6 col-xs-6 number_format"/>
								</div>
								<hr />
								<h3>Động cơ</h3>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Động cơ:</label>
									<input type="text" maxlength="50" name="engine" value="{{engine}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kiểu động cơ:</label>
									<input type="text" maxlength="50" name="engine_type" value="{{engine_type}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Dung tích xi lanh (cc):</label>
									<input type="text" maxlength="50" name="cylinder_vol" value="{{cylinder_vol}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Phanh - Giảm xóc - Lốp</h3>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Phanh:</label>
									<input type="text" maxlength="50" name="brake_des" value="{{brake_des}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Giảm sốc:</label>
									<input type="text" maxlength="50" name="absorber" value="{{absorber}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Lốp xe:</label>
									<input type="text" maxlength="50" name="tyre" value="{{tyre}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Vành mâm xe:</label>
									<input type="text" maxlength="50" name="rim" value="{{rim}}" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<hr/>
								<h3>Thông số kỹ thuật khác</h3>
								<div class="row">									
									<textarea maxlength="255" name="other_tech_para" style="height: 200px" class="col-md-12 col-sm-12 col-xs-12">{{other_tech_para}}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="pn_border_2 margin_top">						
						<div>
							<h3>Đăng ảnh cho xe</h3>
						</div>						
						<div class="row row-margin-bottom">													
							<div class="col-md-12 col-sm-12 col-xs-12" id="img_box">
								<div id="filedrag">
									{%for img in img_list%}
									<div class="div_img" id="div_img_{{img.post_img_id}}">
										<img class="" src="{{url.get(img.img_path)}}">
										<a href="javascript:void(0)" class="delete_img" id="delete_img_{{img.post_img_id}}">X</a>
									</div>
									{%endfor%}														
									<div class="div_img" id="div_btn_img">
										<a class="btn_upload" id="btn_upload"><i class="fa fa-cloud-upload"></i><br/>Upload Ảnh</a>
										<input type="file" multiple="true" style="display: none" accept=".JPG,.PNG,.GIF" id="upload_file">
										<input type="file" id="fileselect" style="display: none" accept=".JPG,.PNG,.GIF" name="fileselect[]" multiple="multiple" />
										
									</div>
								</div>
							</div>												
						</div>
					</div>
					<div class="pn_border_2 margin_top">
						<div class="row">						
						<div>
							<h3>Thông tin liên hệ</h3>
							<h5 style="color: red">(Chỉ thành viên vip mới được thay đổi thông tin liên hệ)</h5>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Họ tên <span class="lab_red">(*)</span>:</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<input type="text" name="contract[full_name]" id="contract_name" required value="{{full_name}}">
								<label class="lab_red lab_invisible" id="contract_name_error">Bạn cần nhập họ tên !</label>
							</div>
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Khu vực: <span class="lab_red">(*)</span>:</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<label class="select_icon">
								<select name="m_provin_id" id="m_provin_id">
									<option value="">-- Chọn khu vực--</option>	
									{%for item in provin_list%}
										<option value="{{item.m_provin_id}}" {%if m_provin_id== item.m_provin_id%}selected{%endif%}>{{item.m_provin_name}}</option>	
									{%endfor%}
								</select>
								</label>
								<label class="lab_red lab_invisible" id="contract_name_error">Bạn cần chọn khu vực!</label>
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Địa chỉ:</label>
							<div class="col-md-10 col-sm-10 col-xs-12">
								<input type="text" name="contract[address]" value="{{contract_address}}">
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Điện thoại:</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<input type="text" name="contract[phone]" value="{{phone}}">
							</div>	
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Di động <span class="lab_red">(*)</span>:</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<input type="text" name="contract[mobie]" id="contract_phone" required value="{{mobie}}">
								<label class="lab_red lab_invisible" id="contract_phone_error">Bạn cần nhập số di động !</label>
							</div>											
						</div>
					</div>	
					</div>
					</form>
						<div class="row row-margin-bottom" style="margin-top:20px">
							<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
								<button  class="btn_dangtin btn_red" id="btn_cancel"><i class="fa fa-times"></i>Hủy bỏ</button>
								<!--<button class="btn_dangtin" id="btn_preview" style="width:110px;"><i class="fa fa-eye"></i>Xem trước</button>-->
								<button class="btn_dangtin" id="btn_save" ><i class="fa fa-check-square-o"></i>Đăng tin</button>
								<button id="mapsubmit" style="display:none">Tìm vị trí</button>
							</div>
						</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
{{ stylesheet_link('template1/css/jquery.datetimepicker.css') }}
{{ javascript_include('template1/js/jquery.datetimepicker.full.min.js') }}
{{ partial('includes/pho_ajax') }}
<script type="text/javascript">
	$(document).ready(function() {
		$(document).off('click','.tab_item');
	   $(document).on('click','.tab_item',function(){
	      $('.tab_item').removeClass('active');
	      $(this).addClass('active');
	      $('.tab_item_detail').hide();
	      $($(this).attr('data-tab')).show();
	   });
   		
		var model_list = Array();		
		{%for item in category_2%}
			model_list.push(['{{item.ctg_id}}',"{{item.ctg_name}}",'{{item.parent_id}}']);
		{%endfor%}

		
		$('.datetimepicker').datetimepicker({
          //format:'Y/m/d H:i',
          format:'d/m/Y',
          inline:false,
          timepicker:false,
          lang:'ru'
    	});
		
		$(document).off('change','#make_id');
		$(document).on('change','#make_id',function(){			
			change_model_option('');
			set_name();		
		});
		$(document).off('change','#model_id');
		$(document).on('change','#model_id',function(){
			set_name();		
		});
		$(document).off('blur','#submodel'); 
        $(document).on('blur','#submodel',function(event){
        	set_name();
        });	
        $(document).off('change','#car_year'); 
        $(document).on('change','#car_year',function(event){
        	set_name();
        });	
        
		$(document).off('blur','.number_format'); 
        $(document).on('blur','.number_format',function(event){
          var val = $(this).val();
          if($.isNumeric( val) == false){
            $(this).val("");
            return;
          }
          $(this).val( parseFloat($(this).val().replace(/,/g, ""))
                       // .toFixed(2)
                        .toString()
                        .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                        );
        });
		var change_model_option= function(model_id){
			var val = $('#make_id').val();
			var option = '<option value="">--Chọn đời xe--</option>';
			$.each(model_list,function(key,item){
				//console.log(item);
				if(val == item[2]){
					if(model_id == item[0] ){
						option +='<option value="'+item[0]+'" selected >'+item[1]+'</option>';
					}else{
						option +='<option value="'+item[0]+'" >'+item[1]+'</option>';
					}					
				}
			});
			$('#model_id').empty();
			$('#model_id').append(option);
		};
		change_model_option('{{model_id}}');
		var set_name= function(){
			var  make_val = $('#make_id option:selected').text();
			var  model_val =  $('#model_id option:selected').text();
			var  submodel_val =  $('#submodel').val();
			var  year_val =  $('#car_year').val();
			$('#post_name').val(make_val+' '+model_val+' '+submodel_val+ ' - '+year_val);
		};
		$(document).off('change','#car_status');
		$(document).on('change','#car_status',function(){			
			var val =$(this).val();
			if(val==1){
				$('#div_mileage').hide();
			}else{
				$('#div_mileage').show();
			}				
		});
		

		
		function topFunction() {
		    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
		    document.documentElement.scrollTop = 0; // For IE and Firefox
		}	
			
		$(document).off('click','#btn_cancel'); 
        $(document).on('click','#btn_cancel',function(event){
        	location.href="{{url.get('tin-da-dang')}}";
        });
		$(document).off('click','#btn_save'); 
        $(document).on('click','#btn_save',function(event){
        	var msg = check_validate_update();
          	if(!msg){
            	topFunction();
            	return;
          	}
          	var arr = $('#from_post').serializeArray();
	      	Pho_json_ajax('POST',"{{url.get('posts/update')}}" ,arr,function(datas){
		        if(datas.status =="OK"){
		          //Pho_modal_close("modal1");
		          //Pho_message_box("Thông báo",'Đăng tin thành công !');
		          Pho_direct("{{url.get('dang-tin-thanh-cong/')}}" + datas.msg);
		        }else{
		          Pho_message_box_error("Lỗi",datas.msg);
		        }	                
	        });
        });
        var check_validate_update = function(){
        	var flg = true;
        	$('input:required').each(function(key,item){
        		if($(this).val().trim().length == 0 && $(this).is(":visible")){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        			console.log($(this).attr('id'));
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});
        	$('select:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        			console.log($(this).attr('id'));
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});
        	$('textarea:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        			console.log($(this).attr('id'));
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});        	
        	if(!flg){
        		$('#lab_message_error').show();
        	}else{
        		$('#lab_message_error').hide();
        	}
        	return flg;
        }
		//delete file
		$(document).off('click','.delete_img'); 
        $(document).on('click','.delete_img',function(event){
        	var id = $(this).attr('id').replace('delete_img_','');
        	var base_url= "{{url.get('')}}";
        	src = $('#div_img_'+id +' img').attr('src');
        	src = src.replace(base_url,"");	        	
        	if(id.indexOf('add') < 0){
        		$('#img_box').append('<input type="hidden" name="img_del[]" value="'+src+'">');
        	}
        	$('#div_img_'+id).remove();
        });
		//upload file
		$(document).off('click','#btn_upload'); 
        $(document).on('click','#btn_upload',function(event){
        	$('#upload_file').click();
        });
		$(document).off('change','#upload_file'); 
        $(document).on('change','#upload_file',function(event){
        	
        	var file_data=$(this).prop("files");
        	//console.log(file_data);	
        	if(file_data.length == 0){
        		return;
        	}
        	var form_data=new FormData(this);
        	for(var i=0;i<file_data.length;i++){
        		form_data.append(i,file_data[i]);
        	}        	
            upload_file(form_data);
        });
	});
var upload_file = function(form_data){
        	form_data.append("folder_tmp",$('#folder_tmp').val());
            var base_url= "{{url.get('')}}";
            //console.log(form_data);	
        	Pho_upload("{{url.get('posts/upload')}}" ,form_data,function(datas){
				if(datas.status =="OK"){
					//console.log(datas);					
                    var cnt_add = $('.add_img').length;  			
					for(var i=0;i<datas.link.length;i++){
		        		//form_data.append(i,file_data[i]);
		        		cnt_add++;
		        		var html_tr= '<div class="div_img" id="div_img_add_'+cnt_add+'"><img class="add_img" src="'+datas.link[i]+'"><a href="javascript:void(0)" class="delete_img" id="delete_img_add_'+cnt_add+'">X</a><input type="hidden" name="img_add['+cnt_add+']" value="'+datas.link[i]+'"></div>';
		        		$("#div_btn_img").before(html_tr);		        		
		        	}
		        	// if(get_avata_id()==""){
		        	// 	$("#radio_add_1").prop('checked',true);	
		        	// }
					//var file_name = datas.link.replace(base_url,"");	
					//$('#img_path').val(file_name);				
				}else{
					Pho_message_box_error("Lỗi",datas.msg);
				}
                
            });
};
function currency_format(n) {
    return n.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
};
function jsion_ajax(url,data,done_fun){
    $.ajax({
        url: url,
        data: data,
        dataType: 'json',
        success: function(datajsion) {
            done_fun(datajsion);
        },
        error: function() {
            alert('Lỗi Ajax !!!');
        },      
        type: 'GET'
    });
}

</script>

<script>
	(function() {

	// getElementById
	function $id(id) {
		return document.getElementById(id);
	}


	// output information
	/*function Output(msg) {
		var m = $id("messages");
		m.innerHTML = msg + m.innerHTML;
	}*/


	// file drag hover
	function FileDragHover(e) {
		e.stopPropagation();
		e.preventDefault();
		e.target.className = (e.type == "dragover" ? "hover" : "");
	}


	// file selection
	function FileSelectHandler(e) {

		// cancel event and hover styling
		FileDragHover(e);

		// fetch FileList object
		var files = e.target.files || e.dataTransfer.files;
		var form_data=new FormData(this);
		// process all File objects
		for (var i = 0, f; f = files[i]; i++) {
			//ParseFile(f);
			form_data.append(i,f);
		}	       	
        upload_file(form_data);

	}


	// output file information
	function ParseFile(file) {

		Output(
			"<p>File information: <strong>" + file.name +
			"</strong> type: <strong>" + file.type +
			"</strong> size: <strong>" + file.size +
			"</strong> bytes</p>"
		);

	}


	// initialize
	function Init() {

		var fileselect = $id("fileselect"),
			filedrag = $id("filedrag"),
			submitbutton = $id("submitbutton");

		// file select
		fileselect.addEventListener("change", FileSelectHandler, false);

		// is XHR2 available?
		var xhr = new XMLHttpRequest();
		if (xhr.upload) {

			// file drop
			filedrag.addEventListener("dragover", FileDragHover, false);
			filedrag.addEventListener("dragleave", FileDragHover, false);
			filedrag.addEventListener("drop", FileSelectHandler, false);
			filedrag.style.display = "block";

			// remove submit button
			//submitbutton.style.display = "none";
		}

	}

	// call initialization file
	if (window.File && window.FileList && window.FileReader) {
		Init();
	}


})();
</script>
