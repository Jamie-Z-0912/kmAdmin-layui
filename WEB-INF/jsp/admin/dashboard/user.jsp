<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
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
            <col width="70">
            <col width="6.8%">
            <col >
            <col width="6.8%">
            <col width="7.2%">
            <col width="6.8%">
            <col width="6.8%">
            <col width="7.5%">
            <col width="7.4%">
            <col width="7.4%">
            <col width="6.8%">
            <col width="7.4%">
            <col width="7.4%">
            <col width="6.8%">
        </colgroup>
        <thead>
            <tr>
                <th>日期</th>
                <th>新增</th>
                <th>日活</th>
                <th>总注册</th>
                <th>邀请注册</th>
                <th>邀请注册占比</th>
                <th>有效邀请注册</th>
                <th>有效邀请注册比</th>
                <th>DNU安卓</th>
                <th>DAU安卓</th>
                <th>次日留存安卓</th>
                <th>DNU(IOS)</th>
                <th>DAU(IOS)</th>
                <th>次日留存IOS</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${statsUsers}" var="statsUser" varStatus="st">
                <tr>
                    <c:if test="${statsUser.date == 0}">
                        <td>合计</td>
                    </c:if>
                    <c:if test="${statsUser.date > 0}">
                        <td>${statsUser.date}</td>
                    </c:if>
                    <td>${statsUser.newAndroidDevice + statsUser.newIosDevice}</td>
                    <td>${statsUser.androidActiveDevice + statsUser.iosActiveDevice}</td>
                    <td>${statsUser.totalRegister}</td>
                    <td>${statsUser.inviteRegister}</td>
                    <c:if test="${statsUser.inviteRegister > 0}">
                        <td><fmt:formatNumber value="${statsUser.inviteRegister / statsUser.totalRegister * 100}" pattern="#0.00" />%</td>
                    </c:if>
                    <c:if test="${statsUser.inviteRegister <= 0}">
                        <td>0%</td>
                    </c:if>

                    <td>${statsUser.validInviteRegister}</td>
                    <c:if test="${statsUser.inviteRegister > 0}">
                        <td><fmt:formatNumber value="${statsUser.validInviteRegister / statsUser.inviteRegister * 100}" pattern="#0.00" />%</td>
                    </c:if>
                    <c:if test="${statsUser.inviteRegister <= 0}">
                        <td>0%</td>
                    </c:if>
                    <td>${statsUser.newAndroidDevice}</td>
                    <td>${statsUser.androidActiveDevice}</td>
                    <td>${statsUser.androidDailyRetention}%</td>
                    <td>${statsUser.newIosDevice}</td>
                    <td>${statsUser.iosActiveDevice}</td>
                    <td>${statsUser.iosDailyRetention}%</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="note">
        Note：
        <ul>
            <li>邀请注册占比 = 邀请注册 / 总注册</li>
            <li>有效邀请注册比 = 有效邀请注册 / 邀请注册</li>
            <li>有效邀请注册: 被师傅邀请注册，安装了App，并且至少读了一篇文章或做了分享任务;</li>
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
    .use('daUser');
</script>
</body>
</html>