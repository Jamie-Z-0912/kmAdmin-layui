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
            <h1>任务完成情况导出</h1>
        </div>
        <div class="row-fluid">
            <form action="#" method="post" id="basic_validate" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">

                <div class="control-group">
                    <label class="control-label">任务名<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="task_name" style="width: 200px;" />
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
    </div>
</div>
<jsp:include page="../foot.jsp"/>
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>

</body>
<script>
    $("#menu_order").addClass('active open');//左侧导航栏选中状态

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

    var selectAppId = 0;
    var selectAppName = "";
    function exportorder(){
        var taskName = $("#task_name").val();
        if (taskName == null || taskName.length == 0) {
            selectAppId = 0;
            selectAppName = "";
        }
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        window.location.href = "admin/order/export_task_complete?start_time=" + starttime + "&end_time=" + endtime + "&task_name=" + selectAppName;
    }

    var taskNameList = [];
    function initBind() {
        $("#task_name").bind(
                'input',
                function () {
                    var taskName = $("#task_name").val();
                    if (taskName == null || taskName.length == 0) {
                        selectAppId = 0;
                        selectAppName = "";
                        return;
                    }
                    $.ajax({
                        "url": "admin/app/name?keyword="
                                + encodeURIComponent(taskName),
                        type: "GET",
                        dataType: "json",
                        success: function (dt) {
                            console.info(dt);
                            var data = dt.data;
                            var d = [];
                            taskNameList = [];
                            if (data != null && data.length > 0) {
                                for (var i = 0; i < data.length; i++) {
                                    //var name = data[i]['name'] + "--" + data[i]['artist'];
                                    var name = data[i]['name'];
                                    var appId = data[i]['id'];
                                    d.push(name);
                                    taskNameList.push({
                                        name: name,
                                        value: appId
                                    });
                                }
                            }
                            console.info(taskNameList);
                            autoCompleteKey(d);
                        }
                    });
                });
    }
    initBind();

    function autoCompleteKey(data) {
        $("#task_name").autocomplete({
            source : data,
            select : function(event, ui) {
                selectByName(ui.item.value);
            }
        });
    }

    function selectByName(name) {
        selectAppName = name;
        var taskAppId;
        if (taskNameList.length > 0) {
            for (var i = 0; i < taskNameList.length; i++) {
                if (taskNameList[i]['name'] == name) {
                    taskAppId = taskNameList[i]['value'];
                    break;
                }
            }
        }
        if (taskAppId != null) {
            selectAppId = taskAppId;
        }
    }
</script>
</html>