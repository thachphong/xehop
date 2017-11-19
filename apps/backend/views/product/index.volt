<!-- page content -->
<style type="text/css">
.optionGroup{
    font-weight: bold;
    font-style: italic;
}
.pager .active a{
		 background-color: rgba(10, 75, 166, 0.86);
    		color: #fff;
	}
	.pager .active a:hover{		 
    	color: #000;
	}
</style>
        <div class="right_col" role="main" style="min-height: 600px">
          <div class="">
            <!--<div class="page-title">
              <div class="title_left">
                <h3>Quản lý danh mục </h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>-->

            <div class="clearfix"></div>

            <div class="row">              
			  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Danh sách tin rao<!--<small>Users</small>--></h2>
                    <!--<ul class="nav navbar-rigth panel_toolbox" style="min-width: auto;">
                      <li><label style="padding-top:5px">Tìm</label></li>	
                      <li><input type="search" id="table_search" class="form-control input-sm" style="float: right;width: 88%"></li>
                      
                    </ul>-->
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	<form method="GET" action="{{url.get('product')}}">
                    <div class="row form-group">
                    	<label class="col-sm-1">Loại BĐS</label>
                    	<div class="col-sm-2">
                    		<select class="form-control" name="ctgid">
                    			<option value=""></option>
                    			{%for item in categorys%}
                    				<option value="{{item['ctg_id']}}" {%if item['cnt_child'] >0%}class="optionGroup"{%endif%}>{%if item['ctg_level'] >=2%}&nbsp;&nbsp;&nbsp;{%endif%}{{item['ctg_name']}}</option>
                    			{%endfor%}
                    		</select>                		
                    	</div>                    	
                    	<label class="col-sm-1">Từ ngày</label>
                    	<div class="col-sm-2">
                    		<input type="text" name="fdate" class="form-control datetimepicker">                    		
                    	</div>
                    	<label class="col-sm-1">Đến ngày</label>
                    	<div class="col-sm-2">
                    		<input type="text" name="tdate" class="form-control datetimepicker">                    		
                    	</div>
                    	<label class="col-sm-1">Trạng thái</label>
                    	<div class="col-sm-2">                    		
                    		<select class="form-control" name="status">
                    			<option value=""></option>
                    			<option value="0">Chưa duyệt</option>
                    			<option value="1">Đã duyệt</option>
                    			<option value="2">Không duyệt</option>
                    		</select>                    		
                    	</div>                    	
                    </div>
					<div class="row" >
						<label class="col-sm-1">Mã tin</label>
                    	<div class="col-sm-2">
                    		<input type="text" name="pid" class="form-control" value="">                    		
                    	</div>
						<div class="col-sm-8">
						</div>
						<div class="col-sm-1">
							<input class="btn btn-info" id="btn_find" type="submit" value="Tìm">
						</div>
					</div>
					</form>
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
					<div class="row">
                    	<div class="col-sm-12">
                      <thead>
                        <tr>
                          <th>Mã tin</th>
                          <th>Loại BĐS</th>
                          <th>Tiêu đề</th>
                          <th>Trạng thái</th>
                          <!-- <th>Giá cũ</th>                       
                          <th>Giá mới</th> -->
                          <th>Ngày đăng</th>   
                          <th>Hết hạn</th>                         
                          <th>Duyệt</th>
                          <th>Không duyệt</th>                        
                        </tr>
                      </thead>
                      <tbody id="fbody">
                      {%for key,item in list%}
                      	<tr>
                          <td>{{item['post_id']}}</td>  
                          <td>{{item['ctg_name']}}</td>  
                          <td><a href="{{url.get('b/')}}{{item['post_no']}}_{{item['post_id']}}" target="_blank">{{item['post_name']}}</a></td>                     
                          <td id="status_{{item['post_id']}}">{{item['status_name']}}</td>
                          <td>{{item['start_date']}}</td>
                          <td>{{item['end_date']}}</td>                         
                          <!--<td>                          	
                          	<span class="fa <%if $item.del_flg == 1%>fa-square-o<%else%>fa-check-square<%/if%>" style="font-size: 16px;"></span>                          	
                          </td>-->
                          <td>
                          	<button id="appr_{{item['post_id']}}" class="btn btn-warning btn-xs" onclick="approval({{item['post_id']}})" {%if item['status']==1%}disabled="disabled"{%endif%}>Duyệt</button>
                          </td>
                          <td>
                          	<button id="unappr_{{item['post_id']}}" class="btn btn btn-danger btn-xs" onclick="unapproval({{item['post_id']}})" {%if item['status']==2%}disabled="disabled"{%endif%}>Không duyệt</button>
                          </td>
                        </tr>
                      {%endfor%}                        
                      </tbody>
                    </table>
                    {%if total_page > 1%}
         <div class="row margin_top" >
            <div class="col-md-12 col-sm-12 col-xs-12" style="display: flex;justify-content: center;">
               <ul class="pager">
                  {%if page > 1%}
                     <li><a href="{{url.get('')}}{{ctg_no}}&page=1">Trang đầu</a></li>
                     <li><a href="{{url.get('')}}{{ctg_no}}&page={{(page-1)}}">Trang trước</a></li>
                  {%endif%}                 
                  
                  {%for i in  start..end%} 
                    <li {%if page == i%}class="active"{%endif%}><a href="{%if page != i%}{{url.get('')}}{{ctg_no}}&page={{i}}{%else%}#{%endif%}">{{i}}</a></li>
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
					</div>
					
                  </div>
                </div>
              </div>
            	
            </div>
          </div>
        
        </div>
        <!-- /page content -->
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
    function approval(post_id){
    	jsion_ajax("{{url.get('product/appr/')}}"+post_id,null,function(){});
    	$('#appr_'+post_id).prop('disabled',true);
    	$('#status_'+post_id).text("Đã duyệt");
    	$('#unappr_'+post_id).prop('disabled',false);
    }
    function unapproval(post_id){
    	jsion_ajax("{{url.get('product/unappr/')}}"+post_id,null,function(){});
    	$('#unappr_'+post_id).prop('disabled',true);
    	$('#status_'+post_id).text("Không duyệt");
    	$('#appr_'+post_id).prop('disabled',false);
    }
</script>