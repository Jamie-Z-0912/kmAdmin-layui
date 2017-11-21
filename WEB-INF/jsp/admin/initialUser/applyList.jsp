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
			采集用户申请列表
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/initialUsersApply/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">手机号</label>
                    <div class="controls">
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">申请状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>待审核</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>审核通过</option>
                            <option value="2" <c:if test="${2 == status}">selected</c:if>>忽略</option>
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
					<button class="btn btn-info" type="submit" onclick="batchPass()">
						<i class="icon-ok"></i> 批量通过
					</button>
					<button class="btn btn-info" type="submit" onclick="batchIgnore()">
						<i class="icon-ok"></i> 批量忽略
					</button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th><label><input type="checkbox" name="checkAll" id="checkAll"/><span class="lbl">uid</span></label></th>
							<th>手机号</th>
							<th>状态</th>
							<th>问题1</th>
							<th>问题2</th>
							<th>问题3</th>
                            <th>申请时间</th>
                            <th>审核时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zhdkInitialUserApplies}" var="user" varStatus="st">
							<tr>
								<td><label><input type="checkbox" name="chkItem" value="${user.uid}">&nbsp;<span class="lbl">
									<a target="_blank" href="admin/users/base?uid=${user.uid}">${user.uid}</a></span></label>
								</td>
								<td>${user.phone}</td>
								<td>
								    <c:if test="${user.status == 0}">
								        <font color="red">待审核</font>
								    </c:if>
                                   <c:if test="${user.status == 1}">
                                        <font color="green"> 通过</font>
                                    </c:if>
                                    <c:if test="${user.status == 2}">
                                        忽略
                                    </c:if>
                                </td>

                                <c:forEach var="an" items="${user.answers}" >
                                    <td>
                                        <font color="red">${an.value}</font><br/>
                                    </td>
                                </c:forEach>

								<td><suishen_fmt:formatDate value="${user.addedTime}" /></td>
								<td><suishen_fmt:formatDate value="${user.updateTime}" /></td>
								<td>
								    <c:if test="${user.status == 0}">
                                        <a class="set_top update" href="javascript:ignore('${user.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>忽略</span></span></a><br/>
                                        <a class="set_top update" href="javascript:pass('${user.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>通过</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${user.status == 2}">
                                        <a class="set_top update" href="javascript:pass('${user.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>通过</span></span></a><br/>
                                    </c:if>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				问题1:&nbsp;每天在微信或快手等工具浏览内容的时间大约为?<br/>
				问题2:&nbsp;您平时主要通过哪种途径获取信息?<br/>
				问题3:&nbsp;对于文章或视频的转发功能（不分平台），您一周会使用多少次?<br/>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录,共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/initialUsersApply/list?page=${page - 1}&phone=${phone}&status=${status}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/initialUsersApply/list?page=1&phone=${phone}&status=${status}&startTime=${startTime}&endTime=${endTime}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/initialUsersApply/list?page=2&phone=${phone}&status=${status}&startTime=${startTime}&endTime=${endTime}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/initialUsersApply/list?page=3&phone=${phone}&status=${status}&startTime=${startTime}&endTime=${endTime}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/initialUsersApply/list?page=${page + 1}&phone=${phone}&status=${status}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
$("#submenu_initial_user_apply").addClass('active');

function pass(id, uid) {
    if (confirm("确认要通过此申请吗？")) {
        $.ajax({
            url : "admin/initialUsersApply/pass?id=" + id ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/initialUsersApply/list?uid=" + uid;
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function ignore(id, uid) {
    if (confirm("确认要忽略此申请吗？")) {
        $.ajax({
            url : "admin/initialUsersApply/ignore?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/initialUsersApply/list?uid=" + uid;
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

window.onload = function() {
    $("#checkAll").click(function () {
        $("input[name='chkItem']").prop("checked", this.checked);
    });

    $("input[name='chkItem']")
        .click(
            function() {
                var $subs = $("input[name='chkItem']");
                $("#checkAll")
                    .prop(
                        "checked",
                        $subs.length == $subs
                            .filter(":checked").length ? true
                            : false);
            });
}
function batchPass() {
    var list = []
    $.each($('input[name="chkItem"]'),function(){
        if(this.checked){
            var uid = this.value;
            list.push(uid);
        }
    })
    if (confirm("确认要通过该批申请吗？")) {
        $.ajax({
            url : "admin/initialUsersApply/batchpass?uids=" + list,
            type : "post",
            dataType : "json",
            async: false,
            timeout:1,
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/initialUsersApply/list";
                }
            },
            error : function(error) {
                alert("批量通过失败");
            }
        });
    }
}

function batchIgnore() {
    var list = []
    $.each($('input[name="chkItem"]'),function(){
        if(this.checked){
            var uid = this.value;
            list.push(uid);
        }
    })
    console.log(list);
    if (confirm("确认要忽略该批申请吗？")) {
        $.ajax({
            url : "admin/initialUsersApply/batchignore?uids=" + list,
            type : "post",
            dataType : "json",
            async: false,
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/initialUsersApply/list";
                }
            },
            error : function(error) {
                alert("批量忽略失败");
            }
        });
    }

}
</script>
</html>