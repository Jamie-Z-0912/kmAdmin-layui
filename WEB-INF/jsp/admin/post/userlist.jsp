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
			<h1><span>用户采集</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/post/userlist" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">

                <div class="control-group">
                    <label class="control-label">手机号:</label>
                    <div class="controls">
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">uid:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid"  value="<c:if test="${0 != uid}">${uid}</c:if>" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>

                <h3><span>用户信息</span>
                </h3>

            <div class="row-fluid">
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>采集者ID</th>
                        <th>用户名</th>
                        <th>手机号</th>
                        <th>是否是黑名单</th>
                        <th>转载文章数</th>
                        <th>昨日收益</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${ not empty userPostStat.userName }">
                    <tr>
                        <td>${userPostStat.uid}</td>

                        <td>${userPostStat.userName}</td>

                        <td>${userPostStat.phone}</td>

                        <td>${userPostStat.blackUid}</td>

                        <td>${userPostStat.postNum}</td>
                        <td>${userPostStat.yesterdayIncome}金币</td>
                        <td>
                            <a class="set_top update" href="" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>每日明细</span></span></a><br/>
                             <a class="set_top update" href="admin/users/base?uid=${uid}" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>查看基本信息</span></span></a><br/>
                            <c:if test="${ !userPostStat.blackUid }">
                            <a class="set_top update" href="admin/blackUser/add?blackAccount=${uid}" style="color: #4f99c6; text-decoration: none;"><span class="blue"> <span>拉黑</span></span></a>
                            </c:if>

                        </td>
                    </tr>
                    </c:if>

                    </tbody>
                </table>
            </div>

		</div>
        <h3><span>转载文章列表</span>
        </h3>

        <div class="control-group">
            <div class="controls">
                排序规则&nbsp;&nbsp;
                <select name="sortField" id="sortField" style="width: 120px;">
                    <option value="1" <c:if test="${1 == sortField}">selected</c:if>>发布时间</option>
                    <option value="2" <c:if test="${2 == sortField}">selected</c:if>>有效阅读数</option>
                    <option value="3" <c:if test="${3 == sortField}">selected</c:if>>点击数</option>
                    <option value="4" <c:if test="${4 == sortField}">selected</c:if>>点赞数</option>
                    <option value="5" <c:if test="${5 == sortField}">selected</c:if>>评论数</option>

                </select>
                &nbsp;&nbsp;&nbsp; 状态 &nbsp;&nbsp;
                    <select name="status" id="status" style="width: 120px;">
                        <option value="0" <c:if test="${0 == status}">selected</c:if>>所有</option>
                        <option value="1" <c:if test="${1 == status}">selected</c:if>>发布中</option>
                        <option value="2" <c:if test="${2 == status}">selected</c:if>>已上架</option>
                        <option value="3" <c:if test="${3 == status}">selected</c:if>>已下架</option>

                    </select>
            </div>

        </div>
        </form>

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
                    <th>状态</th>
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
                            <c:if test="${art.status == 1}">发布中</c:if>
                            <c:if test="${art.status == 2}">上架</c:if>
                            <c:if test="${art.status == 3}">下架(${art.message})</c:if>
                        </td>
                        <td>
                            <c:if test="${art.status == 3}">
                                <a class="set_top update" href="javascript:up('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                            </c:if>
                            <c:if test="${art.status == 2}">
                                <a class="set_top update" href="javascript:down('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                            </c:if>
                            <a class="set_top update" href="${art.originUrl}" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>查看源文章</span></span></a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="row-fluid">
                <div class="span12">
                    <div class="dataTables_paginate paging_bootstrap pagination">
                        ${total}条记录共<b>${totalPage}</b>页
                        <ul>
                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                            href="admin/post/userlist?page=${page - 1}&uid=${uid}&status=${status}&phone=${phone}&sortField=${sortField}">&lt;&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page gt 1}">
                                    <li><a
                                            href="admin/post/userlist?page=1&uid=${uid}&status=${status}&phone=${phone}&sortField=${sortField}">1</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 2 and page ne 2}">
                                    <li><a
                                            href="admin/post/userlist?page=2&uid=${uid}&status=${status}&phone=${phone}&sortField=${sortField}">2</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${totalPage ge 3 and page ne 3}">
                                    <li class=""><a href="admin/post/userlist?page=3&uid=${uid}&status=${status}&phone=${phone}&sortField=${sortField}">3</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page lt totalPage}">
                                    <li class="next"><a
                                            href="admin/post/userlist?page=${page + 1}&uid=${uid}&status=${status}&phone=${phone}&sortField=${sortField}">&gt;&gt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="prev disabled"><a href="javascript:void(0);">&gt;&gt;</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>

    </div>
	</div>
</div></div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_post_user").addClass('active');
function down(id) {
    if (confirm("您确认要下架此文章吗？")) {
        $.ajax({
            url : "admin/post/update?id=" + id + "&status=3" ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/post/userlist?phone=" + '${phone}' + "&uid=" + '${uid}'+ "&sortField=" + '${sortField}'+ "&status=" + '${status}';
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
                    window.location="admin/post/userlist?phone=" + '${phone}' + "&uid=" + '${uid}'+ "&sortField=" + '${sortField}'+ "&status=" + '${status}';
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