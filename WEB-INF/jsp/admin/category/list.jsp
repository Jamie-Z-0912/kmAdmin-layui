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
			<h1><span>资讯分类列表</span>
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
                            <th>名称</th>
                            <th>类型</th>
							<th>是否允许删除</th>
                            <th>状态</th>
							<th>添加时间</th>
							<th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories}" var="cat" varStatus="st">
							<tr>
								<td>${cat.id}</td>
                                <td>
                                ${cat.name}
                                </td>
                                <td>
                                    <c:if test="${cat.type == 1}">赏金任务</c:if>
                                    <c:if test="${cat.type == 2}">资讯</c:if>
                                </td>
								<td>
								    <c:if test="${cat.canDelete == 0}">否</c:if>
                                    <c:if test="${cat.canDelete == 1}">是</c:if>
								</td>
                                <td>
                                    <c:if test="${cat.status == 0}">下架</c:if>
                                    <c:if test="${cat.status == 1}">正常</c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${cat.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${cat.updateTime}" /></td>
								<td>
                                    <c:if test="${cat.status == 0}">
                                        <a class="set_top update" href="admin/category/${cat.id}?status=1" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>恢复</span></span></a>
                                    </c:if>
                                    <c:if test="${cat.status == 1}">
                                        <a class="set_top update" href="admin/category/${cat.id}?status=0" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a>
                                    </c:if>
                                    <c:if test="${cat.isUserAdd == 1}">
                                        <a class="set_top update" href="admin/category/delete?id=${cat.id}&status=0" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a>
                                    </c:if>
                                    <a class="set_top update" href="admin/category/top?id=${cat.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>置顶</span></span></a>
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
$("#menu_article").addClass('active open');
$("#submenu_category").addClass('active');
</script>
</html>