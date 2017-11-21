<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 左侧导航栏部分 -->
<div class="container-fluid" id="main-container">
	<div id="sidebar">
		<ul class="nav nav-list">
			<li class="" id="menu_home">
			    <a href="#" class="dropdown-toggle"> <i class="icon icon-signal"></i> <span>Dashboard</span><b class="arrow icon-angle-down"></b></a>
			    <ul class="submenu">
                   <li id="menu_statsSummary"><a href="admin"> <i class="icon icon-asterisk"></i> <span>汇总统计</span></a></li>
                   <li id="menu_statsRead"><a href="admin/dashboard/read"> <i class="icon icon-asterisk"></i> <span>任务情况</span></a></li>
                   <li id="menu_statsIncome"><a href="admin/dashboard/income"> <i class="icon icon-asterisk"></i> <span>收入</span></a></li>
                   <li id="menu_statsCost"><a href="admin/dashboard/cost"> <i class="icon icon-asterisk"></i> <span>花费</span></a></li>
                   <li id="menu_statsUser"><a href="admin/dashboard/user"> <i class="icon icon-asterisk"></i> <span>用户</span></a></li>
                </ul>
			</li>

            <li class="" id="menu_app">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-desktop"></i> <span>应用管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                   <li id="menu_appVersion"><a href="admin/appVersion/list"> <i class="icon icon-asterisk"></i> <span>应用版本</span></a></li>
                   <li id="menu_adsLocation"><a href="admin/adLocation/list"> <i class="icon icon-asterisk"></i> <span>广告位</span></a></li>
                   <li id="menu_adsLocationConfig"><a href="admin/adLocationConfig/list"> <i class="icon icon-asterisk"></i> <span>广告位开关</span></a></li>
                   <li id="menu_ads"><a href="admin/ads/list?adsLocation=timeline_first"> <i class="icon icon-asterisk"></i> <span>广告管理</span></a></li>
                   <li id="menu_popup"><a href="admin/popup/list"> <i class="icon icon-asterisk"></i> <span>弹窗管理</span></a></li>
                   <li id="menu_systemMsg"><a href="admin/systemMsg/list"> <i class="icon icon-asterisk"></i> <span>系统通知</span></a></li>
                   <li id="menu_search_keyword"><a href="admin/searchKeywords/list"> <i class="icon icon-asterisk"></i> <span>搜索补量</span></a></li>
                </ul>
            </li>

             <li class="" id="menu_article">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-book"></i> <span>文章管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_category"><a href="admin/category/list"><i class="icon-double-angle-right"></i>分类管理</a></li>
                    <li id="submenu_article"><a href="admin/article/list?categoryId=0"><i class="icon-double-angle-right"></i>文章管理</a></li>
                    <li id="submenu_fetch"><a href="admin/article/fetch"><i class="icon-double-angle-right"></i>文章抓取</a></li>
                    <li id="submenu_article_toplist"><a href="admin/article/toplist?categoryId=0"><i class="icon-double-angle-right"></i>文章排行榜</a></li>
                </ul>
            </li>

            <li class="" id="menu_zhidekan">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-film"></i> <span>值得看</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_initial_user"><a href="admin/initialUsers/list"><i class="icon-double-angle-right"></i>采集用户</a></li>
                    <li id="submenu_initial_user_apply"><a href="admin/initialUsersApply/list"><i class="icon-double-angle-right"></i>采集用户申请</a></li>
                    <li id="submenu_tag"><a href="admin/tag/list?contentType=post"><i class="icon-double-angle-right"></i>标签列表</a></li>
                    <li id="submenu_post"><a href="admin/post/list"><i class="icon-double-angle-right"></i>采集列表</a></li>
                    <li id="submenu_post_topListYesterday"><a href="admin/post/topListYesterday?type=1"><i class="icon-double-angle-right"></i>昨日采集推荐</a></li>
                    <li id="submenu_post_user"><a href="admin/post/userlist"><i class="icon-double-angle-right"></i>用户采集</a></li>
                    <li id="submenu_post_top"><a href="admin/post/toplist"><i class="icon-double-angle-right"></i>采集排行榜</a></li>
                    <li id="submenu_post_read_record"><a href="admin/post/readlist"><i class="icon-double-angle-right"></i>有效阅读记录</a></li>
                    <li id="submenu_post_fetch"><a href="admin/post/fetch"><i class="icon-double-angle-right"></i>文章抓取</a></li>
                    <li id="submenu_reportProcess"><a href="admin/report/processList"><i class="icon-double-angle-right"></i>举报管理</a></li>
                    <li id="submenu_report"><a href="admin/report/list"><i class="icon-double-angle-right"></i>举报记录</a></li>
                </ul>
            </li>
            <li class="" id="menu_team">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-film"></i> <span>团队</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_team_list"><a href="admin/team/team_list?status=-1"><i class="icon-double-angle-right"></i>团队</a></li>
                    <li id="submenu_team_member_list"><a href="admin/team/team_member_list"><i class="icon-double-angle-right"></i>团队成员</a></li>
                    <li id="submenu_team_balance_list"><a href="admin/team/team_balance_list"><i class="icon-double-angle-right"></i>团队分红</a></li>
                    <li id="submenu_team_member_balance_list"><a href="admin/team/team_member_balance_list"><i class="icon-double-angle-right"></i>团队成员分红</a></li>

                </ul>
            </li>

            <li class="" id="menu_comment">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-pencil"></i> <span>评论管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_comment"><a href="admin/comment/list"><i class="icon-double-angle-right"></i>评论列表</a></li>
                </ul>
            </li>

            <li class="" id="menu_task">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-tasks"></i> <span>分享任务</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="browser_task"><a href="admin/browserTask/list"><i class="icon-double-angle-right"></i>任务管理</a></li>
                    <li id="submenu_browser_task_order"><a href="admin/socialTaskOrders"><i class="icon-double-angle-right"></i>任务订单</a></li>
                    <li id="submenu_viewLogs"><a href="admin/viewLogs"><i class="icon-double-angle-right"></i>阅读记录</a></li>
                </ul>
            </li>

            <li class="" id="menu_activity">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-bookmark"></i> <span>运营活动/列表</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_aggregation"><a href="admin/aggregation/list"><i class="icon-double-angle-right"></i>列表页</a></li>
                    <li id="submenu_optActivity"><a href="admin/optActivity/list"><i class="icon-double-angle-right"></i>活动管理</a></li>
                    <li id="submenu_activityRewardLog"><a href="admin/optActivity/rewardLogs"><i class="icon-double-angle-right"></i>活动奖励</a></li>
                </ul>
            </li>

            <li class="" id="menu_redPack">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-envelope"></i> <span>红包管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="menu_redPackList"><a href="admin/redpack/list"><i class="icon-double-angle-right"></i>红包列表</a></li>
                    <li id="menu_redPackSetting"><a href="admin/redpack/setting"> <i class="icon icon-asterisk"></i> <span>红包配置</span></a></li>
                </ul>
            </li>

            <li class="" id="menu_card">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-gift"></i> <span>卡券管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_card"><a href="admin/cards/list"><i class="icon-double-angle-right"></i>虚拟卡券</a></li>
                    <li id="submenu_userCard"><a href="admin/cards/user"><i class="icon-double-angle-right"></i>用户卡券列表</a></li>
                    <li id="submenu_read_accelerate"><a href="admin/cards/readAccelerate"><i class="icon-double-angle-right"></i>阅读加速状态</a></li>
                </ul>
            </li>

            <li class="" id="menu_coin">
                <a href="#" class="dropdown-toggle"><i class="icon icon-inbox"></i> <span>金币管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_coinRule"><a href="admin/coinRule/list"><i class="icon-double-angle-right"></i>金币规则</a></li>
                    <li id="submenu_coinExchange"><a href="admin/coinExchange/list"><i class="icon-double-angle-right"></i>每日汇率</a></li>
                    <li id="submenu_activity_mag"><a href="admin/activity/show"><i class="icon-double-angle-right"></i>金币活动管理</a></li>
                    <c:if test="${__LOGINUSER.userName == 'wqy' || __LOGINUSER.userName == 'wyx' || __LOGINUSER.userName == 'admin'}">
                        <li id="submenu_addCoin"><a href="admin/coinEvent/add"><i class="icon-double-angle-right"></i>+金币</a></li>
                    </c:if>
                </ul>
            </li>
            <li class="" id="menu_novel">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-book"></i> <span>首页推送管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_pushRule"><a href="admin/pushRule/list?ruleType=1"><i class="icon-double-angle-right"></i>推送规则</a></li>
                    <li id="submenu_recommendQueue"><a href="admin/recommendQueue/list?recType=1"><i class="icon-double-angle-right"></i>内容推荐队列</a></li>

                </ul>
            </li>

            <li class="" id="menu_recall"><a href="admin/recallPlan/list"><i class="icon icon-user"></i>用户召回</a>

            <li class="" id="menu_stat">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-search"></i> <span>用户数据查询</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_stat_users"><a href="admin/users/base"><i class="icon-double-angle-right"></i>基本信息</a></li>
                    <li id="submenu_stat_userCoin"><a href="admin/users/coin"><i class="icon-double-angle-right"></i>金币数据</a></li>
                    <li id="submenu_stat_cash"><a href="admin/users/cash"><i class="icon-double-angle-right"></i>现金流水</a></li>
                    <li id="submenu_stat_friendlist"><a href="admin/inviteRelation/friends"><i class="icon-double-angle-right"></i>好友列表</a></li>
                    <li id="submenu_login_log"><a href="admin/users/loginLog"><i class="icon-double-angle-right"></i>登陆日志</a></li>
                    <li id="submenu_search_log"><a href="admin/users/searchLog"><i class="icon-double-angle-right"></i>搜索记录</a></li>
                    <li id="submenu_resource_exchange"><a href="admin/post/exchangeOrders"><i class="icon-double-angle-right"></i>资源兑换</a></li>
                    <li id="submenu_top_list"> <a href="admin/top/list"> <i class="icon-double-angle-right"></i>收徒/收益排行榜</a></li>
                    <li id="submenu_verifyCode"> <a href="admin/verifyCode?phone=0"> <i class="icon-double-angle-right"></i>验证码</a></li>
                    <li id="submenu_hotKeywords"> <a href="admin/tj/searchHotKeywords"> <i class="icon-double-angle-right"></i>热门关键词统计</a></li>
                </ul>
            </li>

            <li class="" id="menu_tj_browser">
                <a href="#" class="dropdown-toggle"><i class="icon icon-bar-chart"></i> <span>数据统计</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submen_tj_checkin"><a href="admin/tj/checkin"><i class="icon-double-angle-right"></i>签到</a></li>
                    <li id="submen_tj_redpack"><a href="admin/tj/common?eventType=receiveRedPack"><i class="icon-double-angle-right"></i>红包</a></li>
                    <li id="submen_tj_inviteFriend"><a href="admin/tj/common?eventType=inviteFriend"><i class="icon-double-angle-right"></i>邀请好友</a></li>
                    <li id="submen_tj_readArticle"><a href="admin/tj/common?eventType=readArticle"><i class="icon-double-angle-right"></i>阅读文章</a></li>
                    <li id="submen_tj_post"><a href="admin/tj/post"><i class="icon-double-angle-right"></i>采集</a></li>
                    <li id="submen_tj_post"><a href="admin/tj/team"><i class="icon-double-angle-right"></i>团队</a></li>
                    <li id="submen_tj_task"><a href="admin/tj/browserTask"><i class="icon-double-angle-right"></i>分享任务</a></li>
                    <li id="submen_tj_comment"><a href="admin/tj/comment"><i class="icon-double-angle-right"></i>评论</a></li>
                    <li id="submen_tj_like"><a href="admin/tj/common?eventType=commentIsLiked"><i class="icon-double-angle-right"></i>评论点赞</a></li>
                    <li id="submen_tj_search"><a href="admin/tj/searchLog"><i class="icon-double-angle-right"></i>搜索</a></li>
                    <li id="submen_tj_coin"><a href="admin/tj/coin"><i class="icon-double-angle-right"></i>每日金币</a></li>
                    <li id="submen_tj_card"><a href="admin/tj/card"><i class="icon-double-angle-right"></i>加速卡</a></li>
                    <li id="submen_tj_exchangeResource"><a href="admin/tj/exchangeResource"><i class="icon-double-angle-right"></i>资源兑换</a></li>
                    <li id="submen_tj_withdraw"><a href="admin/tj/withdraw"><i class="icon-double-angle-right"></i>提现</a></li>
                    <li id="submen_tj_cz"><a href="admin/tj/cz"><i class="icon-double-angle-right"></i>充值</a></li>
                </ul>
            </li>

            <li class="" id="menu_tj_date"><a href="admin/tj/date"><i class="icon icon-key"></i> <span>财务数据</span></a>

            <li class="" id="menu_withdraw">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-credit-card"></i> <span>提现充值</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_withdraw_order"><a href="admin/withdraw/list?status=6&type=2&isFast=1"><i class="icon-double-angle-right"></i>提现</a></li>
                    <li id="menu_cz"><a href="admin/cz/list?status=7"><i class="icon icon-phone"></i>充值</a></li>
                    <li id="menu_duiba_order"><a href="admin/duibaOrders/list"><i class="icon icon-phone"></i>兑吧订单列表</a></li>
                    <li id="withdraw_find"><a href="admin/withdraw/list_find"><i class="icon-double-angle-right"></i>提现/充值记录</a></li>
                    <li id="submenu_withdraw_account"><a href="admin/withdraw/account"><i class="icon-double-angle-right"></i>提现账号查询</a></li>
                </ul>
            </li>

            <li class="" id="menu_black">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-user"></i> <span>黑名单管理</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_black_users"><a href="admin/blackUsers"><i class="icon-double-angle-right"></i>黑名单</a></li>
                    <li id="submenu_white_users"><a href="admin/whiteUser/list"><i class="icon-double-angle-right"></i>白名单</a></li>
                </ul>
            </li>
            <li class="" id="menu_sensitiveWords"><a href="admin/sensitiveWords/list"> <i class="icon-heart"></i> <span>敏感词管理</span></a>

            <li class="" id="menu_monitor">
                <a href="#" class="dropdown-toggle"> <i class="icon icon-eye-open"></i> <span>系统配置/监控</span> <b class="arrow icon-angle-down"></b></a>
                <ul class="submenu">
                    <li id="submenu_config"><a href="admin/systemSetting/list"><i class="icon-double-angle-right"></i>配置管理</a></li>
                    <li id="submenu_optLog"><a href="admin/optLogs"><i class="icon-double-angle-right"></i>后台操作日志</a></li>
                    <li id="submenu_redis"><a href="admin/monitor/redis"><i class="icon-double-angle-right"></i>Redis监控</a></li>
                    <li id="submenu_db"><a href="admin/monitor/db"><i class="icon-double-angle-right"></i>DB监控</a></li>
                </ul>
            </li>
		</ul>
	</div>
</div>