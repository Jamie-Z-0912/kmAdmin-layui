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
            <h1>+金币</h1>
            <div class="row-fluid">
                <form action="admin/coinEvent/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">金币事件</label>
                        <div class="controls">
                            <select name="eventType" id="eventType" style="width: 180px;">
                                <c:forEach items="${coinEventTypes}" var="event" varStatus="st">
                                    <option value="${event.eventType}">${event.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">手机号</label>
                        <div class="controls">
                            <input type="text" id="phone" name="phone" class="input-large" value=""/>
                        </div>
                    </div>

                    <input type="hidden" id="operator" name="operator" class="input-large" value="${__LOGINUSER.nickName}"/>

                    <div class="control-group">
                        <label class="control-label">+金币数(不超过1500)</label>
                        <div class="controls">
                            <input type="text" id="coin" name="coin" class="input-large" class="input-xxlarge" value=""/>
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
<jsp:include page="../foot.jsp" />
    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting.js"></script>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_app").addClass('active open');
    $("#submenu_addCoin").addClass('active');
    function cancel() {
        location.reload();
    }
</script>
</html>