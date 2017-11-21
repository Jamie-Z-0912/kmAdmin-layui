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
			<h1><span>昨日采集精选
            </span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/post/topListYesterday" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">类别</label>
                    <div class="controls">
                        <select name="type" id="type" style="width: 120px;">
                            <option value="1" <c:if test="${1 == type}">selected</c:if>>阅读精选</option>
                            <option value="2" <c:if test="${2 == type}">selected</c:if>>评论精选</option>

                        </select>

                    </div>

                </div>

                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>

        <h3><span>采集列表</span>
        </h3>

        <div class="row-fluid">
            <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                <thead>
                <tr>
                    <th>文章ID</th>
                    <th>标题</th>
                    <th>标签</th>
                    <th>来源</th>
                    <th>uid</th>
                    <th>发布时间</th>
                    <th>上架/下架时间</th>
                    <th>PV</th>
                    <th>点击数</th>
                    <th>评论</th>
                    <th>点赞</th>
                    <th>有效阅读</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${posts}" var="art" varStatus="st">
                    <tr>
                        <td>${art.id}</td>

                        <td>

                            <c:if test="${empty art.title}">

                                ------
                            </c:if>
                            <c:if test="${not empty art.title}">


                                ${art.title}
                            </c:if>

                        </td>
                        <td>
                                ${art.tagName}
                        </td>
                        <td>
                            <c:forEach items="${origins}" var="orn" varStatus="st">
                                <c:if test="${orn.value == art.origin}">${orn.desc}</c:if>
                            </c:forEach>
                        </td>
                        <td>
                                ${art.uid}
                        </td>
                        <td><suishen_fmt:formatDate value="${art.addedTime}" /></td>
                        <td><suishen_fmt:formatDate value="${art.pubTime}" /></td>
                        <td>
                                ${art.pv}
                        </td>
                        <td>
                                ${art.click}
                        </td>
                        <td>
                                ${art.commentNum}
                        </td>
                        <td>
                                ${art.praiseNum}
                        </td>
                        <td>
                                ${art.viewNum}
                        </td>

                        <td>
                            <a class="set_top update" href="${art.originUrl}" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>查看源文章</span></span></a><br/>

                            <c:if test="${art.status == 2}">
                                <a class="set_top update" href="javascript:down('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

    </div>
	</div>
</div></div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_post_topListYesterday").addClass('active');
function down(id) {
    if (confirm("您确认要删除此精选吗？")) {
        $.ajax({
            url : "admin/post/delTop?id=" + id +"&type=${type}" ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                   location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要恢复此文章吗？")) {
        $.ajax({
            url : "admin/post/update?id=" + id + "&status=2" ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/post/toplist?sortField=" + '${sortField}';
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

</script>
</html>