<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="${siteIcoImg}">
  <link rel="stylesheet" href="${ctx!}/front/layui/css/layui.css"  media="all">
</head>
<body style="margin: 0 auto;">
 
<div class="layui-upload" style="margin-top: 50px;margin-left: 50px">
  <div class="layui-upload-list">
    <img class="layui-upload-img" style="height: 50%; width: 50%;" id="demo1">
    <p id="demoText"></p>
  </div>
  <button type="button" class="layui-btn" style="margin-left: 50px" id="test1">上传头像</button>
</div>
<script src="${ctx!}/front/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: '${ctx!}/admin/user/upload'
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
      });
    }
    ,done: function(res){
      if(res.success){
        return layer.msg(res.msg,function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        });
      }
       return layer.msg(res.msg);
    }
    ,error: function(){
      //演示失败状态，并实现重传
      var demoText = $('#demoText');
      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
      demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
      });
    }
  });
  
});
</script>

</body>
</html>