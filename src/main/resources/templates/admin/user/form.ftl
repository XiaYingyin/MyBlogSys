<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 用户信息</title>
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
                        <h5>用户信息</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post" action="${ctx!}/admin/user/save">
                        	<input type="hidden" id="id" name="id" value="${(user.id)!}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">账户名：</label>
                                <div class="col-sm-8">
                                    <input id="userName" name="userName" class="form-control" type="text" value="${(user.userName)!}" <#if user?exists> readonly="readonly" </#if>>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">昵称：</label>
                                <div class="col-sm-8">
                                    <input id="nickName" name="nickName" class="form-control" type="text" value="${(user.nickName)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">盐资源：</label>
                                <div class="col-sm-8">
                                    <input id="salt" name="salt" class="form-control" type="text" value="${(user.salt)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-8">
                                    <input id="password" name="password" class="form-control" type="password" value="${(user.password)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">状态：</label>
                                <div class="col-sm-8">
                                	<select name="status" class="form-control">
                                		<option value="-1"  <#if user.status == -1> selected="selected" </#if> >锁定</option>
                                		<option value="0"   <#if user.status == 0> selected="selected"  </#if> >未激活</option>
                                		<option value="1"   <#if user.status == 1> selected="selected" </#if> >已激活</option>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">头像：</label>
                                <div class="col-sm-8">
                                    <input id=url name="url" class="form-control" type="text" value="${(user.url)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">电话：</label>
                                <div class="col-sm-8">
                                    <input id=phone name="phone" class="form-control" type="text" value="${(user.phone)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">邮箱：</label>
                                <div class="col-sm-8">
                                    <input id=emil name="emil" class="form-control" type="text" value="${(user.emil)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">地址：</label>
                                <div class="col-sm-8">
                                    <input id=address name="address" class="form-control" type="text" value="${(user.address)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">描述：</label>
                                <div class="col-sm-8">
                                    <input id="description" name="description" class="form-control" value="${(user.description)!}">
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
    	    	userName: {
    	        required: true,
    	        minlength: 4,
    	        email: true
    	      },
    	      	nickName: {
    	        required: true,
    	        minlength: 1,
    	    	maxlength: 10
    	      },
    	      	salt: {
    	        required: true,
    	        minlength: 10
    	      },
    	      	description: {
    	        required: true,
    	        maxlength: 40
    	      }
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/user/save",
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
