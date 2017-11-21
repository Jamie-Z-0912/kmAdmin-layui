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
    <link rel="stylesheet" href="/km_task/v2/css/main.css?t=1115" />
    <script src="/km_task/v2/plugins/layui/layui.min.js"></script>
</head>
<body>
    <div class="admin-main">
        <form class="layui-form" id="queryForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">应用</label>
                    <div class="layui-input-inline">
					    <select name="application">
					        <c:forEach items="${applications}" var="app">
					            <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
					        </c:forEach>
					    </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">平台</label>
                    <div class="layui-input-inline">
              			<select name="platform">
                  			<option value="" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                  			<option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                  			<option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
              			</select>
                    </div>
                </div>
            </div>

	        <div class="layui-form-item">
	            <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
	            <a class="layui-btn js-operation" data-type="add"><i class="layui-icon">&#xe608;</i> 添加</a>
	        </div>
	    </form>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col width="40">
                <col width="8.6%">
                <col width="8.2%">
                <col width="8%">
                <col>
                <col width="8%">
                <col width="11%">
                <col width="5.2%">
                <col width="80">
                <col width="80">
                <col width="80">
                <col width="6%">
            </colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>推送应用</th>
					<th>推送平台</th>
					<th>推送版本</th>
					<th>通知内容</th>
					<th>点击动作</th>
					<th>跳转地址</th>
					<th>跳转需要登陆</th>
					<th>定时发送时间</th>
					<th>添加时间</th>
                    <th>发送时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="systemMsg" varStatus="st">
                    <tr>
                        <td>${systemMsg.id}</td>
                        <td>
                            <c:if test="${systemMsg.application == ''}">默认</c:if>
                            <c:if test="${systemMsg.application != ''}">
                                <c:forEach items="${applications}" var="app">
                                    <c:if test="${app == systemMsg.application}">${app.appName}</c:if>
                                 </c:forEach>
                            </c:if>
                        </td>
                        <td>${systemMsg.platform}</td>
                        <td>
                            <c:if test="${systemMsg.versions == ''}">所有版本</c:if>
                            <c:if test="${systemMsg.versions != ''}">${systemMsg.versions}</c:if>
                        </td>
                        <td>${systemMsg.msg}</td>
                        <td>
                        	<c:forEach items="${msgActions}" var="ma" varStatus="st">
                        		<c:if test="${ma.type == systemMsg.clickActionType}">${ma.desc}</c:if>
                        	</c:forEach>
                        </td>
                        <td>${systemMsg.action}</td>
                        <td>
                        	<c:if test="${systemMsg.needLogin == 1}"><font color="red">是</font></c:if>
                        	<c:if test="${systemMsg.needLogin == 0}">否</c:if>
                        </td>
						<td>
							<c:choose>
								<c:when test="${systemMsg.sendTime != 0}">
									<suishen_fmt:formatDate value="${systemMsg.sendTime}" /></td>
								</c:when>
							</c:choose>
						</td>
						<td><suishen_fmt:formatDate value="${systemMsg.addedTime}" /></td>
                        <td><suishen_fmt:formatDate value="${systemMsg.updateTime}" /></td>
                        <td class="option">
                            <c:if test="${systemMsg.status == 1}">
                            	<a class="js-operation" data-type="edit" data-id="${systemMsg.id}" href="javascript:;">编辑</a>
                            	<a class="js-operation" data-type="del" data-id="${systemMsg.id}" href="javascript:;">删除</a>
                            	<a class="js-operation" data-type="send" data-id="${systemMsg.id}" data-app="${systemMsg.application}" data-pla="${systemMsg.platform}" data-ver="${systemMsg.versions}" href="javascript:;">发送</a>
                            </c:if>
                            <c:forEach items="${statusList}" var="msgStatus" varStatus="st">
                                <c:if test="${msgStatus.status == systemMsg.status}">
                                    <span class="gray">${msgStatus.desc}的</span>
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
			</tbody>
		</table>
        <div class="layui-hide">
            <span id="totalPage">${totalPage}</span><span id="curPage">${page}</span>
        </div>
        <div id="page"></div>
	</div>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('systemMsg');
</script> 
</body>
</html>