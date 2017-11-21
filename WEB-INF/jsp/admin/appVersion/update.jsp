<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<em>
    {
        "application":"${application}",
        "applications":[
            <c:forEach items="${applications}" var="app" varStatus="stat"><c:if test="${stat.index!=0}">,</c:if>"${app}"</c:forEach>
        ],
        "platform":"${appVersion.platform}",
        "version":"${appVersion.version}",
        "addedTime":"${appVersion.addedTime}",
        "id":"${appVersion.id}",
        "platforms":[
            <c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"</c:forEach>
        ]
    }
</em>
<!-- 
    <div class="popups_size">
        <form id="update_appVersion" class="layui-form layui-form-pane" >
            <div class="layui-form-item">
                <label class="layui-form-label">应用</label>
                <div class="layui-input-block">
                    <select name="application">
                         <option value="" <c:if test="${'' == application}">selected</c:if>>默认</option>
                         <c:forEach items="${applications}" var="app">
                             <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                         </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">平台</label>
                <div class="layui-input-block">
                    <select name="platform">
                        <c:forEach items="${platforms}" var="pt" varStatus="st">
                            <option value="${pt}" <c:if test="${pt == appVersion.platform}">selected</c:if>>${pt}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">版本</label>
                <div class="layui-input-block">
                    <input type="text" name="version" placeholder="如：110" class="layui-input" value="${appVersion.version}"/>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                     <input class="layui-input" data-value="${appVersion.addedTime}" id="updateAddTime">
                     <input type="hidden" name="added_time">
                </div>
            </div>
            <input type="hidden" name="id" class="layui-input" value="${appVersion.id}"/>
            <div class="layui-form-item" id="updateBtn">
                <div class="layui-btn" lay-submit lay-filter="update">修改</div>
            </div>
        </form>
    </div> -->