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
                                <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">广告标题</label>
                    <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="keyword" value="${keyword}"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">投放平台</label>
                    <div class="layui-input-inline">
                        <select name="platform" id="q_platform">
                            <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                            <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                            <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">投放位置</label>
                    <div class="layui-input-inline">
                        <select name="adsLocation">
                            <c:forEach items="${adsLocations}" var="al" varStatus="st">
                                <option value="${al.location}" <c:if test="${al.location == adsLocation}">selected</c:if>>${al.desc}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">广告状态</label>
                    <div class="layui-input-inline">
                        <select name="status">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>新建</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>下架</option>
                            <option value="2" <c:if test="${2 == status}">selected</c:if>>上架</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">开始时间</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="q_startTime" name="startTime">
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
                <col width="46">
                <col width="60">
                <col>
                <col width="80">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
                <col width="7%">
            </colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>应用</th>
					<th>广告标题</th>
                    <th>图片</th>
                    <th>来源</th>
                    <th>布局</th>
                    <th>投放区域</th>
                    <th>投放平台</th>
                    <th>投放位置</th>
                    <th>是否需要登陆</th>
                    <th>tips(标识)</th>
					<th>开始时间</th>
                    <th>结束时间</th>
					<th>操作</th>
				</tr>
			</thead>
            <tbody>
                <c:forEach items="${list}" var="ad" varStatus="st">
                    <tr>
                        <td>${ad.id}</td>
                        <td>
                            <c:if test="${ad.application == ''}">默认</c:if>
                            <c:if test="${ad.application != ''}">
                                ${ad.application}
                            </c:if>
                        </td>
                        <td><a href="${ad.originUrl}">${ad.title}</a></td>
                        <td>
                            <c:forEach items="${ad.imagesList}" var="img" varStatus="st">
                                <img src="${img}" id="avatar" name="avatar"/>
                            </c:forEach>
                        </td>
                        <td>${ad.source}</td>
                        <td>
                            <c:forEach items="${layout}" var="la" varStatus="st">
                                <c:if test="${la.layout == ad.layout}">${la.desc}</c:if>
                            </c:forEach>
                        </td>
                        <td>${ad.city}</td>
                        <td>${ad.platform}</td>
                        <td>
                            <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st">
                                <c:if test="${adsLocation.location == ad.adsLocation}">
                                    ${adsLocation.desc}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:if test="${ad.needLogin}">是</c:if>
                            <c:if test="${!ad.needLogin}">否</c:if>
                        </td>
                        <td>${ad.tips}</td>
                        <td><suishen_fmt:formatDate value="${ad.startTime}" /></td>
                        <td><suishen_fmt:formatDate value="${ad.endTime}" /></td>
                        <td class="option">
                            <a class="js-operation" data-type="edit" data-id="${ad.id}" href="javascript:;">编辑</a>
                            <c:if test="${ad.status == 1 || ad.status == 0}">
                                <a class="js-operation" data-type="up" data-id="${ad.id}" href="javascript:;">上架</a>
                            </c:if>
                            <c:if test="${ad.status == 2}">
                                <a class="js-operation" data-type="down" data-id="${ad.id}" href="javascript:;">下架</a>
                                <a class="js-operation" data-type="toTop" data-id="${ad.id}" href="javascript:;"> 置顶 </a>
                            </c:if>
                            <a class="js-operation" data-type="tongji" data-id="${ad.id}" href="javascript:;">统计</a>
                            <c:choose>
                                <c:when test="${0 == ad.status}">
                                    <span style="color:gray">新建</span>
                                </c:when>
                                <c:when test="${1 == ad.status}">
                                    <span>已下架</span>
                                </c:when>
                                <c:when test="${2 == ad.status}">
                                    <c:if test="${now >= ad.endTime}">
                                        <span style="color:gray">过期</span>
                                    </c:if>
                                    <c:if test="${now < ad.endTime}">
                                        <span class="green">已上架</span>
                                    </c:if>
                                </c:when>
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
            <div class="layui-form-item">
                <label class="layui-form-label">广告标题<br>热词</label>
                <div class="layui-input-block">
                    <textarea id="title" name="title" placeholder="热词可批量添加,以英文逗号分隔,一次最多50个" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片</label>
                <div class="layui-input-block file" id="fileWrap">
                    <div class="layui-upimg img">
                        <img src="" class="hide" />
                        <span><i class="layui-icon">&#xe608;</i>上传图片</span>
                        <input type="file" name="file">
                    </div>
                    <div class="add-upimg" id="addTuPian">＋</div>
                </div>
                <input type="hidden" type="hidden" name="images" id="images" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">广告来源</label>
                <div class="layui-input-block">
                    <input type="text" id="source" name="source" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">原始链接<br><a href="javascript:;" id="sogouLink">转sogou链接</a></label>
                <div class="layui-input-block">
                    <input type="text" id="originUrl" name="originUrl" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">投放位置</label>
                <div class="layui-input-block">
                    <select lay-filter="adsLocation" name="adsLocation" id="adsLocation">
                        <option value="">DEFAULT</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">投放应用</label>
                <div class="layui-input-block">
                    <select name="application" id="application" >
                        <option value="">默认</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">投放平台</label>
                <div class="layui-input-block">
                    <select name="platform" id="platform">
                        <option value="">DEFAULT</option>
                    </select>  
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">广告布局</label>
                <div class="layui-input-block">
                    <select name="layout" id="layout">
                        <option value="左右图文">左右图文</option>
                    </select>  
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
            <div class="layui-form-item" pane>
                <label class="layui-form-label">是否登录才能点击</label>
                <div class="layui-input-block">
                    <input type="checkbox" lay-filter="needLogin" id="needLoginShow" lay-skin="switch" lay-text="是|否">
                    <input type="hidden" id="needLogin" name="needLogin" />  
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">广告标识</label>
                <div class="layui-input-block">
                    <input type="text" id="tips" name="tips" class="layui-input" placeholder="建议2个字" />
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

    <div id="formPane2" style="display: none;padding: 10px;">
        <form id="myformTj" class="layui-form layui-form-pane1" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">广告id</label>
                <div class="layui-input-inline">
                    <input type="text" id="id" name="id" class="layui-input"/>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline">
                    <input class="layui-input" name="startTime" id="startTimeTj" placeholder="开始时间"/>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
                    <input class="layui-input" name="endTime" id="endTimeTj" placeholder="结束时间"/>
                </div>
            </div>
            <div class="layui-form-item t-r" id="updateBtn">
                <div class="layui-btn" lay-submit lay-filter="showTj">查询</div>
            </div>
            <button type="reset" id="reset" class="layui-hide">重置</button>
        </form>
        <div>广告标题：<span id="tjAdTitle"></span></div>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col>
                <col width="20%">
                <col width="20%">
                <col width="20%">
                <col width="20%">
            </colgroup>
            <thead>
                <tr>
                    <th>日期</th>
                    <th>uv</th>
                    <th>pv</th>
                    <th>点击数</th>
                    <th>点击用户数</th>
                </tr>
            </thead>
            <tbody id="tjAdData">
            </tbody>
        </table>
    </div>
    
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('ads');
</script> 
</body>
</html>
<script>
// $("#menu_app").addClass('active open');
// $("#menu_ads").addClass('active');

