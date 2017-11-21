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
			    推送规则列表
            </h1>
        </div>

		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/pushRule/list" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">

                    <div class="control-group">
                        <label class="control-label">推送分类</label>
                        <div class="controls">
                            <select name="ruleType" id="ruleType" style="width: 120px;">
                                <c:forEach items="${ruleTypes}" var="rule" varStatus="st">
                                    <option value="${rule.type}" <c:if test="${rule.type == ruleType}">selected</c:if>>${rule.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a><font color="red"> (修改后1分钟生效)</font>

                    </div>

                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>推送次数</th>
                            <th>刷新次数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="rule" varStatus="st">
							<tr>
								<td>${rule.id}</td>
								<td>
                                   ${rule.startTime}
                                </td>
                                <td>
                                        ${rule.endTime}
                                </td>

                                <td>
                                   ${rule.pushNum}
                                </td>
                                <td>
                                        ${rule.refreshNum}
                                </td>
								<td>
                                    <a class="set_top update" href="admin/pushRule/update?id=${rule.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a>
                                    <a class="set_top update"  onclick="doDelete(${rule.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
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
<style type="text/css">
    body {background-color: red}
    p {margin-left: 20px}
</style>

</body>
<script>
    $("#menu_novel").addClass('active open');
    $("#submenu_pushRule").addClass('active');
function add() {
    window.location = "admin/pushRule/add?ruleType="+${ruleType};
}
function doDelete(id) {
    if (confirm("您确认要删除此规则吗？")) {
        $.ajax({
            url : "admin/pushRule/delete/" + id,
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