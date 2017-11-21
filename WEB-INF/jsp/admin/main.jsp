<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header.jsp" />
<div class="layui-layout layui-layout-admin">
    <!-- side -->
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <!-- main body -->
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>后台主页</cite>
                </li>
            </ul>
            <div class="layui-tab-content ifm" style="min-height: 150px;">
                <div class="layui-tab-item layui-show">
                    <iframe src="home.html"></iframe>
                    <!-- <iframe src="/km_task/admin/dashboard/read"></iframe> -->
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp" />