<div class="row">
	{% set banners= elements.get_banner()%}
   {{ partial('includes/banner_left') }}
   <div class="container" id="content">            
      <div class="col-md-8 col-sm-12 col-xs-12 margin_top no_padding_left">
         <div class="row margin_top pn_background pn_border post_pn" >
            <div class="post_head">
               <h1>{{post_name}}</h1> 
               <div class="khuvuc"><label><i class="fa fa-map-marker2"></i>Khu vực: <a>{{ctg_name}} tại {{m_ward_name}} - {{m_district_name}} - {{m_provin_name}}</a></label></div> 
               <div class="khuvuc">
                  Giá: <span class="postprice">{{price}} {{m_unit_name}}   </span>
                  Diện tích: <span class="postprice">{{acreage}} m2</span>
               </div>
            </div>
            <hr class="line" />
            <div class="post_body">
               <h3 class="post_body_title">Thông tin mô tả</h3>
               <div>
                  {{content|nl2br}}
               </div>
            </div>
            <hr class="line" />
            <div class="post_tab">
               {%if imglist|length >0%}
               <a href="javascript:void(0)" data-tab="#tab_detail_1" class="tab_item active"><i class="fa fa-picture-o"></i>Hình ảnh</a>
               {%endif%}
               {%if youtube_key != ''%}
               <a href="javascript:void(0)" data-tab="#tab_detail_3" class="tab_item {%if imglist|length ==0%} active{%endif%}"><i class="fa fa-play-circle-o"></i>Video</a>
               
               {%endif%}
               <a href="javascript:void(0)" data-tab="#tab_detail_2" class="tab_item {%if imglist|length ==0 and youtube_key == ''%} active{%endif%}"><i class="fa fa-map-marker3"></i>Bản đồ</a>
            </div>
            <!-- <ul class="nav nav-tabs" id="comment_tab">
                 <li class="active"><a data-toggle="tab" href="#tab_detail_1">Facebook</a></li>
                 <li><a data-toggle="tab" href="#tab_detail_2" >Google+</a></li>                 
               </ul> -->
               <!-- <div class="tab-content"> -->
                  <!-- <div id="tab_detail_1" class="tab-pane fade in "> -->
            
              <div class="tab_item_detail" id="tab_detail_1">
               <div>
                  <ul class="bxslider" >
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
            
            {%if youtube_key != ''%}
            <div class="tab_item_detail" id="tab_detail_3" {%if imglist|length !=0 %} style="display:none"{%endif%}>
               <div style="width:100%">
               	  <iframe width="100%" height="60%" src="//www.youtube.com/embed/{{youtube_key}}?wmode=opaque" frameborder="0" allowfullscreen=""></iframe>
               </div>
            </div>
            {%endif%}
         <!--    <div id="tab_detail_2" class="tab-pane fade in active"> -->
            <div class="tab_item_detail" id="tab_detail_2" style="display:block">
               <div id="maps_mapcanvas" style="width:100%">
               </div>
            </div>
           <!--  </div> -->
           <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12 col_left">
               <h3 class="post_body_title">Đặc điểm bất động sản</h3>
               <table class="other_detail">
                  <tr>
                     <td>Mã số</td>
                     <td>{{post_id}}</td>
                  </tr>
                  <tr>
                     <td>Loại tin rao</td>
                     <td>{{ctg_name}}</td>
                  </tr>
                  <tr>
                     <td>ngày đăng tin</td>
                     <td>{{start_date}}</td>
                  </tr>
                  <tr>
                     <td>Ngày hết hạn</td>
                     <td>{{end_date}}</td>
                  </tr>
                  <tr>
                     <td>Hướng nhà</td>
                     <td>{{m_directional_name}}</td>
                  </tr>
                  <tr>
                     <td>Hướng ban công</td>
                     <td>{{huong_bancong}}</td>
                  </tr>
                  <tr>
                     <td>Số phòng ngủ</td>
                     <td>{{room_num}}</td>
                  </tr>
                  <tr>
                     <td>Số toilet</td>
                     <td>{{toilet_num}}</td>
                  </tr>
                  {%if furniture != ''%}
                  <tr>
                     <td>Nội thất</td>
                     <td style="width: 200px">{{furniture|nl2br}}</td>
                  </tr>
                  {%endif%}
               </table>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12 col_right">
               <h3 class="post_body_title">Thông tin liên hệ</h3>
               <table class="other_detail">
                  <tr>
                     <td>Tên liên lạc</td>
                     <td>{{full_name}}</td>
                  </tr>
                  <tr>
                     <td>Địa chỉ</td>
                     <td>{{contract_address}}</td>
                  </tr>
                  <tr>
                     <td>Điện thoại</td>
                     <td>{{phone}}</td>
                  </tr>
                  <tr>
                     <td>Di động</td>
                     <td>{{mobie}}</td>
                  </tr>
                  <tr>
                     <td>Email</td>
                     <td>{{email}}</td>
                  </tr>
               </table>
            </div>
            </div>
            <hr class="line" />
            <div class="row">
            	<div><label style="float: left;padding-top: 16px;font-weight: normal;">Chia sẻ:</label></div>
            	<ul class="mxh">
            		<li><a href="https://www.facebook.com/sharer/sharer.php?u={{url.get('b/')}}{{post_no}}_{{post_id}}" target="_blank"><img src="{{url.get('template1/images/facebook.png')}}"/></a>
            		</li>
            		<li><a href="https://twitter.com/intent/tweet?text={{post_name}}&url={{url.get('b/')}}{{post_no}}_{{post_id}}" target="_blank"><img src="{{url.get('template1/images/twitter.png')}}"/></a>
            		</li>
            		<li><a href="https://plus.google.com/share?url={{url.get('b/')}}{{post_no}}_{{post_id}}" target="_blank"><img src="{{url.get('template1/images/googleplus.png')}}"/></a>
            		</li>
            		<li><a href="http://pinterest.com/pin/create/button/?url={{url.get('b/')}}{{post_no}}_{{post_id}}&description={{post_name}}" target="_blank"><img src="{{url.get('template1/images/pinterest.png')}}"/></a>
            		</li>
	            		<li><a href="https://mail.google.com/mail/u/0/?view=cm&fs=1&to&su={{post_name}}&body={{url.get('b/')}}{{post_no}}_{{post_id}}&ui=2&tf=1" target="_blank"><img class="email" src="{{url.get('template1/images/email.png')}}" /></a>
            		</li>
            	</ul>
            	
            </div>
         </div> 
         <div class="row margin_top" >
            <div class="pn_title">
               <span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>Xêm thêm bất động sản khác</h1>               
            </div>
            <div class="new_list">
               {%for item in relations%}
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
         	<div class="row margin_top pn_background pn_border" style="text-align:right;padding: 0px 5px 5px 0px;">
               <a class="read_more" href="{{url.get('tim?')}}type={{m_type_id}}&provin={{m_provin_id}}&district={{m_district_id}}">>> Xem thêm các tin khác cùng khu vực này</a>
               
            </div> 
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
      {{ partial('includes/right2') }}
   </div>
   {% set banners= elements.get_banner()%}
   {{ partial('includes/banner_right_2') }}
