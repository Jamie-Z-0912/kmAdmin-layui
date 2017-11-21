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
			<h1>红包配置(注意:修改1min后生效)
			    <a href="admin/systemSetting/add" class="btn btn-success btn-small" style="float: right"> <i class="icon-edit"></i>新增配置项</a>
			</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                            <tr>
                                <th>name</th>
                                <th>value</th>
                                <th>desc</th>
                                <th>addedTime</th>
                                <th>updateTime</th>
                                <th>opt</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${systemConfigs}" var="sc" varStatus="st">
                            <tr>
                                <td>${sc.name}</td>
                                <td>${sc.value}</td>
                                <td>${sc.desc}</td>
                                <td><suishen_fmt:formatDate value="${sc.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${sc.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/systemSetting/update?name=${sc.name}"> <span class="blue"> <span>编辑</span></span></a><br/>
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
$("#menu_redPackSetting").addClass('active');//左侧导航栏选中状态
</script>
</html>