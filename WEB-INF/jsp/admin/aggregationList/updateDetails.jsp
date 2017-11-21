<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>编辑列表页数据</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/aggregation/updateDetails" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" class="input-xlarge" value="${details.id}"/>
                    <div class="control-group">
                        <label class="control-label">内容类型</label>
                        <div class="controls">
                            <select name="content_type" id="content_type" style="width: 180px;">
                                <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                    <c:if test="${cType.type == details.contentType}"><option value="${cType.type}">${cType.desc}</option></c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">标题</label>
                        <div class="controls">
                            <input type="text" id="title" name="title" class="input-xlarge" value="${details.title}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">布局</label>
                        <div class="controls">
                            <select name="layout" id="layout" style="width: 180px;">
                                <c:forEach items="${layouts}" var="layout" varStatus="st">
                                    <option value="${layout.layout}" <c:if test="${layout.layout == details.layout}">selected</c:if>>${layout.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <c:forEach items="${details.imagesList}" var="img" varStatus="st">
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
                            <input type="hidden" name="images" id="topic_image" value='${details.images}' />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">保留字段</label>
                        <div class="controls">
                            <input type="text" id="reservedColumn" name="reservedColumn" class="input-xlarge" value="${details.reservedColumn}"/>
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
<jsp:include page="../foot.jsp" />
    <link rel="stylesheet" href="assets/css/setting.css"/>
        <script type="text/javascript" src="assets/js/setting.js"></script>
        <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
        <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_activity").addClass('active open');
    $("#submenu_aggregation").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>