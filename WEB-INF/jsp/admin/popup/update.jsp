<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>

<em>
    {
    "popup":{"id":"${popup.id}","title":"${popup.title}","image":"${popup.image}","url":"${popup.url}","location":"${popup.location}","platform":"${popup.platform}","userGroups":"${popup.userGroups}","needLogin":"${popup.needLogin}","num":"${popup.num}","startTime":"${popup.startTime}","endTime":"${popup.endTime}"},
    "popupLocations":[<c:forEach items="${popupLocations}" var="al" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"location":"${al.location}","desc":"${al.desc}"}</c:forEach>
    ],
    "userGroups":[<c:forEach items="${userGroups}" var="userGroup" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"group":"${userGroup.group}","groupName":"${userGroup.groupName}"}</c:forEach>
    ],
    "platforms":[<c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"</c:forEach>]
    }
</em>
<!-- 页面
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>编辑广告</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid"> -->
                <form action="admin/popup/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" class="input-xxlarge" value="${popup.id}"/>
                    <div class="control-group">
                        <label class="control-label">广告标题(可选)</label>
                        <div class="controls">
                            <input type="text" id="title" name="title" class="input-xlarge" value="${popup.title}"/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="${popup.image}"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="image" id="topic_image" value="${popup.image}" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">弹窗链接</label>
                        <div class="controls">
                            <input type="text" id="url" name="url" class="input-xlarge" value="${popup.url}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == popup.platform}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放位置</label>
                        <div class="controls">
                            <select name="location" id="location" style="width: 180px;">
                                <c:forEach items="${popupLocations}" var="al" varStatus="st">
                                    <option value="${al.location}" <c:if test="${al.location == popup.location}">selected</c:if>>${al.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">用户组</label>
                        <div class="controls">
                            <select class="form-control" id="form-field-select-2" multiple="multiple" name="userGroups">
                                <option value="" <c:if test="${popup.userGroups == ''}">selected</c:if>>所有用户</option>
                                <c:forEach items="${userGroups}" var="userGroup" varStatus="st">
                                    <option value="${userGroup.group}" <c:if test="${popup.userGroups == userGroup.group}">selected</c:if>>${userGroup.groupName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">点击跳转是否要登陆</label>
                        <div class="controls">
                           <select name="needLogin" id="needLogin" style="width: 180px;">
                               <option value="0" <c:if test="${!popup.needLogin}">selected</c:if>>否</option>
                               <option value="1" <c:if test="${popup.needLogin}">selected</c:if>>是</option>
                           </select>
                        </div>
                    </div>

                     <div class="control-group">
                        <label class="control-label">弹窗次数(开始-结束时间)</label>
                        <div class="controls">
                            <input type="text" id="num" name="num" class="input-xlarge" value="${popup.num}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="start_time" id="start_time_hidden" value="${popup.startTime}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="end_time" id="end_time_hidden" value="${popup.endTime}"/>
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
 <!--           </div>
        </div>
    </div>
</div>

    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting.js"></script>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_app").addClass('active open');
    $("#menu_popup").addClass('active');
    function cancel() {
        location.reload();
    }

    if($("#startTime").length > 0){
        $("#startTime").val(new Date().format("yyyy-MM-dd")+" 00:00:00");
        $("#endTime").val(new Date().format("yyyy-MM-dd")+" 23:59:59");
        gx();
        $("#startTime").slTime({
            callback:function(){
                gx();
            }
        });
        $("#endTime").slTime({
            callback:function(){
                gx();
            }
        });
    }

    function gx(){
        var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g,   "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }
</script>
</html> -->