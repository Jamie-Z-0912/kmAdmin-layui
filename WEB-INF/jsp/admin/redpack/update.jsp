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
			<h1>红包编辑</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/redpack/update" method="post" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" name="id" value="${redpack.id}" />
                    <input type="hidden" name="addedTime" value="${redpack.addedTime}" />

                    <div class="control-group">
                        <label class="control-label">每次领取间隔分钟</label>
                        <div class="controls">
                            <input type="text" id="intervalMinu" name="intervalMinu" value="${redpack.intervalMinu}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励金币数(区间)</label>
                        <div class="controls">
                            <input type="text" id="coinNum" name="coinNum" value="${redpack.coinNum}" class="input-xxlarge" maxlength="80"/>
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
$("#menu_redPack").addClass('active open');//左侧导航栏选中状态
$("#menu_redPackList").addClass('active');//左侧导航栏选中状态
function cancel() {
        location.reload();
    }
</script>
</html>