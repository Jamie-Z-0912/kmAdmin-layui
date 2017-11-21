<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>分日统计修改
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
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>

		<div class="row-fluid">
			<div class="row-fluid">
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>时间</th>
                        <th>平台花费</th>
                        <th>平台累计花费</th>
                        <th>提现支出</th>
                        <th>话费充值支出</th>
                        <th>累计支出</th>
                        <th>平台收入</th>
                        <th>累计收入</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tj_list}" var="order" varStatus="st">
                        <tr>
                            <td>${order.date}</td>
                            <td>${order.taskExpense}</td>
                            <td>${order.taskExpenseTotal}</td>
                            <td><input onblur="update('wd_expense', ${order.date}, this)" type="text" value="${order.financeWithdrawExpense}" /> </td>
                            <td><input onblur="update('cz_expense', ${order.date}, this)" type="text" value="${order.financeCzExpense}" /> </td>
                            <td>${order.financeExpenseTotal}</td>
                            <td><input onblur="update('income', ${order.date}, this)" type="text" value="${order.financeIncome}" /></td>
                            <td>${order.financeIncomeTotal}</td>
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
$("#tj_date").addClass('active');//左侧导航栏选中状态

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
        window.location.href = "admin/tj/date_update?start_time=" + starttime + "&end_time=" + endtime;
    }

    function update(updateFiled, date, inp){
        $.ajax({
            url : "admin/tj/date?update_field=" + updateFiled + "&date=" + date + "&amount=" + $(inp).val(),
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    window.location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
</script>
</html>