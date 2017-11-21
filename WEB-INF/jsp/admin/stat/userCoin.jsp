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
                用户金币信息
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/users/coin" method="get" id="basic_validate" name="basic_validate"
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

                <div class="control-group">
                    <label class="control-label">日期</label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="startTime" id="start_time_hidden" />
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
                            <th>新手登陆</th>
                            <th>新手教程</th>
                            <th>新手阅读</th>
                            <th>新手搜索</th>
                            <th>签到</th>
                            <th>普通签到</th>
                            <th>红包</th>
                            <th>注册</th>
                            <th>分享任务</th>
                            <th>阅读文章</th>
                            <th>邀请好友</th>
                            <th>好友阅读文章</th>
                            <th>好友分享任务</th>
                            <th>评论被回复</th>
                            <th>评论被点赞</th>
                            <th>搜索任务</th>
                            <th>福利活动</th>
                            <th>采集被阅读</th>
                            <th>采集图片被点赞</th>
                            <th>兑换资源补偿</th>
                            <th>采集资源被兑换</th>
                            <th>总金币数</th>
                        </tr>
                    </thead>
                        <tbody>
                                <tr>
                                    <td>${kmbrowser.junior_first_day_reward + kmbrowser.junior_second_day_reward
                                        + kmbrowser.junior_third_day_reward + kmbrowser.junior_fourth_day_reward +
                                        kmbrowser.junior_fifth_day_reward + kmbrowser.junior_sixth_day_reward}
                                    </td>
                                    <td>${kmbrowser.read_tutorial}</td>
                                    <td>${kmbrowser.junior_first_read_article}</td>
                                    <td>${kmbrowser.junior_first_search}</td>
                                    <td>${kmbrowser.checkin}</td>
                                    <td>${kmbrowser.common_checkin}</td>
                                    <td>${kmbrowser.receive_red_pack}</td>
                                    <td>${kmbrowser.invite_register}</td>
                                    <td>${kmbrowser.share_task}</td>
                                    <td>${kmbrowser.read_article}</td>
                                    <td>${kmbrowser.invite_friend}</td>
                                    <td>${kmbrowser.friend_read_article}</td>
                                    <td>${kmbrowser.friend_share_task}</td>
                                    <td>${kmbrowser.comment_is_replied}</td>
                                    <td>${kmbrowser.comment_is_liked}</td>
                                    <td>${kmbrowser.search_task_reward}</td>
                                    <td>${kmbrowser.join_fuli_act}</td>
                                    <td>${kmbrowser.post_be_read}</td>
                                    <td>${kmbrowser.post_img_be_liked}</td>
                                    <td>${kmbrowser.exchange_resource_makeup}</td>
                                    <td>${kmbrowser.resource_be_exchanged}</td>
                                    <td>${kmbrowser.totalCoinNum}</td>
                                </tr>
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
$("#submenu_stat_userCoin").addClass('active');
if ($("#startTime").length > 0) {
    $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd"));
    gx();
    $("#startTime").slTime({
        callback:function(){
            gx();
        }
    });
}
function gx(){
    var start = new Date($("#startTime").val().replace(/-/g,   "/")).format("yyyy-MM-dd");
    $("#start_time_hidden").val(start);
    $("#startTime").val(new Date(start).format("yyyy-MM-dd"));
}
</script>
</html>