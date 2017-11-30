{{ stylesheet_link('template1/css/jquery-gentleSelect.css?ver=1.0.0') }}
{{ javascript_include('template1/js/jquery-gentleSelect-min.js') }}
{% set banners= elements.get_banner()%}
<div class="row">
    <!--partial('includes/banner_left') -->
   <div class="container" id="content">
   	  <div class="col-md-2 col-sm-2 col-xs-12 margin_top no_padding_left">
   	  	<div class="row margin_top" >
            <div class="dm_title">               
               <h3>Tìm xe theo hãng</h3>               
            </div>
            <div class="dm_border" style="padding:0px" id="cssmenu">
            	<ul class="danhmuc_sp">
            		{{ elements.getdanhmucsp() }}
            	</ul>
            </div>
        </div>
   	  </div>
      <div class="col-md-6 col-sm-12 col-xs-12 margin_top no_padding">
      	 <div class="row margin_top search_border" >
            <div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title active" data="1">Tìm bán ôtô</a>
                 <a href="javascript:void(0)" class="tab_title" data="2">Tìm mua ôtô</a>
            </div>
            <form action="tim" method="GET" id="search_form">
              <input type="text" name="sname" style="width:80%">
              <button class="btn_search"><i class="fa fa-search"></i>Tìm kiếm</button>
            </form>
            
         </div>
         <div class="row margin_top" >
            <div class="pn_title">
               <!--<span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>TIN RAO MỚI</h1>-->
               <div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title active" data="1">Toàn quốc</a>
                 <a href="tim?provin=79" class="tab_title" data="2">TP HCM</a>
                 <a href="tim?provin=1" class="tab_title" data="2">Hà Nội</a>
                 <div style="float: right;">
	                 <select  id="m_provin_id">
	                 	<option>Chọn tỉnh khác</option>
	                 	{%for item in provin_list%}
							<option value="{{item.m_provin_id}}">{{item.m_provin_name}}</option>	
						{%endfor%}
	                 </select>
                 </div>
               </div>
               <!--<a class="read_more" href="{{url.get('tin-moi')}}">>> Xem thêm tin rao mới</a>-->
            </div>
            <div class="new_list pn_border margin_top">
               {%for item in newlist%}
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
            <!-- <div class="row margin_top pn_background pn_border" style="text-align:right">
               <strong><a>>> Xem thêm tin rao mới</a></strong>
               
            </div> -->
         </div>          
                 
            
      </div>
      
      {{ javascript_include('template1/js/ImageScroll.js') }}
      {{ javascript_include('template1/js/jcarousellite.js') }}
<script type="text/javascript">
$(document).ready(function() {
	$('#m_provin_id').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    }); 
    $(document).off('change','#m_provin_id');
    $(document).on('change','#m_provin_id',function(){        
        location.href="{{url.get('tim?provin=')}}" + $(this).val();         
    });
    $(document).off('click','.tab_title');
    $(document).on('click','.tab_title',function(){
        $(this).parent().find('.tab_title').removeClass('active');
        $(this).addClass('active'); 
        if($(this).attr('data')=="1"){
        	$('#search_form').attr('action','tim');
        }else{
        	$('#search_form').attr('action','tim-mua');
        }     
              
    });

		var autocroll= function () {
			var i = 0;
			var len = 7;
			var count = 8;
			var first = true;
			var o = $("#tintuc_new_list").jCarouselLite({
					vertical: true,
					hoverPause: false,
					visible: len,
					start: 1,
					warp: "circle",
					auto: 1,
					speed: 1000,
					beforeStart: function (a) {
						if (!first)
						$(a).parent().delay(1000);
					},
					afterEnd: function (a,b) {
						if (first) {
						first = false;
						}	
															
						$(".news-list-thumb").css("display", "none");
						var data_item = $(a).last().attr('data_item');
						console.log(data_item);	
						$("#li_" + (data_item)).css("display", "block");
						//i++; if (i > count) i = 0;
						$(a).parent().delay(6500);
					}
				});
			};
		autocroll();
	
});
</script>
<script type="text/javascript">

</script>

      {{ partial('includes/right') }}
   </div>   
    <!--partial('includes/banner_right') -->
</div>