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
			<h1><span>标签列表</span>
            </h1>
		</div>
		<div class="row-fluid">
			<form action="admin/tag/list" method="get" id="basic_validate" name="basic_validate"
				  class="form-horizontal" novalidate="novalidate">

				<div class="control-group">
					<label class="control-label">状态</label>
					<div class="controls">
						<select name="contentType" id="contentType" style="width: 120px;">
							<option value="post" <c:if test="${'post' == contentType}">selected</c:if>>文章</option>
							<option value="resource" <c:if test="${'resource' == contentType}">selected</c:if>>资源</option>

						</select>
					</div>
				</div>
				<div class="form-actions">
					<button class="btn btn-info" type="submit">
						<i class="icon-ok"></i> 查询
					</button>
				</div>
			</form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
                            <th>名称</th>
                            <th>状态</th>
							<th>添加时间</th>
							<th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${tags}" var="cat" varStatus="st">
							<tr>
								<td>${cat.id}</td>
                                <td>
                                ${cat.name}
                                </td>
                                <td>
                                    <c:if test="${cat.status == 0}">下架</c:if>
                                    <c:if test="${cat.status == 1}">正常</c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${cat.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${cat.updateTime}" /></td>
								<td>
                                    <c:if test="${cat.status == 0}">
                                        <a class="set_top update" href="admin/tag/${cat.id}?status=1" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a>
                                    </c:if>
                                    <c:if test="${cat.status == 1}">
                                        <a class="set_top update" href="admin/tag/${cat.id}?status=0" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a>
                                    </c:if>

                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_tag").addClass('active');
</script>
</html>