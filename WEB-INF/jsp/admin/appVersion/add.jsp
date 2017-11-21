<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>

<em>
    {
        "applications":[
            <c:forEach items="${applications}" var="app" varStatus="stat"><c:if test="${stat.index!=0}">,</c:if>"${app}"</c:forEach>
        ],
        "platforms":["ANDROID","IPHONE"]
    }
</em>
<!-- <div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>新增应用版本</h1>
        </div>
         <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/appVersion/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                         <label class="control-label">应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 180px;">
                                <option value="" <c:if test="${'' == application}">selected</c:if>>默认</option>
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                                 </c:forEach>
                             </select>
                         </div>
                     </div>
                    <div class="control-group">
                        <label class="control-label">平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                    <option value="ANDROID" selected>ANDROID</option>
                                    <option value="IPHONE" selected>IPHONE</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">版本(如:110)</label>
                        <div class="controls">
                            <input type="text" id="version" name="version" class="input-large" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">发版时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                            <input  type="hidden" name="added_time" id="start_time_hidden" />
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 保存
                        </button>
                        <button class="btn" type="reset" onclick="cancel();">
                            <i class="icon-undo"></i> 取消
                        </button>
                    </div>
                </form>
            </div>
         </div>
       </div>
    </div>
</div> -->