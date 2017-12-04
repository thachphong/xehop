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
         </div> 
         <div class="pn_title margin_top">
               <!--<span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>TIN RAO MỚI</h1>-->
               <div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title {%if provin==''%}active{%endif%}" data="">Toàn quốc</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='79'%}active{%endif%}" data="79" >TP HCM</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='1'%}active{%endif%}" data="1" >Hà Nội</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='48'%}active{%endif%}" data="48" >Đà nẵng</a>
                 {%if provin !='' and provin !='1' and provin !='48' and provin !='79'%}
                 	  {%for item in provin_list%}
							{%if item.m_provin_id==provin%}
								{%set provin_name=item.m_provin_name%}
							{%endif%}	
					  {%endfor%}
                 	  <a href="javascript:void(0)" class="tab_title active" data="{{provin}}" >{{provin_name}}</a>
                 {%endif%}
                 <div style="float: right;">
                 	<form action="tin-mua-xe" method="get" id="form_search">
                 		<input  type="hidden" name="provin" id="provin" value="{{provin}}"/>
	                 <select  id="m_provin_id">
	                 	<option>Chọn tỉnh khác</option>
	                 	{%for item in provin_list%}
							<option value="{{item.m_provin_id}}">{{item.m_provin_name}}</option>	
						{%endfor%}
	                 </select>
	                 </form>
                 </div>
               </div>               
         </div>
         <div class="search_border margin_top">
         	<div class="row search_tab">
                 <a href="javascript:void(0)" class="tab_title {%if provin==''%}active{%endif%}" data="">Tất cả</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='79'%}active{%endif%}" data="79" >Dưới 200 triệu</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='1'%}active{%endif%}" data="1" >200-400 triệu</a>
                 <a href="javascript:void(0)" class="tab_title {%if provin=='48'%}active{%endif%}" data="48" >400-600 triệu</a>               		  </div>
         </div>
         <div class="new_list pn_border margin_top">         	
               {%for item in list%}
                  <div class="row pn_background border_bottom">                     
                     <div class="col-md-12 col-sm-12 col-xs-12 no_padding">
                     	<div class="row">
	                     	<div class="col-md-8 col-sm-8 col-xs-8 no_padding">
	                        <strong >{{item['buy_name']}}[{{item['price_range']}}]</strong>
	                        </div>
	                        <div class="col-md-2 col-sm-2 col-xs-2 no_padding">
	                        	{{item['add_date']}}
	                        </div>
	                        <div class="col-md-2 col-sm-2 col-xs-2 no_padding">
	                        <strong >{{item['m_provin_name']}}</strong>
	                        </div>
                        </div>
                        <div class="row">
                        	<div class="col-md-8 col-sm-8 col-xs-8 no_padding">
                        		<p>{{item['content']}}</p>
                        	</div>
                        	<div class="col-md-4 col-sm-4 col-xs-4 no_padding">
                        		<p>Liên hệ: <strong>{{item['user_name']}}</strong> {{item['address']}}</p>
                        		<p>ĐT: <strong>{{item['mobile']}}</strong></p>
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
	$('#m_provin_id').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });     
   
   $(document).off('click','.tab_title');
    $(document).on('click','.tab_title',function(){
        $(this).parent().find('.tab_title').removeClass('active');
        $(this).addClass('active');      
        $('#provin').val($(this).attr('data')); 
        $('#form_search').submit();    
    });
    $(document).off('change','#m_provin_id');
    $(document).on('change','#m_provin_id',function(){        
        $('#provin').val($(this).val()); 
        $('#form_search').submit(); 
    });
    
});

</script>