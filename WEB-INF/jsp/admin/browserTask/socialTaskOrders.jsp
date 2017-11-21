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
                分享任务订单
            </h1>
		</div>
        <div class="row-fluid">
            <form action="admin/socialTaskOrders" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">uid/手机号:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">任务id:</label>
                    <div class="controls">
                        <input type="text" id="taskId" name="taskId" value="${taskId}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>
                <div class="control-group">
                <label class="control-label">任务状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="">所有</option>
                            <c:forEach items="${taskOrderStatus}" var="tos" varStatus="st">
                                <c:if test="${tos.code == status}">
                                    <option value="${tos.code}" selected>${tos.desc}</option>
                                </c:if>
                                <c:if test="${tos.code != status}">
                                  <option value="${tos.code}">${tos.desc}</option>
                               </c:if>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                <div class="control-group">
                    <label class="control-label">时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="startTime" id="start_time_hidden" />
                        -
                        <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
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
                        <th>taskId</th>
                        <th>任务名称</th>
                        <th>图片</th>
                        <th>状态</th>
                        <th>结算方式</th>
                        <th>单价</th>
                        <th>总佣金</th>
                        <th>有效阅读数</th>
                        <th>总阅读数</th>
                        <th>过期时间</th>
                        <th>领取时间</th>
                        <th>最后操作时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach items="${taskOrders}" var="taskOrder" varStatus="st">
                        <tr>
                            <td>
                                ${taskOrder.id}
                            </td>
                            <td>
                                ${taskOrder.uid}
                            </td>
                            <td>${taskOrder.taskId}</td>
                            <td>
                                ${taskOrder.taskName}
                            </td>
                            <td>
                             <img onclick="" src="${taskOrder.taskImage}" />
                            </td>
                            <td>
                                <c:forEach items="${taskOrderStatus}" var="tos" varStatus="st">
                                    <c:if test="${taskOrder.status == tos.code}">
                                        ${tos.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${payMethods}" var="pm" varStatus="st">
                                    <c:if test="${pm.method == taskOrder.payMethod}">
                                        ${pm.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                ${taskOrder.price}
                            </td>
                            <td>
                                ${taskOrder.commission}
                            </td>
                            <td>
                                ${taskOrder.validViewNum}
                            </td>
                            <td>
                                ${taskOrder.totalViewNum}
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${taskOrder.expireTime}" />
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${taskOrder.addedTime}" />
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${taskOrder.updateTime}" />
                            </td>
                            <td>
                               <a class="set_top update" href="admin/users/base?uid=${taskOrder.uid}" style="color: #4f99c6; text-decoration: none;">
                               <span class="blue">用户信息</span></a><br/>
                               <c:if test="${taskOrder.status == 1}">
                                   <a class="set_top update" href="javascript:updateStatus(${taskOrder.id}, 0);" style="color: #4f99c6; text-decoration: none;">
                                   <span class="blue">设为异常</span></a><br/>
                               </c:if>
                               <c:if test="${taskOrder.status == 0}">
                                  <a class="set_top update" href="javascript:updateStatus(${taskOrder.id}, 1);" style="color: #4f99c6; text-decoration: none;">
                                  <span class="blue">恢复正常</span></a><br/>
                              </c:if>
                              <a class="set_top update" href="admin/viewLogs?uid=${taskOrder.uid}&taskId=${taskOrder.taskId}" style="color: #4f99c6; text-decoration: none;">
                                    <span class="blue">阅读记录</span></a>
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
                                        href="admin/socialTaskOrders?page=${page-1}&uid=${uid}&status=${status}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                        href="admin/socialTaskOrders?page=1&uid=${uid}&status=${status}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}">1</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 2 and page ne 2}">
                                    <li><a
                                        href="admin/socialTaskOrders?page=2&uid=${uid}&status=${status}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}">2</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 3 and page ne 3}">
                                    <li class=""><a
                                            href="admin/socialTaskOrders?page=3&uid=${uid}&status=${status}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}">3</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page lt totalPage}">
                                    <li class="next"><a
                                        href="admin/socialTaskOrders?page=${page+1}&uid=${uid}&status=${status}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
$("#submenu_browser_task_order").addClass('active');
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
function updateStatus(id, status) {
    if (confirm("确认进行此操作?")) {
        $.ajax({
            url : "admin/soclialTaskOrder/" + id + "?status=" + status,
            type : "put",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("失败！"+ data.desc);
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
</script>
</html>