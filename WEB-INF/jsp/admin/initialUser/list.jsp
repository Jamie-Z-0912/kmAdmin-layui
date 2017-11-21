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
			值得看采集用户
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/initialUsers/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">手机号</label>
                    <div class="controls">
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">uid</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="50"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <a href="admin/initialUsers/add" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>uid</th>
							<th>手机号</th>
							<th>状态</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zhdkInitialUserses}" var="user" varStatus="st">
							<tr>
								<td>${user.id}</td>
								<td><a target="_blank" href="admin/users/base?uid=${user.uid}">${user.uid}</a></td>
								<td>${user.phone}</td>
								<td>
								    <c:if test="${user.status == 0}">
								        <font color="red">删除</font>
								    </c:if>
                                   <c:if test="${user.status == 1}">
                                        <font color="green"> 正常</font>
                                    </c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${user.addedTime}" /></td>
								<td><suishen_fmt:formatDate value="${user.updateTime}" /></td>
								<td>
								    <c:if test="${user.status == 1}">
                                        <a class="set_top update" href="admin/initialUsers/delete?id=${user.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${user.status == 0}">
                                        <a class="set_top update" href="admin/initialUsers/recover?id=${user.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>恢复</span></span></a><br/>
                                    </c:if>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录,共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/initialUsers/list?page=${page - 1}&uid=${uid}&phone=${phone}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/initialUsers/list?page=1&uid=${uid}&phone=${phone}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/initialUsers/list?page=2&uid=${uid}&phone=${phone}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/initialUsers/list?page=3&uid=${uid}&phone=${phone}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/initialUsers/list?page=${page + 1}&uid=${uid}&phone=${phone}">&gt;&gt;</a></li>
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_initial_user").addClass('active');
</script>
</html>