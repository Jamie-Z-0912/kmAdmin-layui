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
                用户阅读加速信息
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/cards/readAccelerate" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">uid:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}"/>
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
                            <th>id</th>
                            <th>uid</th>
                            <th>加速天数</th>
                            <th>生效日期</th>
                            <th>是否加速中</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach items="${list}" var="rcd" varStatus="st">
                                <tr>
                                    <td>${rcd.id}</td>
                                    <td><a target="_blank" href="admin/users/base?uid=${rcd.uid}">${rcd.uid}</a></td>
                                    <td>${rcd.acceleratedDayNum}</td>
                                    <td>${rcd.startDate} - ${rcd.endDate}</td>
                                    <td>
                                        <c:if test="${today >= rcd.startDate && today <= rcd.endDate}">
                                            <font color="green">是</font>
                                        </c:if>
                                        <c:if test="${today < rcd.startDate || today > rcd.endDate}">
                                            <font color="red">否</font>
                                        </c:if>
                                    </td>
                                    <td><suishen_fmt:formatDate value="${rcd.addedTime}" /></td>
                                    <td><suishen_fmt:formatDate value="${rcd.updateTime}" /></td>
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
                                        href="admin/cards/readAccelerate?page=${page - 1}&uid=${uid}">&lt;&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                        href="admin/cards/readAccelerate?page=1&uid=${uid}">1</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 2 and page ne 2}">
                                    <li><a
                                        href="admin/cards/readAccelerate?page=2&uid=${uid}">2</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 3 and page ne 3}">
                                    <li class=""><a href="admin/cards/readAccelerate?page=3&uid=${uid}">3</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page lt totalPage}">
                                    <li class="next"><a
                                        href="admin/cards/readAccelerate?page=${page + 1}&uid=${uid}">&gt;&gt;</a></li>
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
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_card").addClass('active open');//左侧导航栏选中状态
$("#submenu_read_accelerate").addClass('active');
</script>
</html>