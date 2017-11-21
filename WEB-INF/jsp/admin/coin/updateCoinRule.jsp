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
			<h1>编辑金币规则</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/coinRule/update" method="post" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" name="id" value="${coinRule.id}" />
                    <input type="hidden" name="addedTime" value="${coinRule.addedTime}" />

                    <div class="control-group">
                        <label class="control-label">金币事件</label>
                        <div class="controls">
                            <input readonly="true" type="text" id="eventType" name="eventType" value="${coinRule.eventType}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励金币数</label>
                        <div class="controls">
                            <input type="text" id="coin" name="coin" value="${coinRule.coin}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">规则描述</label>
                        <div class="controls">
                            <input type="text" id="msg" name="msg" value="${coinRule.msg}" class="input-xxlarge" maxlength="80"/>
                        </div>
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
$("#submenu_coinRule").addClass('active');//左侧导航栏选中状态
function cancel() {
        location.reload();
    }
</script>
</html>