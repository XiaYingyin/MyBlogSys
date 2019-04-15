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
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="${ctx!}/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                                <li class="am-active"><a href="${ctx!}/b">首页</a></li>
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
    <#--<div class="am-u-md-9 am-u-sm-12">-->
        <#---->
    <#--</div>-->
    <#nested>
    <!--正文内容结束-->

    <#--<!-- 侧边栏 开始&ndash;&gt;-->
    <#--<div class="am-u-md-3 am-u-sm-12">-->
        <#--<img src="${user.url!}" style="height: 140px;width: 140px;" class= "img-circle" />-->
        <#--<p class="pl2"><a href="#"><i class="fa fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;${user.phone!}</a></p>-->
        <#--<p class="pl2"><a href="#"><i class="fa fa-envelope"></i>&nbsp;&nbsp;&nbsp;${user.emil!}</a></p>-->
        <#--<p class="pl2"><a href="#"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;&nbsp;${user.address!}</a></p>-->
    <#--</div>-->
    <#--<!-- 侧边栏结束&ndash;&gt;-->
</div>
<!-- content end -->

<footer class="qing-footer">
    <div class="qing-text-center">
        <p class="am-text-sm">${siteDescription!}</p>
    </div>
    <div class="qing-text-center">Copyright © 2017 ${siteName!}  | All Rights Reserved. | power by Habib</div>
    <div class="qing-text-center"><a href="http://www.beian.gov.cn">${siteRecordNumber!}</a></div>
</footer>
<script src="${ctx!}/front/js/jquery.min.js"></script>
<script src="${ctx!}/front/js/jquery.yestop.js"></script>
<script src="${ctx!}/front/js/amazeui.min.js"></script>
<script src="${ctx!}/front/layui/layui.js"></script>
<script>
    layui.use('layer', function(){
        var layer = layui.layer;
//            $.getJSON('/jquery/layer/test/photos.json', function(json){
//                layer.photos({
//                    photos: '#layer-photos-demo'
//                    //,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
//                });
//            });
        layer.photos({
            photos: '#layer-photos-demo'
            //,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
        });
    });
</script>
<!--光标动画效果 -->
<script async type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#main').addClass('loaded'); //开场拉幕效果
        setCurrentNavMenu();

        setTimeout(function(){	$('#loader-wrapper').remove();},1000);

        $('.slide .icon li').not('.up,.down').mouseenter(function(){
            $('.slide .info').addClass('hover');
            $('.slide .info li').hide();
            $('.slide .info li.'+$(this).attr('class')).show();//.slide .info li.qq
        });
        $('.slide').mouseleave(function(){
            $('.slide .info').removeClass('hover');
        });

        $('#btn').click(function(){
            $('.slide').toggle();
            if($(this).hasClass('index_cy')){
                $(this).removeClass('index_cy');
                $(this).addClass('index_cy2');
            }else{
                $(this).removeClass('index_cy2');
                $(this).addClass('index_cy');
            }

        });
    });
</script>
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