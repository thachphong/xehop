<div class="row">
	<div class="container">
		{{ partial('includes/user_left') }}
		<div class="col-md-9 col-sm-12 col-xs-12 margin_top">
			<div class="pn_title margin_top">
					<span class="bg_icon"><i class="fa post-pencil"></i></span>
					<h1>Quản lý tin đăng bán xe </h1>
			</div>
			<div class="row margin_top pn_background pn_border post_pn" >
				<form enctype="multipart/form-data" id="from_post" action="{{url.get('tin-mua')}}" method="get">						
						<div class="row row-margin-bottom">
							<div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
								<input  type="text" name="buyno" value="{{buyno}}" id="buyno" placeholder="Mã tin">
							</div>
							<div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
								<input name="fdate" class="datetimepicker datepost" placeholder="Từ ngày" value="{{fdate}}"/>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
								<input name="tdate" class="datetimepicker datepost" placeholder="đến ngày" value="{{tdate}}"/>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-12 no_padding_left">
								<label class="select_icon">
									<select name="status" id="status" >
										<option value="">--Trạng thái--</option>
										<option value="0" {%if status == '0'%}selected{%endif%}>Tin chờ duyệt</option>
										<option value="1" {%if status == '1'%}selected{%endif%}>Tin đã duyệt</option>
										<option value="2" {%if status == '2'%}selected{%endif%}>Tin không duyệt</option>
									</select>
								</label>
							</div>
														
						</div>
						<div class="row row-margin-bottom">							
							<div class="col-md-10 col-sm-10 col-xs-12 no_padding_left">
								<span style="padding-top: 7px;">Lưu ý: khi nhập mã tin thì các bộ lọc khác không có tác dụng</span>		
							</div>							
							<div class="col-md-2 col-sm-2 col-xs-12">
								<button class="btn_dangtin"><i class="fa fa-search"></i>Tìm</button>		
							</div>													
						</div>
					</form>
            <div class="post_head">
               <div class="row">
               	<div class="table-responsive"> 
						<table class="table table-bordered " style="font-size: 12px;">
							<tr>								
								<th>Mã tin</th>
								<th>Tiêu đề</th>
								<th>Trạng thái</th>
								<th>Ngày đăng</th>								
								<th>Sửa</th>							
								<th>Xóa</th>
							</tr>
							{%for item in list%}
							<tr>
								<td>{{item['buy_id']}}</td>
								<td>{{item['buy_name']}}</td>
								<td>{{item['status']}}</td>
								<td>{{item['add_date']}}</td>								
								<td><a href="{{url.get('dang-tin-mua-xe/')}}{{item['buy_id']}}" class="btn_blue">Sửa</a></td>
								<td><a href="{{url.get('b/delete/')}}{{item['buy_id']}}" class="btn_red_small">Xóa</a></td>
							</tr>
							{%endfor%}						
						</table>
						</div>
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
            <!--<hr class="line" />-->
            
         </div>			
		</div>
	</div>
</div>
{{ stylesheet_link('template1/css/jquery.datetimepicker.css') }}
{{ javascript_include('template1/js/jquery.datetimepicker.full.min.js') }}
<script type="text/javascript">
	$(document).ready(function() {
		$('.datetimepicker').datetimepicker({
          //format:'Y/m/d H:i',
          format:'d/m/Y',
          inline:false,
          timepicker:false,
          lang:'ru'
    	});
	});
</script>
