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

    <div id="formPane" style="display: none;padding: 10px;">
        <form id="myform" class="layui-form layui-form-pane1" action="">
            <input type="hidden" name="id" disabled>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">推送应用</label>
                <div class="layui-input-block">
                    <select name="application" id="application" >
                        <option value="">默认</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">推送平台</label>
                <div class="layui-input-block">
                    <select name="platform" id="platform">
                        <option value="">DEFAULT</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">支持版本</label>
                <div class="layui-input-block">
                    <select name="versions" id="versions">
                        <option value="">所有版本</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">通知内容<br><span class="red">必填</span></label>
                <div class="layui-input-block">
                     <input type="text" id="msg" name="msg" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">点击通知动作<br><span class="red">必填</span></label>
                <div class="layui-input-block">
                    <select name="clickActionType" id="clickActionType">
                        <option value="2">打开App内指定页面</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">跳转链接</label>
                <div class="layui-input-block">
                     <input type="text" id="action" name="action" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">跳转是否要登录</label>
                <div class="layui-input-block">
                    <input type="checkbox" lay-filter="needLogin" id="needLoginShow" lay-skin="switch" lay-text="是|否">
                    <input type="hidden" id="needLogin" name="needLogin" value="0" />  
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
                <input type="hidden" name="image" id="image" class="layui-input">
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">定时发送时间<br> <a href="javascript:;" id="clearSendTime">清除定时</a></label>
                <div class="layui-input-block">
                    <input class="layui-input" id="send_time" placeholder="定时时间"/>
                    <input type="hidden" name="send_time" value="0">
                </div>
               
            </div>
            <div class="layui-form-item">
                <div class="red">**注意**</div>
                <p>
                    点击通知动作选择: 打开App, 跳转链接为空<br>
                    点击通知动作选择: 打开Url, 跳转链接必须是: http://XXX; <br>
                    点击通知动作选择打开App指定页面时,跳转链接如下:<br>
                    <ol class="has_order">
                        <li>kmb://taskdetail?param={"taskid": 1} //赏金任务详情</li>
                        <li>kmb://recommend?url=http://news.kuaima.cn/article.html?id=116667 //资讯详情</li>
                        <li>kmb://makemoney //赚钱tab</li>
                        <li>kmb://video //视频tab</li>
                        <li>kmb://mine //单播都先跳到“我的”界面</li>
                        <li>kmb://msgcenter //消息中心</li>
                        <li>kmb://worthreading?id=116667 //值得看详情</li>
                        <li>kmb://worthreadingtab //值得看tab</li>
                    </ol>
                </p>
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