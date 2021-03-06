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
			<h1>
			每日汇率
			</h1>
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
			    Note: 默认汇率区间(${coinExchangeRange})
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
						    <th>日期</th>
                            <th>总金币数</th>
                            <th>平台总收入</th>
                            <th>汇率(x金币兑1元rmb)</th>
                            <th>添加时间</th>
                            <th>操作</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${coinExchange}" var="ce" varStatus="st">
							<tr>
							    <td>${ce.date}</td>
                                <td>${ce.coinExchange.totalCoinNum}</td>
                                <td>${ce.coinExchange.totalIncome}</td>
                                <td>${ce.coinExchange.exchangeRate}</td>
                                <td><suishen_fmt:formatDate value="${ce.coinExchange.addedTime}" /></td>
                                <td>
                                    <c:if test="${st.index == 0}">
                                        <a class="set_top update" href="admin/coinExchange/update"> <span class="blue"> <span>编辑</span></span></a>
                                    </c:if>
                                </td>
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
$("#menu_coin").addClass('active open');//左侧导航栏选中状态
$("#submenu_coinExchange").addClass('active');//左侧导航栏选中状态

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
    window.location.href = "admin/coinExchange/list?start_time=" + starttime;
}
</script>
</html>