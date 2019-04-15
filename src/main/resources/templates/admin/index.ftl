<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${siteName!}-后台管理</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="${siteIcoImg}">
    <link href="${ctx!}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx!}/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx!}/admin/css/animate.css" rel="stylesheet">
    <link href="${ctx!}/admin/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <img style="height: 60px; width: 60px" src="${user.url!}" class="img-circle">
                                        <strong class="font-bold">${user.nickName!}</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">${siteName!}
                        </div>
                    </li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <#--<span class="ng-scope">分类</span>-->
                    </li>
                    <li>
                    <#list menuList as menu>
                        <a class="J_menuItem" href="${ctx!}${menu.menuSrc}">
                            <i class="${menu.menuIco}"></i>
                            <span class="nav-label">${menu.menuName}</span>
                        </a>
                    </#list>
                    </li>
                    <#--<li>-->
                       <#--<a class="J_menuItem" href="${ctx!}/admin/user/index">-->
                        <#--<i class="fa fa-user"></i>-->
                        <#--<span class="nav-label">用户管理</span>-->
                       <#--</a>-->
                    <#--</li>-->
                    <#--<li>-->
                       <#--<a class="J_menuItem" href="${ctx!}/admin/category/index">-->
                        <#--<i class="fa fa-tasks"></i>-->
                        <#--<span class="nav-label">分类管理</span>-->
                       <#--</a>-->
                    <#--</li>-->
                    <#--<li>-->
                       <#--<a class="J_menuItem" href="${ctx!}/admin/tag/index">-->
                        <#--<i class="fa fa-tag"></i>-->
                        <#--<span class="nav-label">标签管理</span>-->
                       <#--</a>-->
                    <#--</li>-->
                    <#--<li>-->
                       <#--<a class="J_menuItem" href="${ctx!}/admin/blog/index">-->
                        <#--<i class="fa fa-heart"></i>-->
                        <#--<span class="nav-label">文章管理</span>-->
                       <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                        <#--<a class="J_menuItem" href="${ctx!}/admin/menu/index">-->
                            <#--<i class="fa fa-cog fa-spin"></i>-->
                            <#--<span class="nav-label">系统菜单</span>-->
                        <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                       <#--<a class="J_menuItem" href="${ctx!}/admin/about/index">-->
                        <#--<i class="fa fa-cloud"></i>-->
                        <#--<span class="nav-label">关于我们</span>-->
                       <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                        <#--<a class="J_menuItem" href="${ctx!}/admin/system/index">-->
                            <#--<i class="fa fa-cog fa-spin"></i>-->
                            <#--<span class="nav-label">系统设置</span>-->
                        <#--</a>-->
                    <#--</li>-->
                    <#--<li class="line dk"></li>-->
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-user"></i> <span class="label label-primary"></span>${loginUser.nickName}
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a onclick="modPwd()">
                                        <div>
                                            <i class="fa fa-edit"></i> 修改密码
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a onclick="modImg()">
                                        <div>
                                            <i class="fa fa-edit"></i> 修改头像
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${ctx!}/logout">
                                        <div>
                                            <i class="fa fa-remove"></i> 注销
                                            <span class="pull-right text-muted small">${loginUser.userName}</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="${ctx!}/admin/welcome" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="${ctx!}/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx!}/admin/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx!}/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx!}/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx!}/admin/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${ctx!}/admin/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${ctx!}/admin/js/index.js"></script>
    <script type="text/javascript">
    function modPwd(){
    	layer.open({
  	      type: 2,
  	      title: '修改密码',
  	      shadeClose: true,
  	      shade: false,
          area: ['80%', '75%'],
  	      content: '${ctx!}/update_form',
  	      end: function(index){
  	    	  //修改完密码以后刷新当前页面
  	    	  window.location.reload(true);
  	      }
  	    });
  	}

  	function modImg() {
        layer.open({
            type: 2,
            title: '修改头像',
            shadeClose: true,
            shade: false,
            area: ['50%', '65%'],
            content: '${ctx!}/admin/user/uploadImg',
            end: function(index){
                //修改完密码以后刷新当前页面
                window.location.reload(true);
            }
        });
    }
    </script>
</body>

</html>
