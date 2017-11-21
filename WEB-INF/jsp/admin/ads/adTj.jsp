<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>

<em>
    {
        "ad":{"originUrl":"${ad.originUrl}","title":"${ad.title}"},
        "tjData":[
            <c:forEach items="${tjData}" var="tj" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"date":"${tj.date}","uv":"${tj.uv}","viewNum":"${tj.viewNum}","click":"${tj.click}","clickUser":"${tj.clickUser}"}</c:forEach>
        ]
    }
</em>


    <!-- 
    <form action="admin/ads/tj" method="get" class="form-horizontal" novalidate="novalidate">
        <div class="control-group">
           <label class="control-label">广告id</label>
           <div class="controls">
               <input type="text" id="id" name="id" value="${id}"  />
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
     -->
    <!-- <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
        <thead>
						<tr>
                <th>广告标题</th>
  							<th>日期</th>
  							<th>uv</th>
  							<th>pv</th>
                <th>点击数</th>
                <th>点击用户数</th>
						</tr>
				</thead>
				<tbody>
  					<c:forEach items="${tjData}" var="tj" varStatus="st">
  						<tr>
  						    <td>
                      <a href="${ad.originUrl}">${ad.title}</a>
                  </td>
  								<td>${tj.date}</td>
  								<td>${tj.uv}</td>
  								<td>${tj.viewNum}</td>
  								<td>${tj.click}</td>
  								<td>${tj.clickUser}</td>
  						</tr>
  					</c:forEach>
				</tbody>
		</table> -->
