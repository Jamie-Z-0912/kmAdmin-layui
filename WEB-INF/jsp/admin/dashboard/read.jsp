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
            <col width="80">
            <col width="6.4%">
            <col width="7.4%">
            <col width="9%">
            <col width="9%">
            <col width="8%">
            <col width="9%">
            <col width="9%">
            <col width="7%">
            <col width="8%">
            <col width="9%">
            <col >
        </colgroup>
        <thead>
            <tr>
                <th>日期</th>
                <th>日活</th>
                <th>总阅读量</th>
                <th>转发总投放量</th>
                <th>转发有效阅读</th>
                <th>转发完成度</th>
                <th>文章有效阅读</th>
                <th>文章有效阅读占比</th>
                <th>转发用户</th>
                <th>阅读用户</th>
                <th>转发用户占比</th>
                <th>阅读用户占比</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${statsReads}" var="tj" varStatus="st">
                <tr>
                    <td>${tj.date}</td>
                    <td>${tj.totalActiveUser}</td>
                    <td>${tj.totalValidReadNum}</td>
                    <td>${tj.totalTaskPutNum}</td>
                    <td>${tj.taskValidReadNum}</td>
                    <td>
                    <c:if test="${tj.totalTaskPutNum > 0}">
                        <fmt:formatNumber value="${tj.taskValidReadNum / tj.totalTaskPutNum * 100}" pattern="#0.00" />%
                    </c:if>
                    <c:if test="${tj.totalTaskPutNum <= 0}"> 0% </c:if>
                    </td>
                    <td>${tj.articleValidReadNum}</td>
                    <td>
                        <c:if test="${tj.totalValidReadNum > 0}">
                            <fmt:formatNumber value="${tj.articleValidReadNum / tj.totalValidReadNum * 100}" pattern="#0.00" />%
                        </c:if>
                        <c:if test="${tj.totalValidReadNum <= 0}"> 0% </c:if>
                    </td>
                    <td>${tj.taskUserNum}</td>
                    <td>${tj.articleReadUserNum}</td>
                    <td>
                        <c:if test="${tj.totalActiveUser > 0}">
                            <fmt:formatNumber value="${tj.taskUserNum / tj.totalActiveUser * 100}" pattern="#0.00" />%
                        </c:if>
                        <c:if test="${tj.totalActiveUser <= 0}"> 0% </c:if>
                    </td>
                    <td>
                        <c:if test="${tj.totalActiveUser > 0}">
                            <fmt:formatNumber value="${tj.articleReadUserNum / tj.totalActiveUser * 100}" pattern="#0.00" />%
                        </c:if>
                        <c:if test="${tj.totalActiveUser <= 0}"> 0% </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script src="/km_task/v2/plugins/layui/layui.min.js"></script>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('daRead');
</script>

</body>
</html>