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
			<h1>
                公告列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/notices" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
              <div class="control-group">
                <label class="control-label">状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1">所有</option>
                            <c:forEach items="${statusValues}" var="sv" varStatus="st">
                                <c:if test="${sv.status == status}">
                                    <option value="${sv.status}" selected>${sv.desc}</option>
                                </c:if>
                                <c:if test="${sv.status != status}">
                                  <option value="${sv.status}">${sv.desc}</option>
                               </c:if>
                            </c:forEach>
                        </select>
                    </div>
               </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <button class="btn btn-info" type="button" onclick="addNotice();">
                        添加公告
                    </button>
                </div>
            </form>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">ID</th>
							<th width="10%">标题</th>
							<th width="30%">内容</th>
							<th width="5%">状态</th>
							<th width="5%">是否在首页显示</th>
                            <th width="10%">添加日期</th>
							<th width="10%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${notices}" var="notice" varStatus="st">
							<tr>
								<td>${notice.id}</td>
								<td>${notice.title}</td>
								<td>${notice.content}</td>
								<td>
								    <c:forEach items="${statusValues}" var="sv" varStatus="st">
                                        <c:if test="${sv.status == notice.status}">
                                            ${sv.desc}
                                        </c:if>
                                    </c:forEach>
								</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${notice.showIndexPage == 1}">
                                            是
                                        </c:when>
                                        <c:when test="${notice.showIndexPage == 0}">
                                            否
                                        </c:when>
                                    </c:choose>
                                </td>
								<td><suishen_fmt:formatDate value="${notice.addedTime}" /></td>
								<td>
								    <c:if test="${notice.status == 1}">
                                        <a class="set_top update" href="javascript:update(${notice.id}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> 删除</span></a>
                                        <a class="set_top update" href="admin/notice/update?id=${notice.id}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> |编辑</span></a>
                                    </c:if>
                                    <c:if test="${notice.status == 0}">
                                        <a class="set_top update" href="javascript:update(${notice.id}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> 恢复</span></a>
                                    </c:if>
                                    <c:if test="${notice.status == 1 && notice.showIndexPage == 0}">
                                        <a class="set_top update" href="javascript:showIndexPage(${notice.id});" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> | 显示在首页</span></a>
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
                                            href="admin/notices?page=${page-1}&status=${status}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/notices?page=1&status=${status}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/notices?page=2&status=${status}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a
                                                href="admin/notices?page=3&status=${status}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/notices?page=${page+1}&status=${status}">&gt;&gt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&gt;&gt;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                            每页<b>${pageSize}</b>条
                        </div>
                    </div>
			    </div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_notices").addClass('active open');//左侧导航栏选中状态

function update(id, status) {
    if (confirm("确认要执行此操作？")) {
        $.ajax({
            url : "admin/notice/" + id + "?status=" + status,
            type : "put",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function showIndexPage(id) {
    if (confirm("确认设置当前公告首页显示？")) {
        $.ajax({
            url : "admin/notice/showIndexPage/" + id,
            type : "put",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}
function addNotice() {
    window.location = "admin/notice/add";
}
</script>
</html>