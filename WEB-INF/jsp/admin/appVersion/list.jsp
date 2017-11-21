<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/km_task/v2/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/km_task/v2/css/main.css" />
</head>
<body>
    <div class="admin-main">
        <form class="layui-form" id="queryForm">
            <div class="layui-inline">
                <select name="application" lay-verify="">
                    <c:forEach items="${applications}" var="app">
                    <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-inline">
                <select name="platform" lay-verify="">
                    <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                    <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                    <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                </select>
            </div>
            <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
            <a class="layui-btn js-operation" data-type="add"><i class="layui-icon">&#xe608;</i> 添加</a>
        </form>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col width="8%">
                <col width="14%">
                <col width="14%">
                <col width="10%">
                <col width="16%">
                <col width="16%">
                <col>
            </colgroup>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>应用</th>
                    <th>平台</th>
                    <th>版本</th>
                    <th>添加时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr> 
            </thead>
			<tbody>
				<c:forEach items="${list}" var="appVersion" varStatus="st">
					<tr>
						<td>${appVersion.id}</td>
						<td>
						    <c:if test="${appVersion.application == ''}">默认</c:if>
                            <c:if test="${appVersion.application != ''}">${appVersion.application}</c:if>
                        </td>
                        <td> ${appVersion.platform} </td>
                        <td> ${appVersion.version} </td>
						<td><suishen_fmt:formatDate value="${appVersion.addedTime}" /></td>
                        <td><suishen_fmt:formatDate value="${appVersion.updateTime}" /></td>
                        <td class="option"><a class="js-operation" data-type="edit" data-id="${appVersion.id}" href="javascript:;">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

    <div id="formPane" style="display: none;padding: 10px;">
        <form class="layui-form layui-form-pane" id="myform" >
            <div class="layui-form-item">
                <label class="layui-form-label">应用</label>
                <div class="layui-input-block">
                    <select name="application" id="application">
                        <option value="">默认</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">平台</label>
                <div class="layui-input-block">
                    <select name="platform" id="platform">
                        <option value="DEFAULT">所有</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">版本</label>
                <div class="layui-input-block">
                    <input type="text" id="version" name="version" autocomplete="off" placeholder="如：110" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                     <input class="layui-input" id="added_time">
                     <input type="hidden" name="added_time">
                </div>
            </div>
            <input type="hidden" id="id" name="id">
            <div class="layui-form-item" id="addBtn">
                <div class="layui-btn" lay-submit lay-filter="add">新增</div>
            </div>
            <div class="layui-form-item" id="updateBtn">
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
    .use('appVersion');
</script> 
</body>
</html>