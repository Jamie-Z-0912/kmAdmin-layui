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
            <h1>新增列表数据</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/aggregation/addDetails" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="listId" name="listId" class="input-xlarge" value="${list.id}"/>
                    <div class="control-group">
                        <label class="control-label">列表名称(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" class="input-xlarge" value="${list.name}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">内容类型</label>
                        <div class="controls">
                            <select name="content_type" id="content_type" style="width: 180px;">
                                <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                    <c:if test="${cType.type == list.contentType}"><option value="${cType.type}">${cType.desc}</option></c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">内容Id,以英文逗号拼接<br /></label>
                        <div class="controls">
                            <textarea id="ids" name="ids" class="input-xlarge" style="height: 100px;"></textarea>
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
    $("#menu_activity").addClass('active open');
    $("#submenu_aggregation").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>