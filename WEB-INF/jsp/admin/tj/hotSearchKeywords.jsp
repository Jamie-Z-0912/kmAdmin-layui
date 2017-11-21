<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>热门搜索关键词统计</h1>
        </div>
        <div class="control-group">
            <div class="controls">
                开始日期:&nbsp;&nbsp; <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="50%">关键词</th>
                        <th width="50%">搜索次数</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${topSearchKeyWords}" var="tsk">
                        <tr>
                            <td>${tsk.keyword}</td>
                            <td>${tsk.searchCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
    $("#menu_stat").addClass('active open');//左侧导航栏选中状态
    $("#submenu_hotKeywords").addClass('active');//左侧导航栏选中状态

    if($("#startTime").length > 0){
        $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd"));
        gx();
        $("#startTime").slTime({
            callback:function(){
                gx();
            }
        });
    }

    function gx(){
        var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
        $("#start_time_hidden").val(start);
    }

    function query(){
        var starttime = $("#start_time_hidden").val();
        window.location.href = "admin/tj/searchHotKeywords?start_time=" + starttime;
    }
</script>
</html>