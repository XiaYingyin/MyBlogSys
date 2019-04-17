<#macro html title>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="${siteName!}">
    <meta name="keywords" content="${siteName!}">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${title!}</title>
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="${siteIcoImg}">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="${siteName!}"/>
    <meta name="msapplication-TileColor" content="#0e90d2">

    <link rel="stylesheet" href="${ctx!}/front/css/amazeui.min.css">
    <link rel="stylesheet" href="${ctx!}/front/layui/css/layui.css"/>
    <link rel="stylesheet" href="${ctx!}/front/css/app.css"/>
${css!}
</head>
<style>
    element.style {
        margin-top: 7px;
    }
    .am-btn-primary:focus, .am-btn-primary:hover {
        background-color: #009688;
    }
    .am-active .am-btn-primary.am-dropdown-toggle, .am-btn-primary.am-active, .am-btn-primary:active, .am-btn-primary:focus, .am-btn-primary:hover {
        color: #fff;
        border-color: #0a6999;
    }
    .am-btn:focus, .am-btn:hover {
        color: #fff;
        text-decoration: none;
    }
    .am-btn-primary {
        /* color: #fff; */
        background-color: #393d49;
        border-color: #393d49;
    }
    .am-btn-primary {
        color: #fff;
        background-color: #393d49;
        border-color: #393d49;
    }
    .am-btn-primary {
        /* color: #fff; */
        background-color: #393d49;
        border-color: #393d49;
    }
    .am-btn-primary {
        color: #fff;
        background-color: #393d49;
        border-color: #393d49;
    }

    .am-btn-primary {
        color: #fff;
        background-color: #393d49;
        border-color: #393d49;
    }
    .am-active .am-btn-primary.am-dropdown-toggle, .am-btn-primary.am-active, .am-btn-primary:active, .am-btn-primary:focus, .am-btn-primary:hover {
        color: #fff;
        border-color: #009688;
    }

    .am-active .am-btn-primary.am-dropdown-toggle, .am-btn-primary.am-active, .am-btn-primary:active {
        background-image: none;
        background-color: #009688;
    }
</style>
<body id="blog">
<header class="am-topbar am-topbar-fixed-top qing-header">
    <div class="am-g am-g-fixed" style="max-width: 92%;">
        <h1 class="am-topbar-brand qing-logo">
        ${siteName!}
        </h1>
        <!-- nav start -->
        <nav class="am-g am-g-fixed qing-fixed qing-nav" style="margin-left: 4.5em;">
            <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-show-sm-only am-radius qing-btn-mobile"
                    data-am-collapse="{target: '#blog-collapse'}"><span class="am-sr-only">导航切换</span> <span
                    class="am-icon-bars"></span></button>
            <div class="am-collapse am-topbar-collapse" id="blog-collapse">
                <ul class="am-nav am-nav-pills am-topbar-nav nav-menu-box">
                    <li class="am-active"><a href="${ctx!}/b">首页</a></li>
                    <@categoryList>
                        <#list list as x>
                            <li><a href="${ctx!}/b/${(x.id)!}">${(x.name)!}</a></li>
                        </#list>
                    </@categoryList>
                    <li>
                        <div class="am-dropdown" data-am-dropdown>
                            <button style="margin-top: 7px;" class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle>关于我 <span class="am-icon-caret-down"></span></button>
                            <ul class="am-dropdown-content">
                                <li class="am-dropdown-header">关于我</li>
                                <li class="am-active"><a href="${ctx!}/">首页</a></li>
                                <li><a href="${ctx!}/about">介绍</a></li>
                                <li><a href="${ctx!}/album">相册集</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <form class="am-topbar-form am-topbar-right am-form-inline layui-form am-hide-sm-only" role="search"
                      action="${ctx!}/s/">
                    <div class="am-form-group am-form-icon">
                        <input id="keyword" name="keyword" type="text" value="${keyWord!}"
                               class="am-form-field am-input-sm am-radius" placeholder="请输入要搜索的关键词">
                        <i class="am-icon-search"></i>
                        <button type="submit" class="layui-btn layui-btn-small am-hide-sm-only qing-btn-search">搜索
                        </button>
                    </div>
                </form>
            </div>
        </nav>
    </div>
    <!-- nav end -->
</header>
<!--mobile search input start -->
<div class="am-show-sm-only am-u-sm-12 qing-sm-search">
    <form class="m-topbar-form am-topbar-right am-form-inline layui-form" role="search" action="${ctx!}/s/">
        <div class="am-form-group am-form-icon">
            <i class="am-icon-search"></i>
            <input id="keyword" name="keyword" value="${keyWord!}" type="text"
                   class="am-form-field am-form-field am-radius" placeholder="请输入要搜索的关键词">
        </div>
    </form>
</div>
<!--mobile search input end -->
<!-- content srart -->
<div class="am-g am-g-fixed qing-fixed qing-container">
    <!-- 正文内容开始-->
    <div class="am-u-md-9 am-u-sm-12">
        <#nested>
    </div>
    <!--正文内容结束-->

    <!-- 侧边栏 开始-->
    <div class="am-u-md-3 am-u-sm-12">
        <#include "/front/layout/_sidebar.ftl" />
    </div>
    <!-- 侧边栏结束-->
</div>
<!-- content end -->

<footer class="qing-footer">
    <div class="qing-text-center">
        <p class="am-text-sm">${siteDescription!}</p>
    </div>
    <div class="qing-text-center">Copyright © 2019 ${siteName!}  | All Rights Reserved. </div>
</footer>
<script src="${ctx!}/front/js/jquery.min.js"></script>
<script src="${ctx!}/front/js/jquery.yestop.js"></script>
<script src="${ctx!}/front/js/amazeui.min.js"></script>
<script src="${ctx!}/front/layui/layui.js"></script>
<!--光标动画效果 -->


<script type="text/javascript">
    $(document).ready(function () {
        setCurrentNavMenu();
        $.fn.yestop();
    });
    /**
     * 设置当前导航菜单
     */
    function setCurrentNavMenu() {
        var url = location.pathname, navMenus = $(".nav-menu-box li"), navMenus1 = ${".am-dropdown-content li"};
        $.each(navMenus, function(p1, p2) {
            if (!url.indexOf('/b/' + p1)){
                navMenus.eq(p1).addClass("am-active");
                navMenus.eq(0).removeClass("am-active");

            });
        $.each(navMenus1,function (p1,p2) {
            if(!url.indexOf("/about")) {
                navMenus.eq(p1).addClass("am-active");
                navMenus.eq(0).removeClass("am-active");
            } else if(!url.indexOf("/album")) {
                navMenus.eq(p1).addClass("am-active");
                navMenus.eq(0).removeClass("am-active");
            }
        });

    }
</script>

${js!}
</body>
</html>
</#macro>