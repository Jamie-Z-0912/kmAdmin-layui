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
			金币规则
			</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                            <tr>
                                <th>id</th>
                                <th>金币事件</th>
                                <th>规则描述</th>
                                <th>奖励金币数</th>
                                <th>修改时间</th>
                                <th>操作</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${coinRules}" var="coinRule" varStatus="st">
                            <tr>
                                <td>${coinRule.id}</td>
                                <td>${coinRule.eventType}</td>
                                <td>${coinRule.msg}</td>
                                <td>${coinRule.coin}</td>
                                <td><suishen_fmt:formatDate value="${coinRule.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/coinRule/update?eventType=${coinRule.eventType}"> <span class="blue"> <span>编辑</span></span></a><br/>
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
$("#submenu_coinRule").addClass('active');//左侧导航栏选中状态
</script>
</html>