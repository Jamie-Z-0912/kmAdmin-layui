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
                验证码管理
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/verifyCode" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">手机号:</label>
                    <div class="controls">
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="40"/>
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
							<th width="25%">手机号</th>
							<th width="25%">最近1分钟验证码</th>
							<th width="25%">今日已发送次数</th>
							<th width="25%">操作</th>
						</tr>
					</thead>
                        <tbody>
                                <tr>
                                    <td>${phone}</td>
                                    <td>
                                        ${verifyCode}
                                    </td>
                                    <td>${sendVerifyCodeNum}</td>
                                    <td>
                                        <c:if test="${isOutLimit}">
                                            <a class="set_top update" href="admin/verifyCode/delSendNum?phone=${phone}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除已发送次数</span></span></a><br/>
                                        </c:if>
                                        <a class="set_top update" href="admin/delVerifyCodeSendNum?phone=${phone}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除已发送次数</span></span></a><br/>
                                    </td>
                                </tr>
                        </tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_verifyCode").addClass('active');
</script>
</html>