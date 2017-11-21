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
                用户登陆日志
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/users/loginLog" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">uid:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">ip:</label>
                    <div class="controls">
                        <input type="text" id="ip" name="ip" value="${ip}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">device:</label>
                    <div class="controls">
                        <input type="text" id="device" name="device" value="${device}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">开始时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval=""  />
                        <input type="hidden" name="startTime" id="start_time_hidden" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">结束时间<br />
                    </label>
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
                            <th>id</th>
                            <th>uid</th>
                            <th>登陆应用</th>
                            <th>设备平台</th>
                            <th>设备标识</th>
                            <th>App版本</th>
                            <th>ip</th>
                            <th>所在城市</th>
                            <th>登陆时间</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach items="${list}" var="log" varStatus="st">
                                <tr>
                                    <td>${log.id}</td>
                                    <td><a target="_blank" href="admin/users/base?uid=${log.uid}">${log.uid}</a></td>
                                    <td>${log.application}</td>
                                    <td>${log.platform}</td>
                                    <td>${log.device}</td>
                                    <td>${log.clientVersion}</td>
                                    <td>${log.ip}</td>
                                    <td>${log.city}</td>
                                    <td><suishen_fmt:formatDate value="${log.addedTime}" /></td>
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
                                        href="admin/users/loginLog?page=${page - 1}&uid=${uid}">&lt;&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                        href="admin/users/loginLog?page=1&uid=${uid}">1</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 2 and page ne 2}">
                                    <li><a
                                        href="admin/users/loginLog?page=2&uid=${uid}">2</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 3 and page ne 3}">
                                    <li class=""><a href="admin/users/loginLog?page=3&uid=${uid}">3</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page lt totalPage}">
                                    <li class="next"><a
                                        href="admin/users/loginLog?page=${page + 1}&uid=${uid}">&gt;&gt;</a></li>
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
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_login_log").addClass('active');

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