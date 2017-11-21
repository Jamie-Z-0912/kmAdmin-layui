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
            <h1>新增列表页</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/aggregation/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">关联活动Id<br /></label>
                        <div class="controls">
                            <input type="text" id="act_id" name="act_id" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">列表名称(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放日期(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input  type="hidden" name="start_time" id="start_time_hidden" />
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
                        <label class="control-label">列表描述</label>
                        <div class="controls">
                            <textarea id="description" name="description" class="input-xlarge" style="height: 100px;"></textarea>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">内容类型(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="content_type" id="content_type" style="width: 180px;">
                                <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                    <option value="${cType.type}">${cType.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">内容来源(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="text" id="origin" name="origin" class="input-xlarge" value="" placeholder="资讯/值得看"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">内容Id,以英文逗号拼接<br /></label>
                        <div class="controls">
                            <textarea id="ids" name="ids" class="input-xlarge" style="height: 100px;"></textarea>
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
        $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd"));
        gx();
        $("#startTime").slTime({
            callback:function(){
                gx();
            }
        });
    }

    function gx(){
        var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
        $("#start_time_hidden").val(start);
    }
</script>
</html>