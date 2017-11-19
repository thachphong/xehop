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
                    <h2>Danh sách menu<!--<small>Users</small>--></h2>
                    <ul class="nav navbar-rigth panel_toolbox" style="min-width: auto;">                      
                      <li><label style="margin: 5px 5px 0px 0;">Tìm</label>                         
                      </li>                      
                      <li><input type="search" id="table_search" class="form-control input-sm" style="float: right;width: 88%">
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="row">
                      <!--<div class="col-sm-2">
                        <label>Menu cấp 1</label>
                      </div>
                      <div class="col-sm-3">                        
                        <select class="form-control">
                          <option>fgsdgsd</option>
                          <option>sgsdgsfgsd</option>
                        </select>
                      </div>-->
                      <div class="col-sm-8">
                      <ul class="nav navbar-left panel_toolbox" > 
                      <%if $level_flg > 1%> 
                        <li><label style="padding: 5px 10px  ">Menu cấp 1</label></li>                      
                        <li><select class="form-control" id="level_1">
                            <option value=""></option>
                            <%foreach $parent_list1 as $pa%>
                              <option value="<%$pa.menu_id%>"><%$pa.menu_name%></option>
                            <%/foreach%>
                        </select>
                        </li>
                        <%if $level_flg > 2%>                      
                        <li><label style="padding: 5px 10px ">Menu cấp 2</label></li>                      
                        <li><select class="form-control" id="level_2">
                          <option value=""></option>                            
                        </select>
                        </li>
                        <%/if%>
                      <%/if%>
                      </ul>
                      </div>
                      <div class="col-sm-4">
                        
                        <div class="dataTables_filter" style="margin-bottom: 10px">
                          <button class="btn btn-primary" id="btn_new">Thêm mới</button>
                          </div>                        
                        </div>
                    </div>
          
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th width="110px">Thứ tự hiển thị</th> 
                          <%if $level_flg == 2%>
                              <th >Menu cấp 1</th>    
                          <%elseif $level_flg == 3%>
                              <th >Menu cấp 1</th>
                              <th >Menu cấp 2</th>
                          <%/if%>
                          <th >Tên menu</th>                                                                      
                          <th>Hiện</th>
                          <th>Sửa</th>   
                          <th>Xóa</th>                         
                        </tr>
                      </thead>
                      <tbody id="fbody">
                      <%foreach $menus as $key=>$item%>
                        <tr>                          
                          <td ><%$item.sort%></td>
                          <%if $level_flg == 2%>
                              <td><%$item.menu_name_1%></td>  
                          <%elseif $level_flg == 3%>
                              <td><%$item.menu_name_2%></td>
                            <td><%$item.menu_name_1%></td>
                          <%/if%>      
                          <td id="name_<%$item.menu_id%>"><%$item.menu_name%></td>                                            
                          <td>                            
                            <span class="fa <%if $item.del_flg == 1%>fa-square-o<%else%>fa-check-square<%/if%>" style="font-size: 16px;"></span>                            
                          </td>
                          <td>
                            <button class="btn btn-warning btn-xs btn_edit" id="edit_<%$item.menu_id%>">Sửa</button>
                          </td>
                          <td>
                            <button class="btn btn btn-danger btn-xs btn_delete" id="del_<%$item.menu_id%>">Xóa</button>
                          </td>
                        </tr>
                      <%/foreach%>                        
                      </tbody>
                    </table>
                    </div>
          </div>
          
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        
        </div>
