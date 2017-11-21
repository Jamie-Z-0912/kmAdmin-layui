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
            <h1>新增规则</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/pushRule/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">

                    <div class="control-group">
                        <label class="control-label">推送分类</label>
                        <div class="controls">
                            <select name="ruleType" id="ruleType" style="width: 120px;">
                                <c:forEach items="${ruleTypes}" var="rule" varStatus="st">
                                    <option value="${rule.type}" <c:if test="${rule.type == ruleType}">selected</c:if>>${rule.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时分</label>
                        <div class="controls">
                            <input type="text"  id="startTime" name="startTime" class="input-large datetimepicker" readonly="true" class="input-xxlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时分</label>
                        <div class="controls">
                            <input type="text"  id="endTime" name="endTime" class="input-large datetimepicker" readonly="true" class="input-xxlarge" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">推送次数</label>
                        <div class="controls">
                            <input type="number" max="10" min="1" id="pushNum" name="pushNum" class="input-large" class="input-xxlarge" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">刷新次数(0表示每次刷新都出现,1表示间隔一次刷新才出现)</label>
                        <div class="controls">
                            <input type="number" max="10" min="1" id="refreshNum" name="refreshNum" class="input-large" class="input-xxlarge" value="0"/>
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
    $('.datetimepicker').datetimepicker({
        lang:'ch', //设置为控件语言为中文
        datepicker:false,
        format:'H:i',
        step:1

    });
    $("#menu_novel").addClass('active open');
    $("#submenu_pushRule").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>