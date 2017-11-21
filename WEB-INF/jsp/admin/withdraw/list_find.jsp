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
			<h1>提现/充值记录查询</h1>
            <input type="text" id="account" width="20px" value="${account}" placeholder="uid/手机号"/>
            <input type="text" id="keyword" width="20px" value="${keyword}" placeholder="提现账号"/>
            <a onclick="find()" class="btn btn-success btn-small">查询</a>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">ID</th>
                            <th width="5%">UID</th>
							<th width="10%">收款人</th>
                            <th width="10%">银行</th>
                            <th width="5%">开户行</th>
							<th width="10%">卡号/支付宝号</th>
                            <th width="10%">提现金额</th>
							<th width="20%">申请时间</th>
                            <th width="20%">打款时间</th>
                            <th width="10%">快速</th>
                            <th width="10%">状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${wd_list}" var="wd" varStatus="st">
							<tr>
								<td>${wd.id}
                                </td>
                                <td><a target="_blank" href="admin/users/base?uid=${wd.uid}">${wd.uid}</a></td>
								<td>${wd.bankAccountName}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${wd.type == 1}">
                                            ${wd.bankName}
                                        </c:when>
                                        <c:otherwise>
                                            支付宝
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${wd.bankBranchName}</td>
                                <td>${wd.bankCard}</td>
                                <td>${wd.amount}</td>
								<td><suishen_fmt:formatDate value="${wd.addedTime}" /></td>
                                <td>
                                    <c:if test="${wd.status==2}">
                                        <suishen_fmt:formatDate value="${wd.modifiedTime}" />
                                    </c:if>
                                    <c:if test="${wd.status==3}">
                                        ${wd.failReason}
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${wd.isFast==1}">
                                        是
                                    </c:if>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${wd.status==1}">
                                            创建
                                        </c:when>
                                        <c:when test="${wd.status==2}">
                                            成功
                                        </c:when>
                                        <c:when test="${wd.status==3}">
                                            失败
                                        </c:when>
                                        <c:when test="${wd.status==6}">
                                            待处理
                                        </c:when>
                                        <c:when test="${wd.status==7}">
                                            待打款
                                        </c:when>
                                        <c:when test="${wd.status==8}">
                                            延迟打款
                                        </c:when>
                                    </c:choose>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="5%">ID</th>
                        <th width="5%">UID</th>
                        <th width="10%">手机号</th>
                        <th width="10%">充值金额</th>
                        <th width="20%">申请时间</th>
                        <th width="20%">充值时间</th>
                        <th width="8%">状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cz_list}" var="wd" varStatus="st">
                        <tr>
                            <td>${wd.id}
                            </td>
                            <td><a target="_blank" href="admin/users/base?uid=${wd.uid}">${wd.uid}</a></td>
                            <td>${wd.phone}</td>
                            <td>${wd.amount}</td>
                            <td><suishen_fmt:formatDate value="${wd.addedTime}" /></td>
                            <td>
                                <c:if test="${wd.status==3}">
                                    <suishen_fmt:formatDate value="${wd.modifiedTime}" />
                                </c:if>
                            </td>
                            <td>
                                <c:choose>
                                <c:when test="${wd.status==1}">
                                    创建
                                </c:when>
                                <c:when test="${wd.status==2}">
                                    充值中
                                </c:when>
                                <c:when test="${wd.status==3}">
                                    充值成功
                                </c:when>
                                <c:when test="${wd.status==4}">
                                    充值失败
                                </c:when>
                                <c:when test="${wd.status==5}">
                                    异常订单
                                </c:when>
                                <c:when test="${wd.status==6}">
                                    失败已退款
                                </c:when>
                                    <c:when test="${wd.status==7}">
                                        待处理
                                    </c:when>
                                    <c:when test="${wd.status==8}">
                                        延迟充值
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
				<div class="row-fluid">
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_withdraw").addClass('active open');//左侧导航栏选中状态
$("#withdraw_find").addClass('active');//左侧导航栏选中状态

function find(){
    var keyword = $("#keyword").val();
    var account = $("#account").val();

    if(keyword == '' && account == ''){
        alert("请输入uid/手机号/提现账号查询!");
        return;
    }
    window.location.href = "admin/withdraw/list_find?keyword=" + encodeURIComponent(keyword) + "&account=" + account;
}

</script>
</html>