<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>分享任务统计</h1>
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
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<caption>任务数据</caption>
					<thead>
						<tr>
						    <th>日期</th>
                            <th>任务数</th>
                            <th>领完任务数</th>
                            <th>投放阅读数</th>
                            <th>有效阅读数</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${statKMBrowser}" var="sdkmb" varStatus="st">
							<tr>
							    <td>${sdkmb.date}</td>
                                <td>${sdkmb.taskTJMap.totalTaskNum}</td>
                                <td>${sdkmb.taskTJMap.noLeftTaskNum}</td>
                                <td>${sdkmb.taskTJMap.totalNum}</td>
                                <td>${sdkmb.taskTJMap.totalViewNum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <caption>订单数据</caption>
                    <thead>
                            <tr>
                                <th>日期</th>
                                <th>订单个数</th>
                                <th>用户数</th>
                                <th>平均用户领取任务数</th>
                                <th>总发放佣金</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${statKMBrowser}" var="sdkmb" varStatus="st">
                            <tr>
                                <td>${sdkmb.date}</td>
                                <td>${sdkmb.orderTJMap.totalShareTaskOrderNum}</td>
                                <td>${sdkmb.orderTJMap.totalUserNum}</td>
                                <td>${sdkmb.orderTJMap.averageOrderNum}</td>
                                <td>${sdkmb.orderTJMap.totalOrderComission}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <caption>任务阅读数据</caption>
                    <thead>
                        <tr>
                            <th>日期</th>
                            <th>总阅读数</th>
                            <th>QQ阅读数</th>
                            <th>QQ空间阅读数</th>
                            <th>微信阅读数</th>
                            <th>朋友圈阅读数</th>
                            <th>微博阅读数</th>
                            <th>浏览器内阅读数</th>
                            <th>其他(pc等)</th>
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
                                <td>${sdkmb.taskViewNumTJMap.WX_TIMELINE}</td>
                                <td>${sdkmb.taskViewNumTJMap.WB}</td>
                                <td>${sdkmb.taskViewNumTJMap.KM}</td>
                                <td>${sdkmb.taskViewNumTJMap.Default}</td>
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
$("#menu_tj_browser").addClass('active open');//左侧导航栏选中状态
$("#submen_tj_task").addClass('active');//左侧导航栏选中状态

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
    window.location.href = "admin/tj/browserTask?start_time=" + starttime;
}
</script>
</html>