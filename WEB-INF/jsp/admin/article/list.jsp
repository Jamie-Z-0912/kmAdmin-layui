<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1><span>资讯文章列表</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/article/list" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                <label class="control-label">分类</label>
                    <div class="controls">
                        <select name="categoryId" id="categoryId" style="width: 120px;">
                            <option value="0" <c:if test="${0 == categoryId}">selected</c:if>>所有</option>
                            <c:forEach items="${categories}" var="cat" varStatus="st">
                                <option value="${cat.id}" <c:if test="${cat.id == categoryId}">selected</c:if>>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                <div class="control-group">
                    <label class="control-label">标题</label>
                    <div class="controls">
                        <input type="text" id="title" name="title" value="${title}" class="input-xlarge" maxlength="50"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
                            <th>分类</th>
							<th>标题</th>
                            <th>图片</th>
                            <th>状态</th>
                            <th>来源</th>
                            <th>布局</th>
                            <th>投放城市</th>
                            <th>发布时间</th>
                            <th>浏览次数</th>
                            <th>评论次数</th>
							<th>添加时间</th>
							<th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${articles}" var="art" varStatus="st">
							<tr>
								<td>${art.id}</td>
                                <td>
                                    ${art.categoryName}
                                </td>
								<td>
								    <a class="set_top update" href="${art.url}">${art.title}</a>
								</td>
								<td>
								    <img src="${art.imagesList[0]}" />
                                </td>
                                <td>
                                    <c:if test="${art.status == 0}">删除</c:if>
                                    <c:if test="${art.status == 1}">正常</c:if>
                                </td>
                                <td>
                                    <a class="set_top update" href="${art.originUrl}">${art.source}</a>
                                </td>
                                <td>
                                    <c:forEach items="${layout}" var="la" varStatus="st">
                                        <c:if test="${la.layout == art.layout}">${la.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:if test="${art.city == ''}">全国</c:if>
                                    <c:if test="${art.city != ''}">${art.city}</c:if>
                                </td>
                                <td>
                                    ${art.pubTime}
                                </td>
                                <td>
                                    ${art.viewNum}
                                </td>
                                <td>
                                    ${art.commentNum}
                                </td>
								<td><suishen_fmt:formatDate value="${art.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${art.updateTime}" /></td>
								<td>
                                    <c:if test="${art.status == 0}">
                                        <a class="set_top update" href="javascript:up('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>恢复</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${art.status == 1}">
                                        <a class="set_top update" href="javascript:down('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="admin/article/addShareTask?articleId=${art.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>+现金任务</span></span></a><br/>
                                    <a class="set_top update" href="admin/article/addCoinShareTask?articleId=${art.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>+金币任务</span></span></a><br/>
                                    <a class="set_top update" href="admin/msg/push?type=article&id=${art.id}&platform=DEFAULT" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>推送</span></span></a><br/>
                                    <c:if test="${art.commentNum > 0}">
                                        <a class="set_top update" href="admin/comment/list?articleId=${art.id}&status=-1" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>评论列表</span></span></a>
                                    </c:if>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row-fluid">
                    <div class="span12">
                        <div class="dataTables_paginate paging_bootstrap pagination">
                        ${total}条记录共<b>${totalPage}</b>页
                            <ul>
                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/article/list?categoryId=${categoryId}&page=${page - 1}&title=${title}&status=${status}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/article/list?categoryId=${categoryId}&page=1&title=${title}&status=${status}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/article/list?page=2&categoryId=${categoryId}&title=${title}&status=${status}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a href="admin/article/list?page=3&categoryId=${categoryId}&title=${title}&status=${status}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/article/list?page=${page + 1}&categoryId=${categoryId}&title=${title}&status=${status}">&gt;&gt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&gt;&gt;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_article").addClass('active open');
$("#submenu_article").addClass('active');

function down(id) {
    if (confirm("您确认要下架此文章吗？")) {
        $.ajax({
            url : "admin/article/update?id=" + id + "&status=0" ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/article/list?categoryId=" + ${categoryId} + "&title=" + '${title}';
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要恢复此文章吗？")) {
        $.ajax({
            url : "admin/article/update?id=" + id + "&status=1" ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/article/list?categoryId=" + ${categoryId} + "&title=" + '${title}';
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}
</script>
</html>