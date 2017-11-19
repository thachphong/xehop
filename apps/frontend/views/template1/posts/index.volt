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
											<option value="{{item.ctg_id}}">{{item.ctg_name}}</option>
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
								<input type="text" name="submodel" class="" id="submodel">
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
												<option value="{{item}}">Trước 1990</option>
											{%else%}
												<option value="{{item}}">{{item}}</option>
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
										<option value="1">Nhập khẩu</option>
										<option value="2">Lắp ráp trong nước</option>
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
										<option value="1">Xe mới</option>
										<option value="2">Xe đã dùng</option>
									</select>
								</label>
								<label class="lab_red lab_invisible" id="car_status_error">Bạn cần chọn tình trạng !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số Km đã đi<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input type="text" name="mileage" required value="{{post_name}}" id="mileage">
								<label class="lab_red lab_invisible" id="mileage_error">Bạn cần nhập số km đã đi !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Dòng xe<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="body_style_id" id="body_style_id" required>
										<option value="">--Chọn--</option>
										<option value="1">Sedan</option>
										<option value="2">SUV</option>									
										<option value="3">Coupe</option>
										<option value="4">Crossover</option>								
										<option value="5">Hatchback</option>
										<option value="6">Convertible/Cabriolet</option>
										<option value="7">Truck</option>
										<option value="8">Van/Minivan</option>										
										<option value="9">Wagon</option>
									</select>
								</label>
								<label class="lab_red lab_invisible" id="body_style_id_error">Bạn cần chọn dòng xe !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Giá tiền<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input type="text" name="price" id="price">
								<label>Triệu đồng<input type="checkbox" name=""></label>
								<label>USD<input type="checkbox" name=""></label>
								<label class="lab_red lab_invisible" id="price_error">Bạn cần nhập giá tiền !</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Ngoại thât<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding" >
								<label class="select_icon">
									<select name="exterior_color_id" id="exterior_color_id">
										<option value="">Chọn màu xe</option>
										<option value="1">Bạc</option> 
										<option value="2">Cát</option> 
										<option value="3">Ghi</option> 										
										<option value="4">Hồng</option> 		
										<option value="5">Kem</option> 									
										<option value="6">Nâu</option> 									
										<option value="7">Tím</option> 
										<option value="8">Trắng</option> 
										<option value="9">Vàng</option> 
										<option value="10">Cam</option> 
										<option value="11">Xanh</option> 
										<option value="12">Xám</option> 
										<option value="13">Đỏ</option> 
										<option value="14">Đồng</option> 
										<option value="15">Đen</option> 
										<option value="99">Nhiều màu</option> 
										<option value="100">Màu khác</option>
									</select>
								</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Nội thất<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="interior_color_id" id="interior_color_id">
										<option value="">--Chọn màu nội thất--</option>									
										<option value="1">Bạc</option> 
										<option value="2">Cát</option> 
										<option value="3">Ghi</option> 										
										<option value="4">Hồng</option> 		
										<option value="5">Kem</option> 									
										<option value="6">Nâu</option> 									
										<option value="7">Tím</option> 
										<option value="8">Trắng</option> 
										<option value="9">Vàng</option> 
										<option value="10">Cam</option> 
										<option value="11">Xanh</option> 
										<option value="12">Xám</option> 
										<option value="13">Đỏ</option> 
										<option value="14">Đồng</option> 
										<option value="15">Đen</option> 
										<option value="99">Nhiều màu</option> 
										<option value="100">Màu khác</option>
									</select>
								</label>
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số cửa<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">								
								<input name="num_doors" id="num_doors">
							</div>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-5 col-sm-5 col-xs-12 title_col">Số chỗ ngồi<span class="lab_red">(*)</span>:</label>
							<div class="col-md-7 col-sm-7 col-xs-12 no_padding">
								<input name="num_seats" id="num_seats">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px;" >
						<div>
							<h3>Hộp số chuyển động</h3>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Hộp số <span class="lab_red">(*)</span>:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<label class="select_icon">
									<select name="transmission_id" id="transmission_id">
										<option value="">--Chọn--</option>										
										<option value="1">Số tay</option> 
										<option value="2">tự động</option> 										
									</select>
								</label>
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">dẫn động <span class="lab_red">(*)</span>:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<label class="select_icon">
								<select name="drivetrain" id="drivetrain">
									<option value="">-- Chọn --</option>
									<option value="1">FWD - Dẫn động cầu trước</option>
									<option value="2">RWD - Dẫn động cầu sau</option>										
									<option value="3">4WD - Dẫn động 4 bánh</option>
									<option value="4">AWD - 4 bánh toàn thời gian</option>
								</select>
								</label>
							</div>												
						</div>						
						<hr />
						<div>
							<h3>Nhiên liệu</h3>
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Nhiên liệu <span class="lab_red">(*)</span>:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">							
								<label class="select_icon">
								<select name="fueltype_id" id="fueltype_id">
									<option value="">- Chọn -</option>
									<option value="1">Xăng</option>
									<option value="2">Diesel</option>
									<option value="3">Hybrid</option>
									<option value="4">Điện</option>
									<option value="9">Loại khác</option>
								</select>
								</label>								
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Hệ thống nạp nhiên liệu:</label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<input type="text" name="fuel_system" required value="{{fuel_system}}" id="fuel_system">
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-6 col-sm-6 col-xs-12 title_col">Mức tiêu thụ nhiên liệu: </label>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding">
								<input type="text" name="fuel_consumer" required value="{{fuel_consumer}}" id="fuel_consumer">
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
								<div class="row">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho người lái:</label>
									<input type="checkbox" name="air_bag[]" value="1" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho hành khách phía trước:</label>
									<input type="checkbox" name="air_bag[]" value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí cho hành khách phía sau:</label>
									<input type="checkbox" name="air_bag[]" value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row ">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí hai bên hàng ghế:</label>
									<input type="checkbox" name="air_bag[]" value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-10 col-sm-10 col-xs-2 title_col">Túi khí treo phía trên hai hàng ghế trước và sau:</label>
									<input type="checkbox" name="air_bag[]" value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<hr />
								<h3>Phanh - Điều khiển</h3>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Chống bó cứng phanh (ABS):</label>
									<input type="checkbox" name="brake[]" value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Phân bố lực phanh điện tử (EBD):</label>
									<input type="checkbox" name="brake[]" value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Trợ lực phanh khẩn cấp (EBA):</label>
									<input type="checkbox" name="brake[]" value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Tự động cân bằng điện tử (ESP):</label>
									<input type="checkbox" name="brake[]" value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Điều khiển hành trình:</label>
									<input type="checkbox" name="brake[]" value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Hỗ trợ cảnh báo lùi:</label>
									<input type="checkbox" name="brake[]" value="6" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-7 col-sm-7 col-xs-2 title_col">Hệ thống kiểm soát trượt:</label>
									<input type="checkbox" name="brake[]" value="7" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Khóa chống trộm</h3>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Chốt cửa an toàn:</label>
									<input type="checkbox" name="lock[]" value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa cửa tự động:</label>
									<input type="checkbox" name="lock[]" value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa cửa điện điều khiển từ xa:</label>
									<input type="checkbox" name="lock[]" value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Khóa động cơ:</label>
									<input type="checkbox" name="lock[]" value="4" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Hệ thống báo trộm ngoại vi:</label>
									<input type="checkbox" name="lock[]" value="5" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<hr />
								<h3>Các thông số khác</h3>	
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn sương mù:</label>
									<input type="checkbox" name="safety[]" value="1" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn cảnh báo thắt dây an toàn:</label>
									<input type="checkbox" name="safety[]" value="2" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-8 col-sm-8 col-xs-2 title_col">Đèn phanh phụ thứ 3 lắp cao:</label>
									<input type="checkbox" nname="safety[]" value="3" class="col-md-1 col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>							
							</div>
						</div>
					</div>
					<div class="pn_border_2 tab_item_detail" id="tab_detail_3" style="display:none">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left border_left border_right">
								<h3>Thiết bị tiêu chuẩn</h3>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Thiết bị định vị:</label>
									<input type="checkbox" name="standard_equipment[]" value="1" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Cửa sổ nóc:</label>
									<input type="checkbox" name="standard_equipment[]" value="2" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kính chỉnh điện:</label>
									<input type="checkbox" name="standard_equipment[]" value="3" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Tay lái trợ lực:</label>
									<input type="checkbox" name="standard_equipment[]" value="4" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Ghế:Chất liệu,tiện nghi..:</label>
									<input type="text" name="chair_stuff" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Điều hòa trước:</label>
									<input type="checkbox" name="standard_equipment[]" value="5" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Điều hòa sau:</label>
									<input type="checkbox" name="standard_equipment[]" value="6" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>								
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Hỗ trợ xe tự động:</label>
									<input type="checkbox" name="standard_equipment[]" value="7" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Xấy kính sau:</label>
									<input type="checkbox" name="standard_equipment[]" value="8" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Quạt kính phía sau:</label>
									<input type="checkbox" name="standard_equipment[]" value="9" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kính mầu:</label>
									<input type="checkbox" name="standard_equipment[]" value="10" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div> 
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Màn hình LCD:</label>
									<input type="checkbox" name="standard_equipment[]" value="11" class="col-md-1 col-sm-1 col-xs-1 input_chkbx"/>
								</div>
								<div class="row">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Thiết bị giải trí Audio, Video:</label>
									<input type="text" name="audio_video" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Thiết bị khác</h3>
								<div class="row">									
									<textarea  name="other_equipment" style="height: 200px" class="col-md-12 col-sm-12 col-xs-12"></textarea>
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
									<input type="text" name="length_width_heigh" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Chiều dài cơ sở:</label>
									<input type="text" name="basic_length" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Chiều rộng cơ sở trước/sau (mm):</label>
									<input type="text" name="basic_width" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Trọng lượng không tải (kg):</label>
									<input type="text" name="weight" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Dung tích bình nhiên liệu (lít):</label>
									<input type="text" name="fuel_capacity" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<hr />
								<h3>Động cơ</h3>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Động cơ:</label>
									<input type="text" name="engine" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Kiểu động cơ:</label>
									<input type="text" name="engine_type" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Dung tích xi lanh (cc):</label>
									<input type="text" name="cylinder_vol" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>								
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
								<h3>Động cơ</h3>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Phanh:</label>
									<input type="text" name="brake_des" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Giảm sốc:</label>
									<input type="text" name="absorber" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Lốp xe:</label>
									<input type="text" name="tyre" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<div class="row row-margin-bottom">
									<label class="col-md-6 col-sm-6 col-xs-2 title_col">Vành mâm xe:</label>
									<input type="text" name="rim" class="col-md-6 col-sm-6 col-xs-6"/>
								</div>
								<hr/>
								<h3>Thông số kỹ thuật khác</h3>
								<div class="row">									
									<textarea  name="other_tech_para" style="height: 200px" class="col-md-12 col-sm-12 col-xs-12"></textarea>
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
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Họ tên <span class="lab_red">(*)</span>:</label>
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="text" name="contract[full_name]" id="contract_name" required value="{{full_name}}">
								<label class="lab_red lab_invisible" id="contract_name_error">Bạn cần nhập họ tên !</label>
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Địa chỉ:</label>
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="text" name="contract[address]" value="{{contract_address}}">
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Điện thoại:</label>
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="text" name="contract[phone]" value="{{phone}}">
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Di động <span class="lab_red">(*)</span>:</label>
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="text" name="contract[mobie]" id="contract_phone" required value="{{mobie}}">
								<label class="lab_red lab_invisible" id="contract_phone_error">Bạn cần nhập số di động !</label>
							</div>												
						</div>
						<div class="row row-margin-bottom">
							<label class="col-md-2 col-sm-2 col-xs-12 title_col">Email:</label>
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="text" name="contract[email]" value="{{email}}">
							</div>												
						</div>
					</div>	
					</div>
					</form>
						<div class="row row-margin-bottom" style="margin-top:20px">
							<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
								<button class="btn_dangtin btn_red" id="btn_cancel"><i class="fa fa-times"></i>Hủy bỏ</button>
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
   
		var district_list = Array();
		var ward_list = Array();
		var street_list = Array();
		var category_list = Array();
		var unit_list = Array();
		{%for item in category_2%}
			category_list.push(['{{item.ctg_id}}',"{{item.ctg_name}}",'{{item.parent_id}}']);
		{%endfor%}

		
		$('.datetimepicker').datetimepicker({
          //format:'Y/m/d H:i',
          format:'d/m/Y',
          inline:false,
          timepicker:false,
          lang:'ru'
    	});
		//console.log(district_list);
		function get_basic(){
			loading_flg = false;
	        jsion_ajax("{{url.get('posts/wards')}}" ,null,function(datas){               
	            ward_list = datas.wards;  
	            change_war_option('m_ward_id');
	        });
	    }
	    function get_street(m_district_id){
			loading_flg = false;
	        jsion_ajax("{{url.get('index/street/')}}"+m_district_id ,null,function(datas){               
	            street_list = datas.streets; 
	            console.log(datas);
	            var option = '<option value="">--Chọn Đường/Phố--</option>';
				$.each(street_list,function(key,item){
					//console.log(item);
					//if(val == item['m_district_id']){
						//if(m_ward_id == item['m_ward_id']){
							//option +='<option value="'+item['m_ward_id']+'" selected>'+item['m_ward_name']+'</option>';
						//}else{
							option +='<option value="'+item['m_street_id']+'">'+item['m_street_name']+'</option>';
						//}					
					//}
				});
				$('#m_street_id').empty();
				$('#m_street_id').append(option);
	        });
	    }
	    setTimeout(get_basic(),10);
		$(document).off('change','#m_provin_id');
		$(document).on('change','#m_provin_id',function(){			
			change_district_option('');
			change_map();
		});
		var change_district_option= function(district_id){
			var val = $('#m_provin_id').val();
			var option = '<option value="">--Chọn Quận/Huyện--</option>';
			$.each(district_list,function(key,item){
				//console.log(item);
				if(val == item[2]){
					if(district_id == item[0] ){
						option +='<option value="'+item[0]+'" selected >'+item[1]+'</option>';
					}else{
						option +='<option value="'+item[0]+'" >'+item[1]+'</option>';
					}					
				}
			});
			$('#m_district_id').empty();
			$('#m_district_id').append(option);
		};
		

		$(document).off('change','#m_district_id');
		$(document).on('change','#m_district_id',function(){			
			change_war_option('');
			change_map();
			dis_id = $(this).val();
			get_street(dis_id);
		});
		var change_war_option = function(m_ward_id){
			var val = $('#m_district_id').val();
			var option = '<option value="">--Chọn Phường/Xã--</option>';
			$.each(ward_list,function(key,item){
				//console.log(item);
				if(val == item['m_district_id']){
					if(m_ward_id == item['m_ward_id']){
						option +='<option value="'+item['m_ward_id']+'" selected>'+item['m_ward_name']+'</option>';
					}else{
						option +='<option value="'+item['m_ward_id']+'">'+item['m_ward_name']+'</option>';
					}					
				}
			});
			$('#m_ward_id').empty();
			$('#m_ward_id').append(option);		
		};
		
		$(document).off('change','#m_ward_id');
		$(document).on('change','#m_ward_id',function(){
			/*var val = $(this).val();
			var option = '<option value="">--Chọn Đường/Phố--</option>';
			$.each(street_list,function(key,item){
				//console.log(item);
				if(val == item[2]){
					option +='<option value="'+item[0]+'">'+item[1]+'</option>';
				}
			});
			$('#m_street_id').empty();
			$('#m_street_id').append(option);*/				
		});
		
		$(document).off('change','#m_street_id');
		$(document).on('change','#m_street_id',function(){
			change_map();
		});
		$(document).off('change','#post_address');
		$(document).on('change','#post_address',function(){
			change_location();
		});
		//change_m_type_id($("input[name='m_type_id']:checked").val());
		$(document).off('change','.m_type_id');
		$(document).on('change','.m_type_id',function(){
			//var val = $("input[name='m_type_id']:checked").val();
			change_m_type_id('');
			change_unit_price('');
		});
		function change_m_type_id(ctg_id){
			var val = $("input[name='m_type_id']:checked").val();
			var option = '<option value="">--Chọn loại bất động sản--</option>';
			$.each(category_list,function(key,item){
				//console.log(item);
				if(val == item[2]){
					if(ctg_id == item[0]){
						option +='<option value="'+item[0]+'" selected>'+item[1]+'</option>';
					}else{
						option +='<option value="'+item[0]+'">'+item[1]+'</option>';
					}					
				}
			});
			$('#ctg_id').empty();
			$('#ctg_id').append(option);
		}		
		
		function change_unit_price(m_unit_id){
			var val = $("input[name='m_type_id']:checked").val();
			var option = '<option value="">--Chọn đơn vị--</option>';			
			$.each(unit_list,function(key,item){
				//console.log(item);
				if(val == item[2]){
					if(m_unit_id == item[0]){
						option +='<option value="'+item[0]+'" selected>'+item[1]+'</option>';
					}else{
						option +='<option value="'+item[0]+'">'+item[1]+'</option>';
					}					
				}
			});
			$('#unit_price').empty();
			$('#unit_price').append(option);
		}
		change_unit_price('{{unit_price}}');
		
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
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});
        	$('select:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
        		}else{
        			$('#'+ $(this).attr('id') + "_error").hide();
        		}
        	});
        	$('textarea:required').each(function(key,item){
        		if($(this).val().trim().length == 0){
        			$('#'+ $(this).attr('id') + "_error").show();
        			flg = false;
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
