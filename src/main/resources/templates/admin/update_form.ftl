<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>密码修改</title>
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
                        <h5>密码修改</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="POST">
                        	<input type="hidden" id="id" name="id" value="${(tag.id)!}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">原始密码：</label>
                                <div class="col-sm-8">
                                    <input id="oldpassword" name="oldpassword" class="form-control" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码：</label>
                                <div class="col-sm-8">
                                    <input id="password1" name="password1" class="form-control" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">重复新密码：</label>
                                <div class="col-sm-8">
                                    <input id="password2" name="password2" class="form-control" type="password">
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
				oldpassword: {
	    	        required: true,
	    	        minlength: 2,
	    	        maxlength: 20
				},
				password1: {
	    	        required: true,
	    	        minlength: 2,
	    	        maxlength: 20
				},
				password2: {
	    	        required: true,
	    	        equalTo: '#password1',
	    	        minlength: 2,
	    	        maxlength: 20
				}
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/updatePwd",
   	    		   data: $(form).serialize(),
   	    		   success: function(msg){
	   	    			layer.msg(msg.msg||"操作成功", {time: 2000},function(){
	   						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	   						parent.layer.close(index); 
	   					});
   	    		   }
   	    		});
            } 
    	});
    });
    </script>

</body>

</html>
