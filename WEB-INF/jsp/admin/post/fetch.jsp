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
			<h1><span>文章抓取</span>
            </h1>
		</div>
		<div class="row-fluid">
            <form action="admin/post/fetch" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">采集用户uid</label>
                    <div class="controls">
                            <input type="text" id="uid" name="uid" class="input-medium"/>
                    </div>
                </div>
                <div class="control-group">
                <label class="control-label">标签</label>
                    <div class="controls">
                        <select name="tagId" id="tagId" style="width: 120px;">
                            <c:forEach items="${tags}" var="cat" varStatus="st">
                                <option value="${cat.id}" >${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                 <div class="control-group">
                     <label class="control-label">文章地址</label>

                     <div class="controls">
                         <textarea id="originUrl" name="originUrl" class="input-xlarge" style="height: 200px;width:400px" placeholder="多个网址换行分隔"></textarea>
                     </div>
                 </div>


                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 开始抓取
                    </button>
                </div>
            </form>
        </div>

	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_post_fetch").addClass('active');
</script>
</html>