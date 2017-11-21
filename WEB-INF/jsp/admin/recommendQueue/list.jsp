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
			<h1><span>内容队列列表</span>
            </h1>
		</div>
		<div class="row-fluid">
			<form action="admin/recommendQueue/list" method="get" id="basic_validate" name="basic_validate"
				  class="form-horizontal" novalidate="novalidate">

				<div class="control-group">
					<label class="control-label">状态</label>
					<div class="controls">
						<select name="recType" id="recType" style="width: 120px;">
							<option value="1" <c:if test="${1 == recType}">selected</c:if>>资源</option>
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
							<th>采集ID</th>
                            <th>标题</th>
                            <th>状态</th>
							<th>添加时间</th>
							<th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${queues}" var="cat" varStatus="st">
							<tr>
								<td>${cat.id}</td>
								<td>${cat.recId}</td>
                                <td>
                                ${cat.title}
                                </td>
                                <td>
                                    <c:if test="${cat.status == 0}">下架</c:if>
                                    <c:if test="${cat.status == 1}">正常</c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${cat.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${cat.updateTime}" /></td>
								<td>

                                        <a class="set_top update" href="javascript:down(${cat.id});" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a>

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
$("#menu_novel").addClass('active open');
$("#submenu_recommendQueue").addClass('active');

function down(id) {
	if (confirm("您确认要删除此推荐吗？")) {
		$.ajax({
			url : "admin/recommendQueue/update?id=" + id + "&status=0" ,
			type : "post",
			dataType : "json",
			success : function(data) {
				if (data.status != 1000) {
					alert("操作失败！");
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