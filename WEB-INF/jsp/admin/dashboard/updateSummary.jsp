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
            <h1>编辑汇总统计</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/dashboard/updateStatsSummary" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">日期</label>
                        <div class="controls">
                            <input type="text" id="date" name="date" class="input-xlarge" value="${statsSummary.date}" readonly/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">PV</label>
                        <div class="controls">
                            <input type="text" id="articleDetailsViewNum" name="articleDetailsViewNum" class="input-xlarge" value="${statsSummary.articleDetailsViewNum}"/>
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
    $("#menu_home").addClass('active open');
    $("#menu_statsSummary").addClass('active');
    function cancel() {
        location.reload();
    }
</script>
</html>