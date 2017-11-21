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
			活动奖品列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/optActivity/rewards" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">活动id<br /></label>
                        <div class="controls">
                            <input type="text" id="activityId" value="${activityId}" class="input-xlarge" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a href="javascript:add(${activityId});" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增奖品</a>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>活动ID</th>
							<th>活动名称</th>
                            <th>奖励类型</th>
                            <th>关联奖励Id</th>
                            <th>奖励名称</th>
                            <th>奖励图片</th>
                            <th>奖励个数</th>
                            <th>奖励条件</th>
							<th>添加时间</th>
                            <th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="reward" varStatus="st">
							<tr>
							    <td>${reward.id}</td>
								<td>${reward.activityId}</td>
								<td>${reward.activityName}</td>
								<td>
								    <c:forEach items="${rewardTypes}" var="type" varStatus="st">
                                        <c:if test="${type.type == reward.rewardType}">${type.desc}</c:if>
                                    </c:forEach>
								</td>
								<td>${reward.realRewardId}</td>
								<td>${reward.rewardName}</td>
                                <td>
                                    <img src="${reward.rewardImage}" style="width: 130px;" />
                                </td>
                                <td>${reward.rewardNum}</td>
                                <td>${reward.rewardCondition}</td>
								<td><suishen_fmt:formatDate value="${reward.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${reward.updateTime}" /></td>
								<td>
									<a class="set_top update" href="admin/optActivity/deleteReward/${reward.id}" onclick="javascript:return del()" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                                    <a class="set_top update" href="admin/optActivity/updateReward/${reward.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
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
$("#menu_activity").addClass('active open');
$("#submenu_optActivity").addClass('active');

function add(activityId) {
    window.location = "admin/optActivity/addReward?activityId=" + activityId;
}

function del() {
    if(confirm("您确认要删除此活动奖励吗？")) {
        return true;
    } else {
        return false;
    }
}
</script>
</html>