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
            <form>              
              <input type="hidden" name="mtype" value="1">
              <input type="" name="" style="width:80%">
              <button class="btn_search"><i class="fa fa-search"></i>Tìm kiếm</button>
            </form>
            
         </div>
         <div class="row margin_top" >
            <div class="pn_title">
               <!--<span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>TIN RAO MỚI</h1>-->
               <div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title active" data="1">Toàn quốc</a>
                 <a href="javascript:void(0)" class="tab_title" data="2">TP HCM</a>
                 <a href="javascript:void(0)" class="tab_title" data="2">Hà Nội</a>
            	</div>
               <a class="read_more" href="{{url.get('tin-moi')}}">>> Xem thêm tin rao mới</a>
            </div>
            <div class="new_list">
               {%for item in newlist%}
                  <div class="row margin_top_5 pn_background pn_border">
                     <div class="col-md-3 col-sm-3 col-xs-3 post_img">
                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}">
                        <img src="{%if item['img_path']|length ==0%}{{url.get('crop/176x118/template1/images/post0.png')}}{%else%}{{url.get('crop/140x100/')}}{{item['img_path']}}{%endif%}" class="img_newlist" alt="{{item['post_name']}}" title="{{item['post_name']}}">
                        </a>
                     </div>
                     <div class="col-md-9 col-sm-9 col-xs-9">
                        <a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}" class="post_title {%if item['post_level']==3%}sieu_vip{%elseif item['post_level']==2%}vip{%elseif item['post_level']==1%}hot{%endif%}">{%if item['post_level']==3%}<i class="fa fa-star"></i>{%endif%}{{item['post_name']}}</a>
                        <div class="icon_post"><label><!--<i class="fa fa-usd"></i>-->Giá<span>: </span></label><strong>{%if item['price'] is defined%}{{item['price']}} {{item['m_unit_name']}}{%else%}Thỏa thuận{%endif%}</strong>
                        <strong class="icon_dientich"><!--<i class="fa fa-university"></i>-->Diện tích<span>: </span></strong>{%if item['acreage'] is defined%}{{item['acreage']}} m2{%else%}Không xác định{%endif%}
                        </div>
                        <div class="icon_post"></div>
                        <div class="icon_post"><label><!--<i class="fa fa-map-marker"></i>-->Địa chỉ<span>: </span></label>{%if item['m_ward_name'] is defined%}{{item['m_ward_name']}} - {%endif%}
                        {{item['m_district_name']}} - {{item['m_provin_name']}}</div>
                        <span class="post_date">{{item['start_date']}}</span>
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
    $(document).off('click','.tab_title');
    $(document).on('click','.tab_title',function(){
        $(this).parent().find('.tab_title').removeClass('active');
        $(this).addClass('active');      
        $('#mtype').val($(this).attr('data'));      
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