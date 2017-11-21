<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<script type="text/javascript" src="assets/js/echarts.min.js"></script>
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>渠道订单统计
            </h1>
		</div>
        <div class="control-group">
            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                -
                <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" width="10px"/>
                <input  type="hidden" name="end_time" id="end_time_hidden" />
                &nbsp;&nbsp;
                <select name="channel_id" id="channel_id" style="width: 120px;">

                    <option value="0"
                            <c:if test="${0 == channel_id}">
                                selected
                            </c:if>
                            >全部</option>

                    <c:forEach items="${channel_list}" var="channel" varStatus="st">
                        <option value="${channel.id}"
                                <c:if test="${channel.id == channel_id}">
                                    selected
                                </c:if>
                                >${channel.name}</option>
                    </c:forEach>
                </select>
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>

        <label><input name="channeltj" onclick="showNum()" type="radio" checked />&nbsp;<span class="lbl">数量</span>
            &nbsp;<input name="channeltj" onclick="showCommsion()" type="radio" />&nbsp;<span class="lbl">金额</span>
        </label>

        <div id="main" style="width: 600px;height:400px;"></div>
        任务明细：
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
                            <th width="10%">渠道</th>
							<th width="10%">任务名称</th>
                            <th width="10%">日期</th>
							<th width="10%">完成数量</th>
                            <th width="10%">佣金</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ordertj_list}" var="order" varStatus="st">
							<tr>
								<td>${order.channelName}</td>
								<td>${order.taskName}</td>
                                <td>${order.date}</td>
                                <td>${order.num}</td>
                                <td>${order.commision}</td>
							</tr>
						</c:forEach>
                        <tr>
                            <td>总计</td>
                            <td></td>
                            <td></td>
                            <td>${total}</td>
                            <td>${total_commision}</td>
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
$("#order_tj").addClass('active');//左侧导航栏选中状态

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd hh:mm:ss"));
    $("#endTime").val(new Date(${end_time}).format("yyyy-MM-dd hh:mm:ss"));
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

    function query(){
        var channelId = $("#channel_id").val();
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        window.location.href = "admin/tj/order?start_time=" + starttime + "&end_time=" + endtime + "&channel_id=" + channelId;
    }

// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
var option = {
    title: {
        text: ''
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:[
        <c:forEach var="ent" items="${task_num}" varStatus="status">
            '${ent.key}'
                    <c:if test="${status.index + 1 < fn:length(task_num)}">
                    ,
                    </c:if>
        </c:forEach>
    ]
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ${dates}
    },
    yAxis: {
        type: 'value'
    },
    series: [
    <c:forEach var="ent" items="${task_num}" varStatus="status">
        {
            name:'${ent.key}',
            type:'line',
            data:[
                <c:forEach var="t" items="${ent.value}" varStatus="status">
                    ${t}
                <c:if test="${status.index + 1 < fn:length(ent.value)}">
                ,
                </c:if>
                </c:forEach>
            ]
        },
    </c:forEach>
    ]
};

var option_commision = {
    title: {
        text: ''
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:[
            <c:forEach var="ent" items="${task_commission}" varStatus="status">
            '${ent.key}'
            <c:if test="${status.index + 1 < fn:length(task_commission)}">
            ,
            </c:if>
            </c:forEach>
        ]
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ${dates}
    },
    yAxis: {
        type: 'value'
    },
    series: [
        <c:forEach var="ent" items="${task_commission}" varStatus="status">
        {
            name:'${ent.key}',
            type:'line',
            data:[
                <c:forEach var="t" items="${ent.value}" varStatus="status">
                ${t}
                <c:if test="${status.index + 1 < fn:length(ent.value)}">
                ,
                </c:if>
                </c:forEach>
            ]
        },
        </c:forEach>
    ]
};

myChart.setOption(option);

    function showNum(){
        myChart.setOption(option);
    }

function showCommsion(){
    myChart.setOption(option_commision);
}

</script>
</html>