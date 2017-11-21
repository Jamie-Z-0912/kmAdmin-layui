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
                白名单用户
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/whiteUser/list" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">白名单账号(uid/ip):</label>
                    <div class="controls">
                        <input type="text" id="account" name="account" value="${account}" class="input-xxlarge" maxlength="80"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <button class="btn btn-info" type="button" onclick="addWhiteUser();">
                        添加白名单
                    </button>
                </div>
            </form>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="10%">账号(uid/ip)</th>
							<th width="20%">白名单原因</th>
							<th width="10%">是否白名单</th>
                            <th width="10%">添加日期</th>
                            <th width="10%">操作人</th>
                            <th width="10%">操作日期</th>
							<th width="10%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${whiteList}" var="white" varStatus="st">
							<tr>
								<td>${white.account}</td>
								<td>${white.addReason}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${white.status == 0}">
                                            <font color="red">否</font>
                                        </c:when>
                                        <c:when test="${white.status == 1}">
                                            <font color="green">是</font>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td><suishen_fmt:formatDate value="${white.addedTime}" /></td>
                                <td>${white.handler}</td>
								<td><suishen_fmt:formatDate value="${white.modifiedTime}" /></td>
								<td>
								    <c:if test="${white.status == 0}">
                                        <a class="set_top update" href="javascript:update(${white.account}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <span>恢复</span></span></a></br>
                                    </c:if>
                                    <c:if test="${white.status == 1}">
                                        <a class="set_top update" href="javascript:update(${white.account}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>取消</span></span></a></br>
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
                                            href="admin/whiteUser/list?page=${page-1}&account=${account}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/whiteUser/list?page=1&account=${account}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/whiteUser/list?page=2&account=${account}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a
                                                href="admin/whiteUser/list?page=3&account=${account}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/whiteUser/list?page=${page+1}&account=${account}">&gt;&gt;</a></li>
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
$("#menu_black").addClass('active open');//左侧导航栏选中状态
$("#submenu_white_users").addClass('active');
function update(account, status) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/whiteUser/update?status=" + status + "&account=" + account,
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
function addWhiteUser() {
    window.location = "admin/whiteUser/add";
}
</script>
</html>