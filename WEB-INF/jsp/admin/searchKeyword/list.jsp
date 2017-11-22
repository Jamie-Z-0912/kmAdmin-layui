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
    <link rel="stylesheet" href="/km_task/v2/css/main.css?t=11015" />
    <script src="/km_task/v2/plugins/layui/layui.min.js"></script>
</head>
<body>
    <div class="admin-main">
        <form class="layui-form" id="queryForm">
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
                <div class="layui-inline">
                    <label class="layui-form-label">链接</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="url" >
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">来源</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="source">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
                <a class="layui-btn js-operation" data-type="add"><i class="layui-icon">&#xe608;</i> 添加</a>
				<div class="tag layui-bg-orange"> 总投放量:${totalPutNum} </div>
				<div class="tag layui-bg-orange"> 总搜索量:${totalSearchNum} </div>
            </div>
        </form>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col width="8%">
                <col>
                <col width="8.4%">
                <col width="8%">
                <col width="84">
                <col width="84">
                <col width="7%">
                <col width="7%">
                <col width="84">
                <col width="5%">
                <col width="5%">
            </colgroup>
			<thead>
				<tr>
					<th>关键词</th>
					<th>链接</th>
					<th>投放平台</th>
					<th>来源</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>投放量</th>
                    <th>搜索量</th>
                    <th>添加时间</th>
                    <th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${searchKeywords}" var="word" varStatus="st">
					<tr>
						<td><a target="_blank" href="${word.url}">${word.keyword}</a></td>
						<td>${word.url}</td>
						<td>${word.platform}</td>
						<td>${word.source}</td>
						<td><suishen_fmt:formatDate value="${word.startTime}" /></td>
						<td><suishen_fmt:formatDate value="${word.endTime}" /></td>
						<td><font color="red">${word.putNum}</font></td>
						<td><font color="green">${word.searchNum}</font></td>
						<td><suishen_fmt:formatDate value="${word.addedTime}" /></td>
                        <td><c:choose>
                            <c:when test="${word.status==1}">上架</c:when>
                            <c:otherwise>下架</c:otherwise>
                        </c:choose></td>
						<td class="option">
							<a class="js-operation" data-type="edit" data-id="${word.id}" href="javascript:;">编辑</a>
                            <c:choose>
                                <c:when test="${word.status==0}">
                                	<a class="js-operation" data-type="up" data-id="${word.id}" href="javascript:;">上架</a>
                                </c:when>
                                <c:otherwise>
                                	<a class="js-operation" data-type="down" data-id="${word.id}" href="javascript:;">下架</a>
                                </c:otherwise>
                            </c:choose>
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
            <input type="hidden" name="id" disabled>
            <div class="layui-form-item">
                <label class="layui-form-label">搜索关键词<br><span class="red">必填</span></label>
                <div class="layui-input-block">
                    <textarea id="keyword" name="keyword" placeholder="可批量添加,以英文逗号分隔" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">关键词链接<br><span class="red">必填</span></label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="url" name="url" />
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">投放平台<br><span class="red">必填</span></label>
                <div class="layui-input-block">
                    <select name="platform" id="platform">
                        <option value="">DEFAULT</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">来源</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="source" name="source" />
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">投放数目<br><span class="red">必填</span></label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="putNum" name="putNum" placeholder="需大于0" />
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="startTime" placeholder="开始时间"/>
                    <input type="hidden" name="start_time">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="endTime" placeholder="结束时间"/>
                    <input type="hidden" name="end_time">
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


<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('searchKeywords');
</script> 
</body>
</html>