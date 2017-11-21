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
			<h1>提现账号</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/withdraw/account" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">uid:</label>
                        <div class="controls">
                            <input type="text" id="uid" name="uid" value="${uid}" class="input-large" maxlength="80"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">支付宝/银行卡:</label>
                        <div class="controls">
                            <input type="text" id="account" name="account" value="${account}" class="input-large" maxlength="80"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                    </div>
                </form>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
                            <th width="5%">UID</th>
							<th width="10%">账号类型</th>
							<th width="10%">提现账号</th>
                            <th width="10%">账号详情</th>
                            <th width="10%">添加时间</th>
							<th width="20%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userWithdrawAccounts}" var="uwa" varStatus="st">
							<tr>
                                <td>${uwa.uid}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${uwa.type == 1}">
                                            银行卡
                                        </c:when>
                                        <c:otherwise>
                                            支付宝
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${uwa.account}</td>
                                <td>${uwa.withdrawAccount}</td>
								<td><suishen_fmt:formatDate value="${uwa.addedTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/withdraw/account/${uwa.id}/${uwa.type}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				历史账号:
				<table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th width="5%">UID</th>
                            <th width="10%">账号类型</th>
                            <th width="10%">提现账号</th>
                            <th width="10%">账号详情</th>
                            <th width="10%">添加时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${hisUserWithdrawAccounts}" var="huwa" varStatus="st">
                            <tr>
                                <td>${huwa.uid}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${huwa.type == 1}">
                                            银行卡
                                        </c:when>
                                        <c:otherwise>
                                            支付宝
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${huwa.account}</td>
                                <td>${huwa.withdrawAccount}</td>
                                <td><suishen_fmt:formatDate value="${huwa.addedTime}" /></td>
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
    $("#menu_withdraw").addClass('active open');//左侧导航栏选中状态
    $("#submenu_withdraw_account").addClass('active');
</script>
</html>