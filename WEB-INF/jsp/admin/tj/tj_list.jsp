<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>汇总统计
            </h1>
		</div>
        <div class="control-group">
            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>

		<div class="row-fluid">
			<div class="row-fluid">
                用户数据：
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>新增用户</th>
                        <th>活跃用户</th>
                        <th>启动次数</th>
                        <th>总用户数</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${basedata.newUsers}</td>
                            <td>${basedata.activeUsers}</td>
                            <td>${basedata.launches}</td>
                            <td>${basedata.installations}</td>
                        </tr>
                    </tbody>
                </table>

                基础任务数据：
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>任务</th>
                            <th>数量</th>
                            <th>佣金</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${tj_list}" var="order" varStatus="st">
							<tr>
								<td>${order.channelName}</td>
                                <td>${order.num}</td>
                                <td>${order.commision}</td>
							</tr>
						</c:forEach>
                        <tr>
                            <td>总计</td>
                            <td>${financedata.huafeiNum}</td>
                            <td>${financedata.huafei}</td>
                        </tr>
					</tbody>
				</table>

                渠道任务数据：
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>任务</th>
                        <th>数量</th>
                        <th>佣金</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${income_list}" var="order" varStatus="st">
                        <tr>
                            <td>${order.channelName}</td>
                            <td>${order.num}</td>
                            <td>${order.commision}</td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td>总计</td>
                        <td>${financedata.incomeNum}</td>
                        <td>${financedata.income}</td>
                    </tr>
                    </tbody>
                </table>

                财务数据：
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>花费</th>
                        <th>提现支出</th>
                        <th>话费支出</th>
                        <th>合计支出</th>
                        <th>收入</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${financedata.huafei}</td>
                        <td>${financedata.wdExpense}</td>
                        <td>${financedata.czExpense}</td>
                        <td>${financedata.expense}</td>
                        <td>${financedata.income}</td>
                    </tr>
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
$("#tj").addClass('active');//左侧导航栏选中状态

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
        window.location.href = "admin/tj?start_time=" + starttime;
    }
</script>
</html>