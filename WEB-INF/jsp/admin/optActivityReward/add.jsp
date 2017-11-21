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
            <h1>新增活动奖励</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/optActivity/addReward" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">活动名称(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <input type="hidden" id="activityId" name="activityId" class="input-xlarge" value="${activity.id}"/>
                            <input type="text" id="activityName" name="activityName" class="input-xlarge" value="${activity.name}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励类型(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="rewardType" id="rewardType" style="width: 180px;">
                                <option value="1">阅读加速卡</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">关联奖励</label>
                        <div class="controls">
                            <select name="realRewardId" id="realRewardId" style="width: 180px;">
                                <c:forEach items="${cards}" var="card" varStatus="st">
                                    <option value="${card.id}">${card.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励名称</label>
                        <div class="controls">
                            <input type="text" id="rewardName" name="rewardName" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">奖励图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="assets/img/avatar.jpg!w160.jpg"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="rewardImage" id="topic_image" value="" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励领取条件(行为:数量)</label>
                        <div class="controls">
                            <input type="text" id="rewardCondition" name="rewardCondition" class="input-xlarge" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励个数</label>
                        <div class="controls">
                            <input type="text" id="rewardNum" name="rewardNum" class="input-xlarge" value="1"/>
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
    $("#submenu_activityRewardLog").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>