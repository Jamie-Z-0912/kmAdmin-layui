<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<em>
    {
    "ad":{"id":"${ad.id}","title":"${ad.title}","imagesList":[<c:forEach items="${ad.imagesList}" var="img" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${img}"</c:forEach>],"source":"${ad.source}","originUrl":"${ad.originUrl}","tips":"${ad.tips}","needLogin":"${ad.needLogin}","startTime":"${ad.startTime}","endTime":"${ad.endTime}","adsLocation":"${ad.adsLocation}"},
    "applications":[
    <c:forEach items="${applications}" var="app" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${app}"</c:forEach>
    ],
    "application":"${application}",
    "platforms":[<c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"</c:forEach>],
    "adsLocations":[
    <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"location":"${adsLocation.location}","desc":"${adsLocation.desc}"}</c:forEach>
    ],
    "locations":[
    <c:forEach items="${locations}" var="loa" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"location":"${loa.location}","desc":"${loa.desc}"}</c:forEach>
    ],
    "layouts":[
    <c:forEach items="${layouts}" var="lay" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"layout":"${lay.layout}","desc":"${lay.desc}"}</c:forEach>
    ]
    }
</em>
               <!--  <form action="admin/ads/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" class="input-xxlarge" value="${ad.id}"/>
                    <div class="control-group">
                        <label class="control-label">广告标题</label>
                        <div class="controls">
                            <input type="text" id="title" name="title" class="input-xlarge" value="${ad.title}"/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <c:forEach items="${ad.imagesList}" var="img" varStatus="st">
                                <div class='table-pic' style="float: left;">
                                    <a href="javascript:void(0);" class="js-deltu" style="position: absolute;right:0;top:0;z-index:4;">删除</a >
                                    <div class="table-picboxW">
                                        <div class='table-picbox'>
                                            <span>
                                                    <img src="${img}" id="avatar" name="avatar" style="width: 130px;" />
                                            </span>
                                            <a href="javascript:;" class="table-picevent" >点击上传
                                            <input type="file" name="file" class="js-files" id="file${st.index}" value="点击上传" />
                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="table-pic" style="float: left;cursor: pointer; font-size: 80px;text-align: center; line-height: 130px; color: #888;" id="addTuPian">＋</div>
                            <input type="hidden" name="images" id="topic_image" value='${ad.images}' />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告来源</label>
                        <div class="controls">
                            <input type="text" id="source" name="source" class="input-xlarge" value="${ad.source}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告布局</label>
                        <div class="controls">
                            <select name="layout" id="layout" style="width: 180px;">
                                <c:forEach items="${layouts}" var="layout" varStatus="st">
                                    <option value="${layout.layout}" <c:if test="${layout.layout == ad.layout}">selected</c:if>>${layout.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告原始链接</label>
                        <div class="controls">
                            <input type="text" id="originUrl" name="originUrl" class="input-xlarge" value="${ad.originUrl}"/>
                        </div>
                    </div>

                    <div class="control-group">
                         <label class="control-label">投放应用</label>
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
                        <label class="control-label">投放平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == ad.platform}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告标识(建议2个字)</label>
                        <div class="controls">
                            <input type="text" id="tips" name="tips" class="input-xlarge" value="${ad.tips}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放位置</label>
                        <div class="controls">
                            <select name="adsLocation" id="adsLocation" style="width: 180px;">
                                <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st">
                                    <option value="${adsLocation.location}" <c:if test="${ad.adsLocation == adsLocation}">selected</c:if>>${adsLocation.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">是否要登陆(用户点击广告时)</label>
                        <div class="controls">
                           <select name="needLogin" id="needLogin" style="width: 180px;">
                               <option value="0" <c:if test="${!ad.needLogin}">selected</c:if>>否</option>
                               <option value="1" <c:if test="${ad.needLogin}">selected</c:if>>是</option>
                           </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="start_time" id="start_time_hidden" value="${ad.startTime}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="end_time" id="end_time_hidden" value="${ad.endTime}"/>
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
                </form> -->

