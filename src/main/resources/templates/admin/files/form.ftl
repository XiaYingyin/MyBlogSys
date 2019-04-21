<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>图片列表</title>
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
                        <h5>图片列表</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post" action="${ctx!}/admin/files/save">
                        	<input type="hidden" id="id" name="id" value="${(album.id)!}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图片名称：</label>
                                <div class="col-sm-8">
                                    <input id="alt" name="alt" class="form-control" type="text" value="${(album.alt)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图片描述：</label>
                                <div class="col-sm-8">
                                    <input id="description" name="description" class="form-control" type="text" value="${(album.description)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">标题：</label>
                                <div class="col-sm-8">
                                    <input id="tiltle" name="tiltle" class="form-control" type="text" value="${(album.tiltle)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图片：</label>
                                <div class="col-sm-8">
                                    <input id="src" name="src" class="form-control" type="text" value="${(album.src)!}">
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">状态：</label>
                                <div class="col-sm-8">
                                	<select name="status" class="form-control">
                                		<option value="0"  <#if album.status == 0> selected="selected" </#if> >显示</option>
                                		<option value="1"   <#if album.status == 1> selected="selected"  </#if> >隐藏</option>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">轮播图：</label>
                                <div class="col-sm-8">
                                    <select name="carousel" class="form-control">
                                        <option value="0"  <#if album.status == 0> selected="selected" </#if> >不显示</option>
                                        <option value="1"   <#if album.status == 1> selected="selected"  </#if> >显示</option>
                                    </select>
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
    <script type="text/javascript">
    $(document).ready(function () {
	    $("#frm").validate({
    	    rules: {
                alt: {
    	            required: true
    	      },
                src: {
                    required: true
                }
            },
    	    messages: {},
    	    submitHandler:function(form){
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/files/save",
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
	    $("#btnUpload").click(function () {
            layer.open({
                type: 2,
                title: '上传图片',
                shadeClose: true,
                shade: false,
                area: ['50%', '65%'],
                content: '${ctx!}/admin/files/uploadImg?id=' + $("#id").val()
            });
        });
    });

    </script>

</body>

</html>