<script>
  $(document).ready(function() {
    var list_level2= '<%if isset($parent_list2)%><%$parent_list2%><%/if%>';
    if(list_level2.length > 0){
      list_level2 = JSON.parse(list_level2);
    }
    
    var change_option_2= function(val){
      var str_op = '<option value=""></option>';
      //console.log(val);
      //console.log(list_level2);
      for(i=0;i<list_level2.length;i++){
        console.log(list_level2[i].parent_id);
        if(val == list_level2[i].parent_id){
          str_op += '<option value="'+list_level2[i].menu_id+'">'+list_level2[i].menu_name+'</option>';
        }
      };
      //console.log(str_op);
      $('#level_2').empty();
      $('#level_2').append(str_op);
    };
                            
    $(document).off('click','#btn_new'); 
        $(document).on('click','#btn_new',function(event){
          Pho_html_ajax('POST',"<%$smarty.const.ACW_BASE_URL%>menu/new" ,{'menu_level':'<%$level_flg%>'},function(html){
                /*Pho_modal({
                template:html,
                closeClick: false,
                closable: true, 
                modalid:"modal1",
                size:'large'
              
              });*/
              Pho_modal(html,"Thêm Menu",600);
            });
          
        });
        $(document).off('click','.dialog_close'); 
        $(document).on('click','.dialog_close',function(event){         
      Pho_modal_close("modal1");
        });
        $(document).off('click','#btn_save'); 
        $(document).on('click','#btn_save',function(event){
          var arr = $('#form_ctg').serializeArray();  
      Pho_json_ajax('POST',"<%$smarty.const.ACW_BASE_URL%>menu/update" ,arr,function(datas){
        if(datas.status =="OK"){
          Pho_modal_close("modal1");
          //Pho_message_box("Thông báo",datas.msg);
          Pho_direct("<%$smarty.const.ACW_BASE_URL%>menu/list/<%$level_flg%>");
        }else{
          Pho_message_box_error("Lỗi",datas.msg);
        }
                
            });
        });
        $(document).off('click','.btn_delete'); 
        $(document).on('click','.btn_delete',function(event){
          var id = $(this).attr('id');
            id = id.replace("del_","");
          var menu_name = $('#name_'+id).text();
          Pho_message_confirm("Thông báo","Bạn có chắc chắn muốn xóa menu: ["+menu_name+"] ?",function(){
            
        Pho_json_ajax('GET',"<%$smarty.const.ACW_BASE_URL%>menu/delete/" + id,null ,function(datas){
          if(datas.status == "OK"){
            //Pho_modal_close("modal1");
            //Pho_message_box("Thông báo",datas.msg);
            //location.href="<%$smarty.const.ACW_BASE_URL%>menu";
            Pho_direct("<%$smarty.const.ACW_BASE_URL%>menu/list/<%$level_flg%>");
          }else{
            Pho_message_box_error("Lỗi",datas.msg);
          }
                  
              });
          });
          
        });
        $(document).off('click','.btn_edit'); 
        $(document).on('click','.btn_edit',function(event){
          var id = $(this).attr('id');
            id = id.replace("edit_","");      
              Pho_html_ajax('GET',"<%$smarty.const.ACW_BASE_URL%>menu/edit/"+ id ,null,function(html){
                /*Pho_modal({
                template:html,
                closeClick: false,
                closable: true, 
                modalid:"modal1",
                size:'large'
              
              });*/
              Pho_modal(html,"Sửa Menu",600);
            });
        });
        $(document).off('click','.add_child'); 
        $(document).on('click','.add_child',function(event){
          var id = $(this).attr('id');
            id = id.replace("add_","");     
            Pho_html_ajax('GET',"<%$smarty.const.ACW_BASE_URL%>menu/addchild/"+ id ,null,function(html){
                /*Pho_modal({
                template:html,
                closeClick: false,
                closable: true, 
                modalid:"modal1",
                size:'large'
              
              });*/
              Pho_modal(html,"Thêm Menu",600);
            });
        });
        
        $("#table_search").keyup(function(){  
            find_table(this.value);
        });
          
    $(document).off('change','#level_1'); 
        $(document).on('change','#level_1',function(event){
          var val = $("#level_1 option:selected").text();
          //alert(val);
          //console.log($(this).val());
          change_option_2($(this).val());
          find_table(val);
          
        });
        $(document).off('change','#level_2'); 
        $(document).on('change','#level_2',function(event){
          var val = $("#level_1 option:selected").text();
          var val_2 = $("#level_2 option:selected").text();
          find_table(val);
          find_table_2(val_2);          
        });
    function find_table(str_val){
      $("#fbody").find("tr").hide();

      //split the current value of searchInput
            var data = str_val.split(" ");
      //create a jquery object of the rows
            var jo = $("#fbody").find("tr");            
      //Recusively filter the jquery object to get results.
            $.each(data, function(i, v){
                jo = jo.filter("*:contains('"+v+"')");
            });
          //show the rows that match.
            jo.show();
    } 
    function find_table_2(str_val){
      var jo = $("#fbody").find("tr:visible");
      $("#fbody").find("tr").hide();
          var data = str_val.split(" ");
          $.each(data, function(i, v){
             jo = jo.filter("*:contains('"+v+"')");
          });         
          jo.show();
    } 
        
    });
</script>