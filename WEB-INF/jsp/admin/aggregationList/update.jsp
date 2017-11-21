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
            <h1>编辑列表页</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/aggregation/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" class="input-xlarge" value="${aggregationList.id}" />
                    <div class="control-group">
                        <label class="control-label">关联活动Id<br /></label>
                        <div class="controls">
                            <input type="text" id="act_id" name="act_id" class="input-xlarge" value="${aggregationList.actId}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">列表名称(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" class="input-xlarge" value="${aggregationList.name}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放日期(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input type="hidden" name="start_time" id="start_time_hidden" value="${date}"/>
                        </div>
                    </div>
                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="${aggregationList.image}" id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="image" id="topic_image" value="${aggregationList.image}" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">列表描述</label>
                        <div class="controls">
                            <textarea id="description" name="description" class="input-xlarge" style="height: 100px;" >${aggregationList.description}</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">内容类型(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="content_type" id="content_type" style="width: 180px;">
                                <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                    <option value="${cType.type}" <c:if test="${aggregationList.contentType == cType.type}"> selected</c:if>>${cType.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">内容来源(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="origin" name="origin" class="input-xlarge" value="${aggregationList.origin}" />
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

    if($("#startTime").length > 0){
            $("#startTime").val(new Date(${date}).format("yyyy-MM-dd"));
            gx();
            $("#startTime").slTime({
                callback:function(){
                    gx();
                }
            });
        }

        function gx(){
            var start = new Date($("#startTime").val().replace(/-/g,"/")).getTime();
            $("#start_time_hidden").val(start);
        }
</script>
</html>