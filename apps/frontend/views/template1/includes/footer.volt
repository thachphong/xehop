<div class="row background_menu" style="margin-top:20px">
         <div class="container" id="menu_footer">            
            <div class="menu_top">
               <ul class="dropDownMenu">                 
                  {{ elements.getMenu_bottom() }}
               </ul>
            </div>
         </div>
      </div>
      <div class="row" id="footer">
         <div class="container" style="margin-bottom:20px;padding-top:15px;">
         	<!--<div class="col-md-3 col-sm-3 col-xs-12" id="footer_col_1">
         		<div class="left_menu_bottom"> 
	         		<ul>
	         			<li><i class="fa-angle-double-righ-smallt"></i><a href="{{url.get('p/huong-dan-dang-tin')}}">Hướng dẫn đăng tin</a></li>
	         			<li><i class="fa-angle-double-righ-smallt"></i><a href="{{url.get('p/quy-che-su-dung')}}">Quy chế sử dụng</a></li>
	         			<li><i class="fa-angle-double-righ-smallt"></i><a href="{{url.get('p/bao-gia')}}">Báo giá</a></li>
	         			<li><i class="fa-angle-double-righ-smallt"></i><a href="{{url.get('p/quy-dinh')}}">Quy định</a></li>
	         		</ul>
         		</div>  
         	</div>   -->
            <div class="col-md-6 col-sm-6 col-xs-12" id="footer_col_1">               
               <p><strong style="color:#015f95;">XẾ HỘP.NET.VN</strong></p>
              <!-- <p><strong style="color:#589b04;;">Địa chỉ:</strong> Tầng 7, tòa nhà BIGOFFICE 152  Vũ Phạm Hàm , Phường Yên Hòa , Quận Cầu Giấy, Hà Nội</p>-->
               <p><strong style="color:#589b04;">Hotline:</strong> 0981 111 222</p>
               <p><strong style="color:#589b04;">Email:</strong> xehophcm@gmail.com</p>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12" id="footer_col_2">
                <!--<div><img src="{{url.get('template1/images/dang_ky_bct.png')}}"> </div>-->
                <!--<ul class="mxh">
                    <li><a href="{{define['facebook_page']}}" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    <li><a href="{{define['tweet_page']}}" target="_blank"><i class="fa fa-twitter-square"></i></a>
                    <li><a href="{{define['youtu_page']}}" target="_blank"><i class="fa fa-youtube-square"></i></a>
                    <li><a href="{{define['google_page']}}" target="_blank"><i class="fa fa-google-plus-square"></i></a>
                    <li><a href="{{define['skype']}}" target="_blank"><i class="fa fa-skype"></i></a>
                    <li><a href="{{define['email']}}" target="_blank"><i class="fa fa-envelope-square"></i></a>
                </ul>   -->
                <ul class="mxh">
            		<li><a href="{{define['facebook_page']}}" target="_blank"><img src="{{url.get('template1/images/facebook.png')}}"/></a>
            		</li>
            		<li><a href="{{define['tweet_page']}}" target="_blank"><img src="{{url.get('template1/images/twitter.png')}}"/></a>
            		</li>
            		<li><a href="{{define['google_page']}}" target="_blank"><img src="{{url.get('template1/images/googleplus.png')}}"/></a>
            		</li>
            		<li><a><img src="{{url.get('template1/images/pinterest.png')}}"/></a>
            		</li>
            		<li><a href="{{define['youtu_page']}}" target="_blank"><img src="{{url.get('template1/images/youtube.png')}}"/></a>
            		</li>
            		<li><a href="{{define['skype']}}" target="_blank"><img src="{{url.get('template1/images/skype.jpg')}}"/></a>
            		</li>
            		<li><a href="{{define['email']}}" target="_blank"><img class="email" src="{{url.get('template1/images/email.png')}}"/></a>
            		</li>
            	</ul>
            	             
            </div>
         </div>
      </div>
      <!--<div class="row">
      	<div class="container">
      		<div id="cfacebook" style="float: right;">
            <a href="javascript:;" class="chat_fb" onclick="return:false;"><i class="fa fa-facebook-square"></i> Hỗ trợ trực tuyến</a>
            <div class="fchat">
            <div class="fb-page" data-tabs="messages" data-href="{{define['facebook_page']}}" data-width="250" data-height="400" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"></div>
            </div>
          </div>
      	</div>
      </div>
<div id="fb-root"></div>-->
<!--<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=807407399380069";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9";
  fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>
  <style>#cfacebook{position:fixed;bottom:0px;right:100px;z-index:999999999999999;width:250px;height:auto;box-shadow:6px 6px 6px 10px rgba(0,0,0,0.2);border-top-left-radius:5px;border-top-right-radius:5px;overflow:hidden;}#cfacebook .fchat{float:left;width:100%;height:270px;overflow:hidden;display:none;background-color:#fff;}#cfacebook .fchat .fb-page{margin-top:-130px;float:left;}#cfacebook a.chat_fb{float:left;padding:0 25px;width:250px;color:#fff;text-decoration:none;height:40px;line-height:40px;text-shadow:0 1px 0 rgba(0,0,0,0.1);background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAqCAMAAABFoMFOAAAAWlBMV…8/UxBxQDQuFwlpqgBZBq6+P+unVY1GnDgwqbD2zGz5e1lBdwvGGPE6OgAAAABJRU5ErkJggg==);background-repeat:repeat-x;background-size:auto;background-position:0 0;background-color:#3a5795;border:0;border-bottom:1px solid #133783;z-index:9999999;margin-right:12px;font-size:14px;}#cfacebook a.chat_fb:hover{color:yellow;text-decoration:none;}</style>
  <script>
  jQuery(document).ready(function () {
  jQuery(".chat_fb").click(function() {
jQuery('.fchat').toggle('slow');
  });
  });
  </script>-->
{{ javascript_include('template1/js/menu_active.js?ver=1.0.5') }}