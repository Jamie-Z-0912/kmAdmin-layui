<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../header.jsp" %>
<jsp:include page="../sidebar.jsp"/>
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>提现快速订单导出</h1>
        </div>
        <div class="row-fluid">
            <form action="#" method="post" id="basic_validate" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">是否兑吧订单<br />
                    </label>
                    <div class="controls">
                        <select name="isDuiba" id="isDuiba" style="width: 120px;">
                           <option value="1" selected >是</option>
                           <option value="0">否</option>
                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">开始时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                        <input  type="hidden" name="start_time" id="start_time_hidden" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">结束时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                        <input  type="hidden" name="end_time" id="end_time_hidden" />
                    </div>
                </div>

                <div class="form-actions">
                    <input type="button" class="btn btn-info" onclick="exportorder()" value="导出"/>
                </div>
            </form>
        </div>

        <div>
            <h2>支付宝付款记录导入</h2>
        </div>
        <div class="row-fluid">
            <form  action="admin/withdraw/import_fail" enctype="multipart/form-data" method="post" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">

                <div class="control-group">
                    <label class="control-label">文件<br />
                    </label>
                    <div class="controls">
                        <input type="file" name="file"/>
                    </div>
                </div>

                <div class="form-actions">
                    <input type="submit" class="btn btn-info" value="导入"/>
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
    $("#submenu_withdraw_order").addClass('active');

    if($("#startTime").length > 0){
        $("#startTime").val(new Date(new Date().getTime() - 24*60*60*1000).format("yyyy-MM-dd")+" 00:00:00");
        $("#endTime").val(new Date().format("yyyy-MM-dd")+" 00:00:00");
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

    function exportorder(){
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        var isDuiba = $("#isDuiba").val();
        window.location.href = "admin/withdraw/export_fast?start_time=" + starttime + "&end_time=" + endtime + "&status=" + status + "&isDuiba=" + isDuiba;
    }
    var successNum = "";
    var failNum = "";
    <c:if test="${success_num != null}">
        successNum = ${success_num};
    </c:if>

    <c:if test="${fail_num != null}">
        failNum = ${fail_num};
    </c:if>

    if(successNum != '' && successNum != null){
        alert("成功订单数：" + successNum + ",失败订单数:"  + failNum);
    }

</script>
</html>