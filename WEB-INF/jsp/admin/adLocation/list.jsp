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
    <link rel="stylesheet" href="/km_task/v2/css/main.css?t=1031d2" />
</head>
<body>
<div class="admin-main">
    <form class="layui-form" id="queryForm">
        <div class="layui-inline">
            <select name="application" >
                <c:forEach items="${applications}" var="app">
                <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                </c:forEach>
            </select>
        </div>
        <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
        <a class="layui-btn js-operation" data-type="add"><i class="layui-icon">&#xe608;</i> 添加</a>
    </form>
    <table class="layui-table" lay-even="" lay-skin="row">
        <colgroup>
            <col width="46">
            <col width="8%">
            <col width="10%">
            <col width="56">
            <col width="12%">
            <col width="10%">
            <col width="10%">
            <col>
            <col width="86">
            <col width="86">
            <col width="66">
        </colgroup>
        <thead>
            <tr>
                <th>ID</th>
                <th>应用</th>
                <th>广告位</th>
                <th>图片</th>
                <th>支持设备</th>
                <th>支持版本</th>
                <th>支持布局</th>
                <th>支持渠道</th>
                <th>添加时间</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr> 
        </thead>
		<tbody>
			<c:forEach items="${list}" var="adLocation" varStatus="st">
				<tr>
					<td>${adLocation.id}</td>
	                <td>
	                    <c:if test="${adLocation.application == ''}">
                            默认
                        </c:if>
                        <c:if test="${adLocation.application != ''}">
                            ${adLocation.application}
                        </c:if>
                    </td>
                    <td>
                        ${adLocation.desc}
                    </td>
                    <td class="ad_position">
                        <c:if test="${adLocation.img != ''}">
                            <img title="点击显示大图" src="${adLocation.img}" />
                        </c:if>
                        <c:if test="${adLocation.img == ''}">
                            无图片
                        </c:if>
                    </td>
                    <td>
                        ${adLocation.platform}
                    </td>
                    <td>
                        ${adLocation.version}
                    </td>
                    <td>
                        ${adLocation.layout}
                    </td>
                    <td>
                        ${adLocation.adsType}
                    </td>
					<td><suishen_fmt:formatDate value="${adLocation.addedTime}" /></td>
                    <td><suishen_fmt:formatDate value="${adLocation.updateTime}" /></td>
					<td class="option">
                        <span>
                        <c:if test="${adLocation.status == 1}">正常</c:if>
                        <c:if test="${adLocation.status == 0}">删除</c:if>
                        </span>
                        <a class="js-operation" data-type="edit" data-id="${adLocation.id}" href="javascript:;">编辑</a>
                        <a class="js-operation" data-type="del" data-id="${adLocation.id}" href="javascript:;">删除</a>
                        <a class="js-operation" data-type="onOff" data-location="${adLocation.location}" data-application="${adLocation.application}" href="javascript:;">广告开个</a>
                    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
    <!-- 表单 -->
    <div id="formPane" style="display: none;padding: 10px;">
        <form id="myform" class="layui-form layui-form-pane1" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">应用</label>
                <div class="layui-input-block">
                    <select name="application" id="application">
                        <option value="">默认</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">广告位code</label>
                <div class="layui-input-block">
                    <input type="text" name="location" id="location" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">广告位描述</label>
                <div class="layui-input-block">
                    <input type="text" name="desc" id="desc" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片</label>
                <div class="layui-input-block file">
                    <div class="layui-upimg img">
                        <img src="" class="hide" />
                        <span><i class="layui-icon">&#xe608;</i>上传图片</span>
                        <input type="file" name="file">
                    </div>
                </div>
                <input type="hidden" name="img" id="img" class="layui-input">
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">支持平台</label>
                <div class="layui-input-block" id="platforms">
                    <input type="checkbox" title="ANDROID" value="ANDROID" lay-filter="platform">
                </div>
                <div class="layui-input-block layui-hide">
                    <input type="hidden" name="platform" id="platform" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">支持版本</label>
                <div class="layui-input-block" id="versions">
                    <input type="checkbox" title="140" value="140" lay-filter="version" lay-skin="primary">
                </div>
                <div class="layui-input-block layui-hide">
                    <input type="hidden" name="version" id="version" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">支持布局</label>
                <div class="layui-input-block" id="layouts">
                    <input type="checkbox" title="左右图文" value="左右图文" lay-filter="layout" lay-skin="primary">
                </div>
                <div class="layui-input-block layui-hide">
                    <input type="hidden" name="layout" id="layout" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">支持渠道</label>
                <div class="layui-input-block"id="adsTypes">
                  <input type="checkbox" title="快马直投" value="快马直投" lay-filter="adsType" lay-skin="primary">
                </div>
                <div class="layui-input-block layui-hide"> 
                    <input type="hidden" name="adsType" id="adsType" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <input type="text" name="remarks" id="remarks" placeholder="输入备注内容" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item t-r" id="addBtn">
                <div class="layui-btn" lay-submit lay-filter="add">新增</div>
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
    .use('adLocation');
</script> 
</body>
</html>