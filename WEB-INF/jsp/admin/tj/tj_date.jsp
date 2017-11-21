<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>分日统计
            </h1>
            <a href="admin/tj/date_update" style="float: right">修改</a>
		</div>
        <div class="control-group">
            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                -
                <input type="text" id="endTime" data-oval="" class="start_time input-large" width="10px"/>
                <input  type="hidden" name="end_time" id="end_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>

		<div class="row-fluid">
			<div class="row-fluid">
                <table class="table table-bordered table-striped">
                    <thead id="dateTjTit">
                        <tr>
                            <th width="10%">时间</th>
                            <th width="10%">平台花费</th>
                            <th width="10%">累计花费</th>
                            <th width="10%">提现支出</th>
                            <th width="10%">充值支出</th>
                            <th width="10%">累计支出</th>
                            <th width="10%">收入</th>
                            <th width="10%">累计收入</th>
                            <th width="10%">累计盈亏</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tj_list}" var="order" varStatus="st">
                        <tr <c:if test="${order.weekend == 1}"> style="color:darkseagreen" </c:if>>
                            <td>${order.date}</td>
                            <td>${order.taskExpense}</td>
                            <td>${order.taskExpenseTotal}</td>
                            <td>${order.financeWithdrawExpense}</td>
                            <td>${order.financeCzExpense}</td>
                            <td>${order.financeExpenseTotal}</td>
                            <td>${order.financeIncome}</td>
                            <td>${order.financeIncomeTotal}</td>
                            <td>${order.financeIncomeTotal - order.financeExpenseTotal}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                说明:<br/>
                <p>1、平台花费为每日用户账户产生的零钱累加;<br/></p>
                <p>2、收入 = 快马广告收入 + 卡券收入 + 资源兑换 + 清空余额;<br/></p>
                <p>3、表格中的提现、充值支出不包括手续费</p>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_tj_date").addClass('active');//左侧导航栏选中状态

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
    var starttime = $("#start_time_hidden").val();
    var endtime = $("#end_time_hidden").val();
    window.location.href = "admin/tj/date?start_time=" + starttime + "&end_time=" + endtime;
}
/******* Jamie 20161014 ************/
var navtop = $('#dateTjTit').offset().top ,
    tr_left = $('#dateTjTit').offset().left ,
    tr_width = $('#dateTjTit').width();
var $_tr = $('#dateTjTit th');
$.each($_tr, function(){
    var w = $(this).width();
    $(this).width(w);
});

$(window).resize(function(){
    tr_left = $('#dateTjTit').offset().left ,
    tr_width = $('#dateTjTit').width();
    $.each($_tr, function(){
        var w = $(this).width();
        $(this).width(w);
    });
    a();
})

var $_DTT = document.createElement('div');
    $_DTT.style.position = 'fixed';
    $_DTT.style.zIndex = 9;
    $_DTT.style.top = 0;
    $_DTT.style.width = tr_width+'px';
    $_DTT.style.left = tr_left+'px';
function a(){
    var docTop = $(document).scrollTop();
    if( docTop >  navtop){
        if($('#js_T').length<1){
            $('body').append($_DTT);
            $($_DTT).append('<table class="table table-bordered table-striped" id="js_T"></table>');
            $('#js_T').html($('#dateTjTit tr').clone());
        }else{
            $_DTT.style.width = tr_width+'px';
            $_DTT.style.left = tr_left+'px';
        }
    }else{
        $($_DTT).remove();
    }
}
a();
$(window).scroll(function(){ a(); });
</script>
</html>