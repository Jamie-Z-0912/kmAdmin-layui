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
                        <select name="platform">
                            <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                            <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                            <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">投放位置</label>
                    <div class="layui-input-inline">
                        <select name="location">
                            <c:forEach items="${popupLocations}" var="pl" varStatus="st">
                                <option value="${pl.location}" <c:if test="${pl.location == location}">selected</c:if>>${pl.desc}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">弹窗状态</label>
                    <div class="layui-input-inline">
                        <select name="status">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>新建</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>下架</option>
                            <option value="2" <c:if test="${2 == status}">selected</c:if>>上架</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">开始时间</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="q_startTime" name="startTime" placeholder="开始时间">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">结束时间</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="q_endTime" name="endTime" placeholder="结束时间">
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
                <col>
                <col width="80">
                <col width="8.6%">
                <col width="8%">
                <col width="9%">
                <col width="9%">
                <col width="8%">
                <col width="5%">
                <col width="84">
                <col width="84">
                <col width="84">
                <col width="5.2%">
            </colgroup>
			<thead>
				<tr>
					<th>弹窗标题</th>
                    <th>图片</th>
                    <th>投放平台</th>
                    <th>投放位置</th>
                    <th>投放用户组</th>
                    <th>是否要登陆</th>
                    <th>弹窗次数</th>
                    <th>状态</th>
					<th>开始时间</th>
                    <th>结束时间</th>
                    <th>添加时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="popup" varStatus="st">
                    <tr>
                        <td>
                           <a href="${popup.url}">${popup.title}</a>
                        </td>
                        <td><img src="${popup.image}" /></td>
                        <td>
                            ${popup.platform}
                        </td>
                        <td>
                            <c:forEach items="${popupLocations}" var="pl" varStatus="st">
                                <c:if test="${pl.location == popup.location}">
                                    ${pl.desc}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${userGroups}" var="userGroup" varStatus="st">
                                <c:if test="${userGroup.group == popup.userGroups}">${userGroup.groupName}</c:if>
                            </c:forEach>
                            <c:if test="${popup.userGroups == ''}">所有用户</c:if>
                        </td>
                        <td>
                            <c:if test="${popup.needLogin}">是</c:if>
                            <c:if test="${!popup.needLogin}">否</c:if>
                        </td>
                        <td>${popup.num}</td>
                        <td>
                            <c:choose>
                                <c:when test="${0 == popup.status}">
                                    <span style="color:gray">新建</span>
                                </c:when>
                                <c:when test="${1 == popup.status}">
                                    <span>下架</span>
                                </c:when>
                                <c:when test="${2 == popup.status}">
                                    <span style="color:lightgreen">上架</span>
                                </c:when>
                                <c:when test="${now > popup.endTime}">
                                    <span style="color:gray">过期</span>
                                </c:when>
                            </c:choose>
                        </td>
                        <td><suishen_fmt:formatDate value="${popup.startTime}" /></td>
                        <td><suishen_fmt:formatDate value="${popup.endTime}" /></td>
                        <td><suishen_fmt:formatDate value="${popup.addedTime}" /></td>
                        <td class="option">
                            <a class="js-operation" data-type="edit" data-id="${ad.id}" href="javascript:;">编辑</a>
                            <c:if test="${popup.status == 1 || popup.status == 0}">
                                <a class="js-operation" data-type="up" data-id="${ad.id}" href="javascript:;">上架</a>
                            </c:if>
                            <c:if test="${popup.status == 2}">
                                <a class="js-operation" data-type="down" data-id="${ad.id}" href="javascript:;">下架</a>
                            </c:if>
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

    <!-- 表单 -->
    <div id="formPane" style="display: none;padding: 10px;">
        <form id="myform" class="layui-form layui-form-pane1" action="">
        </form>
    </div>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('popup');
</script> 
</body>
</html>