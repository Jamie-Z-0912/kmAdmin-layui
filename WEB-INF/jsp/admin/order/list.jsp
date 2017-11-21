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
			<h1>全部订单(可导出)
                <a href="admin/order/export_order" class="btn btn-success btn-small"
                   style="float: right"> <i class="icon-download"></i>  导表</a>
                <a href="admin/order/export_order_task_complete" class="btn btn-success btn-small"
                   style="float: right"> <i class="icon-download"></i>  任务完成情况导表</a>
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
                            <th width="10%">渠道</th>
							<th width="10%">UID</th>
                            <%--<th width="5%">任务图片</th>--%>
							<th width="10%">任务名称</th>
							<th width="10%">佣金</th>
							<th width="10%">时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order_list}" var="order" varStatus="st">
							<tr>
                                <td>
                                    <c:forEach items="${channel_list}" var="channel" varStatus="st">
                                        <c:if test="${channel.id == order.channelId}">
                                            ${channel.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
								<td>${order.uid}</td>
                                <%--<td><img src="${order.taskImage}" /></td>--%>
                                <td>${order.taskName}</td>
								<td>${order.commision}</td>
                                <td><suishen_fmt:formatDate value="${order.addedTime}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/order/list?page=${page - 1}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/order/list?page=1&name=${name}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/order/list?page=2">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/order/list?page=3">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/order/list?page=${page + 1}">&gt;&gt;</a></li>
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
$("#menu_order").addClass('active open');//左侧导航栏选中状态
$("#order_list").addClass('active');//左侧导航栏选中状态
</script>
</html>