// function add() {
//     var v = $("#application").val();
//     window.location = "admin/ads/add?application=" + v;
// }
// function down(id) {
//     if (confirm("您确认要下架此广告吗？")) {
//         $.ajax({
//             url : "admin/ads/down?id=" + id,
//             type : "post",
//             dataType : "json",
//             success : function(data) {
//                 if (data.status != 1000) {
//                     alert("操作失败！");
//                 } else {
//                     location.reload();
//                 }
//             },
//             error : function(error) {
//                 console.log(error);
//             }
//         });
//     }
// }

// function up(id) {
//     if (confirm("您确认要上架此广告吗？")) {
//         $.ajax({
//             url : "admin/ads/up?id=" + id,
//             type : "post",
//             dataType : "json",
//             success : function(data) {
//                 if (data.status != 1000) {
//                     alert("操作失败！");
//                 } else {
//                     location.reload();
//                 }
//             },
//             error : function(error) {
//                 console.log(error);
//             }
//         });
//     }
// }

// function setTop(id) {
//     if (confirm("您确认要置顶此广告吗？")) {
//         $.ajax({
//             url : "admin/ads/top?id=" + id,
//             type : "post",
//             dataType : "json",
//             success : function(data) {
//                 if (data.status != 1000) {
//                     alert("操作失败！");
//                 } else {
//                     location.reload();
//                 }
//             },
//             error : function(error) {
//                 console.log(error);
//             }
//         });
//     }
// }

// if($("#startTime").length > 0){
//     $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
//     gx();
//     $("#startTime").slTime({
//         callback:function(){
//             gx();
//         }
//     });
// }
// function gx(){
//     var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
//     $("#start_time_hidden").val(start);
// }
</script>