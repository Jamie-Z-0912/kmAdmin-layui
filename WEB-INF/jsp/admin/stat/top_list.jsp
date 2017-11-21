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
                收徒/收益排行榜
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/top/list" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                <label class="control-label">榜单类型</label>
                    <div class="controls">
                        <select name="type" id="type" style="width: 150px;">
                            <c:forEach items="${typeValues}" var="tv" varStatus="st">
                                <c:if test="${tv.type == type}">
                                    <option value="${tv.type}" selected>${tv.desc}</option>
                                </c:if>
                                <c:if test="${tv.type != type}">
                                  <option value="${tv.type}">${tv.desc}</option>
                               </c:if>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                 <div class="control-group">
                     <label class="control-label">榜单个数<br />
                     </label>
                     <div class="controls">
                         <input type="text" id="size" name="size" value="${size}" data-oval="" class="start_time input-xlarge" />
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
                </div>
            </form>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="30%">uid</th>
							<c:if test="${type == 1}">
							    <th width="30%">现金收益</th>
							</c:if>
							<c:if test="${type == 2}">
                                <th width="30%">徒弟数</th>
                            </c:if>
                            <c:if test="${type == 3}">
                                <th width="30%">金币收益</th>
                            </c:if>
                            <c:if test="${type == 4}">
                                <th width="30%">有效徒弟数</th>
                            </c:if>
							<th width="40%">操作</th>
						</tr>
					</thead>
                        <tbody>
                            <c:forEach items="${top_lists}" var="tl" varStatus="st">
                                <tr>
                                    <td>${tl.uid}</td>
                                    <td>${tl.value}</td>
                                    <td>
                                        <a class="set_top update" href="admin/users/base?uid=${tl.uid}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <i class="icon-edit"> </i> <span>用户信息</span></span></a></br>
                                        <a class="set_top update" href="admin/inviteRelation/friends?uid=${tl.uid}" style="color: #4f99c6; text-decoration: none;">
                                         <span class="blue"> <i class="icon-edit"> </i> <span>好友</span></span></a></br>
                                        <a class="set_top update" href="admin/blackUser/add?blackAccount=${tl.uid}" style="color: #4f99c6; text-decoration: none;">
                                         <span class="blue"> <i class="icon-edit"> </i> <span>拉黑</span></span></a></br>
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
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_top_list").addClass('active');
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
</script>
</html>