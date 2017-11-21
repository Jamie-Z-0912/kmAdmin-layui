<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext((request).getSession().getServletContext());
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>" />
    <meta charset="utf-8">
    <title>快马后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="v2/plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="v2/plugins/layui/css/global.css" media="all">
</head>

<body>
	<div class="layui-header header">
        <h1 class="logo">快马后台管理 <span class="cur" id="cur"></span></h1>
        <div class="admin-side-toggle">
            <i class="fa fa-bars layui-icon" aria-hidden="true">&#xe65a;</i>
        </div>
		<ul class="layui-nav" pc>
			<li class="layui-nav-item">
                <a class="admin-header-user" href="javascript:;"> 
                    <img alt="photo" src="assets/avatars/avatar.png" class="nav-user-photo"> 
                    <span id="user_info"> <small>Welcome,</small> ${__LOGINUSER.nickName} </span> 
				</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="admin/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                    </dd>
                </dl>
            </li>
		</ul>
	</div>