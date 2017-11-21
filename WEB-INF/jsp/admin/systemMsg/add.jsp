<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>

<em>
    {
    "msgActions":[
    <c:forEach items="${msgActions}" var="ma" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"type":"${ma.type}","desc":"${ma.desc}"}</c:forEach>
    ],
    "applications":[
    <c:forEach items="${applications}" var="app" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${app}"</c:forEach>
    ],
    "platforms":[
    <c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"}</c:forEach>
    ],
    "versions":[
    <c:forEach items="${versions}" var="ver" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${ver}"</c:forEach>
    ]
    }
</em>
<!-- 页面
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>新增系统通知</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid"> -->
                <form action="admin/systemMsg/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                         <label class="control-label">推送应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 180px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">推送平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == 'DEFAULT'}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">推送版本</label>
                        <div class="controls">
                            <select class="form-control" id="form-field-select-2" multiple="multiple" name="versions">
                                <option value="">所有用户</option>
                                <c:forEach items="${versions}" var="version" varStatus="st">
                                    <option value="${version}">${version}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">通知内容(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="msg" name="msg" class="input-xxlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">点击通知动作(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="clickActionType" id="clickActionType" style="width: 180px;">
                                <c:forEach items="${msgActions}" var="ma" varStatus="st">
                                    <option value="${ma.type}" <c:if test="${ma.type == '2'}">selected</c:if>>${ma.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">跳转链接</label>
                        <div class="controls">
                            <input type="text" id="action" name="action" class="input-xxlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">跳转是否要登陆</label>
                        <div class="controls">
                            <select name="needLogin" id="needLogin" style="width: 180px;">
                                    <option value="0" selected>否</option>
                                    <option value="1" >是</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">定时发送时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="sendTime" data-oval="" class="sendTime input-xlarge" />
                            <input  type="hidden" name="send_time" id="send_time_hidden" value="0" />
                            <a onclick="clearSendTime()"> 清除定时</a>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><font color="red">注意:</font></label>
                        <div class="controls">
                            点击通知动作选择: 打开App, 跳转链接为空<br/>
                            点击通知动作选择: 打开Url, 跳转链接必须是: http://XXX; <br/>
                            点击通知动作选择打开App指定页面时,跳转链接如下:<br/><br/>
                            kmb://taskdetail?param={"taskid": 1}                                   &nbsp;&nbsp;//赏金任务详情<br/>
                            kmb://recommend?url=http://news.kuaima.cn/article.html?id=116667       &nbsp;&nbsp;//资讯详情<br/>
                            kmb://makemoney                                                     &nbsp;&nbsp;//赚钱tab<br/>
                            kmb://video                                                         &nbsp;&nbsp;//视频tab<br/>
                            kmb://mine                                                          &nbsp;&nbsp;//单播都先跳到“我的”界面<br/>
                            kmb://msgcenter                                                     &nbsp;&nbsp;//消息中心<br/>
                            kmb://worthreading?id=116667    &nbsp;&nbsp;//值得看详情<br/>
                            kmb://worthreadingtab          &nbsp;&nbsp;//值得看tab<br/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 保存
                        </button>
                        <button class="btn" type="reset" onclick="cancel();">
                            <i class="icon-undo"></i> 取消
                        </button>
                    </div>
                </form>
    <!--        </div>
         </div>
    </div>
</div>
    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting.js"></script>&nbsp;&nbsp;
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_app").addClass('active open');
    $("#menu_systemMsg").addClass('active');
    function cancel() {
        history.go(-1);
    }

    $("#sendTime").slTime({
        callback:function(){
            gx();
        }
    });

    $(function(){
        $("#sendTime").val("");
    })

    function gx(){
        var start = new Date($("#sendTime").val().replace(/-/g,   "/")).getTime();
        $("#send_time_hidden").val(start);
    }

    function clearSendTime(){
        $("#sendTime").val("");
        $("#send_time_hidden").val(0);
    }
</script>
</html> -->