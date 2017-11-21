
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
			    列表页详情
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/aggregation/details" method="get" id="basic_validate" name="basic_validate"
                                                  class="form-horizontal" novalidate="novalidate">
                       <div class="form-actions">
                            <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                       </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="10%">列表id</th>
							<th width="10%">内容id</th>
							<th width="10%">内容类型</th>
							<th width="10%">标题</th>
							<th width="10%">图片</th>
							<th width="10%">布局方式</th>
							<th width="10%">保留字段</th>
							<th width="10%">修改时间</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="details" varStatus="st">
							<tr>
								<td>
								    ${details.listId}
								</td>
								<td>
                                    ${details.contentId}
                                </td>
								<td>
                                    <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                        <c:if test="${cType.type == details.contentType}">${cType.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td>${details.title}</td>
								<td>
								    <c:forEach items="${details.imagesList}" var="img" varStatus="st">
								        <img src="${img}" id="avatar" name="avatar" style="width: 130px;" />
								    </c:forEach>
								</td>
								<td>
                                    <c:forEach items="${layouts}" var="layout" varStatus="st">
                                        <c:if test="${layout.layout == details.layout}">${layout.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td>${details.reservedColumn}</td>
                                <td><suishen_fmt:formatDate value="${details.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/aggregation/updateDetails/${details.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <a class="set_top update" onclick="del('${details.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
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
										href="admin/aggregation/details?id=${listId}&page=${page - 1}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/aggregation/details?id=${listId}&page=1">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/aggregation/details?id=${listId}&page=2">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/aggregation/details?id=${listId}&page=3">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/aggregation/details?id=${listId}&page=${page + 1}">&gt;&gt;</a></li>
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
$("#menu_activity").addClass('active open');
$("#submenu_aggregation").addClass('active');

function add() {
    window.location = "admin/aggregation/addDetails?listId=${listId}";
}

function del(id) {
    var msg = "确认要删除此列表页数据？";
    if (confirm(msg)){
        window.location = "admin/aggregation/delDetails/" + id;
    } else {
        return false;
    }
}
</script>
</html>