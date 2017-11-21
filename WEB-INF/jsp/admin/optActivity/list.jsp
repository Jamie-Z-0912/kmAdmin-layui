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
			运营活动列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/optActivity/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">活动状态</label>
                        <div class="controls">
                            <select name="status" id="status" style="width: 120px;">
                                <option value="0" <c:if test="${0 == status}">selected</c:if>>新建</option>
                                <option value="1" <c:if test="${1 == status}">selected</c:if>>下架</option>
                                <option value="2" <c:if test="${2 == status}">selected</c:if>>上架</option>
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
                        <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>活动名称</th>
                            <th>图片</th>
                            <th>活动类型</th>
                            <th>活动规则</th>
                            <th>活动描述</th>
                            <th>活动状态</th>
							<th>开始时间</th>
                            <th>结束时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="activity" varStatus="st">
							<tr>
								<td>${activity.id}</td>
                                <td>${activity.name}</td>
                                <td>
                                    <img src="${activity.image}" id="avatar" name="avatar" style="width: 130px;" />
                                </td>
                                <td>
                                    <c:forEach items="${actTypes}" var="actType" varStatus="st">
                                        <c:if test="${actType.type == activity.actType}">${actType.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>${activity.rule}</td>
                                <td>${activity.desc}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${0 == activity.status}">
                                            <span style="color:gray">新建</span>
                                        </c:when>
                                        <c:when test="${1 == activity.status}">
                                            <span>停止</span>
                                        </c:when>
                                        <c:when test="${2 == activity.status}">
                                            <c:if test="${now > activity.startTime && now < activity.endTime}">
                                                <span style="color:green">进行中</span>
                                            </c:if>
                                            <c:if test="${now <= activity.startTime}">
                                                <span style="color:green">上架</span>
                                            </c:if>
                                            <c:if test="${now >= activity.endTime}">
                                                <span style="color:#FFA500">结束</span>
                                            </c:if>
                                        </c:when>
                                    </c:choose>
                                </td>
								<td><suishen_fmt:formatDate value="${activity.startTime}" /></td>
                                <td><suishen_fmt:formatDate value="${activity.endTime}" /></td>
								<td>
									<a class="set_top update" href="admin/optActivity/delete/${activity.id}" onclick="javascript:return del()" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                                    <a class="set_top update" href="admin/optActivity/update/${activity.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${activity.status == 1 || activity.status == 0}">
                                        <a class="set_top update" onclick="up(${activity.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${activity.status == 2}">
                                        <a class="set_top update" onclick="down(${activity.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${activity.actType == 1}">
                                        <a class="set_top update" href="admin/optActivity/rewards?activityId=${activity.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>活动奖品</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${activity.actType == 2 && now >= activity.startTime}">
                                        <a class="set_top update" href="admin/optActivity/actUsers?activityId=${activity.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>活动用户</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${activity.actType == 2 && activity.status == 2 && now > activity.endTime}">
                                        <a class="set_top update" onclick="pay(${activity.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>结算</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${activity.actType == 3}">
                                        <a class="set_top update" href="admin/aggregation/list?actId=${activity.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>活动列表页</span></span></a><br/>
                                    </c:if>
                                </td>
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
										href="admin/optActivity/list?page=${page - 1}&startTime=${startTime}&endTime=${endTime}&status=${status}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/optActivity/list?page=1&startTime=${startTime}&endTime=${endTime}&status=${status}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/optActivity/list?page=2&startTime=${startTime}&endTime=${endTime}&status=${status}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/optActivity/list?page=3&startTime=${startTime}&endTime=${endTime}&status=${status}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/optActivity/list?page=${page + 1}&startTime=${startTime}&endTime=${endTime}&status=${status}">&gt;&gt;</a></li>
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
$("#submenu_optActivity").addClass('active');

function add() {
    window.location = "admin/optActivity/add";
}

function down(id) {
    if (confirm("您确认要下架此活动吗？")) {
        $.ajax({
            url : "admin/optActivity/down?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/optActivity/list?status=1";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要上架此活动吗？")) {
        $.ajax({
            url : "admin/optActivity/up?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/optActivity/list?status=2";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function del() {
    if(confirm("您确认要删除此活动吗？")) {
        return true;
	} else {
        return false;
	}
}

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

function pay(actId) {
    if (confirm("确认结算此活动？")) {
        $.ajax({
            url : href="admin/optActivity/pay?activityId=" + actId,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败, " + data.desc);
                } else {
                    window.location="admin/optActivity/list";
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