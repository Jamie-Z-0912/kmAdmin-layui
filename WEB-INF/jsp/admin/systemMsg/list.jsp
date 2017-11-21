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
			系统通知列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/systemMsg/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                     <div class="control-group">
                         <label class="control-label">应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 120px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                     </div>
                        <div class="control-group">
                          <label class="control-label">平台</label>
                          <div class="controls">
                              <select name="platform" id="platform" style="width: 120px;">
                                  <option value="" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                                  <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                                  <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                              </select>
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
							<th>推送应用</th>
							<th>推送平台</th>
							<th>推送版本</th>
							<th>通知内容</th>
							<th>点击动作</th>
							<th>跳转地址</th>
							<th>跳转需要登陆</th>
							<th>状态</th>
							<th>定时发送时间</th>
							<th>添加时间</th>
                            <th>发送时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="systemMsg" varStatus="st">
                            <tr>
                                <td>${systemMsg.id}</td>
                                <td>
                                    <c:if test="${systemMsg.application == ''}">
                                        默认
                                    </c:if>
                                    <c:if test="${systemMsg.application != ''}">
                                        <c:forEach items="${applications}" var="app">
                                             <c:if test="${app == systemMsg.application}">${app.appName}</c:if>
                                         </c:forEach>
                                    </c:if>
                                </td>
                                <td>
                                        ${systemMsg.platform}
                                </td>
                                <td>
                                    <c:if test="${systemMsg.versions == ''}">所有版本</c:if>
                                    <c:if test="${systemMsg.versions != ''}">${systemMsg.versions}</c:if>
                                </td>
                                <td>
                                        ${systemMsg.msg}
                                </td>
                                <td>
                                        <c:forEach items="${msgActions}" var="ma" varStatus="st">
                                             <c:if test="${ma.type == systemMsg.clickActionType}">${ma.desc}</c:if>
                                        </c:forEach>
                                </td>
                                <td>
                                        ${systemMsg.action}
                                </td>
                                <td>
                                        <c:if test="${systemMsg.needLogin == 1}"><font color="red">是</font></c:if>
                                        <c:if test="${systemMsg.needLogin == 0}">否</c:if>
                                </td>
                                <td>
                                    <c:forEach items="${statusList}" var="msgStatus" varStatus="st">
                                        <c:if test="${msgStatus.status == systemMsg.status}">
                                            ${msgStatus.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>

								<c:choose>
									<c:when test="${systemMsg.sendTime != 0}">
										<td><suishen_fmt:formatDate value="${systemMsg.sendTime}" /></td>
									</c:when>
									<c:otherwise>
										<td> </td>
									</c:otherwise>
								</c:choose>
								<td><suishen_fmt:formatDate value="${systemMsg.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${systemMsg.updateTime}" /></td>
                                <td>
                                    <c:if test="${systemMsg.status == 1}">
                                        <a class="set_top update" href="admin/systemMsg/update?id=${systemMsg.id}" style="color: #4f99c6;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                        <a class="set_top update" href="admin/systemMsg/delete?id=${systemMsg.id}" style="color: #4f99c6;"> <span class="blue"> <span>删除</span></span></a><br/>
                                        <a class="set_top update" onclick="send('${systemMsg.id}', '${systemMsg.application}', '${systemMsg.platform}', '${systemMsg.versions}');" <span class="blue"> <span>发送</span></span></a><br/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/systemMsg/list?page=${page - 1}&status=${status}&platform=${platform}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/systemMsg/list?page=1&status=${status}&platform=${platform}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/systemMsg/list?page=2&status=${status}&platform=${platform}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/systemMsg/list?page=3&status=${status}&platform=${platform}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/systemMsg/list?page=${page + 1}&status=${status}&platform=${platform}">&gt;&gt;</a></li>
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
    $("#menu_app").addClass('active open');
    $("#menu_systemMsg").addClass('active');
    function add() {
        var v = $("#application").val();
        window.location = "admin/systemMsg/add?application=" + v;
    }
	function send(id,application,platform,versions) {
	    var confirmMsg = "确认要给应用: ";
	    if (application == '') {
	        confirmMsg = confirmMsg + "默认";
	    } else {
	        confirmMsg = confirmMsg + application;
	    }
	    confirmMsg = confirmMsg + ",平台: " + platform + ",版本:" + versions + "发送通知?";
		if (confirm(confirmMsg)) {
			$.ajax({
				url : "admin/systemMsg/push?id=" + id,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.status != 1000) {
						alert("发送失败！"+data.desc);
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