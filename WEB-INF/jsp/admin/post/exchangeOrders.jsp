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
			资源兑换记录
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/post/exchangeOrders" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                   <div class="control-group">
                        <label class="control-label">手机号</label>
                        <div class="controls">
                            <input type="text" id="phone" name="phone" value="${phone}" />
                        </div>
                  </div>
                   <div class="control-group">
                       <label class="control-label">uid</label>
                       <div class="controls">
                           <input type="text" name="uid" value="${uid}"/>
                       </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">采集Id</label>
                       <div class="controls">
                           <input type="text" name="postId" value="${postId}"/>
                       </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">开始时间<br /></label>
                       <div class="controls">
                           <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                           <input type="hidden" name="startTime" id="start_time_hidden" />
                       </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">结束时间<br /></label>
                       <div class="controls">
                           <input type="text" id="endTime" data-oval=""  />
                           <input type="hidden" name="endTime" id="end_time_hidden" />
                       </div>
                   </div>
                   <div class="form-actions">
                       <button class="btn btn-info" type="submit">
                           <i class="icon-ok"></i> 查询
                       </button>
                   </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>uid</th>
							<th>资源id</th>
							<th>资源作者</th>
							<th>资源标题</th>
							<th>资源图片</th>
							<th>兑换价格</th>
							<th>兑换时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="order" varStatus="st">
							<tr>
								<td><a target="_blank" href="admin/users/base?uid=${order.uid}">${order.uid}</a></td>
								<td><a target="_blank" href="admin/post/list?id=${order.postId}">${order.postId}</a></td>
								<td>${order.postAuthorNick}</td>
                                <td>${order.postTitle}</td>
                                <td><img src="${order.postImages[0]}" /></td>
                                <td>${order.amount}</td>
                                <td><suishen_fmt:formatDate value="${order.addedTime}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录, 共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/post/exchangeOrders?page=${page - 1}&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&postId=${postId}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/post/exchangeOrders?page=1&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&postId=${postId}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/post/exchangeOrders?page=2&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&postId=${postId}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/post/exchangeOrders?page=3&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&postId=${postId}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/post/exchangeOrders?page=${page + 1}&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&postId=${postId}">&gt;&gt;</a></li>
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
$("#menu_stat").addClass('active open');
$("#submenu_resource_exchange").addClass('active');

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
    $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
    gx();
    $("#startTime").slTime({
        callback:function(){
            gx();
        }
    });
    $("#endTime").slTime({
        callback:function(){
            gx();
        }
    });
}
function gx(){
    var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
    var end = new Date($("#endTime").val().replace(/-/g,   "/")).getTime();
    $("#start_time_hidden").val(start);
    $("#end_time_hidden").val(end);
}
</script>
</html>