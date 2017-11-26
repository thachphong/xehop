<div class="row">
	<!-- set banners= elements.get_banner()
    partial('includes/banner_left') -->
   <div class="container" id="content">
   	 <div class="pn_title margin_top">
               <h1>Xe {{post_name}} - {{price}} {{unit_name}}</h1>
               <span class="read_more" style="font-style: italic;color:#575353">
                  Ngày đăng: {{start_date}}
               </span>
            </div>
   	 <div class="row">  	   	            
	      <div class="col-md-7 col-sm-12 col-xs-12 margin_top no_padding_left">	      	
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
	         <div class="pn_border_2 tab_item_detail" id="tab_detail_1" style="display:block">
	         	<div class="row">
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left">
	         			<h3 class="post_body_title">Thông số cơ bản</h3> 
			         	<table class="other_detail">
			         		<tr>
			         			<td>Xuất sứ:</td>
			         			<td>{{from_type}}</td>
			         		</tr>
			         		<tr>
			         			<td>Tình trạng:</td>
			         			<td>{{car_status}}</td>
			         		</tr>
			         		<tr>
			         			<td>Dòng xe:</td>
			         			<td>{{m_body_type_name}}</td>
			         		</tr>
			         		<tr>
			         			<td>Số km đã đi:</td>
			         			<td>{{mileage}}</td>
			         		</tr>
			         		<tr>
			         			<td>Màu ngoại thất:</td>
			         			<td>{{exterior_color_name}}</td>
			         		</tr>
			         		<tr>
			         			<td>Màu nội thất:</td>
			         			<td>{{interior_color_name}}</td>
			         		</tr>
			         		<tr>
			         			<td>Số cửa:</td>
			         			<td>{{num_doors}}</td>
			         		</tr>
			         		<tr>
			         			<td>Số chỗ ngồi:</td>
			         			<td>{{num_seats}}</td>
			         		</tr>
			         	</table>
	         		</div>
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
	         			<h3 class="post_body_title">Nhiên liệu - động cơ</h3>
	         			<table class="other_detail">
	         				<tr>
			         			<td>Động cơ:</td>
			         			<td>{{fueltype_name}}</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Hệ thống nạp nhiên liệu:</td>
			         			<td>{{fuel_system}}</td>
			         		</tr>
	         			</table>
	         			<hr class="line2"/>
	         			<h3 class="post_body_title">Hộp số chuyển động</h3>
	         			<table class="other_detail">
	         				<tr>
			         			<td>Hộp số:</td>
			         			<td>{{transmission_name}}</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Dẫn động:</td>
			         			<td>{{m_drivetrain_name}}</td>
			         		</tr>
			         		<tr>
			         			<td>Tiêu thụ nhiên liệu:</td>
			         			<td>{{fuel_consumer}}</td>
			         		</tr>
	         			</table>  
	         		</div>
	         	</div>
	         	<hr class="line2"/>
	         	<div class="row">
	         		<h3 class="post_body_title">Thông tin mô tả</h3>
	         		<div>{{content|nl2br}}</div>
	         	</div>
	         </div>
	         <div class="pn_border_2 tab_item_detail" id="tab_detail_2" style="display:none">
	         	<div class="row">
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left">
	         			<h3 class="post_body_title">Túi khí an toàn</h3>
						{%if air_bag|length >0 %}
							{% set arr = air_bag|json_decode %}
						{%else%}
							{% set arr ={} %}
						{%endif%}
						<table class="other_detail ">
	         				<tr>
			         			<td>Túi khí cho người lái:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 1 in arr%}checked="true"{%endif%} disabled="true" />
									  <span class="checkmark"></span>
									</label>
			         			</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Túi khí cho hành khách phía trước:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 2 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Túi khí cho hành khách phía sau:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 3 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Túi khí hai bên hàng ghế:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 4 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Túi khí treo phía trên hai hàng ghế trước và sau:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 5 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		
	         			</table>
	         			<hr class="line2"/>
	         			<h3 class="post_body_title">Phanh - Điều khiển</h3>
						{%if brake|length >0 %}
									{% set arr = brake|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
						<table class="other_detail ">
	         				<tr>
			         			<td>Chống bó cứng phanh (ABS):</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 1 in arr%}checked="true"{%endif%} disabled="true" />
									  <span class="checkmark"></span>
									</label>
			         			</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Phân bố lực phanh điện tử (EBD):</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 2 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Trợ lực phanh khẩn cấp (EBA):</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 3 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Tự động cân bằng điện tử (ESP):</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 4 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Điều khiển hành trình:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 5 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Hỗ trợ cảnh báo lùi:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 6 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Hệ thống kiểm soát trượt:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 7 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
	         			</table>    
	         		</div>
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
	         			<h3 class="post_body_title">Khóa chống trộm</h3>
								{%if car_lock|length >0 %}
									{% set arr = car_lock|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
						<table class="other_detail ">
	         				<tr>
			         			<td>Chốt cửa an toàn:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 1 in arr%}checked="true"{%endif%} disabled="true" />
									  <span class="checkmark"></span>
									</label>
			         			</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Khóa cửa tự động:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 2 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Khóa cửa điện điều khiển từ xa:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 3 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Khóa động cơ:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 4 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Hệ thống báo trộm ngoại vi:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 5 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		
	         			</table>
	         			<hr class="line2" />
	         			<h3 class="post_body_title">Các thông số khác</h3>
						{%if car_lock|length >0 %}
									{% set arr = car_lock|json_decode %}
								{%else%}
									{% set arr ={} %}
								{%endif%}
						<table class="other_detail ">
	         				<tr>
			         			<td>Đèn sương mù:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 1 in arr%}checked="true"{%endif%} disabled="true" />
									  <span class="checkmark"></span>
									</label>
			         			</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Đèn cảnh báo thắt dây an toàn:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 2 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Đèn phanh phụ thứ 3 lắp cao:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 3 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>			         		
	         			</table>
	         		</div>
	         	</div>
	         </div>
	         <div class="pn_border_2 tab_item_detail" id="tab_detail_3" style="display:none">
	         	<div class="row">
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left">
	         			<h3 class="post_body_title">Thiết bị tiêu chuẩn</h3>
						{%if standard_equipment|length >0 %}
									{% set arr = standard_equipment|json_decode %}
						{%else%}
									{% set arr ={} %}
						{%endif%}
						<table class="other_detail ">
	         				<tr>
			         			<td>Thiết bị định vị:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 1 in arr%}checked="true"{%endif%} disabled="true" />
									  <span class="checkmark"></span>
									</label>
			         			</td>			         			
			         		</tr>
			         		<tr>
			         			<td>Cửa sổ nóc:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 2 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Kính chỉnh điện:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 3 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Tay lái trợ lực:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 4 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>	
			         		<tr>
			         			<td>Ghế:Chất liệu,tiện nghi..:</td>
			         			<td>{{chair_stuff}}
			         				
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Điều hòa trước:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 5 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Điều hòa sau:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 6 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Hỗ trợ xe tự động:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 7 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Xấy kính sau:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 8 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Quạt kính phía sau:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 9 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Kính mầu:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 10 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Màn hình LCD:</td>
			         			<td>
			         				<label class="cus_checkbox">
									  <input type="checkbox" {%if 11 in arr%}checked="true"{%endif%} disabled="true"/>
									  <span class="checkmark"></span>
									</label>
			         			</td>
			         		</tr>
			         		<tr>
			         			<td>Ghế:Chất liệu,tiện nghi..:</td>
			         			<td>{{audio_video}}</td>
			         		</tr>		         		
	         			</table>
	         		</div>
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
	         			<h3 class="post_body_title">Thiết bị khác</h3>
	         			<div>{{other_equipment|nl2br}}</div>
	         		</div>
	         	</div>
	         </div>
	         <div class="pn_border_2 tab_item_detail" id="tab_detail_4" style="display:none">
	         	<div class="row">
	         		<div class="col-md-6 col-sm-6 col-xs-12 no_padding_left">
	         			<h3 class="post_body_title">Kích thước/Trọng lượng</h3>						
						<table class="other_detail ">
							<tr>
								<td>Dài x Rộng x Cao (mm):</td>
								<td>{{length_width_heigh}}</td>
							</tr>
							<tr>
								<td>Chiều dài cơ sở:</td>
								<td>{{basic_length}}</td>
							</tr>
							<tr>
								<td>Chiều rộng cơ sở trước/sau (mm):</td>
								<td>{{basic_width}}</td>
							</tr>
							<tr>
								<td>Trọng lượng không tải (kg):</td>
								<td>{{weight}}</td>
							</tr>
							<tr>
								<td>Dung tích bình nhiên liệu (lít):</td>
								<td>{{fuel_capacity}}</td>
							</tr>
						</table>
						<hr class="line2"/>
						<h3 class="post_body_title">Động cơ</h3>
						<table class="other_detail ">
							<tr>
								<td>Động cơ:</td>
								<td>{{engine}}</td>
							</tr>
							<tr>
								<td>Kiểu động cơ:</td>
								<td>{{engine_type}}</td>
							</tr>
							<tr>
								<td>Dung tích xi lanh (cc):</td>
								<td>{{cylinder_vol}}</td>
							</tr>
						</table>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 no_padding_right">
	         			<h3 class="post_body_title">Phanh - Giảm xóc - Lốp</h3>						
						<table class="other_detail ">
							<tr>
								<td>Phanh:</td>
								<td>{{brake_des}}</td>								
							</tr>
							<tr>
								<td>Giảm sốc:</td>
								<td>{{absorber}}</td>								
							</tr>
							<tr>
								<td>Lốp xe:</td>
								<td>{{tyre}}</td>								
							</tr>
							<tr>
								<td>Vành mâm xe:</td>
								<td>{{rim}}</td>								
							</tr>
						</table>						
						<hr class="line2"/>
						<h3 class="post_body_title">Thông số kỹ thuật khác</h3>
						<div>{{other_tech_para}}</div>
					</div>
	         	</div>
	         </div>	 
	      </div>
	      <div class="col-md-5 col-sm-12 col-xs-12 margin_top no_padding_left ">
	   	  	 <div class="pn_border_2" style="padding:0px">
	               <div id="slide_img_post">
	                  <ul class="bxslider"  style="height:350px">
	                     {%for img in imglist%}
	                        <li><img src="{{url.get('')}}{{img.img_path}}"></li>
	                     {%endfor%}
	                  </ul>
	               </div>               
	               <div class="imgselect_thumb" id="bx-pager">                  
	                  <ul>
	                     {%for key,img in imglist%}
	                     <li><a data-slide-index="{{key}}"><img src="{{url.get('')}}{{img.img_path}}"></a></li>
	                     {%endfor%}                  
	                  </ul>                 
	               </div>
	           </div>
	           <div class="pn_border_2 margin_top">
	           		<h3 class="post_body_title">Liên hệ người bán</h3>
	           		<div>
	           			<p><i class="fa fa-users"></i><strong style="padding-left:8px;color:#e11a1a;font-size:14px">{{full_name}}</strong></p>
	           			<p><i class="fa fa-map-marker"></i><span>Địa chỉ: {{contract_address}}</span></p>
	           			<p><i class="fa fa-mobile"></i><span>Điện thoại: <strong>{{contract_address}}</strong></span></p>
	           		</div>
	           </div>
	   	  </div>
    	</div>
    	<div class="pn_title">
            <span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
            <h1>Xe cùng model</h1>               
        </div>
    	<div class="new_list pn_border margin_top">    	
               {%for item in relations%}
                  <div class="row pn_background border_bottom">
                     <div class="col-md-2 col-sm-2 col-xs-2 post_img">                     	
                     	<div class="row">
                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}">
                        <img src="{%if item['img_path']|length ==0%}{{url.get('crop/103x74/template1/images/post0.png')}}{%else%}{{url.get('crop/103x74/')}}{{item['img_path']}}{%endif%}" class="img_newlist" alt="{{item['post_name']}}" title="{{item['post_name']}}">
                        </a>
                        </div>
                     </div>
                     <div class="col-md-10 col-sm-10 col-xs-10 no_padding">
                     	<div class="row">
	                     	<div class="col-md-7 col-sm-7 col-xs-7 no_padding">
	                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}" class="post_title">{%if item['post_level']==3%}<i class="fa fa-star"></i>{%endif%}{{item['post_name']}}<span style="color:#000"> [{{item['car_status']}}]</span></a>
	                        </div>
	                        <div class="col-md-3 col-sm-3 col-xs-3 no_padding">
	                        <strong>{%if item['price'] is defined%}{{item['price']}} {{item['unit_name']}}{%else%}Thỏa thuận{%endif%}</strong>  </div>
	                        <div class="col-md-2 col-sm-2 col-xs-2 no_padding">
	                        <strong >{{item['m_provin_name']}}</strong>
	                        </div>
                        </div>
                        <div class="row">
                        	<div class="col-md-7 col-sm-7 col-xs-7 no_padding">
                        		<p>Xe {{item['from_type']}},
                        		{%if item['color_name'] is defined%}màu {{item['color_name']}},{%endif%}
                        		{%if item['fueltype_name'] is defined%}máy {{item['fueltype_name']}},{%endif%}
                        		{%if item['transmission_name']|length >0%}{{item['transmission_name']}},{%endif%}
                        		{%if item['mileage'] >0%}đã đi {{item['mileage']}} km{%endif%} ...
                        		</p>
                        		<p>{{elements.substr_des(item['content'])}} ...</p>
                        	</div>
                        	<div class="col-md-5 col-sm-5 col-xs-5 no_padding">
                        		<p>Liên hệ: <strong>{{item['full_name']}}</strong> {{item['address']}}</p>
                        		<p>ĐT: <strong>{{item['mobie']}}</strong></p>
                        	</div>
                        </div>
                        
                     </div>
                  </div>
               {%endfor%}
         </div>
         <div class="row margin_top" >
            <div class="pn_title">
               <span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>Bình luận</h1>               
            </div>
            <div class="row margin_top pn_background pn_border">
               <ul class="nav nav-tabs" id="comment_tab">
                 <li class="active"><a data-toggle="tab" href="#tab1">Facebook</a></li>
                 <li><a data-toggle="tab" href="#tab2" >Google+</a></li>                 
               </ul>
               <div class="tab-content">
                  <div id="tab1" class="tab-pane fade in active">
                  <div class="fb-comments" data-href="{{url.get('b/')}}{{post_no}}_{{post_id}}" data-width="100%" data-numposts="20"></div>
                                 <div id="fb-root"></div>
                                    <script>(function(d, s, id) {
                                      var js, fjs = d.getElementsByTagName(s)[0];
                                      if (d.getElementById(id)) return;
                                      js = d.createElement(s); js.id = id;
                                      js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=807407399380069";
                                      fjs.parentNode.insertBefore(js, fjs);
                                    }(document, 'script', 'facebook-jssdk'));</script>
                  </div>
                  <div id="tab2" class="tab-pane fade">
                     <div id="google_comments" style="width:100%"></div>
                     <script src="https://apis.google.com/js/plusone.js" type="text/javascript" >{lang: 'vi'}</script>
                     <script>gapi.comments.render('google_comments',{
                        href:window.location.href,
                        width:"725",
                        first_party_property: 'BLOGGER',
                        view_type: 'FILTERED_POSTMOD'}
                        );
                        function fix_google()
                        {                           
                           $("#google_comments").css({"width":"100%"});                           
                           $("#google_comments iframe").css("width","100%");
                        }
                        setTimeout(fix_google,4000);
                     </script>
                  </div>
                  
               </div>
            </div>
            
         </div>         
            
      </div>
      <!-- partial('includes/right2') -->
   </div>
    <!--set banners= elements.get_banner()
    partial('includes/banner_right_2') -->
</div>
{{ stylesheet_link('template1/css/jquery.bxslider.css') }}
{{ javascript_include('template1/js/jquery.bxslider.min.js') }}

<script type="text/javascript">
$(document).ready(function() {
   var map_api_key ='AIzaSyAbkqq1po0p6Z1rnpQSSlO4x32JrdnedY0';
   $('.bxslider').bxSlider({
        pagerCustom: '#bx-pager'
        ,height:300
        ,auto:false
   });
   
   $(document).off('click','.tab_item');
   $(document).on('click','.tab_item',function(){
      $('.tab_item').removeClass('active');
      $(this).addClass('active');
      $('.tab_item_detail').hide();
      $($(this).attr('data-tab')).show();
   });

});
</script>