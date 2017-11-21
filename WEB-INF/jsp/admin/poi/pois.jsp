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
			<h1>全国poi列表</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">ID</th>
                            <th width="8%">省</th>
							<th width="8%">市</th>
                            <th width="10%">店名</th>
							<th width="15%">地址</th>
							<th width="10%">经纬度</th>
							<th width="10%">电话</th>
							<th width="10%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pois}" var="poi" varStatus="st">
							<tr>
								<td>${poi.id}</td>
								<td>${poi.province}</td>
								<td>${poi.city}</td>
                                <td>${poi.name}</td>
                                <td>${poi.address}</td>
								<td>${poi.location}</td>
								<td>${poi.telephone}</td>
								<td>
                                    <a class="set_top update" href="admin/task/add_task/complete/${poi.id}" style="color: #4f99c6; text-decoration: none;">
                                    <span class="blue"> <span>生成任务</span></span></a>
                                </td>
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
										href="admin/pois?page=${page - 1}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/pois?page=1&name=${name}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/pois?page=2">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/pois?page=3">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/pois?page=${page + 1}">&gt;&gt;</a></li>
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
$("#menu_poi").addClass('active');//左侧导航栏选中状态
	function down(taskId) {
		if (confirm("您确认要下架此任务吗？")) {
			$.ajax({
				url : "admin/pois?task_id=" + taskId,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.status != 1000) {
						alert("操作失败！");
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
}
</script>
</html>