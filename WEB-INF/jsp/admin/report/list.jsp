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
			    举报记录
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/report/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">uid</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-large"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">采集id</label>
                    <div class="controls">
                        <input type="text" id="objId" name="objId" value="${objId}" class="input-large"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">举报类别</label>
                    <div class="controls">
                        <select name="reportReason" id="reportReason" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == reportReason}">selected</c:if>>所有</option>
                            <c:forEach items="${reportReasons}" var="reason" varStatus="st">
                                <option value="${reason.reason}" <c:if test="${reason.reason == reportReason}">selected</c:if>>${reason.desc}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">举报状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <c:forEach items="${statusList}" var="sl" varStatus="st">
                                <option value="${sl.status}" <c:if test="${sl.status == status}">selected</c:if>>${sl.desc}</option>
                            </c:forEach>
                        </select>
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
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>举报人</th>
							<th>手机号</th>
							<th>昵称</th>
							<th>采集id</th>
							<th>标题</th>
                            <th>分类</th>
                            <th>来源</th>
                            <th>状态</th>
							<th>举报类别</th>
                            <th>详细原因</th>
                            <th>举报状态</th>
                            <c:if test="${status != 0}">
                                <th>处理人</th>
                                <th>处理结果</th>
                            </c:if>
                            <th>举报时间</th>
                            <c:if test="${status != 0}">
                                <th>处理时间</th>
                            </c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reports}" var="report" varStatus="st">
							<tr>
								<td><a target="_blank" href="admin/users/base?uid=${report.uid}">${report.uid}</a></td>
								<td>${report.userInfo.phone}</td>
								<td>${report.userInfo.nickName}</td>
								<td><a href="admin/report/list?objId=${report.objId}">${report.objId}</a></td>
								<td><a target="_blank" href="${report.post.originUrl}">${report.post.title}</a></td>
                                <td>${report.post.tagName}</td>
                                <td>${report.post.authorName}</td>
                                <td>
                                    <c:if test="${report.post.status == 1}"> 发布中</c:if>
                                    <c:if test="${report.post.status == 2}"> 上架</c:if>
                                    <c:if test="${report.post.status == 3}"> 下架</c:if>
                                </td>
								<td>
								    <c:forEach items="${reportReasons}" var="reason" varStatus="st">
                                        <c:if test="${reason.reason == report.reportReason}">${reason.desc}</c:if>
                                    </c:forEach>
								</td>
								<td>
								    <c:if test="${1 == report.reportReason}">
								        正确分类: ${report.tag.name}
								    </c:if>
								    <c:if test="${1 != report.reportReason}">
                                        ${report.reportDetails}
                                    </c:if>
								</td>
								<td>
                                    <c:forEach items="${statusList}" var="status" varStatus="st">
                                        <c:if test="${status.status == report.status}">
                                            <c:if test="${status.status == 0}"> <font color="red">${status.desc} </font></c:if>
                                            <c:if test="${status.status > 0}"> <font color="green">${status.desc} </font></c:if>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <c:if test="${status != 0}">
                                    <td>${report.handler}</td>
                                    <td>${report.handleResult}</td>
								</c:if>
								<td><suishen_fmt:formatDate value="${report.addedTime}" /></td>
								<c:if test="${status != 0}">
								    <td><suishen_fmt:formatDate value="${report.updateTime}" /></td>
								</c:if>
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
										href="admin/report/list?page=${page - 1}&uid=${uid}&objId=${objId}&reportReason=${reportReason}&status=${status}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/report/list?page=1&uid=${uid}&objId=${objId}&reportReason=${reportReason}&status=${status}&startTime=${startTime}&endTime=${endTime}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/report/list?page=2&uid=${uid}&objId=${objId}&reportReason=${reportReason}&status=${status}&startTime=${startTime}&endTime=${endTime}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/report/list?page=3&uid=${uid}&objId=${objId}&reportReason=${reportReason}&status=${status}&startTime=${startTime}&endTime=${endTime}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/report/list?page=${page + 1}&uid=${uid}&objId=${objId}&reportReason=${reportReason}&status=${status}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
$("#submenu_report").addClass('active');

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