<#--<div id="wrapper">-->
    <#--<div id="content">-->
        <#--<div class="grid-16-8 clearfix">-->
            <#--<div class="article">-->
               <#---->
            <#--</div>-->
            <#--<div class="aside">-->
               <#---->
            <#--</div>-->
            <#--<div class="extra">-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->

<div class="am-g am-g-fixed qing-fixed qing-container">
    <!-- 正文内容开始-->
    <div class="am-u-md-9 am-u-sm-12">
        <img src="${user.url!}" style="height: 140px;width: 140px;" class= "img-circle" />
        <p class="pl2"><a href="#"><i class="fa fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;${user.phone!}</a></p>
        <p class="pl2"><a href="#"><i class="fa fa-envelope"></i>&nbsp;&nbsp;&nbsp;${user.emil!}</a></p>
        <p class="pl2"><a href="#"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;&nbsp;${user.address!}</a></p>
    </div>
    <!--正文内容结束-->

    <!-- 侧边栏 开始-->
    <div class="am-u-md-3 am-u-sm-12">
        ${siteAboutMe!}
    </div>
    <!-- 侧边栏结束-->
</div>