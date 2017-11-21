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
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">应用</label>
                    <div class="layui-input-inline">
                        <select name="application">
                            <c:forEach items="${applications}" var="app">
                                <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">设备平台</label>
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
                <div class="layui-inline">
                    <label class="layui-form-label">广告位</label>
                    <div class="layui-input-inline">
                        <select name="location">
                            <c:forEach items="${locations}" var="loa" varStatus="st">
                                <option value="${loa.location}" <c:if test="${loa.location == location}">selected</c:if>>${loa.desc}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">版本</label>
                    <div class="layui-input-inline">
                        <select name="version">
                            <option value="0" <c:if test="${0 == version}">selected</c:if>>所有</option>
                            <c:forEach items="${versions}" var="ver" varStatus="st">
                                <option value="${ver}" <c:if test="${ver == version}">selected</c:if>>${ver}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
                <a class="layui-btn js-operation" data-type="add"><i class="layui-icon">&#xe608;</i> 添加</a> <font color="red"> (修改后最多10分钟生效)</font>
            </div>
        </form>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col width="46">
                <col width="80">
                <col width="9%">
                <col width="80">
                <col width="54">
                <col width="8.2%">
                <col width="9%">
                <col width="9%">
                <col width="9%">
                <col width="86">
                <col width="86">
                <col >
            </colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>应用</th>
					<th>广告位</th>
                    <th>平台</th>
                    <th>版本</th>
                    <th>广告布局</th>
                    <th>广告渠道</th>
                    <th>第三方授权AppID</th>
                    <th>第三方广告位ID</th>
					<th>添加时间</th>
                    <th>修改时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="alc" varStatus="st">
					<tr>
						<td>${alc.id}</td>
                        <td>${alc.application}</td>
                        <td>${alc.locationDesc}</td>
                        <td>${alc.platform}</td>
                        <td>${alc.version}</td>
                        <td>
                            <c:forEach items="${layouts}" var="lay" varStatus="st">
                                <c:if test="${lay.layout == alc.layout}">${lay.desc}</c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${adChannels}" var="adc" varStatus="st">
                                <c:if test="${adc.type == alc.adsType}">${adc.desc}</c:if>
                            </c:forEach>
                        </td>
                        <td>${alc.adAppId}</td>
                        <td>${alc.thirdLocationId}</td>
						<td><suishen_fmt:formatDate value="${alc.addedTime}" /></td>
                        <td><suishen_fmt:formatDate value="${alc.updateTime}" /></td>
                        <td class="option">
                            <a class="js-operation" data-type="edit" data-id="${alc.id}" href="javascript:;">编辑</a>
                            <c:if test="${alc.status == 0}">
                                <a class="js-operation" data-type="up" data-id="${alc.id}" href="javascript:;">打开</a>
                                <span>关闭中</span>
                            </c:if>
                            <c:if test="${alc.status == 1}">
                                <a class="js-operation" data-type="down" data-id="${alc.id}" href="javascript:;">关闭</a>
                                <span>打开中</span>
                            </c:if> 
                        </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
    </div>

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
                <label class="layui-form-label">广告位</label>
                <div class="layui-input-block">
                    <select name="location" id="location">
                        <option value="">默认</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">设备平台</label>
                <div class="layui-input-block">
                    <select name="platform" id="platform">
                        <option value="">默认</option>
                    </select>   
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">版本</label>
                <div class="layui-input-block">
                    <select name="version" id="version">
                        <option value="">默认</option>
                    </select>   
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">支持布局</label>
                <div class="layui-input-block">
                    <select name="layout" id="layout">
                        <option value="">默认</option>
                    </select>   
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">支持渠道</label>
                <div class="layui-input-block">
                    <select name="adsType" id="adsType">
                        <option value="">默认</option>
                    </select>   
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">第三方授权AppID</label>
                <div class="layui-input-block">
                    <input type="text" name="adAppId" id="adAppId" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">第三方广告位ID</label>
                <div class="layui-input-block">
                    <input type="text" name="thirdLocationId" id="thirdLocationId" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <input type="text" id="remarks" name="remarks" placeholder="输入备注内容" class="layui-input">
                </div>
            </div>
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
    .use('adLocationConfig');
</script> 
</body>
</html>