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
			<h1>系统配置管理(注意:所有配置修改完1min后生效)
			<a href="admin/systemSetting/add" class="btn btn-success btn-small"
                               style="float: right"> <i class="icon-edit"></i>新增配置项</a>
			</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/systemSetting/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">模块</label>
                        <div class="controls">
                            <select name="module" id="module" style="width: 120px;">
                                <c:forEach items="${modules}" var="md">
                                    <option value="${md}" <c:if test="${md == module}">selected</c:if>>${md}</option>
                                </c:forEach>
                                <option value="" <c:if test="${'' == module}">selected</c:if>>所有</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                    </div>
                </form>
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                            <tr>
                                <th>名称</th>
                                <th>配置值</th>
                                <th>描述</th>
                                <th>所属模块</th>
                                <th>修改时间</th>
                                <th>操作</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${systemConfigs}" var="sc" varStatus="st">
                            <tr>
                                <td>${sc.name}</td>
                                <td>${sc.value}</td>
                                <td>${sc.desc}</td>
                                <td>${sc.module}</td>
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
$("#menu_monitor").addClass('active open');//左侧导航栏选中状态
$("#submenu_config").addClass('active');//左侧导航栏选中状态
</script>
</html>