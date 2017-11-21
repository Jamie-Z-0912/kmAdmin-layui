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
			活动奖励领取列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/optActivity/rewardLogs" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
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
                        <label class="control-label">活动Id</label>
                        <div class="controls">
                            <input type="text" name="activityId" value="${activityId}"/>
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
							<th>活动Id</th>
                            <th>活动名称</th>
                            <th>奖励Id</th>
                            <th>奖励名称</th>
                            <th>奖励类型</th>
							<th>领取时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="log" varStatus="st">
							<tr>
							    <td>${log.uid}</td>
								<td>${log.activityId}</td>
								<td>${log.activityName}</td>
                                <td>${log.rewardId}</td>
                                <td>${log.rewardName}</td>
                                <td>
                                    <c:forEach items="${rewardTypes}" var="type" varStatus="st">
                                        <c:if test="${type.type == log.rewardType}">${type.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td><suishen_fmt:formatDate value="${log.addedTime}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录, 第${page}页, 共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/optActivity/rewardLogs?page=${page - 1}&startTime=${startTime}&endTime=${endTime}&uid=${uid}&phone=${phone}&activityId=${activityId}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/optActivity/rewardLogs?page=1&startTime=${startTime}&endTime=${endTime}&uid=${uid}&phone=${phone}&activityId=${activityId}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/optActivity/rewardLogs?page=2&startTime=${startTime}&endTime=${endTime}&uid=${uid}&phone=${phone}&activityId=${activityId}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/optActivity/rewardLogs?page=3&startTime=${startTime}&endTime=${endTime}&uid=${uid}&phone=${phone}&activityId=${activityId}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/optActivity/rewardLogs?page=${page + 1}&startTime=${startTime}&endTime=${endTime}&uid=${uid}&phone=${phone}&activityId=${activityId}">&gt;&gt;</a></li>
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
$("#submenu_activityRewardLog").addClass('active');

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