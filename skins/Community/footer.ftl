<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-2018, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<div class="content paddingTop12 paddingBottom12">
    <div class="left">
        <div>
            <span style="color: gray;">&copy; ${year}</span> - <a href="${servePath}">${blogTitle}</a>${footerContent}
        </div>
        Powered by <a href="https://b3log.org" target="_blank">B3log 开源</a> • <a href="https://solo.b3log.org" target="_blank">Solo</a> ${version}&nbsp;&nbsp;
        Theme <a rel="friend" href="https://github.com/b3log/solo-skins" target="_blank">Community</a>
        by <a rel="friend" href="http://vanessa.b3log.org" target="_blank">Vanessa</a>.
    </div>
    <div class="right nowrap">
        <div class="goTop right" onclick="Util.goTop();">${goTopLabel}</div>
        <br/>
        <div class="right">
            ${viewCount1Label}
            <span class='error-msg'>
                ${statistic.statisticBlogViewCount}
            </span>
            &nbsp;&nbsp;
            ${articleCount1Label}
            <span class='error-msg'>
                ${statistic.statisticPublishedBlogArticleCount}
            </span>
            &nbsp;&nbsp;
            ${commentCount1Label}
            <span class='error-msg'>
                ${statistic.statisticPublishedBlogCommentCount}
            </span>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script type="text/javascript">
    var latkeConfig = {
        "servePath": "${servePath}",
        "isLoggedIn": "${isLoggedIn?string}",
        "staticServePath": "${staticServePath}"
    };
    
    var Label = {
        "adminLabel": "${adminLabel}",
        "logoutLabel": "${logoutLabel}",
        "skinDirName": "${skinDirName}",
        "loginLabel": "${loginLabel}",
        "loginLabel": "${loginLabel}",
        "em00Label": "${em00Label}",
        "em01Label": "${em01Label}",
        "em02Label": "${em02Label}",
        "em03Label": "${em03Label}",
        "em04Label": "${em04Label}",
        "em05Label": "${em05Label}",
        "em06Label": "${em06Label}",
        "em07Label": "${em07Label}",
        "em08Label": "${em08Label}",
        "em09Label": "${em09Label}",
        "em10Label": "${em10Label}",
        "em11Label": "${em11Label}",
        "em12Label": "${em12Label}",
        "em13Label": "${em13Label}",
        "em14Label": "${em14Label}"
    },
    maxLength = parseInt("${mostCommentArticles?size}");

    $(document).ready(function () {
        // article header: user list.
        var isAuthorArticle = false;
        $(".header-user a").each(function () {
            var it = this;
            if (window.location.pathname === it.pathname) {
                it.className = "star-current-icon";
                isAuthorArticle = true;
            }
        });
        if (isAuthorArticle) {
            $(".moon-current-icon").removeClass().addClass("moon-icon");
        }

        Util.init();
        
        $(".footer-block").each(function (num) {
            var $lis = $(this).find("li");
            if ($lis.length > maxLength) {
                for (var i = maxLength; i < $lis.length; i++) {
                    $lis.get(i).style.display = "none";
                }
                $(this).find("h4").append("<span class='down-icon' onmouseover=\"showFooterBlock(this, " + num + ");\"></span>");
            }
        });
    });

    var showFooterBlock = function (it, num) {
        var $li = $($(".footer-block").get(num)).find("li");
        for (var i = maxLength; i < $li.length; i++) {
            if (it.className === "down-icon") {
                $($li.get(i)).slideDown("normal");
            } else {
                $($li.get(i)).slideUp("normal");
            }
        }
        if (it.className === "down-icon") {
            it.className = "up-icon";
        } else {
            it.className = "down-icon";
        }
    }
</script>
${plugins}