</div>
{{ stylesheet_link('template1/css/jquery.bxslider.css') }}
{{ javascript_include('template1/js/jquery.bxslider.min.js') }}

<script type="text/javascript">
$(document).ready(function() {
   var map_api_key ='AIzaSyAbkqq1po0p6Z1rnpQSSlO4x32JrdnedY0';
   $('.bxslider').bxSlider({
        pagerCustom: '#bx-pager'
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

   var map, ele, mapH, mapW, addEle, mapL, mapN, mapZ;

ele = 'maps_mapcanvas';
addEle = 'maps_address';
mapLat = 'map_lat';
var maplng = "map_lng";
var markers = [];
var map_lat =21.0197704; 
var map_lng = 105.8007434;
{%if map_lat|length > 0%}
  map_lat = {{map_lat}};
{%endif%}
{%if map_lng|length >0%}
  map_lng = {{map_lng}};
{%endif%}

var post_address = '{{address}}';
if(post_address.length ==0){ post_address = "152 Vũ Phạm Hàm , Phường Yên Hòa , Quận Cầu Giấy, Hà Nội";}
    function initMap() {
      mapW = $('#tab_detail_1').innerWidth();
      mapH = mapW * 3 / 5;
     console.log(mapW);
     console.log(mapH);
    // Init MAP
    $('#' + ele).width(mapW).height(mapH > 400 ? 400 : mapH);
        var map = new google.maps.Map(document.getElementById('maps_mapcanvas'), {
          zoom: 15,
          scrollwheel: false,
          center: {lat: map_lat, lng: map_lng}
        });
    
    markers[0] = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(map_lat,map_lng),
          draggable: true,
          animation: google.maps.Animation.DROP
      });
    var infowindow = new google.maps.InfoWindow;
    var div_addr ='<div style="overflow: auto;width:100%;">'+post_address+'</div>'
    infowindow.setContent(div_addr);
        infowindow.open(map, markers[0]);  

      setTimeout(function(){
      		{%if imglist|length !=0 or youtube_key != ''%} 
      			$('#tab_detail_2').hide();
      		{%elseif imglist|length ==0 %}
      			$('#tab_detail_1').hide();
      		{%endif%}
      		
      		},1000
      	);
       
      }

      
</script>
<script async defer  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGWoTNwauIzO_pJEDymaSYTG031uJbbkk&callback=initMap">
    </script>