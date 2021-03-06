<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>

<em>
    {
    "popupLocations":[<c:forEach items="${popupLocations}" var="pl" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"location":"${pl.location}","desc":"${pl.desc}"}</c:forEach>
    ],
    "userGroups":[<c:forEach items="${userGroups}" var="userGroup" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"group":"${userGroup.group}","groupName":"${userGroup.groupName}"}</c:forEach>
    ],
    "platforms":[<c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"</c:forEach>]
    }
</em>

               <!--  <form action="admin/popup/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">弹窗标题(可选)</label>
                        <div class="controls">
                            <input type="text" id="title" name="title" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="assets/img/avatar.jpg!w160.jpg"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="image" id="topic_image" value="" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">跳转链接(需以http://开头)</label>
                        <div class="controls">
                            <input type="text" id="url" name="url"  class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == 'DEFAULT'}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放位置</label>
                        <div class="controls">
                            <select name="location" id="location" style="width: 180px;">
                                <c:forEach items="${popupLocations}" var="pl" varStatus="st">
                                    <option value="${pl.location}">${pl.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">用户组</label>
                        <div class="controls">
                            <select class="form-control" id="form-field-select-2" multiple="multiple" name="userGroups">
                                <option value="">所有用户</option>
                                <c:forEach items="${userGroups}" var="userGroup" varStatus="st">
                                    <option value="${userGroup.group}">${userGroup.groupName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">点击跳转是否要登陆</label>
                        <div class="controls">
                           <select name="needLogin" id="needLogin" style="width: 180px;">
                                   <option value="0">否</option>
                                   <option value="1">是</option>
                           </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">弹窗次数(开始-结束时间)</label>
                        <div class="controls">
                            <input type="text" id="num" name="num" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="start_time" id="start_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="end_time" id="end_time_hidden" />
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