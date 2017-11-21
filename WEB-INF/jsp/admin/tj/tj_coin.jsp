<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>金币汇总统计</h1>
		</div>
        <div class="control-group">
            <div class="controls">
               日期:&nbsp;&nbsp; <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
						    <th>日期</th>
                            <th>签到</th>
                            <th>普通签到</th>
                            <th>红包</th>
                            <th>分享任务</th>
                            <th>分享任务分成</th>
                            <th>阅读文章</th>
                            <th>阅读推送文章</th>
                            <th>加速卡阅读</th>
                            <th>阅读分成</th>
                            <th>邀请好友</th>
                            <th>受邀请注册</th>
                            <th>新手登陆</th>
                            <th>新手教程</th>
                            <th>新手阅读</th>
                            <th>新手搜索</th>
                            <th>评论被回复</th>
                            <th>评论被点赞</th>
                            <th>搜索任务</th>
                            <th>采集被阅读</th>
                            <th>采集图片被点赞</th>
                            <th>采集资源被兑换</th>
                            <th>举报奖励</th>
                            <th>兑换资源补偿</th>
                            <th>福利活动</th>
                            <th>分享快马</th>
                            <th>团队分红</th>
                            <th>总发放金币</th>
                            <th>汇率(x金币兑1元)</th>
                            <th>兑换人民币</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${tjResult}" var="tj" varStatus="st">
                            <tr>
                                <td>${tj.date}</td>
                                <td>${tj.checkin}</td>
                                <td>${tj.common_checkin}</td>
                                <td>${tj.receive_red_pack}</td>
                                <td>${tj.share_task}</td>
                                <td>${tj.friend_share_task}</td>
                                <td>${tj.read_article}</td>
                                <td>${tj.read_push_article}</td>
                                <td>${tj.accelerate_read_article}</td>
                                <td>${tj.friend_read_article}</td>
                                <td>${tj.invite_friend}</td>
                                <td>${tj.invite_register}</td>
                                <td>${tj.junior_first_day_reward + tj.junior_second_day_reward
                                + tj.junior_third_day_reward + tj.junior_fourth_day_reward +
                                tj.junior_fifth_day_reward + tj.junior_sixth_day_reward}
                                </td>
                                <td>${tj.read_tutorial}</td>
                                <td>${tj.junior_first_read_article}</td>
                                <td>${tj.junior_first_search}</td>
                                <td>${tj.comment_is_replied}</td>
                                <td>${tj.comment_is_liked}</td>
                                <td>${tj.search_task_reward}</td>
                                <td>${tj.post_be_read}</td>
                                <td>${tj.post_img_be_liked}</td>
                                <td>${tj.resource_be_exchanged}</td>
                                <td>${tj.report_reward}</td>
                                <td>${tj.exchange_resource_makeup}</td>
                                <td>${tj.join_fuli_act}</td>
                                <td>${tj.share_kuaima}</td>
                                <td>${tj.team_income}</td>
                                <td>${tj.totalCoinNum}</td>
                                <td>${tj.exchangeRate}</td>
                                <td>${tj.rmb}元</td>
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
$("#menu_tj_browser").addClass('active open');//左侧导航栏选中状态
$("#submen_tj_coin").addClass('active');//左侧导航栏选中状态

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd"));
    gx();
    $("#startTime").slTime({
        callback:function(){
            gx();
        }
    });
}

function gx(){
    var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
    $("#start_time_hidden").val(start);
}

function query(){
    var starttime = $("#start_time_hidden").val();
    window.location.href = "admin/tj/coin?start_time=" + starttime;
}
</script>
</html>