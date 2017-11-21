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
			列表页
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/aggregation/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">内容类型</label>
                        <div class="controls">
                            <select name="contentType" id="contentType" style="width: 120px;">
                                <option value="-1" <c:if test="${-1 == contentType}">selected</c:if>>所有</option>
                                <option value="1" <c:if test="${1 == contentType}">selected</c:if>>文章</option>
                                <option value="2" <c:if test="${2 == contentType}">selected</c:if>>采集</option>
                            </select>
                        </div>
                     </div>
                     <div class="control-group">
                         <label class="control-label">活动ID</label>
                         <div class="controls">
                             <input type="text" id="actId" name="actId" value="${actId}" class="input-xlarge" maxlength="50"/>
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
							<th>列表名称</th>
							<th>描述</th>
							<th>图片</th>
                            <th>内容类型</th>
                            <th>来源</th>
                            <th>关联活动Id</th>
                            <th>投放日期</th>
                            <th>状态</th>
							<th>添加时间</th>
                            <th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="aggregation" varStatus="st">
							<tr>
								<td>${aggregation.id}</td>
                                <td>${aggregation.name}</td>
                                <td>${aggregation.description}</td>
                                <td><img src="${aggregation.image}" id="avatar" name="avatar" style="width: 130px;" /></td>
                                <td>
                                    <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                        <c:if test="${cType.type == aggregation.contentType}">${cType.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>${aggregation.origin}</td>
                                <td>${aggregation.actId}</td>
                                <td>${aggregation.date}</td>
                                <td>
                                    <c:if test="${aggregation.status == 0}"><font color="red">下架</font></c:if>
                                    <c:if test="${aggregation.status == 1}"><font color="green">上架</font></c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${aggregation.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${aggregation.updateTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/aggregation/update/${aggregation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${aggregation.status == 0}">
                                        <a class="set_top update" onclick="up(${aggregation.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${aggregation.status == 1}">
                                        <a class="set_top update" onclick="down(${aggregation.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="admin/aggregation/details?id=${aggregation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>详情</span></span></a><br/>
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
										href="admin/aggregation/list?page=${page - 1}&contentType=${contentType}&actId=${actId}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/aggregation/list?page=1&contentType=${contentType}&actId=${actId}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/aggregation/list?page=2&contentType=${contentType}&actId=${actId}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/aggregation/list?page=3&contentType=${contentType}&actId=${actId}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/aggregation/list?page=${page + 1}&contentType=${contentType}&actId=${actId}">&gt;&gt;</a></li>
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
$("#submenu_aggregation").addClass('active');

function add() {
    window.location = "admin/aggregation/add";
}

function down(id) {
    if (confirm("您确认要下架此列表页吗？")) {
        $.ajax({
            url : "admin/aggregation/down?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/aggregation/list";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要上架此列表页吗？")) {
        $.ajax({
            url : "admin/aggregation/up?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/aggregation/list";
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