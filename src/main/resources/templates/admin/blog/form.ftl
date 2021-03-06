<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>${siteName!}-添加博客</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="${siteIcoImg}">
    <link href="${ctx!}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx!}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx!}/admin/css/animate.css" rel="stylesheet">
    <link href="${ctx!}/admin/css/style.css?v=4.1.0" rel="stylesheet">
    
    <link href="${ctx!}/admin/js/plugins/tagit/css/jquery.tagit.css" rel="stylesheet">
    <link href="${ctx!}/admin/js/plugins/tagit/css/tagit.ui-zendesk.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="${ctx!}/admin/js/plugins/simditor-2.3.6/styles/simditor.css" />
    
    

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑博客</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post" action="${ctx!}/admin/blog/save">
                        	<input type="hidden" id="id" name="id" value="${(blog.id)!}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题：</label>
                                <div class="col-sm-10">
                                    <input id="title" name="title" class="form-control" type="text" value="${(blog.title)!}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">分类：</label>
                                <div class="col-sm-10">
                                	<select name="category" class="form-control">
                                		<#list categories as x>
                                			<option value="${x.id}" 
                                			<#if (blog.category == x.id)> selected="selected" </#if>
                                			>${x.name}</option>
                                		</#list>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">权限：</label>
                                <div class="col-sm-10">
                                	<select name="privacy" class="form-control">
                               			<option value="0" <#if (blog.privacy == 0)>selected="selected" </#if>>公开</option>
                               			<option value="1" <#if (blog.privacy == 1)>selected="selected" </#if>>私密</option>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容：</label>
                                <div class="col-sm-10">
                               		<textarea id="editor" name="content" class="form-control">${(blog.content)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签：</label>
                                <div class="col-sm-10">
                                    <input type="hidden" name="tags" id="fieldTags" value="${(blog.tags)!}">
									<ul id="tags" class="am-selected-text"></ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-2">
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
    
	<script type="text/javascript" src="${ctx!}/admin/js/plugins/simditor-2.3.6/scripts/module.js"></script>
	<script type="text/javascript" src="${ctx!}/admin/js/plugins/simditor-2.3.6/scripts/hotkeys.js"></script>
	<script type="text/javascript" src="${ctx!}/admin/js/plugins/simditor-2.3.6/scripts/uploader.js"></script>
	<script type="text/javascript" src="${ctx!}/admin/js/plugins/simditor-2.3.6/scripts/simditor.js"></script>    
	
    <script type="text/javascript" src="${ctx!}/admin/js/plugins/tagit/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${ctx!}/admin/js/plugins/tagit/js/tag-it.min.js"></script>
    <script type="text/javascript">
    var editor;
    $(document).ready(function () {
    	editor = new Simditor({
    		textarea: $('#editor'),
		  	upload:{
		  		url: '${ctx!}/upload/image',
		    	params: null,
		    	fileKey: 'upload_file',
		    	connectionCount: 3,
		    	leaveConfirm: '图片正在上传中，是否真的离开此页?'
		  	},
		  	toolbar: ['title','bold','italic','underline','strikethrough','fontScale','color','ol' ,'ul','blockquote','code','table','link','image','hr','indent','outdent','alignment']
		});
    	
	    $("#frm").validate({
    	    rules: {
    	    	title: {
    	        required: true,
    	        minlength: 2,
    	        maxlength: 30
    	      }
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	    	var content = editor.getValue();
    	    	if(!content){
    	    		layer.msg("请输入博客内容",{icon:2});
    	    		return;
    	    	}
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/blog/save",
   	    		   data: $(form).serialize(),
   	    		   success: function(msg){
	   	    			layer.msg(msg.msg||"操作成功", {time: 2000},function(){
	   	    				//只有添加成功了 ，才能关闭当前窗口
	   	    				if(msg.isOk){
	   	    					layer.closeAll();
		   						window.location.href = "${ctx!}/admin/blog/index";
	   	    				}
	   					});
   	    		   }
   	    		});
            } 
    	});
	    
	    $.ajax({
     	  url: "${ctx!}/admin/tag/tags_name",
     	  cache: false,
     	  success: function(json){
     		$('#tags').tagit({ 
     			//输入提示 
     			availableTags: json, 
     			// 与赋值操作有关 
     			singleField: true, 
     			allowSpaces: true, 
     			//标签中是否允许空格 
     			singleFieldNode: $('#fieldTags') //将值保存到mySingleField元素 
     		}); 
     	  }
     	});
    });
    </script>

</body>

</html>
