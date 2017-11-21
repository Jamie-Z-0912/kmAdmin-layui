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
			    用户召回
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <a href="admin/recallPlan/add" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="20%">召回用户条件</th>
							<th width="8%">召回方法</th>
							<th>召回时间</th>
							<th>奖励方式</th>
                            <th>处罚方法</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>完成时间</th>
                            <th>预计召回人数</th>
                            <th width="6%">状态</th>
                            <th>最后操作</th>
                            <th width="5%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userRecallPlans}" var="recallPlan" varStatus="st">
							<tr>
								<td>
								距召回计划开始至少 <font color="red">${recallPlan.userRecallConditions.noIncomeDayToToday}</font> 天无收益</br></br>
                                <c:if test="${recallPlan.userRecallConditions.excludeBlackUser}">
                                    <font color="red">排除黑名单用户</font></br></br>
                                </c:if>
								注册时间: <font color="red"><suishen_fmt:formatDate value="${recallPlan.userRecallConditions.smallRegisterTime}" /></font> ~ <font color="red"><suishen_fmt:formatDate value="${recallPlan.userRecallConditions.bigRegisterTime}" /></font></br></br>
								<font color="red">${recallPlan.userRecallConditions.smallYue}</font> <= 用户账户余额 <= <font color="red">${recallPlan.userRecallConditions.bigYue}</font>
								<td>
								    <c:if test="${recallPlan.recallMethod == 'PUSH'}">
                                        推送
								    </c:if>
								    <c:if test="${recallPlan.recallMethod == 'SHORT_MSG'}">
                                        短信
                                    </c:if>
                                    <c:if test="${recallPlan.recallMethod == 'PUSH,SHORT_MSG' || recallPlan.recallMethod == 'SHORT_MSG,PUSH'}">
                                        推送,短信
                                    </c:if>
								</td>
								<td>${recallPlan.recallRate}</td>
								<td>${recallPlan.rewardMethod}</td>
                                <td>
                                    <c:forEach items="${penalizeMethods}" var="penalizeMethod" varStatus="st">
                                        <c:if test="${penalizeMethod == recallPlan.penalizeMethod}">
                                            ${penalizeMethod.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><suishen_fmt:formatDate value="${recallPlan.beginTime}" /></td>
                                <td><suishen_fmt:formatDate value="${recallPlan.endTime}" /></td>
                                <td><suishen_fmt:formatDate value="${recallPlan.finishTime}" /></td>
                                <td>${recallPlan.recallUser}</td>
                                <td>
                                    <c:if test="${now <= recallPlan.beginTime}">
                                        未开始
                                    </c:if>
                                    <c:if test="${now > recallPlan.beginTime && now < recallPlan.endTime}">
                                        <c:if test="${recallPlan.status == 0}"> <font color="red">停止</font></c:if>
                                        <c:if test="${recallPlan.status == 1}"> <font color="#FFA500">进行中</font></c:if>
                                    </c:if>
                                    <c:if test="${now >= recallPlan.endTime}">
                                        <c:if test="${recallPlan.status == 0}"> <font color="red">停止</font></c:if>
                                        <c:if test="${recallPlan.status == 1}"> <font color="#FFA500">结束</font></c:if>
                                        <c:if test="${recallPlan.status == 3}"> <font color="red">结算中</font></c:if>
                                        <c:if test="${recallPlan.status == 2}"> <font color="green">完成</font></c:if>
                                    </c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${recallPlan.updateTime}" /></td>
								<td>
								    <c:if test="${recallPlan.endTime > now && recallPlan.status == 1}">
								        <a class="set_top update" href="admin/recallPlan/update?id=${recallPlan.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>修改</span></span></a><br/>
								    </c:if>
								    <c:if test="${now > recallPlan.beginTime && now < recallPlan.endTime}">
								        <c:if test="${recallPlan.status == 1}">
								            <a class="set_top update" onclick="stop(${recallPlan.id});" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>停止</span></span></a><br/>
								        </c:if>
								        <c:if test="${recallPlan.status == 0}">
                                            <a class="set_top update" onclick="start(${recallPlan.id});" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>开启</span></span></a><br/>
                                        </c:if>
							        </c:if>
							        <c:if test="${now > recallPlan.beginTime}">
							            <a class="set_top update" href="admin/recallPlan/logs?recallPlanId=${recallPlan.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>统计</span></span></a><br/>
							         </c:if>
							    </td>
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
										href="admin/recallPlan/list?page=${page - 1}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/recallPlan/list?page=1">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/recallPlan/list?page=2">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/recallPlan/list?page=3">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/recallPlan/list?page=${page + 1}">&gt;&gt;</a></li>
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
$("#menu_recall").addClass('active');

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

function stop(id) {
    if (confirm("您确认要停止召回计划吗？")) {
        $.ajax({
            url : "admin/recallPlan/stop?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    location.href = "admin/recallPlan/list";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function start(id) {
    if (confirm("您确认要重新开启召回计划吗？")) {
        $.ajax({
            url : "admin/recallPlan/start?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    location.href = "admin/recallPlan/list";
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