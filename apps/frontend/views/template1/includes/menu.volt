<div class="row">
         <div class="container" id="header">
            <div class="row" >
               <div class="col-md-4 col-sm-4 col-xs-12">
                  <img src="{{url.get('template1/images/logo.png')}}" />  
               </div>
               {% set login_info= elements.getuser()%}
               <div class="col-md-8 col-sm-8 col-xs-12">
                  <ul class="dang-tin-icon">
                     <li><span class="fa fa-pencil"></span><a href="{{url.get('dang-tin/0')}}">Đăng tin miễn phí</a></li>
                     {%if login_info is defined%}
                        <li><span class="fa fa-users"></span><a href="{{url.get('thanh-vien')}}">{{login_info.user_name}}</a></li>
                        <li><span class="fa fa-sign-out"></span><a href="{{url.get('users/logout')}}">Thoát</a></li>
                     {%else%}
                        <li><span class="fa fa-pencil-square-o"></span><a href="{{url.get('dang-ky')}}">Đăng ký</a></li>
                        <li><span class="fa fa-users"></span><a href="{{url.get('dang-nhap')}}">Đăng nhập</a></li>
                     {%endif%}
                     
                  </ul>
               </div>        
            </div> 
         </div>
      </div>  
      <div class="row background_menu">
         <div class="container" id="header">            
            <div class="menu_top">
               <ul class="dropDownMenu">
                  {{elements.getMenu()}}
               </ul>
            </div>
            <button class="btn_menu_mobi">
            <span data-toggle="collapse" data-target="#nav-menu" class="glyphicon glyphicon-menu-hamburger menu_mobi"></span>
            </button>
            <div id="nav-menu" class="collapse">
               <ul class="vertical_bar">
               		{{ elements.getMenu_mobi() }}
               </ul>
            </div>
         </div>
      </div>