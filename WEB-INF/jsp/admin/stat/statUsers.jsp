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
                用户基本信息查询
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/users/base" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                      <div class="control-group">
                          <label class="control-label">手机号:</label>
                          <div class="controls">
                              <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="40"/>
                          </div>
                      </div>
                    <div class="control-group">
                        <label class="control-label">uid:</label>
                        <div class="controls">
                            <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                        </div>
                    </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>uid</th>
							<th>师傅uid</th>
							<th>手机号</th>
							<th>注册时间</th>
							<th>徒弟数</th>
                            <th>有效徒弟数</th>
                            <th>账户余额</th>
                            <th>昨日收益</th>
                            <th>总收益</th>
                            <th>是否黑户</th>
							<th>操作</th>
						</tr>
					</thead>
                    <c:if test="${userStat.uid > 0}">
                        <tbody>
                                <tr>
                                    <td>${userStat.uid}</td>
                                    <td>
                                        <c:if test="${userStat.fatherUid > 0}">
                                            <a target="_blank" href="admin/users/base?uid=${userStat.fatherUid}">${userStat.fatherUid}</a>
                                        </c:if>
                                        <c:if test="${userStat.fatherUid <= 0}">
                                            无
                                        </c:if>
                                    </td>
                                    <td>${userStat.phone}</td>
                                    <td>
                                        <suishen_fmt:formatDate value="${userStat.registerTime}" />
                                    </td>
                                    <td>
                                        ${userStat.sonNum}
                                    </td>
                                    <td>
                                        ${userStat.realBrowserSonNum}
                                    </td>
                                     <td>
                                        ${userStat.balance}
                                    </td>
                                    <td>
                                        ${userStat.yesterIncome}
                                    </td>
                                    <td>
                                        ${userStat.totalIncome}
                                    </td>
                                    <td>
                                        <c:if test="${userStat.blackUid}">
                                            <span style="color:red">是</span>
                                        </c:if>
                                        <c:if test="${!userStat.blackUid}">
                                            否
                                        </c:if>
                                    </td>
                                    <td>
                                        <a class="set_top update" href="admin/users/cash?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                              <span class="blue"> <span>现金流水</span></span></a><br/>
                                        <a class="set_top update" href="admin/withdraw/list_find?account=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                              <span class="blue"> <span>提现/充值</span></span></a><br/>
                                        <a class="set_top update" href="admin/duibaOrders/list?uid=${userStat.uid}&type=alipay&status=1" style="color: #4f99c6; text-decoration: none;">
                                              <span class="blue"> <span>兑吧订单</span></span></a><br/>
                                        <c:if test="${userStat.sonNum > 0}">
                                            <a class="set_top update" href="admin/inviteRelation/friends?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>好友列表</span></span></a><br/>
                                        </c:if>
                                        <a class="set_top update" href="admin/users/loginLog?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>登陆日志</span></span></a><br/>
                                        <a class="set_top update" href="admin/socialTaskOrders?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>分享任务</span></span></a><br/>
                                        <a class="set_top update" href="admin/users/searchLog?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>搜索记录</span></span></a><br/>
                                        <a class="set_top update" href="admin/bindPhone?uid=${userStat.uid}&phone=${userStat.phone}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>更改手机</span></span></a><br/>
                                        <c:if test="${!userStat.blackUid}">
                                            <a class="set_top update" href="admin/blackUser/add?blackAccount=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>拉黑</span></span></a><br/>
                                         </c:if>
                                    </td>
                                </tr>
                        </tbody>
					</c:if>
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
$("#submenu_stat_users").addClass('active');
if ($("#startTime").length > 0) {
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