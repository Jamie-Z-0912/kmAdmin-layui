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
			<h1><span>采集列表</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/post/list" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">

                <div class="control-group">
                    <label class="control-label">采集类型</label>
                    <div class="controls">
                        <select name="contentType" id="contentType" style="width: 120px;">
                            <option value="" <c:if test="${empty contentType}">selected</c:if>>所有</option>
                            <option value="post" <c:if test="${'post' == contentType}">selected</c:if>>文章</option>
                            <option value="photo" <c:if test="${'photo' == contentType}">selected</c:if>>图片</option>
                            <option value="resource" <c:if test="${'resource' == contentType}">selected</c:if>>资源</option>

                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">标题</label>
                    <div class="controls">
                        <input type="text" id="title" name="title" value="${title}" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">文章ID</label>
                    <div class="controls">
                        <input type="text" id="id" name="id" value="<c:if test="${0 != id}">${id}</c:if>" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">采集者ID</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="<c:if test="${0 != uid}">${uid}</c:if>" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">发布时间</label>
                    <div class="controls">
                        <input type="text" id="addTimeS" data-oval="" class="addTimeS input-large" />
                        <input  type="hidden" name="addTime" id="addTime" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">状态</label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>发布中</option>
                            <option value="2" <c:if test="${2 == status}">selected</c:if>>已上架</option>
                            <option value="3" <c:if test="${3 == status}">selected</c:if>>已下架</option>

                        </select>
                    </div>
                </div>
                <div class="control-group">
                <label class="control-label">标签</label>
                    <div class="controls">
                        <select name="tagId" id="tagId" style="width: 120px;">
                            <option value="0" <c:if test="${0 == tagId}">selected</c:if>>所有</option>
                            <c:forEach items="${tags}" var="tag" varStatus="st">
                                <option value="${tag.id}" <c:if test="${tag.id == tagId}">selected</c:if>>${tag.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                 </div>


                <div class="control-group">
                    <label class="control-label">采集来源</label>
                    <div class="controls">
                        <select name="origin" id="origin" style="width: 120px;">
                            <option value="0" <c:if test="${0 == origin}">selected</c:if>>所有</option>
                            <c:forEach items="${origins}" var="orn" varStatus="st">
                                <option value="${orn.value}" <c:if test="${orn.value == origin}">selected</c:if>>${orn.desc}</option>
                            </c:forEach>
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
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>文章ID</th>
                            <th>标题</th>
                            <th>标签</th>
                            <th>来源</th>
                            <th>预览</th>
                            <th>uid</th>
                            <th>发布时间</th>
                            <th>上架/下架时间</th>
                            <th>密码</th>
                            <th>PV</th>
                            <th>点击数</th>
                            <th>评论</th>
                            <th>点赞</th>
                            <th>有效阅读</th>
                            <th>购买数</th>
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
                                    <c:forEach items="${art.imagesList}" var="img" varStatus="st">
                                        <img src="${img}" id="avatar" name="avatar" style="width: 130px;" />
                                    </c:forEach>
                                </td>
                                <td>
                                   ${art.uid}
                                </td>
                                <td><suishen_fmt:formatDate value="${art.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${art.pubTime}" /></td>
                                <td>
                                <c:if test="${empty art.secretKey}">
                                    无
                                </c:if>
                                </td>
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
                                        ${art.exchangeNum}
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
                                    <c:if test="${contentType=='post'}">
                                        <a class="set_top update" href="${art.originUrl}" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>查看源文章</span></span></a><br/>
                                        <a class="set_top update" href="javascript:reFetch('${art.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>重新抓取</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${contentType=='photo'}">

                                    </c:if>
                                    <c:if test="${contentType=='resource'}">
                                        <a class="set_top update" href="${art.originUrl}" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>查看资源地址</span></span></a><br/>
                                        <c:if test="${art.status == 2}">
                                            <a class="set_top update" href="javascript:addRecommend('${art.id}');" target="_blank" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>加入推荐队列</span></span></a><br/>
                                        </c:if>
                                    </c:if>



                                    <a class="set_top update" href="admin/post/userlist?uid=${art.uid}" style="color: #4f99c6; text-decoration: none;">查看采集者</a><br/>
                                    <a class="set_top update" href="admin/msg/push?type=post&id=${art.id}&platform=DEFAULT" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>推送</span></span></a><br/>
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
                                            href="admin/post/list?page=${page - 1}&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}">&lt;&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page gt 1}">
                                        <li><a
                                            href="admin/post/list?page=1&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}">1</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">1</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 2 and page ne 2}">
                                        <li><a
                                            href="admin/post/list?page=2&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}">2</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">2</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${totalPage ge 3 and page ne 3}">
                                        <li class=""><a href="admin/post/list?page=3&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}">3</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev disabled"><a href="javascript:void(0);">3</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${page lt totalPage}">
                                        <li class="next"><a
                                            href="admin/post/list?page=${page + 1}&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}">&gt;&gt;</a></li>
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
$("#submenu_post").addClass('active');

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
                    window.location="admin/post/list?page=${page}&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}";
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
                    window.location="admin/post/list?page=${page}&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function reFetch(id) {
    if (confirm("您确认要重新抓取此文章吗？")) {
        $.ajax({
            url : "admin/post/refetch?id=" + id  ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location="admin/post/list?page=${page}&title=${title}&id=${id}&uid=${uid}&addTime=${addTime}&status=${status}&tagId=${tagId}&origin=${origin}&contentType=${contentType}";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}
function addRecommend(id) {
    if (confirm("您确认要将该资源加入首页推荐队列吗？")) {
        $.ajax({
            url : "admin/recommendQueue/add?id=" + id  ,
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


$("#addTimeS").slTime({
    callback:function(){
        gx();
    }
});
if($("#addTimeS").length > 0){
    if(Number(${addTime})>0){
        $("#addTimeS").val(new Date(${addTime}).format("yyyy-MM-dd"));
        gx();
    }else{
        $("#addTimeS").val("");
    }

}

function gx(){
    var start = new Date($("#addTimeS").val().replace(/-/g,   "/")).getTime();
    $("#addTimeS").val(new Date($("#addTimeS").val().replace(/-/g,   "/")).format("yyyy-MM-dd"));
    $("#addTime").val(start);
}
</script>
</html>