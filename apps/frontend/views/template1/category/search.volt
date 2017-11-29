{{ stylesheet_link('template1/css/jquery-gentleSelect.css?ver=1.0.0') }}
{{ javascript_include('template1/js/jquery-gentleSelect-min.js') }}
{{ stylesheet_link('template1/css/jquery-ui.css?ver=1.0.0') }}
{{ javascript_include('template1/js/jquery-ui.js') }}
<div class="row">
   <div class="container" id="content">            
      <div class="col-md-8 col-sm-12 col-xs-12 margin_top">
         <div class="row margin_top" >
            <div class="pn_title">
               <span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>{{ctg_name}}</h1>
              <!--  <label class="read_more" style="font-weight:normal">có <strong>{{total_post}}</strong> tin bất động sản</label> -->
            </div>
            <div class="row dm_border margin_top">
            <form method="GET" action="{{url.get('tim')}}">
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Tình trạng xe:</label>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left" >
	                  <label class="control control-radio">Tất cả
						<input type="radio" name="carsta" checked="checked" value=""/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left" >
	                  <label class="control control-radio">Xe mới {{carsta}}
						<input type="radio" name="carsta" value="1" {%if carsta=="1"%}checked="checked"{%endif%}/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left" >
	                  <label class="control control-radio">Xe cũ
						<input type="radio" name="carsta"  value="2" {%if carsta=="2"%}checked="checked"{%endif%}/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
               </div>
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Hãng xe:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  <select id="make_id" name="makeid">
                  	  		<option value="">-- Tất cả --</option>
	                     {%for item in category_1%}
	                        <option value="{{item.ctg_id}}" {%if makeid==item.ctg_id%}selected{%endif%}>{{item.ctg_name}}</option>
	                     {%endfor%}
	                  </select>
                  </div>
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Đời xe:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left" id="div_model">
	                  <select id="model_id" name="modid">                     
	                     <option value="" >-- Tất cả --</option>
	                  </select>
                  </div>
               </div>
                              
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Năm:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left" id="div_model">
	                  <select id="fyear" name="fyear">                     
	                     <option value="" >-- Từ năm --</option>
	                     {%for item in current_year..1989%}
							{%if item==1989%}
								<option value="{{item}}" {%if fyear=='1989'%}selected{%endif%}>Trước 1990</option>
							{%else%}
								<option value="{{item}}" {%if fyear==item%}selected{%endif%}>{{item}}</option>
							{%endif%}
						{%endfor%}
	                  </select>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left" id="div_model">
	                  <select id="tyear" name="tyear">                     
	                     <option value="" >--Đến năm--</option>
	                     {%for item in current_year..1989%}
							{%if item==1989%}
								<option value="{{item}}" {%if tyear=='1989'%}selected{%endif%}>Trước 1990</option>
							{%else%}
								<option value="{{item}}" {%if tyear==item%}selected{%endif%}>{{item}}</option>
							{%endif%}
						{%endfor%}
	                  </select>
                  </div>
               </div>
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Hộp số:</label>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Tất cả
						<input type="radio" name="smissi" checked="checked" value=""/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Số tay
						<input type="radio" name="smissi" value="1" {%if smissi=="1"%}checked="checked"{%endif%}/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Tự động
						<input type="radio" name="smissi"  value="2" {%if smissi=="2"%}checked="checked"{%endif%}/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
               </div>
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Giá:</label>
                  <div class="col-md-10 col-sm-10 col-xs-12 no_padding_left" id="div_model">
                  	 <p id="amount"></p>
	                 <div id="slider-range"></div>
	                 <input type="hidden" id="amount1" name="fprice" value="{{fprice}}">
    				 <input type="hidden" id="amount2" name="tprice" value="{{tprice}}">
                  </div>                  
               </div>
               <div class="row" id="search_advance" style="display: none;">
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Nhiên liệu:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  <label class="select_icon">
      						<select name="fuelid" id="fuelid">
      							<option value="">-- Tất cả --</option>
      							{%for item in fueltype_list%}
      							<option value="{{item.m_fueltype_id}}" {%if fuelid==item.m_fueltype_id%}selected{%endif%}>{{item.m_fueltype_name}}</option>
      							{%endfor%}
      						</select>
      					</label>
                  </div>
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Xuất sứ:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  <label class="select_icon">
						<select name="ftype" id="ftype">
							<option value="">-- Tất cả --</option>
							<option value="1" {%if ftype=='1'%}selected{%endif%}>Nhập khẩu</option>
							<option value="2" {%if ftype=='2'%}selected{%endif%}>Lắp ráp trong nước</option>
						</select>
					  </label>
                  </div>                  
               </div>
               <div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Màu xe:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  	<select name="color" id="color">
							<option value="">-- Tất cả --</option>
							{%for item in color_list%}
							<option value="{{item.m_color_id}}" {%if color==item.m_color_id%}selected{%endif%}>{{item.m_color_name}}</option>
							{%endfor%}
						</select>
                  </div>
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Kiểu dáng:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  		<select name="bodyid" id="bodyid">
							<option value="">-- Tất cả --</option>										
							{%for item in bodytype_list%}
							<option value="{{item.m_body_type_id}}" {%if bodyid==item.m_body_type_id%}selected{%endif%}>{{item.m_body_type_name}}</option>
							{%endfor%}
						</select>
				  </div>                 
               </div>
               <div class="row row-margin-bottom">
               	  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Số chỗ ngồi:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  <label class="select_icon">
						<select name="nseat" id="nseat">
							<option value="">-- Tất cả --</option>
							<option value="1" {%if nseat=='1'%}selected{%endif%}>1-3 chỗ</option>
							<option value="2" {%if nseat=='2'%}selected{%endif%}>4-6 chỗ</option>
							<option value="3" {%if nseat=='3'%}selected{%endif%}>7-8 chỗ</option>
							<option value="4" {%if nseat=='4'%}selected{%endif%}>9-16 chỗ</option>
							<option value="5" {%if nseat=='5'%}selected{%endif%}>>16 chỗ</option>
						</select>
					  </label>
                  </div>
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Dẫn động:</label>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
                  	  <label class="select_icon">
						<select name="drive" id="drive">
							<option value="">-- Chọn --</option>
							{%for item in drivetrain_list%}
							<option value="{{item.m_drivetrain_id}}" {%if drive==item.m_drivetrain_id%}selected{%endif%}>{{item.m_drivetrain_name}}</option>
							{%endfor%}									
						</select>
					</label>
                  </div>
               </div>
               <!--<div class="row row-margin-bottom">
                  <label class="col-md-2 col-sm-2 col-xs-12 title_col_s">Xe có ảnh ?:</label>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Tất cả
						<input type="radio" name="himg" checked="checked" value="0"/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-2 col-sm-2 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Có ảnh
						<input type="radio" name="himg" value="1"/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
                  <div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
	                  <label class="control control-radio">
							        Không có ảnh
						<input type="radio" name="himg"  value="2"/>
						<div class="control_indicator"></div>
					  </label>
                  </div>
               </div>-->
			   </div>
               <div class="row row-margin-bottom">
               	  <div class="col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;padding-top:7px;padding-right:0px;">
                        <i class="fa fa-asterisk"></i>
                        <a href="javascript:void(0)" class="show_search_advance">Tìm kiếm nâng cao</a>
                  </div>
                  <div class="col-md-6 col-sm-6 col-xs-6" style="padding-right:0px;">
                        <button class="btn_search"><i class="fa fa-search"></i>TÌM XE</button>
                  </div>
               </div>
            </form>
            </div>
            <div class="new_list">
            
            </div>           
         </div> 
         <div class="pn_title margin_top">
               <!--<span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>TIN RAO MỚI</h1>-->
               <div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title active" data="1">Toàn quốc</a>
                 <a href="javascript:void(0)" class="tab_title" data="2">TP HCM</a>
                 <a href="javascript:void(0)" class="tab_title" data="3">Hà Nội</a>
                 <a href="javascript:void(0)" class="tab_title" data="4">Đà nẵng</a>
                 <div style="float: right;">
	                 <select  id="m_provin_id">
	                 	<option>Chọn tỉnh khác</option>
	                 	{%for item in provin_list%}
							<option value="{{item.m_provin_id}}">{{item.m_provin_name}}</option>	
						{%endfor%}
	                 </select>
                 </div>
               </div>               
         </div>
         <div class="new_list pn_border margin_top">         	
               {%for item in posts%}
                  <div class="row pn_background border_bottom">
                     <div class="col-md-3 col-sm-3 col-xs-3 post_img">
                     	<div class="row" style="text-align: center">                     	
                     		{{item['car_status']}} <strong>{{item['car_year']}} </strong>                    		
                     	</div>
                     	<div class="row">
                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}">
                        <img src="{%if item['img_path']|length ==0%}{{url.get('crop/103x74/template1/images/post0.png')}}{%else%}{{url.get('crop/103x74/')}}{{item['img_path']}}{%endif%}" class="img_newlist" alt="{{item['post_name']}}" title="{{item['post_name']}}">
                        </a>
                        </div>
                     </div>
                     <div class="col-md-9 col-sm-9 col-xs-9 no_padding">
                     	<div class="row">
	                     	<div class="col-md-7 col-sm-7 col-xs-7 no_padding">
	                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}" class="post_title">{%if item['post_level']==3%}<i class="fa fa-star"></i>{%endif%}{{item['post_name']}}</a>
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
         {%if total_page > 1%}
         <div class="row margin_top" >
            <div class="col-md-12 col-sm-12 col-xs-12" style="display: flex;justify-content: center;">
               <ul class="page_number">
                  {%if page > 1%}
                     <li><a href="{{url.get('')}}{{ctg_no}}&page=1">Trang đầu</a></li>
                     <li><a href="{{url.get('')}}{{ctg_no}}&page={{(page-1)}}">Trang trước</a></li>
                  {%endif%}                 
                  
                  {%for i in  start..end%} 
                    <li {%if page == i%}class="active"{%endif%}><a href="{{url.get('')}}{{ctg_no}}&page={{i}}">{{i}}</a></li>
                  {%endfor%}
                  {%if page < total_page%}
                     <li><a href="{{url.get('')}}{{ctg_no}}&page={{page+1}}">Trang sau</a></li>
                     <li><a href="{{url.get('')}}{{ctg_no}}&page={{total_page}}">Trang cuối</a></li>
                  {%endif%}       
               </ul>
            </div>
         </div>
         {%endif%}
            
      </div>
  <!--      partial('includes/right_search')  -->
      {{ partial('includes/right') }}
   </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$( "#slider-range" ).slider({
      range: true,
      min: 1000000,
      max: 2100000000,
      values: [ {{fprice}}, {{tprice}} ],
      slide: function( event, ui ) {
        $( "#amount" ).html( "Từ " + change_price(ui.values[ 0 ]) + " đến " + change_price(ui.values[ 1 ]) );
		$( "#amount1" ).val(ui.values[ 0 ]);
		$( "#amount2" ).val(ui.values[ 1 ]);
      }
    });
    $( "#amount" ).html( "Từ " + change_price($( "#slider-range" ).slider( "values", 0 )) +
     " đến " + change_price($( "#slider-range" ).slider( "values", 1 )) );
     
	$('#m_provin_id').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });  
   $('#make_id').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"       
    });
    $('#fyear').gentleSelect({
        columns: 3,
        itemWidth: 80,
        openEffect: "fade",
        openSpeed: "fast"       
    });
    $('#tyear').gentleSelect({
        columns: 3,
        itemWidth: 80,
        openEffect: "fade",
        openSpeed: "fast"       
    });
   $('#model_id').gentleSelect({
        rows: 10,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });
    $('#color').gentleSelect({
        columns: 3,
        itemWidth: 70,
        openEffect: "fade",
        openSpeed: "fast"
    });
    $('#bodyid').gentleSelect({
        columns: 2,
        itemWidth: 110,
        openEffect: "fade",
        openSpeed: "fast"
    });
   var model_list = Array();     
      {%for item in category_2%}
         model_list.push(['{{item.ctg_id}}',"{{item.ctg_name}}",'{{item.parent_id}}']);
      {%endfor%}
   var change_model_option= function(model_id){
         var val = $('#make_id').val();
         var option = '<option value="">-- Tất cả --</option>';
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
         var child = $('#div_model').children();
         child.each(function(){
             var id = $(this).attr('id');
             if(id != 'model_label' && id!='model_id'){
                $(this).remove();
             }
         });
         
         $('#model_id').gentleSelect({
              rows: 10,
              itemWidth: 100,
              openEffect: "fade",
              openSpeed: "fast"
          });
      };
   change_model_option('{{modid}}');
   $(document).off('change','#make_id');
   $(document).on('change','#make_id',function(){        
      change_model_option('');
   });
   $(document).off('click','.show_search_advance');
   $(document).on('click','.show_search_advance',function(){        
      if($(this).text()=='Tìm kiếm nâng cao'){
             $(this).text('Bỏ tìm kiếm nâng cao');
             $('#search_advance').show();
        }else{
             $('#search_advance').hide();
              $(this).text('Tìm kiếm nâng cao');
        }
   });
   $(document).off('click','.tab_title');
    $(document).on('click','.tab_title',function(){
        $(this).parent().find('.tab_title').removeClass('active');
        $(this).addClass('active');      
        $('#mtype').val($(this).attr('data'));      
    });
});
function change_price(amount){
	if(amount ==1000000) return '0' ;
	if(amount ==2100000000) return 'không giới hạn' ;
	if(amount < 1000000000){
		return Math.round(amount/1000000) + ' triệu';
	}else{
		return (amount/1000000000).toFixed(1) + ' tỷ';
	}
}
</script>