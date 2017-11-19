<!-- page content -->
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
                    <h2></h2>
                    <ul class="nav navbar-rigth panel_toolbox" style="min-width: auto;">
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  	<div class="x_content">
                    <div class="row">
                    	<div class="col-sm-6">
                    	</div>
                    	
                    </div>
						          <form id="form_define" action="" class="form-horizontal form-label-left" enctype="multipart/form-data">
                        {%for item in list%}     
							           <div class="form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >{{item.define_name}}
		                        </label>
		                        <div class="col-md-6 col-sm-4 col-xs-12">
		                          <input type="text" required="required" name="define_val[{{item.define_id}}]" id="define_val" class="form-control col-md-7 col-xs-12" value="{{item.define_val}}" alt="{{item.define_name}}">           
		                        </div>		                        
		                      </div>
                        {%endfor%}  
                          <div class="form-group">
                            <div class="col-md-12 col-sm-12" style="text-align: center">                              
                              <a class="btn btn-success" id="btn_save" >Cập nhật</a>
                            </div>
                          </div>              
                    	</form>
                    </div>
					</div>
					
                  </div>
                </div>
              </div>
            	
            </div>
          </div>
        
        </div>
        <!-- /page content -->
<script>
	$(document).ready(function() {
		
		$(document).off('click','#btn_save'); 
        $(document).on('click','#btn_save',function(event){
        	//$('#form_define').checkValidity();
        	var msg = check_validate_update();
        	if(msg !=""){
        		Pho_message_box_error("Lỗi",msg);
        		return;
        	}
        	var arr = $('#form_define').serializeArray();
        	
			Pho_json_ajax('POST',"{{url.get('define/updatelist')}}" ,arr,function(datas){
				if(datas.status =="OK"){					
					Pho_message_box("Thông báo",datas.msg);					
				}else{
					Pho_message_box_error("Lỗi",datas.msg);
				}
                
            });
        });
		var check_validate_update = function(){
			
        	if($('#define_val').val()==''){
        		return "Bạn chưa nhập "+$('#define_val').attr('alt')+" !";
        	}
        	
        	return "";
        };
	 	

        
    });
</script>