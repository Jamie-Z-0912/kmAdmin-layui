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
            <h1>编辑卡券</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/cards/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <input type="hidden" id="id" name="id" class="input-xlarge" value="${card.id}"/>
                    <div class="control-group">
                        <label class="control-label">卡券名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" class="input-large" value="${card.name}"/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="${task.image}"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="icon" id="topic_image" value="${card.icon}" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">卡券类型</label>
                        <div class="controls">
                            <select name="type" id="type" style="width: 180px;">
                                <c:forEach items="${cardTypes}" var="cardType" varStatus="st">
                                    <option <c:if test= "${card.type == cardType.type}">selected</c:if> value="${cardType.type}">${cardType.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                          <label class="control-label">卡券有效天数</label>
                          <div class="controls">
                              <input type="number" max="30" min="1" id="effectiveDays" name="effectiveDays" class="input-large" class="input-xxlarge" value="${card.effectiveDays}"/>
                          </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">获取方式</label>
                        <div class="controls">
                            <select name="obtainMethod" id="obtainMethod" style="width: 180px;">
                                <c:forEach items="${obtainMethods}" var="om" varStatus="st">
                                    <option value="${om.method}" <c:if test= "${om.method == card.obtainMethod}">selected</c:if>>${om.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">原始价格(金币)</label>
                        <div class="controls">
                            <input type="text" id="originalPrice" name="originalPrice" class="input-large" class="input-xxlarge" value="${card.originalPrice}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">销售价格(元)</label>
                        <div class="controls">
                            <input type="text" id="sellPrice" name="sellPrice" class="input-large" class="input-xxlarge" value="${card.sellPrice}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">兑吧商品详情URL</label>
                        <div class="controls">
                            <input type="text" id="duibaGoodsUrl" name="duibaGoodsUrl" class="input-large" class="input-xlarge" value="${card.duibaGoodsUrl}"/>
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
    $("#menu_card").addClass('active open');
    $("#submenu_card").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>