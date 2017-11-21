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
                黑名单用户
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/blackUsers" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                  <div class="control-group">
                    <label class="control-label">状态</label>
                    <div class="controls">
                        <select name="blackUserStatus" id="blackUserStatus" style="width: 120px;">
                            <option value="">所有</option>
                            <c:forEach items="${blackUserStatusValues}" var="bus" varStatus="st">
                                <c:if test="${bus.status == blackUserStatus}">
                                    <option value="${bus.status}" selected>${bus.desc}</option>
                                </c:if>
                                <c:if test="${bus.status != blackUserStatus}">
                                  <option value="${bus.status}">${bus.desc}</option>
                               </c:if>
                            </c:forEach>
                        </select>
                    </div>
                  </div>

                  <div class="control-group">
                      <label class="control-label">账号类型</label>
                      <div class="controls">
                          <select name="blackAccountType" id="blackAccountType" style="width: 120px;">
                              <option value="">所有</option>
                              <c:forEach items="${blackAccountTypeValues}" var="bat" varStatus="st">
                                  <c:if test="${bat.type == blackAccountType}">
                                      <option value="${bat.type}" selected>${bat.type}</option>
                                  </c:if>
                                  <c:if test="${bat.type != blackAccountType}">
                                    <option value="${bat.type}">${bat.type}</option>
                                 </c:if>
                              </c:forEach>
                          </select>
                      </div>
                  </div>

                  <div class="control-group">
                    <label class="control-label">拉黑类型</label>
                    <div class="controls">
                        <select name="blackReasonType" id="blackReasonType" style="width: 120px;">
                            <option value="-1">所有</option>
                            <c:forEach items="${blackReasonTypeValues}" var="brt" varStatus="st">
                                <c:if test="${brt.type == blackReasonType}">
                                    <option value="${brt.type}" selected>${brt.desc}</option>
                                </c:if>
                                <c:if test="${brt.type != blackReasonType}">
                                  <option value="${brt.type}">${brt.desc}</option>
                               </c:if>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                <div class="control-group">
                    <label class="control-label">拉黑账号(uid/phone/ip):</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="80"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">开始时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="startTime" id="start_time_hidden" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">结束时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="endTime" id="end_time_hidden" />
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <button class="btn btn-info" type="button" onclick="addBlackUser();">
                        添加黑名单
                    </button>
                </div>
            </form>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="10%">账号</th>
							<th width="10%">账号类型</th>
							<th width="10%">拉黑类型</th>
							<th width="20%">拉黑原因</th>
                            <th width="10%">状态</th>
                            <th width="10%">拉黑日期</th>
                            <th width="10%">操作人</th>
                            <th width="10%">操作日期</th>
							<th width="15%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${blackUsers}" var="blackUser" varStatus="st">
							<tr>
								<td>${blackUser.blackAccount}</td>
								<td>${blackUser.type}</td>
								<td>
								    <c:forEach items="${blackReasonTypeValues}" var="brt" varStatus="st">
                                        <c:if test="${brt.type == blackUser.blackReasonType}">
                                            ${brt.desc}
                                        </c:if>
                                    </c:forEach>
								</td>
								<td>${blackUser.addReason}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${blackUser.status == 1}">
                                            <font color="red">拉黑中</font>
                                        </c:when>
                                        <c:when test="${blackUser.status == 2}">
                                            <font color="green">已解除</font>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td><suishen_fmt:formatDate value="${blackUser.addedTime}" /></td>
                                <td>${blackUser.handler}</td>
								<td><suishen_fmt:formatDate value="${blackUser.modifiedTime}" /></td>
								<td>
								    <c:if test="${blackUser.status == 1}">
                                        <a class="set_top update" href="javascript:update(${blackUser.id}, 2);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>解除</span></span></a></br>
                                        <c:if test="${blackUser.type == 'IP'}">
                                            <a class="set_top update" href="javascript:updateByIP('${blackUser.blackAccount}');" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>解除IP</span></span></a></br>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${blackUser.status == 2}">
                                        <a class="set_top update" href="javascript:update(${blackUser.id}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>拉黑</span></span></a></br>
                                    </c:if>
                                     <c:if test="${blackUser.type == 'UID'}">
                                        <a class="set_top update" href="admin/users/base?uid=${blackUser.blackAccount}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>用户信息</span></span></a></br>
                                     </c:if>
                                    <c:if test="${blackUser.type == 'PHONE'}">
                                        <a class="set_top update" href="admin/users/base?phone=${blackUser.blackAccount}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"><span>用户信息</span></span></a>
                                     </c:if>
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
                                            href="admin/blackUsers?page=${page-1}&uid=${uid}&blackUserStatus=${blackUserStatus}&blackAccountType=${blackAccountType}&blackReasonType=${blackReasonType}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/blackUsers?page=1&uid=${uid}&blackUserStatus=${blackUserStatus}&blackAccountType=${blackAccountType}&blackReasonType=${blackReasonType}&startTime=${startTime}&endTime=${endTime}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/blackUsers?page=2&uid=${uid}&blackUserStatus=${blackUserStatus}&blackAccountType=${blackAccountType}&blackReasonType=${blackReasonType}&startTime=${startTime}&endTime=${endTime}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a
                                                href="admin/blackUsers?page=3&uid=${uid}&blackUserStatus=${blackUserStatus}&blackAccountType=${blackAccountType}&blackReasonType=${blackReasonType}&startTime=${startTime}&endTime=${endTime}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/blackUsers?page=${page+1}&uid=${uid}&blackUserStatus=${blackUserStatus}&blackAccountType=${blackAccountType}&blackReasonType=${blackReasonType}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_black").addClass('active open');//左侧导航栏选中状态
$("#submenu_black_users").addClass('active');
function update(id, status) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/blackUsers/" + id + "?status=" + status,
            type : "put",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
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
function updateByIP(ip) {
    if (confirm("您确认要解除该ip下所有拉黑用户？")) {
        $.ajax({
            url : "admin/blackUsers/ip?ip=" + ip,
            type : "put",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
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
function addBlackUser() {
    window.location = "admin/blackUser/add";
}
</script>
</html>