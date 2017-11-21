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
            <h1>修改支付宝账号</h1>
            <div class="row-fluid">
            <form action="admin/withdraw/update_alipay" method="post" id="basic_validate" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">
                <input type="hidden" name="id" value="${account.id}" />
                <input type="hidden" name="uid" value="${account.uid}" />
                <input type="hidden" name="type" value="${account.type}" />
                <div class="control-group">
                    <label class="control-label">真实姓名</label>
                    <div class="controls">
                        <input type="text" id="realName" name="realName" value="${account.realName}" class="input-xxlarge" maxlength="100" value=""/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">支付宝账号</label>
                    <div class="controls">
                        <input type="text" id="account" name="account" value="${account.account}" class="input-xxlarge" maxlength="100"/>
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
    $("#menu_withdraw").addClass('active open');//左侧导航栏选中状态
        $("#submenu_withdraw_account").addClass('active');
    function cancel() {
        location.reload();
    }
</script>
</html>