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
<div id="sideNavi" class="side-navi">
    <#if "" != noticeBoard>
    <ul class="marginTop12">
        <li>
            <h4>${noticeBoardLabel}</h4>
        </li>
        <li class="side-navi-notice">${noticeBoard}</li>
    </ul>
    <div class="line"></div>
    </#if>
    <#if 0 != recentComments?size>
    <ul>
        <li>
            <h4>${recentCommentsLabel}</h4>
        </li>
        <li>
            <ul id="recentComments">
                <#list recentComments as comment>
                <li>
                    <#if "http://" == comment.commentURL>
                    ${comment.commentName}<#else>
                    <a target="_blank" href="${comment.commentURL}">
                        ${comment.commentName}</a></#if>:
                    <a rel="nofollow" class='side-comment content-reset' href="${servePath}${comment.commentSharpURL}">
                        ${comment.commentContent}
                    </a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    <div class="line"></div>
    </#if>
    <#if 0 != mostCommentArticles?size>
    <ul>
        <li>
            <h4>${mostCommentArticlesLabel}</h4>
        </li>
        <li>
            <ul>
                <#list mostCommentArticles as article>
                <li>
                    <sup>[${article.articleCommentCount}]</sup><a rel="nofollow" title="${article.articleTitle}" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    <div class="line"></div>
    </#if>
    <#if 0 != mostViewCountArticles?size>
    <ul>
        <li>
            <h4>${mostViewCountArticlesLabel}</h4>
        </li>
        <li>
            <ul id="mostViewCountArticles">
                <#list mostViewCountArticles as article>
                <li>
                    <sup>[${article.articleViewCount}]</sup><a trel="nofollow" itle="${article.articleTitle}" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    <div class="line"></div>
    </#if>

    <#if 0 != mostUsedCategories?size>
        <ul>
            <li>
                <h4>${categoryLabel}</h4>
            </li>
            <li>
                <ul>
                    <#list mostUsedCategories as category>
                        <li>
                            <a class="tag" href="${servePath}/category/${category.categoryURI}">
                                ${category.categoryTitle}</a> (${category.categoryTagCnt})
                        </li>
                    </#list>
                </ul>
            </li>
        </ul>
        <div class="line"></div>
    </#if>


    <#if 0 != mostUsedTags?size>
    <ul>
        <li>
            <h4>${tagsLabel}</h4>
        </li>
        <li>
            <ul>
                <#list mostUsedTags as tag>
                <li>
                    <a rel="alternate" href="${servePath}/tag-articles-feed.do?oId=${tag.oId}" class="no-underline">
                        <img alt="${tag.tagTitle}" src="${staticServePath}/images/feed.png"/>
                    </a>
                    <a rel="tag" title="${tag.tagTitle}(${tag.tagPublishedRefCount})" href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}">
                        ${tag.tagTitle}</a>
                    (${tag.tagPublishedRefCount})
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    <div class="line"></div>
    </#if>
    <#if 0 != links?size>
    <ul>
        <li>
            <h4>${linkLabel}</h4>
        </li>
        <li>
            <ul id="sideLink">
                <#list links as link>
                <li>
                    <a rel="friend" href="${link.linkAddress}" title="${link.linkTitle}" target="_blank">
                        <img alt="${link.linkTitle}"
                             src="${faviconAPI}<#list link.linkAddress?split('/') as x><#if x_index=2>${x}<#break></#if></#list>" width="16" height="16" /></a>
                    <a rel="friend" href="${link.linkAddress}" title="${link.linkTitle}" target="_blank">${link.linkTitle}
                    </a>
                    <#-- ${link.linkDescription} -->
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    <div class="line"></div>
    </#if>
    <#if 0 != archiveDates?size>
    <ul>
        <li>
            <h4>${archiveLabel}</h4>
        </li>
        <li>
            <ul id="archiveSide">
                <#list archiveDates as archiveDate>
                <li data-year="${archiveDate.archiveDateYear}">
                    <#if "en" == localeString?substring(0, 2)>
                    <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                       title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">
                        ${archiveDate.monthName} ${archiveDate.archiveDateYear}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    <#else>
                    <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                       title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">
                        ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    </#if>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
</div>
