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
			<h1>每日红包
			</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                            <tr>
                                <th>id</th>
                                <th>每次领取间隔分钟</th>
                                <th>奖励金币数(区间)</th>
                                <th>添加时间</th>
                                <th>修改时间</th>
                                <th>操作</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${redPackList}" var="rp" varStatus="st">
                            <tr>
                                <td>${rp.id}</td>
                                <td>${rp.intervalMinu}</td>
                                <td>${rp.coinNum}</td>
                                <td><suishen_fmt:formatDate value="${rp.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${rp.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/redpack/update?id=${rp.id}"> <span class="blue"> <span>编辑</span></span></a><br/>
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
$("#menu_redPack").addClass('active open');//左侧导航栏选中状态
$("#menu_redPackList").addClass('active');//左侧导航栏选中状态
</script>
</html>