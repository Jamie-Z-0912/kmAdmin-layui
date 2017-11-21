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
                分享任务阅读记录
            </h1>
		</div>
        <div class="row-fluid">
            <form action="admin/viewLogs" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                  <label class="control-label">任务id:</label>
                  <div class="controls">
                      <input type="text" id="taskId" name="taskId" value="${taskId}" class="input-xlarge" maxlength="40"/>
                  </div>
                </div>
                <div class="control-group">
                    <label class="control-label">uid/手机号:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">用户唯一标识:</label>
                    <div class="controls">
                        <input type="text" id="cookieV" name="cookieV" value="${cookieV}" class="input-xlarge" maxlength="100"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
            <table class="table table-bordered" style="table-layout:fixed; word-break: break-all;">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>uid</th>
                        <th>taskId</th>
                        <th>结算方式</th>
                        <th>唯一标识</th>
                        <th>ip</th>
                        <th>城市</th>
                        <th>设备类型</th>
                        <th>阅读平台</th>
                        <th>阅读次数</th>
                        <th>是否有效阅读</th>
                        <th>无效原因</th>
                        <th>初次阅读时间</th>
                        <th>最后阅读时间</th>
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach items="${taskViewLogs}" var="tvl" varStatus="st">
                        <tr>
                            <td>
                                ${tvl.id}
                            </td>
                            <td>
                                ${tvl.uid}
                            </td>
                            <td>${tvl.taskId}</td>
                            <td>
                                <c:forEach items="${payMethods}" var="pm" varStatus="st">
                                    <c:if test="${pm.method == tvl.payMethod}">
                                        ${pm.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                ${tvl.cookie}
                            </td>
                            <td>
                                ${tvl.ip}
                            </td>
                            <td>
                                ${tvl.city}
                            </td>
                            <!--<td>${tvl.userAgent}</td>-->
                            <td>
                                ${tvl.devicePlatform}
                            </td>
                            <td>
                                <c:forEach items="${sharePlatform}" var="sp" varStatus="st">
                                    <c:if test="${sp.platform == tvl.platform}">
                                        ${sp.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                ${tvl.num}
                            </td>
                            <td>
                                <c:if test="${tvl.isValid == 1}">
                                    是
                                </c:if>
                                <c:if test="${tvl.isValid == 0}">
                                    否
                                </c:if>
                            </td>
                            <td>
                                 <c:forEach items="${invalidViewReasonType}" var="reason" varStatus="st">
                                    <c:if test="${reason.type == tvl.invalidReason}">
                                        ${reason.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${tvl.addedTime}" />
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${tvl.updateTime}" />
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
                                        href="admin/viewLogs?page=${page-1}&uid=${uid}&taskId=${taskId}&cookieV=${cookieV}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                        href="admin/viewLogs?page=1&uid=${uid}&taskId=${taskId}&cookieV=${cookieV}&startTime=${startTime}&endTime=${endTime}">1</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 2 and page ne 2}">
                                    <li><a
                                        href="admin/viewLogs?page=2&uid=${uid}&taskId=${taskId}&cookieV=${cookieV}&startTime=${startTime}&endTime=${endTime}">2</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 3 and page ne 3}">
                                    <li class=""><a
                                            href="admin/viewLogs?page=3&uid=${uid}&taskId=${taskId}&cookieV=${cookieV}&startTime=${startTime}&endTime=${endTime}">3</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page lt totalPage}">
                                    <li class="next"><a
                                        href="admin/viewLogs?page=${page+1}&uid=${uid}&taskId=${taskId}&cookieV=${cookieV}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_task").addClass('active open');//左侧导航栏选中状态
$("#submenu_viewLogs").addClass('active');
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