<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>编辑搜索关键词</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/searchKeywords/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" class="input-xlarge" value="${keyword.id}"/>
                    <div class="control-group">
                        <label class="control-label">搜索关键词(<font color="red">必填</font>)
                        <div class="controls">
                            <textarea id="keyword" name="keyword" class="input-xlarge" style="height: 100px;" value="${keyword.keyword}">${keyword.keyword}</textarea>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">关键词链接(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="url" name="url" class="input-xxlarge" value="${keyword.url}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == ad.platform}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">来源</label>
                        <div class="controls">
                            <input type="text" id="source" name="source" class="input-xlarge" value="${keyword.source}"/>
                        </div>
                    </div>

                     <div class="control-group">
                        <label class="control-label">投放数目(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="putNum" name="putNum" class="input-xlarge" value="${keyword.putNum}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间(<font color="red">必填</font>)<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="start_time" id="start_time_hidden" value="${keyword.startTime}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间(<font color="red">必填</font>)<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="end_time" id="end_time_hidden" value="${keyword.endTime}"/>
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
            </div>
         </div>
    </div>
</div>
<jsp:include page="../foot.jsp" />
    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting.js"></script>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_app").addClass('active open');
    $("#menu_search_keyword").addClass('active');
    function cancel() {
        history.go(-1);
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
</html>