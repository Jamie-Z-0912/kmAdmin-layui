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
			<h1>编辑汇率</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/coinExchange/update" method="post" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" name="id" value="${coinExchangeRate.id}" />
                    <input type="hidden" name="addedTime" value="${coinExchangeRate.addedTime}" />
                    <div class="control-group">
                        <label class="control-label">日期</label>
                        <div class="controls">
                            <input type="text" id="date" name="date" readonly value="${coinExchangeRate.date}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">总金币数</label>
                        <div class="controls">
                            <input type="text" id="totalCoinNum" name="totalCoinNum" readonly value="${coinExchangeRate.totalCoinNum}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">平台总收入</label>
                        <div class="controls">
                            <input type="text" id="totalIncome" name="totalIncome" value="${coinExchangeRate.totalIncome}" class="input-xxlarge" maxlength="80" onblur="caculateExchangeRate();"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">汇率(xx金币兑1元rmb)</label>
                        <div class="controls">
                            <input type="text" id="exchangeRate" name="exchangeRate" value="${coinExchangeRate.exchangeRate}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">Note: 默认汇率区间(${minCoinExchangeRange} - ${maxCoinExchangeRange})</div>
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_coin").addClass('active open');//左侧导航栏选中状态
$("#submenu_coinExchange").addClass('active');//左侧导航栏选中状态
function cancel() {
    location.reload();
}
function caculateExchangeRate() {
    var totalCoinNum =  $("#totalCoinNum").val();
    var totalIncome =  $("#totalIncome").val();
    if (totalIncome <= 0) {
        confirm("收入必须大于0");
    } else {
        var exchangeRate = Math.ceil(totalCoinNum / totalIncome);
        var min = ${minCoinExchangeRange};
        var max = ${maxCoinExchangeRange};

        if (exchangeRate < min) {
            exchangeRate = min;
        }
        if (exchangeRate > max) {
            exchangeRate = max;
        }
        $("#exchangeRate").val(exchangeRate);
    }
}
</script>
</html>