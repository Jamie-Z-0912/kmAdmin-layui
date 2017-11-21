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
			搜索补量
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/searchKeywords/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                      <label class="control-label">开始时间<br /></label>
                      <div class="controls">
                          <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                          <input type="hidden" name="startTime" id="start_time_hidden" />
                      </div>
                  </div>
                  <div class="control-group">
                      <label class="control-label">结束时间<br /></label>
                      <div class="controls">
                          <input type="text" id="endTime" data-oval=""  />
                          <input type="hidden" name="endTime" id="end_time_hidden" />
                      </div>
                  </div>
				<div class="control-group">
					<label class="control-label">链接<br /></label>
					<div class="controls">
						<input type="text" name="url" id="url" data-oval=""  />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">来源<br /></label>
					<div class="controls">
						<input type="text" name="source" id="source" data-oval=""  />
					</div>
				</div>
                <div class="form-actions" style="position:relative;">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
					<button class="btn btn-info">
						<p>总投放量:${totalPutNum}</p>
					</button>
					<button class="btn btn-info">
						<p>总搜索量:${totalSearchNum}</p>
					</button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>关键词</th>
							<th>链接</th>
							<th>投放平台</th>
							<th>来源</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>投放量</th>
                            <th>搜索量</th>
                            <th>添加时间</th>
                            <th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${searchKeywords}" var="word" varStatus="st">
							<tr>
								<td><a target="_blank" href="${word.url}">${word.keyword}</a></td>
								<td> ${word.url}</td>
								<td>${word.platform}</td>
								<td>${word.source}</td>
								<td><suishen_fmt:formatDate value="${word.startTime}" /></td>
								<td><suishen_fmt:formatDate value="${word.endTime}" /></td>
								<td><font color="red">${word.putNum}</font></td>
								<td><font color="green">${word.searchNum}</font></td>
								<td><suishen_fmt:formatDate value="${word.addedTime}" /></td>
                                <td><c:choose>
                                    <c:when test="${word.status==1}">上架</c:when>
                                    <c:otherwise>下架</c:otherwise>
                                </c:choose></td>
								<td>
                                    <a class="set_top update" href="admin/searchKeywords/update?id=${word.id}">编辑</a><br/>
                                    <c:choose>
                                        <c:when test="${word.status==0}"><a href="javascript:show(${word.id})">上架</a><br/></c:when>
                                        <c:otherwise><a href="javascript:shutdown(${word.id})">下架</a><br/></c:otherwise>
                                    </c:choose>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/searchKeywords/list?page=${page - 1}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/searchKeywords/list?page=1&startTime=${startTime}&endTime=${endTime}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/searchKeywords/list?page=2&startTime=${startTime}&endTime=${endTime}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/searchKeywords/list?page=3&startTime=${startTime}&endTime=${endTime}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/searchKeywords/list?page=${page + 1}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
$("#menu_app").addClass('active open');
$("#menu_search_keyword").addClass('active');

function add() {
    window.location = "admin/searchKeywords/add";
}

function show(id) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/searchKeywords/show?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功！");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function shutdown(id) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/searchKeywords/shutdown?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功！");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
    $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
    gx();
    $("#startTime").slTime({
        callback:function(){
            gx();
        }
    });
    $("#endTime").slTime({
        callback:function(){
            gx();
        }
    });
}

function gx(){
    var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
    var end = new Date($("#endTime").val().replace(/-/g,   "/")).getTime();
    $("#start_time_hidden").val(start);
    $("#end_time_hidden").val(end);
}
</script>
</html>