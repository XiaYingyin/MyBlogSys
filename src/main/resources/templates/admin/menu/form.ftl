<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 系统菜单</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="${siteIcoImg}">
    <link href="${ctx!}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx!}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx!}/admin/css/animate.css" rel="stylesheet">
    <link href="${ctx!}/admin/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>系统菜单</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post" action="${ctx!}/admin/menu/save">
                        	<input type="hidden" id="id" name="id" value="${(menu.id)!}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">菜单名称：</label>
                                <div class="col-sm-8">
                                    <input id="menuName" name="menuName" class="form-control" type="text" value="${(menu.menuName)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">菜单路径：</label>
                                <div class="col-sm-8">
                                    <input id="menuSrc" name="menuSrc" class="form-control" type="text" value="${(menu.menuSrc)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">菜单图标：</label>
                                <div class="col-sm-6">
                                    <input id="menuIco" name="menuIco" class="form-control" type="text"
                                           placeholder="例如：fa fa-circle-o" value="${(menu.menuIco)!}">
                                </div>
                                <input id="ico-btn" class="btn btn-warning" type="button" value="选择图标">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">排序：</label>
                                <div class="col-sm-8">
                                    <input id="sort" name="sort" class="form-control" type="text" value="${(menu.sort)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <!-- 全局js -->
    <script src="${ctx!}/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx!}/admin/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${ctx!}/admin/js/content.js?v=1.0.0"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${ctx!}/admin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/layer/layer.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/layer/laydate/laydate.js"></script>
    <script>
        $(function() {
            //打开图标列表
            $("#ico-btn").click(function(){
                layer.open({
                    type: 2,
                    title:'图标列表',
                    content: '${ctx!}/FontIcoList.html',
                    area: ['80%', '90%'],
                    success: function(layero, index){
                        //var body = layer.getChildFrame('.ico-list', index);
                        //console.log(layero, index);
                    }
                });
            });
        });
    </script>
    <script type="text/javascript">
    $(document).ready(function () {
	    $("#frm").validate({
    	    rules: {
                menuName: {
    	        required: true
    	      },
                menuSrc: {
    	        required: true
    	      },
                menuIco: {
    	        required: true
    	      }
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/menu/save",
   	    		   data: $(form).serialize(),
   	    		   success: function(ret){
   	    			   if(ret.isOk){
		   	    			layer.msg("操作成功", {time: 2000},function(){
		   						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		   						parent.layer.close(index);
		   					});
   	    		   	    }else{
   	    		   	  		layer.msg(ret.msg, {time: 2000});
   	    		   	    }
   	    		   }
   	    		});
            } 
    	});
    });
    </script>

</body>

</html>
