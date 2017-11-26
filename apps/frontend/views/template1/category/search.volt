{{ stylesheet_link('template1/css/jquery-gentleSelect.css?ver=1.0.0') }}
{{ javascript_include('template1/js/jquery-gentleSelect-min.js') }}
<div class="row">
   <div class="container" id="content">            
      <div class="col-md-8 col-sm-12 col-xs-12 margin_top">
         <div class="row margin_top" >
            <div class="pn_title">
               <span class="bg_icon" style="padding: 6px 4px 4px 2px;"><i class="fa fa-list"></i></span>
               <h1>{{ctg_name}}</h1>
              <!--  <label class="read_more" style="font-weight:normal">có <strong>{{total_post}}</strong> tin bất động sản</label> -->
            </div>
            <div class="row dm_border margin_top">
               <div class="row">
                  <label class="col-md-2 col-sm-2 col-xs-12">Hãng xe:</label>
                  <select id="make_id">
                     {%for item in category_1%}
                        <option value="{{item.ctg_id}}" {%if make_id==item.ctg_id%}selected{%endif%}>{{item.ctg_name}}</option>
                     {%endfor%}
                  </select>
               </div>
               <div class="row margin_top" id="div_model" >
                  <label class="col-md-2 col-sm-2 col-xs-12" id="model_label">Đời xe:</label>
                  <select id="model_id">                     
                     <option value="" >-- Đời xe --</option>
                  </select>
               </div>
            </div>
            <div class="new_list">
            <br/>
               <select class="multi_column">
                  <option value="1">Apple</option>
                    <option value="2">Orange</option>
                    <option value="3">Banana</option>
                    <option value="4">Mango</option>
                    <option value="5">Pineapple</option>
                    <option value="6">Guava</option>
                    <option value="7">Grape</option>
                    <option value="8">Sugar Cane</option>
                    <option value="9">Durian</option>
                    <option value="10">Plum</option>
                    <option value="11">Apricot</option>
                    <option value="12">Cumquat</option>
               </select>
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
  <!--      partial('includes/right_search')  -->
   </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
   $('.multi_column').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });
   $('#make_id').gentleSelect({
        columns: 3,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });
   $('#model_id').gentleSelect({
        rows: 10,
        itemWidth: 100,
        openEffect: "fade",
        openSpeed: "fast"
    });
   var model_list = Array();     
      {%for item in category_2%}
         model_list.push(['{{item.ctg_id}}',"{{item.ctg_name}}",'{{item.parent_id}}']);
      {%endfor%}
   var change_model_option= function(model_id){
         var val = $('#make_id').val();
         var option = '<option value="">--Chọn đời xe--</option>';
         $.each(model_list,function(key,item){
            //console.log(item);
            if(val == item[2]){
               if(model_id == item[0] ){
                  option +='<option value="'+item[0]+'" selected >'+item[1]+'</option>';
               }else{
                  option +='<option value="'+item[0]+'" >'+item[1]+'</option>';
               }              
            }
         });
         $('#model_id').empty();
         $('#model_id').append(option);
         var child = $('#div_model').children();
         child.each(function(){
             var id = $(this).attr('id');
             if(id != 'model_label' && id!='model_id'){
                $(this).remove();
             }
         });
         
         $('#model_id').gentleSelect({
              rows: 10,
              itemWidth: 100,
              openEffect: "fade",
              openSpeed: "fast"
          });
      };
   change_model_option('{{model_id}}');
   $(document).off('change','#make_id');
   $(document).on('change','#make_id',function(){        
      change_model_option('');
   });
});
</script>