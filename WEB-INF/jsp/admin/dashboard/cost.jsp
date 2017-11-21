<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/km_task/v2/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/km_task/v2/css/main.css" />
</head>
<body>
<!-- 页面 -->
<div class="admin-main">
    <form class="layui-form" id="queryForm" action="">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input class="layui-input" name="startTime" id="q_startTime" placeholder="开始时间"/>
            </div>
            <div class="layui-input-inline t-c">—</div>
            <div class="layui-input-inline">
                <input class="layui-input" name="endTime" id="q_endTime" placeholder="结束时间"/>
            </div>
        </div>
        <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
        <a class="layui-btn js-operation" data-type="derived"><i class="layui-icon">&#xe601;</i> 导出</a>
    </form>
    <table class="layui-table" lay-even="" lay-skin="row">
        <colgroup>
            <col width="58">
            <col width="4.6%">
            <col width="5.4%">
            <col width="4.76%">
            <col width="4.76%">
            <col width="4.26%">
            <col width="4.76%">
            <col width="5%">
            <col width="5%">
            <col width="4.76%">
            <col width="5%">
            <col width="4.6%">
            <col width="4.6%">
            <col >
            <col width="4.6%">
            <col width="4.6%">
            <col width="3.6%">
            <col width="4.6%">
            <col width="4.6%">
            <col width="4.6%">
            <col width="4.6%">
        </colgroup>
        <thead>
            <tr>
                <th>日期</th>
                <th>现金(元)</th>
                <th>金币</th>
                <th>收徒奖励</th>
                <th>新手奖励</th>
                <th>签到</th>
                <th>红包</th>
                <th>分享任务(师+徒)</th>
                <th>阅读任务(师+徒)</th>
                <th>加速阅读</th>
                <th>评论(回复+赞)</th>
                <th>搜索任务</th>
                <th>采集阅读</th>
                <th>采集图片点赞</th>
                <th>资源兑换</th>
                <th>阅读推送</th>
                <th>举报</th>
                <th>福利活动</th>
                <th>分享快马</th>
                <th>团队分红</th>
                <th>汇率</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${statsCosts}" var="statsCost" varStatus="st">
                <tr>
                    <td><a target="_blank" href="admin/tj/coin?start_time=${statsCost.addedTime}">${statsCost.date}</a></td>
                    <td>${statsCost.withdrawCost + statsCost.czCost}</td>
                    <td>${statsCost.totalCoinCost}</td>
                    <td>${statsCost.inviteRegisterCoin + statsCost.inviteFriendCoin}</td>
                    <td>${statsCost.juniorCoin}</td>
                    <td>${statsCost.checkinCoin}</td>
                    <td>${statsCost.redpackCoin}</td>
                    <td>${statsCost.shareTaskCoin}</td>
                    <td>${statsCost.readArticleCoin}</td>
                    <td>${statsCost.accelerateReadArticleCoin}</td>
                    <td>${statsCost.commentCoin + statsCost.likeCoin}</td>
                    <td>${statsCost.searchTaskCoin}</td>
                    <td>${statsCost.readPostCoin}</td>
                    <td>${statsCost.postImgBeLikedCoin}</td>
                    <td>${statsCost.resourceBeExchangedCoin}</td>
                    <td>${statsCost.readPushCoin}</td>
                    <td>${statsCost.reportCoin}</td>
                    <td>${statsCost.fuliActCoin}</td>
                    <td>${statsCost.shareKuaimaCoin}</td>
                    <td>${statsCost.teamTaskCoin}</td>
                    <td>${statsCost.coinExchange}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="note">
        Note：
        <ul>
            <li>2017-07-20日以前收徒奖励 = 师傅邀请奖励 + 徒弟注册奖励</li>
            <li>新手奖励 = 新手登陆奖励 + 新手阅读 + 新手搜索 + 阅读新手教程</li>
            <li>签到 = 正常签到 + 普通签到(阳光普照)</li>
            <li>举报 = 采集文章举报奖励 + 资源举报补偿</li>
            <li>汇率: 1700金币=1元</li>
        </ul>
    </div>
</div>
<script src="/km_task/v2/plugins/layui/layui.min.js"></script>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('daIncome');
</script>
</body>
</html>