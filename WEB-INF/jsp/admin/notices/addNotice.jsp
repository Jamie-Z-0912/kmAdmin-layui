<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<%@ include file="../header.jsp" %>
<jsp:include page="../sidebar.jsp"/>
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>添加公告</h1>
        </diajaxfileupload.jsv>
        <div class="row-fluid">
            <form action="admin/notice/add" method="post" id="basic_validate" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">公告标题</label>
                    <div class="controls">
                        <input type="text" id="title" name="title" value="" class="input-xxlarge" maxlength="100"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">公告内容</label>
                    <div class="controls">
                        <textarea id="content" name="content" cols="150" rows="10"></textarea>
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
<jsp:include page="../foot.jsp"/>
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_notices").addClass('active open');//左侧导航栏选中状态
    function cancel() {
        location.reload();
    }
</script>
</html>