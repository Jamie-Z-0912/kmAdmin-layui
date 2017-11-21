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
			    举报管理
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/report/processList" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">采集id</label>
                    <div class="controls">
                        <input type="text" id="objId" name="objId" value="${objId}" class="input-large"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">举报原因</label>
                    <div class="controls">
                        <select name="reportReason" id="reportReason">
                            <option value="0">默认</option>
                            <c:forEach items="${reportReasons}" var="reason" varStatus="st">
                                <option value="${reason.reason}" <c:if test="${reason.reason == reportReason}">selected</c:if>>${reason.desc}</option>
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
							<th>采集id</th>
							<th>标题</th>
							<th>来源</th>
							<th>状态</th>
							<th>分类</th>
							<th>密码</th>
							<th>举报原因</th>
                            <th>举报人数</th>
                            <th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reports}" var="report" varStatus="st">
							<tr>
								<td>${report.objId}</td>
								<td><a target="_blank" href="${report.post.originUrl}">${report.post.title}</a></td>
								<td>${report.post.authorName}</td>
								<td>
                                    <c:if test="${report.post.status == 1}"> 发布中</c:if>
                                    <c:if test="${report.post.status == 2}"> 上架</c:if>
                                    <c:if test="${report.post.status == 3}"> 下架</c:if>
                                </td>
                                <td>${report.post.tagName}</td>
                                <td>${report.post.secretKey}</td>
								<td>
								    <c:forEach items="${reportReasons}" var="reason" varStatus="st">
                                        <c:if test="${reason.reason == report.reportReason}">${reason.desc}</c:if>
                                    </c:forEach>
								</td>
								<td><a target="_blank" href="admin/report/list?objId=${report.objId}&reportReason=${report.reportReason}&startTime=1497888000000&status=0">${report.reportCount}</a></td>
								<td>
								    <c:if test="${report.reportReason == 1}">
                                        <a class="set_top update" href="javascript:modifyCategory('${report.objId}', '${report.reportReason}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>修改分类</span></span></a><br/>
                                    </c:if>
								    <c:if test="${report.reportReason != 1}">
                                        <a class="set_top update" href="javascript:setPostDown('${report.objId}', '${report.reportReason}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架采集</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="javascript:setInvalid('${report.objId}', '${report.reportReason}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>设为无效</span></span></a><br/>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录,共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/report/processList?page=${page - 1}&objId=${objId}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/report/processList?page=1&objId=${objId}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/report/processList?page=2&objId=${objId}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/report/processList?page=3&objId=${objId}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/report/processList?page=${page + 1}&objId=${objId}">&gt;&gt;</a></li>
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_reportProcess").addClass('active');

var tags = ${tags}, tagsStr='';
for (var i = 0; i < tags.length; i++) {
 tagsStr += '<span class="btn" data-catId="'+tags[i].id+'" style="margin:8px 5px;">'+tags[i].name+'</span>';
};
function modifyCategory(id,reason){
 var selectedId = false;
 layer.open({
    title: '修改分类',
    content: tagsStr,
    success: function(layero, index){
      console.log(layero, index);
      $(layero).on('click', '.btn', function(){
       var that = $(this);
       if(!that.hasClass('btn-danger')){
        $(this).addClass('btn-danger').siblings().removeClass('btn-danger');
        selectedId = that.attr('data-catId');
       }
      })
  },
    yes: function(index, layero){
     if(selectedId){
    updatePostTag(id, reason, selectedId);
      layer.close(index);
     }
  }
 });
}

function setInvalid(objId, reportReason) {
    if (confirm("确认设置举报为无效？")) {
        $.ajax({
            url : "admin/report/ignore?id=" + objId + "&reportReason=" + reportReason,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败, " + data.desc);
                } else {
                    window.location="admin/report/processList";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function setPostDown(objId, reportReason) {
    if (confirm("确认下架采集？")) {
        $.ajax({
            url : "admin/report/downPost?id=" + objId + "&reportReason=" + reportReason,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败, " + data.desc);
                } else {
                    window.location="admin/report/processList";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function updatePostTag(objId, reportReason, tagId) {
    if (confirm("确认修改采集分类？")) {
        $.ajax({
            url : "admin/report/updateTag?id=" + objId + "&reportReason=" + reportReason + "&tagId=" + tagId ,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败, " + data.desc);
                } else {
                    window.location="admin/report/processList";
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