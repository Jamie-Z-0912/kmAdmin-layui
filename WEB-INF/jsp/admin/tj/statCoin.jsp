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
			<h1>金币数据统计</h1>
		</div>
        <div class="control-group">
            <div class="controls">
               开始时间:&nbsp;&nbsp; <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>
		<div class="row-fluid">
			<div class="row-fluid">
                红包数据：
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                            <tr>
                                <th>日期</th>
                                <th>用户个数</th>
                                <th>领取红包总个数</th>
                                <th>平均领取红包数</th>
                                <th>发放总金币数</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${statKMBrowser}" var="sdkmb" varStatus="st">
                            <tr>
                                <td>${sdkmb.date}</td>
                                <td>${sdkmb.orderTJMap.totalShareTaskOrderNum}</td>
                                <td>${sdkmb.orderTJMap.totalUserNum}</td>
                                <td>${sdkmb.orderTJMap.averageOrderNum}</td>
                                <td>${sdkmb.orderTJMap.totalShareTaskOrderCommission}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                阅读资讯(文章+视频)数据：
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                        <tr>
                            <th>日期</th>
                            <th>用户个数</th>
                            <th>总阅读资讯个数</th>
                            <th>平均阅读资讯个数</th>
                            <th>发放总金币数</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${statKMBrowser}" var="sdkmb" varStatus="st">
                            <tr>
                                <td>${sdkmb.date}</td>
                                <td>${sdkmb.totalTaskViewNumTJMap}</td>
                                <td>${sdkmb.taskViewNumTJMap.QQ}</td>
                                <td>${sdkmb.taskViewNumTJMap.QQKJ}</td>
                                <td>${sdkmb.taskViewNumTJMap.WX}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_order").addClass('active open');//左侧导航栏选中状态
$("#stat_kmbrowser").addClass('active');//左侧导航栏选中状态

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
    window.location.href = "admin/tj/coin?start_time=" + starttime;
}
</script>
</html>