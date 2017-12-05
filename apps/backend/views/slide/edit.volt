<div class="row" style="width: 700px">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <!--<div class="x_panel">
                  <div class="x_title">
                    <h2>Danh mục</h2>
                    <ul class="nav navbar-right panel_toolbox">-->
                      <!--<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>-->
                      <!--<li style="float: right"><a class="dialog_close" ><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>-->
                  <div class="x_content">
                    <br />
                    <form id="form_ctg" action="" class="form-horizontal form-label-left" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ctg_name">Hình ảnh<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <img id="img_disp" class="img-rounded" width="250" height="130" {%if data.img_path is defined%}src="{{url.get(data.img_path)}}"{%endif%}/>                         
                        </div>                        
                        <div class="col-md-1 col-sm-1 col-xs-12">
                        	<button class="btn btn-primary" type="button" id="btn_upload">Upload</button>
                        	<input  type="file" id="upload_file" style="display: none"/>
                        	
                        </div>
                        <input type="hidden" id="img_path" required="required" name="img_path" class="form-control col-md-7 col-xs-12" value="{{data.img_path}}">
                        <input type="hidden"  name="slide_id" value="{{data.slide_id}}" >  
                        <input type="hidden"  name="banner_flg" value="{{data.banner_flg}}" >
                        <input type="hidden"  name="folder_tmp" value="{{folder_tmp}}" >
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Vị trí</label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                        	<select class="form-control" name="position">                        	 
                          	 <option value="1" {%if data.position == '1'%}selected="selected"{%endif%}>Phía trên</option>
                          	 <option value="2" {%if data.position == '2'%}selected="selected"{%endif%}>Phía dưới</option>
                          	 <option value="3" {%if data.position == '3'%}selected="selected"{%endif%}>Bên trái</option>
                          	 <option value="4" {%if data.position == '4'%}selected="selected"{%endif%}>Bên phải</option>
                           </select>                          
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Link đến trang</label>
                        <div class="col-md-8 col-sm-8 col-xs-12">
                          <input type="text"  class="form-control" name="link_page" value="{{data.link_page}}">
                        </div>
                      </div> 
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Hiện/Ẩn</label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                          <select class="form-control" name="del_flg">
                          	 <option value="0" {%if data.del_flg == 0%}selected="selected"{%endif%}>Hiện</option>
                          	 <option value="1" {%if data.del_flg == 1%}selected="selected"{%endif%}>Ẩn</option>
                          </select>                          
                        </div>
                      </div>                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="text-align: center">
                          <button class="dialog_close btn btn-primary" type="button">Thoát</button>
                          <button class="btn btn-success" id="btn_save" type="button">Cập nhật</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
           <!-- </div>-->
<script>
	
	
	$(document).ready(function() {
		
		
		$(document).off('change','#page_flg'); 
        $(document).on('change','#page_flg',function(event){
        	var val = $(this).val();
        	//change_option(val);
        });
        $(document).off('click','#btn_upload'); 
        $(document).on('click','#btn_upload',function(event){
        	$('#upload_file').click();
        });	
        $(document).off('change','#upload_file'); 
        $(document).on('change','#upload_file',function(event){
        	var corractpath = $(this).val();
        	//var filename = corractpath.replace(/^.*[\\\/]/, '')        	
        	
        	var file_data=$(this).prop("files")[0];
        	//console.log(file_data);	
        	var form_data=new FormData(this);
            form_data.append("file",file_data);
            var base_url= "{{url.get('')}}";
            //console.log(form_data);	
        	Pho_upload("{{url.get('phofile/upload/')}}{{folder_tmp}}" ,form_data,function(datas){
				//if(datas.status =="OK"){
					 //console.log(datas);
				var file_name = datas.link.replace(base_url,"");	
				$('#img_path').val(file_name);	
				$('#img_disp').attr('src',datas.link);			
				//}else{
					//Pho_message_box_error("Lỗi",datas.msg);
				//}
                
            });
        });
	});
	
</script>