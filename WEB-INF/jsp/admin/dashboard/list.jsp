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
            <col width="78">
            <col width="11.12%">
            <col width="12%">
            <col width="12%">
            <col>
            <col width="11.12%">
            <col width="11.12%">
            <col width="11.12%">
            <col width="60">
        </colgroup>
        <thead>
            <tr>
                <th>日期</th>
                <th>总有效阅读数</th>
                <th>总收入</th>
                <th>总花费（金币兑换）</th>
                <th>提现支出（提现+充值）</th>
                <th>PV</th>
                <th>DAU价值</th>
                <th>单次有效阅读收入</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${statsSummaries}" var="statsSummary" varStatus="st">
                <tr>
                    <c:if test="${statsSummary.date == 0}">
                        <td>合计</td>
                    </c:if>
                    <c:if test="${statsSummary.date > 0}">
                        <td>${statsSummary.date}</td>
                    </c:if>
                    <td>${statsSummary.articleValidReadNum}</td>
                    <td>${statsSummary.totalIncome}</td>
                    <td>${statsSummary.totalCoinCost}</td>
                    <td>${statsSummary.czCost + statsSummary.withdrawCost}</td>
                    <td>${statsSummary.oneArticleValidReadIncome}</td>
                    <td>${statsSummary.articleDetailsViewNum}</td>
                    <td>${statsSummary.dauValue}</td>
                    <td class="option">
                        <a class="js-operation" data-type="edit" data-id="23" href="javascript:;">编辑</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- 表单 -->
<div id="formPane" style="display: none;padding: 10px;">
    <form class="layui-form layui-form-pane1" action="admin/dashboard/updateStatsSummary" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label w40">日期</label>
            <div class="layui-input-block">
                <input type="text" name="date" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">PV</label>
            <div class="layui-input-block">
                <input type="text" name="articleDetailsViewNum" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item t-r" id="updateBtn">
            <div class="layui-btn" lay-submit lay-filter="update">修改</div>
        </div>
        <button type="reset" id="reset" class="layui-hide">重置</button>
    </form>
</div>
<script src="/km_task/v2/plugins/layui/layui.min.js"></script>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('daList');
</script>

</body>
</html>