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
			<h1><span>团队列表</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/team/team_list" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">



                <div class="control-group">
                    <label class="control-label">团队id</label>
                    <div class="controls">
                        <input type="text" id="teamId" name="teamId" value="<c:if test="${0 != teamId}">${teamId}</c:if>" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">团队名</label>
                    <div class="controls">
                        <input type="text" id="teamName" name="teamName" value="${teamName}" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">团队邀请码</label>
                    <div class="controls">
                        <input type="text" id="inviteCode" name="inviteCode" value="${inviteCode}" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>已上线</option>
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>已下线</option>

                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-group">
                        <label class="control-label">排序规则</label>
                        <div class="controls">
                            <select name="orderby" id="orderby" style="width: 120px;">
                                <option value="added_time" <c:if test="${'added_time' == orderby}">selected</c:if>>发布时间</option>
                                <option value="member_num" <c:if test="${'member_num' == orderby}">selected</c:if>>团队人数</option>
                            </select>
                        </div>
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
                            <th>团队id</th>
                            <th>团队名</th>
                            <th>团队邀请码</th>
                            <th>团队人数</th>
                            <th>状态</th>
                            <th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teams}" var="art" varStatus="st">
							<tr>
								<td>${art.id}</td>
                                <td>${art.teamName}</td>
                                <td>${art.inviteCode}</td>
                                <td>${art.memberNum}</td>
                                <td>
                                    <c:if test="${art.status ==1}">已上线</c:if>
                                    <c:if test="${art.status ==0}">已下线</c:if>
                                </td>
                                <td><suishen_fmt:formatDate value="${art.addedTime}" /></td>
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
                                            href="admin/team/team_list?page=${page - 1}&teamId=${teamId}&teamName=${teamName}&inviteCode=${inviteCode}&status=${status}&orderby=${orderby}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/team/team_list?page=1&teamId=${teamId}&teamName=${teamName}&inviteCode=${inviteCode}&status=${status}&orderby=${orderby}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/team/team_list?page=2&teamId=${teamId}&teamName=${teamName}&inviteCode=${inviteCode}&status=${status}&orderby=${orderby}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a href="admin/team/team_list?page=3&teamId=${teamId}&teamName=${teamName}&inviteCode=${inviteCode}&status=${status}&orderby=${orderby}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/team/team_list?page=${page + 1}&teamId=${teamId}&teamName=${teamName}&inviteCode=${inviteCode}&status=${status}&orderby=${orderby}">&gt;&gt;</a></li>
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
</div></div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_team").addClass('active open');
$("#submenu_team_list").addClass('active');



</script>
</html>