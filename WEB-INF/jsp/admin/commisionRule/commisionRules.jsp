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
                公共佣金规则
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">ID</th>
							<th width="10%">适用目标</th>
							<th width="10%">类型</th>
							<th width="10%">计算方式</th>
                            <th width="10%">分成比例</th>
                            <th width="8%">佣金值</th>
                            <th width="10%">状态</th>
                            <th width="15%">申请日期</th>
							<th width="20%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rules}" var="rule" varStatus="st">
							<tr>
								<td>${rule.id}</td>
								<td>
								<c:choose>
                                    <c:when test="${rule.object == 1}">
                                        总代理
                                    </c:when>
                                    <c:when test="${rule.object == 2}">
                                        普通三级分销商
                                    </c:when>
                                    <c:when test="${rule.object == 3}">
                                        第三级代理(做任务的)
                                    </c:when>
                                       <c:when test="${rule.object == 4}">
                                        第二级代理(父亲)
                                    </c:when>
                                    <c:when test="${rule.object == 5}">
                                        第一级代理(爷爷)
                                    </c:when>
                                    </c:choose>
								</td>
								<td>
                                    <c:choose>
                                        <c:when test="${rule.ruleType == 1}">
                                            分成规则
                                        </c:when>
                                        <c:when test="${rule.ruleType == 2}">
                                            限额规则
                                        </c:when>
                                    </c:choose>
								</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${rule.caculateMethod == 1}">
                                            按比例分成
                                        </c:when>
                                        <c:when test="${rule.caculateMethod == 2}">
                                            固定金额
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>${rule.commisionRate}</td>
                                 <td>${rule.commision}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${rule.status == 0}">
                                            关闭
                                        </c:when>
                                        <c:when test="${rule.status == 1}">
                                            开启
                                        </c:when>
                                    </c:choose>
                                </td>
								<td><suishen_fmt:formatDate value="${rule.addedTime}" /></td>
								<td>
								    <c:if test="${rule.status == 0}">
                                        <a class="set_top update" href="javascript:update(${rule.id}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <i class="icon-edit"> </i> <span>开启</span></span></a>
                                        <a class="set_top update" href="javascript:del(${rule.id});" style="color: #4f99c6; text-decoration: none;">
                                                                                <span class="blue"> <i class="icon-edit"> </i> <span>删除</span></span></a>
                                    </c:if>
                                    <c:if test="${rule.status == 1}">
                                        <a class="set_top update" href="javascript:update(${rule.id}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <i class="icon-edit"> </i> <span>关闭</span></span></a>
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
										href="admin/commisionRules?page=${page - 1}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/commisionRules?page=1">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/commisionRules?page=2">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a
                                            href="admin/commisionRules?page=3">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/commisionRules?page=${page + 1}">&gt;&gt;</a></li>
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
</body>
<script>
$("#menu_rules").addClass('active open');//左侧导航栏选中状态

function update(id, status) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/commisionRules/" + id + "?status=" + status,
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

function del(id) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/commisionRules/" + id,
            type : "delete",
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
</script>
</html>