<#include "/front/layout/__layout_album.ftl">
<#include "/front/layout/_paginate.ftl">
<@html>
<#-- 轮播图开始 -->

<div class="am-slider am-slider-default" data-am-flexslider id="demo-slider-0">
    <ul class="am-slides">
    <#if (page.content?size > 0)>
    <#list carousel.content as x>
            <li style="height: 500px;">
                <img src="${x.src!}" />
            </li>
    </#list>
    <#else>
        <li style="height: 500px;">
            <img src="http://pic1.win4000.com/wallpaper/a/55f8c18720263.jpg" />
        </li>
        <li style="height: 500px;">
            <img src="http://pic1.win4000.com/wallpaper/e/53ec732e6142b.jpg" />
        </li>
        <li style="height: 500px;">
            <img src="http://pic1.win4000.com/wallpaper/c/5947736a401f5.jpg" />
        </li>
        <li style="height: 500px;">
            <img src="http://pic1.win4000.com/wallpaper/6/596835bf7d2ae.jpg?down" />
            <#--<div class="am-slider-desc">风景5</div>-->
        </li>
    </#if>
    </ul>
</div>

<#-- 轮播图结束 -->
<#if (page.content?size > 0)>
    <#list page.content as x>
            <div class="col-sm-4" id="layer-photos-demo">
                <figure class="am-thumbnail">
                    <img src="${x.src!}" alt = "${x.alt!}" layer-pi = "${x.pid}" layer-src = "${x.src}"/>
                    <figcaption class="am-thumbnail-caption">${x.createAt}</figcaption>
                </figure>
            </div>
            <#--<div class="am-u-sm-4">-->
                <#--<a href="#" class="am-thumbnail">-->
                    <#--<img src="http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1308/20/c0/24658483_1376969062003.jpg" alt=""/>-->
                    <#--<figcaption class="am-thumbnail-caption">图片标题 #2</figcaption>-->
                    <#--<figcaption class="am-thumbnail-caption">图片标题 #2</figcaption>-->
                <#--</a>-->
            <#--</div>-->
    </#list>
<#else>
<div class="am-u-sm-4">
    没有任何数据
</div>
</#if>
<!-- 分页 -->
<@paginate currentPage=page.number + 1  totalPage=page.totalPages link="/album/index?p=" />
</@html>
