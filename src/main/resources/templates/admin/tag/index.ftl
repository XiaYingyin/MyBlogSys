<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>标签列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="${siteIcoImg}">
    <link href="${ctx!}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx!}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx!}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <link href="${ctx!}/admin/css/animate.css" rel="stylesheet">
    <link href="${ctx!}/admin/css/style.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>标签管理</h5>
                    </div>
                    <div class="ibox-content">
                        <p>
                      		<button class="btn btn-success " type="button" onclick="add();"><i class="fa fa-plus"></i>&nbsp;添加</button>
                        </p>
                        <hr>
                        <div class="row row-lg">
		                    <div class="col-sm-12">
		                        <!-- Example Card View -->
		                        <div class="example-wrap">
		                            <div class="example">
		                            	<table id="table_list"></table>
		                            </div>
		                        </div>
		                        <!-- End Example Card View -->
		                    </div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="${ctx!}/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx!}/admin/js/bootstrap.min.js?v=3.3.6"></script>
    
	<!-- Bootstrap table -->
    <script src="${ctx!}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <!-- Peity -->
    <script src="${ctx!}/admin/js/plugins/peity/jquery.peity.min.js"></script>

    <script src="${ctx!}/admin/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${ctx!}/admin/js/content.js?v=1.0.0"></script>
    
    <script src="${ctx!}/admin/js/plugins/artTemplate/template.js"></script>
    
    <script id="operateHtml" type="text/html">
    		<button class="btn btn-primary btn-xs" type="button" onclick="edit('{{row.id}}')">
    			<i class="fa fa-edit"></i>&nbsp;修改
    		</button> &nbsp;
        	<button class="btn btn-danger btn-xs" type="button" onclick="del('{{row.id}}')">
        		<i class="fa fa-remove"></i>&nbsp;删除
        	</button> &nbsp;
			<button class="btn btn-warning btn-xs" type="button" onclick="change('{{row.id}}')">
			{{if row.status == 0 }}
        		<i class="fa fa-eye"></i>&nbsp;隐藏
			{{else}}
        		<i class="fa fa-eye"></i>&nbsp;显示
			{{/if}}
        	</button>
    </script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
        	//初始化表格,动态从服务器加载数据  
			$("#table_list").bootstrapTable({
			    //使用get请求到服务器获取数据  
			    method: "POST",
			    //必须设置，不然request.getParameter获取不到请求参数
			    contentType: "application/x-www-form-urlencoded",
			    //获取数据的Servlet地址  
			    url: "${ctx!}/admin/tag/list",
			    //表格显示条纹  
			    striped: true,
			    //启动分页  
			    pagination: true,
			    //每页显示的记录数  
			    pageSize: 10,
			    //当前第几页  
			    pageNumber: 1,
			    //记录数可选列表  
			    pageList: [5, 10, 15, 20, 25],
			    //是否启用查询  
			    search: true,
			    //是否启用详细信息视图
			    detailView:true,
			    detailFormatter:detailFormatter,
			    //表示服务端请求  
			    sidePagination: "server",
			    //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
			    //设置为limit可以获取limit, offset, search, sort, order  
			    queryParamsType: "undefined",
			    //json数据解析
			    responseHandler: function(res) {
			        return {
			        	"rows": res.content,
			            "total": res.totalElements
			        };
			    },
			    //数据列
			    columns: [{
			        title: "ID",
			        field: "id",
			        sortable: true
			    },{
			        title: "名称",
			        field: "name"
			    },{
			        title: "文章数量",
			        field: "count"
			    },{
			        title: "状态",
			        sortable: true,
			        field: "status",
                    formatter: function (value, row, index) {
                        if (value == '0') 
                        	return '<span class="label label-warning">显示</span>';
                        else
                        return '<span class="label label-warning">隐藏</span>';
                    }
			    },{
			        title: "操作",
			        field: "empty",
                    formatter: function (value, row, index) {
                        return template("operateHtml",{"row":row});
                    }
			    }]
			});
        });
        
        function edit(id){
        	layer.open({
        	      type: 2,
        	      title: '标签修改',
        	      shadeClose: true,
        	      shade: false,
                  area: ['80%', '75%'],
        	      content: '${ctx!}/admin/tag/form?id=' + id,
        	      end: function(index){
        	    	  $('#table_list').bootstrapTable("refresh");
       	    	  }
        	    });
        }
        function add(){
        	layer.open({
        	      type: 2,
        	      title: '标签添加',
        	      shadeClose: true,
        	      shade: false,
                  area: ['80%', '75%'],
        	      content: '${ctx!}/admin/tag/form',
        	      end: function(index){
        	    	  $('#table_list').bootstrapTable("refresh");
       	    	  }
        	    });
        }
        function del(id){
        	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
        		$.ajax({
    	    		   type: "POST",
    	    		   dataType: "json",
    	    		   url: "${ctx!}/admin/tag/" + id + "/del",
    	    		   success: function(msg){
	 	   	    			layer.msg(msg.msg||"操作成功", {time: 2000},function(){
	 	   	    				$('#table_list').bootstrapTable("refresh");
	 	   	    				layer.close(index);
	 	   					});
    	    		   }
    	    	});
       		});
        }
        
        function detailFormatter(index, row) {
	        var html = [];
	        html.push('<p><b>描述:</b> </p>');
	        return html.join('');
	    }
        
        function change(id){
       		$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/tag/" + id + "/changeStatus",
   	    		   success: function(msg){
 	   	    			layer.msg(msg.msg||"操作成功", {time: 2000},function(){
 	   	    				$('#table_list').bootstrapTable("refresh");
 	   	    				layer.close();
 	   					});
   	    		   }
   	    	});
        }
    </script>

    
    

</body>

</html>
