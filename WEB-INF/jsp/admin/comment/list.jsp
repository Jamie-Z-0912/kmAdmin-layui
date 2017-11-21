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
			<h1><span>评论列表</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/comment/list" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                     <label class="control-label">uid</label>
                     <div class="controls">
                         <input type="text" id="uid" name="uid" value="${uid}" class="input-large" maxlength="50"/>
                     </div>
                </div>
               <div class="control-group">
                  <label class="control-label">文章id</label>
                  <div class="controls">
                      <input type="text" id="articleId" name="articleId" value="${articleId}" class="input-large" maxlength="50"/>
                  </div>
               </div>
                <div class="control-group">
                    <label class="control-label">评论id</label>
                    <div class="controls">
                        <input type="text" id="commentId" name="commentId" value="${commentId}" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">评论对象类型</label>
                    <div class="controls">
                        <select name="commentObjType" id="commentObjType" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == commentObjType}">selected</c:if>>所有</option>
                            <option value="2" <c:if test="${2 == commentObjType}">selected</c:if>>文章</option>
                            <option value="3" <c:if test="${3 == commentObjType}">selected</c:if>>采集</option>
                        </select>
                    </div>
                 </div>

                <div class="control-group">
                    <label class="control-label">评论状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>待审核</option>
                            <option value="2" <c:if test="${2 == status}">selected</c:if>>审核通过</option>
                            <option value="3" <c:if test="${3 == status}">selected</c:if>>审核不通过</option>
                        </select>
                    </div>
                 </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">ID</th>
                            <th width="15%">评论人信息</th>
                            <th width="20%">评论内容</th>
                            <th width="15%">评论信息</th>
                            <th width="10%">状态</th>
							<th width="10%">评论时间</th>
							<th width="10%">审核时间</th>
							<th width="5%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${comments}" var="comment" varStatus="st">
							<tr>
								<td>${comment.id}</td>
                                <td>
                                   uid: <a class="set_top update" href="admin/users/base?uid=${comment.uid}" style="color: #4f99c6; text-decoration: none;">${comment.uid}</a>
                                    <br/>
                                   昵称: ${comment.nick}<br/>
                                   <img src="${comment.avatar}" />
                                </td>
                                <td>
                                    ${comment.content}
                                </td>
                                <td>
                                    评论对象id:${comment.commentArticleId}<br/>
                                    评论对象类型:<c:if test="${comment.commentObjType == 3}"><font color="green">采集</font></c:if>
                                    <c:if test="${comment.commentObjType == 2}"><font color="green">文章</font></c:if><br/>
                                    父评论id:${comment.fatherCommentId}<br/>
                                    回复评论id:${comment.replyCommentId}
                                </td>
                                <td>
                                    <c:if test="${0 == comment.status}">删除</c:if>
                                    <c:if test="${1 == comment.status}"><span style="color:gray">待审核</span></c:if>
                                    <c:if test="${2 == comment.status}"><span style="color:lightgreen">审核通过</span></c:if>
                                    <c:if test="${3 == comment.status}"><span style="color:red">审核不通过</span></c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${comment.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${comment.updateTime}" /></td>
                                <td>
                                    <c:if test="${1 == comment.status}">
                                        <a class="set_top update" href="admin/comment/${comment.id}?status=2" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>通过</span></span></a><br/>
                                        <a class="set_top update" href="admin/comment/${comment.id}?status=3" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>拒绝</span></span></a><br/>
                                    </c:if>
                                        <a class="set_top update" href="admin/comment/sonComment?fatherCommentId=${comment.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>子评论</span></span></a><br/>
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
                                            href="admin/comment/list?articleId=${articleId}&page=${page - 1}&status=${status}&uid=${uid}&commentId=${commentId}&commentObjType=${commentObjType}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/comment/list?articleId=${articleId}&page=1&status=${status}&uid=${uid}&commentId=${commentId}&commentObjType=${commentObjType}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/comment/list?page=2&articleId=${articleId}&status=${status}&uid=${uid}&commentId=${commentId}&commentObjType=${commentObjType}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a href="admin/comment/list?page=3&articleId=${articleId}&status=${status}&uid=${uid}&commentId=${commentId}&commentObjType=${commentObjType}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/comment/list?page=${page + 1}&articleId=${articleId}&status=${status}&uid=${uid}&commentId=${commentId}&commentObjType=${commentObjType}">&gt;&gt;</a></li>
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_comment").addClass('active open');
$("#submenu_comment").addClass('active');
</script>
</html>