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
            <h1>文章生成金币任务</h1>
        </diajaxfileupload.jsv>
        <div class="row-fluid">
            <form action="admin/browserTask/add" method="post" id="basic_validate" name="basic_validate"
                  class="form-horizontal" novalidate="novalidate">
                  <input type="hidden" name="type" value="${type}" />
                <div class="control-group">
                    <label class="control-label">任务名称</label>
                    <div class="controls">
                        <input type="text" id="name" name="name"  value="${article.title}" onblur="fillShareDesc();" class="input-xxlarge"/>
                    </div>
                </div>
                <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                    <label class="control-label">图片</label>
                    <div class="controls zlappend">
                        <div class='table-pic' id="cover_table" style="float: left;">
                            <div class="table-picboxW">
                                <div class='table-picbox'>
									<span><img src="${article.imagesList[0]}"
                                               id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                        href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                    <input type="file" name="file" id="file" value="点击上传" />
                                    <input type="hidden" name="image" id="topic_image" value="${article.imagesList[0]}" />
                                </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">广告主投放阅读数</label>
                    <div class="controls">
                        <input type="text" id="total_count" name="total_count"  value="" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">单次阅读奖励金币数</label>
                    <div class="controls">
                        <input type="text" id="price" name="price" class="input-large" value="${coinNum}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">结算方式</label>
                    <div class="controls">
                        <select name="pay_method" id="pay_method" style="width: 120px;">
                            <c:forEach items="${payMethods}" var="pm" varStatus="st">
                                <option value="${pm.method}">${pm.desc}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">分享内容原始链接</label>
                    <div class="controls">
                        <input type="text"  id="origin_url" name="origin_url" class="input-xxlarge" value="${article.url}"/>
                    </div>
                </div>

                <div class="control-group">
                  <label class="control-label">投放平台</label>
                  <div class="controls">
                      <select name="platform" id="platform" style="width: 120px;">
                          <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                          <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                          <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                      </select>
                  </div>
               </div>

                <div class="control-group">
                    <label class="control-label">有效区域</label>
                    <div class="controls">
                        <input type="radio" name="area" value="${task.area}" class="input-xlarge" />
                        <span class="lbl">全国</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">分享描述</label>
                    <div class="controls">
                       <input type="text" id="share_description" name="share_description" class="input-xxlarge" maxlength="100" value="${article.title}"/>
                    </div>
                </div>

                <div class="control-group">
                  <label class="control-label">内容来源类型(*影响分享方式)</label>
                  <div class="controls">
                      <select name="contentSource" id="contentSource" style="width: 120px;">
                          <option value="article" selected>文章</option>
                          <option value="ad">广告</option>
                      </select>
                  </div>
               </div>

                <div class="control-group">
                    <label class="control-label">开始时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                        <input  type="hidden" name="start_time" id="start_time_hidden" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">结束时间<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="endTime" data-oval="" class="start_time input-large" />
                        <input  type="hidden" name="end_time" id="end_time_hidden" value=""/>
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
<jsp:include page="../foot.jsp" />
    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>

</body>
<script>
    $("#menu_task").addClass('active open');
    $("#browser_task").addClass('active');
    function cancel() {
        location.reload();
    }

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

    function fillShareDesc() {
        var shareDescription =  $("#name").val();
        $("#share_description").val(shareDescription);
    }
</script>
</html>