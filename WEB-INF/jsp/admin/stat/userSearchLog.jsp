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
			用户搜索记录
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/users/searchLog" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                          <label class="control-label">客户端版本:</label>
                          <div class="controls">
                              <select name="clientVersion" id="clientVersion" style="width: 120px;">
                                  <option value="" <c:if test="${clientVersion == ''}">selected</c:if>>所有</option>
                                  <c:forEach items="${clientVersions}" var="ver" varStatus="st">
                                    <option value="${ver}" <c:if test="${ver == clientVersion}">selected</c:if>>${ver}</option>
                                  </c:forEach>
                              </select>
                          </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">设备平台</label>
                      <div class="controls">
                          <select name="devicePlatform" id="devicePlatform" style="width: 120px;">
                              <option value="" <c:if test="${'' == devicePlatform}">selected</c:if>>所有</option>
                              <option value="ANDROID" <c:if test="${'ANDROID' == devicePlatform}">selected</c:if>>ANDROID</option>
                              <option value="IPHONE" <c:if test="${'IPHONE' == devicePlatform}">selected</c:if>>IPHONE</option>
                          </select>
                      </div>
                   </div>
                   <div class="control-group">
                        <label class="control-label">是否有效搜索:</label>
                        <div class="controls">
                            <select name="isValid" id="isValid" style="width: 120px;">
                                <option value="-1" <c:if test="${isValid == '-1'}">selected</c:if>>所有</option>
                                <option value="0" <c:if test="${isValid == '0'}">selected</c:if>>否</option>
                                <option value="1" <c:if test="${isValid == '1'}">selected</c:if>>是</option>
                            </select>
                        </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">搜索来源:</label>
                      <div class="controls">
                          <select name="source" id="source" style="width: 120px;">
                            <option value="-1" <c:if test="${source == '-1'}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${source == '1'}">selected</c:if>>首页搜索框</option>
                            <option value="2" <c:if test="${source == '2'}">selected</c:if>>搜索任务热词</option>
                            <option value="3" <c:if test="${source == '3'}">selected</c:if>>首页热词</option>
                            <option value="4" <c:if test="${source == '4'}">selected</c:if>>资源搜索</option>
                          </select>
                      </div>
                  </div>
                   <div class="control-group">
                         <label class="control-label">手机号:</label>
                         <div class="controls">
                             <input type="text" id="phone" name="phone" value="${phone}" />
                         </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">uid:</label>
                       <div class="controls">
                           <input type="text" id="uid" name="uid" value="${uid}" />
                       </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">ip:</label>
                      <div class="controls">
                          <input type="text" id="ip" name="ip" value="${ip}" />
                      </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">设备标识:</label>
                       <div class="controls">
                           <input type="text" id="device" name="device" value="${device}" />
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
							<th>uid</th>
							<th>搜索渠道</th>
							<th>搜狗pid</th>
							<th>搜索关键字</th>
							<th>搜索来源</th>
							<th>平台</th>
							<th>Client版本</th>
							<th>设备标识</th>
							<th>ip</th>
							<th>是否有效</th>
							<th>搜索时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="log" varStatus="st">
							<tr>
								<td><a target="_blank" href="admin/users/searchLog?uid=${log.uid}">${log.uid}</a></td>
								<td>${log.platform}</td>
								<td>${log.pid}</td>
								<td>
                                   ${log.keyword}
                                </td>
                                <td>
                                    <c:if test="${log.source == 1}">
                                        首页搜索框
                                    </c:if>
                                    <c:if test="${log.source == 2}">
                                        搜索任务热词
                                    </c:if>
                                    <c:if test="${log.source == 3}">
                                        首页热词
                                    </c:if>
                                    <c:if test="${log.source == 4}">
                                        资源搜索
                                    </c:if>
                                </td>
                                <td>
                                    ${log.devicePlatform}
                                </td>
                                <td>
                                   ${log.clientVersion}
                                </td>
                                <td>
                                    <a target="_blank" href="admin/users/searchLog?device=${log.device}">${log.device}</a>
                                </td>

                                <td>
                                    <a target="_blank" href="admin/users/searchLog?ip=${log.ip}">${log.ip}</a>
                                 </td>
                                <td>
                                    <c:if test="${log.isValid == 0}">
                                        <font color="red">否</font>
                                    </c:if>
                                    <c:if test="${log.isValid == 1}">
                                        <font color="green">是</font>
                                    </c:if>
                                </td>
                                <td>
                                    <suishen_fmt:formatDate value="${log.addedTime}" />
                                </td>
                                <td><a target="_blank" href="admin/users/base?uid=${log.uid}">用户信息</a></td>
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
										href="admin/users/searchLog?page=${page - 1}&uid=${uid}&source=${source}&startTime=${startTime}&endTime=${endTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&clientVersion=${clientVersion}&isValid=${isValid}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/users/searchLog?page=1&uid=${uid}&source=${source}&startTime=${startTime}&endTime=${endTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&clientVersion=${clientVersion}&isValid=${isValid}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/users/searchLog?page=2&uid=${uid}&source=${source}&startTime=${startTime}&endTime=${endTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&clientVersion=${clientVersion}&isValid=${isValid}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/users/searchLog?page=3&uid=${uid}&source=${source}&startTime=${startTime}&endTime=${endTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&clientVersion=${clientVersion}&isValid=${isValid}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/users/searchLog?page=${page + 1}&uid=${uid}&source=${source}&startTime=${startTime}&endTime=${endTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&clientVersion=${clientVersion}&isValid=${isValid}">&gt;&gt;</a></li>
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
$("#menu_stat").addClass('active open');
$("#submenu_search_log").addClass('active');

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