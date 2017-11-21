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
			用户卡券列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/cards/user" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                   <div class="control-group">
                         <label class="control-label">手机号:</label>
                         <div class="controls">
                             <input type="text" id="phone" name="phone" value="${phone}"  />
                         </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">uid:</label>
                       <div class="controls">
                           <input type="text" id="uid" name="uid" value="${uid}"  />
                       </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">卡券类型:</label>
                      <div class="controls">
                          <select name="cardType" id="cardType" style="width: 120px;">
                            <option value="1" <c:if test="${cardType == '1'}">selected</c:if>>阅读加速卡</option>
                        </select>
                      </div>
                  </div>
                  <div class="control-group">
                      <label class="control-label">开始时间<br />
                      </label>
                      <div class="controls">
                          <input type="text" id="startTime" data-oval=""  />
                          <input type="hidden" name="startTime" id="start_time_hidden" />
                      </div>
                  </div>

                  <div class="control-group">
                      <label class="control-label">结束时间<br />
                      </label>
                      <div class="controls">
                          <input type="text" id="endTime" data-oval=""  />
                          <input type="hidden" name="endTime" id="end_time_hidden" />
                      </div>
                  </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>uid</th>
							<th>兑吧订单号</th>
							<th>卡券名称</th>
							<th>卡券封面</th>
							<th>卡券类型</th>
							<th>有效天数</th>
                            <th>获取方式</th>
                            <th>卡券价格</th>
                            <th>状态</th>
							<th>购买时间</th>
							<th>使用时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="card" varStatus="st">
							<tr>
								<td>${card.id}</td>
								<td><a target="_blank" href="admin/users/base?uid=${card.uid}">${card.uid}</a></td>
								<td>${card.duibaOrderNum}</td>
								<td>
                                   ${card.cardName}
                                </td>
                                <td>
                                    <img src="${card.cardIcon}" style="width: 130px;" />
                                </td>
                                <td>
                                    <c:forEach items="${cardTypes}" var="cardType" varStatus="st">
                                        <c:if test="${cardType.type == card.cardType}">
                                            ${cardType.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                   ${card.cardEffectiveDays}
                                </td>
                                <td>
                                    ${card.obtainMethodDesc}
                                </td>
                                <td>${card.sellPrice}</td>
                                <td>
                                    <c:forEach items="${statusList}" var="sl" varStatus="st">
                                        <c:if test="${sl.status == card.status}">${sl.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <suishen_fmt:formatDate value="${card.addedTime}" />
                                </td>
                                 <td>
                                     <suishen_fmt:formatDate value="${card.updateTime}" />
                                 </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					${total}条记录, 共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/cards/user?page=${page - 1}&status=${status}&uid=${uid}&cardType=${cardType}&startTime=${startTime}&endTime=${endTime}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/cards/user?page=1&status=${status}&uid=${uid}&cardType=${cardType}&startTime=${startTime}&endTime=${endTime}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/cards/user?page=2&status=${status}&uid=${uid}&cardType=${cardType}&startTime=${startTime}&endTime=${endTime}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/cards/user?page=3&status=${status}&uid=${uid}&cardType=${cardType}&startTime=${startTime}&endTime=${endTime}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/cards/user?page=${page + 1}&status=${status}&uid=${uid}&cardType=${cardType}&startTime=${startTime}&endTime=${endTime}">&gt;&gt;</a></li>
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
$("#menu_card").addClass('active open');
$("#submenu_userCard").addClass('active');

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