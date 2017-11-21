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
            <h1>新增召回计划</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/recallPlan/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">召回条件(<font color="red">必填</font>)</label>
                    </div>
                    <div class="control-group">
                        <label class="control-label">注册时间早于:</label>
                        <div class="controls">
                            <input type="text" id="small_register_time" data-oval=""/>
                                   <input type="hidden" name="smallRegisterTime" id="small_register_time_hidden"/>
                            晚于:<input type="text" id="big_register_time" data-oval=""  />
                                   <input type="hidden" name="bigRegisterTime" id="big_register_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">距召回开始至少?天无收益</label>
                        <div class="controls">
                            <input type="text" id="noIncomeDayToToday" name="noIncomeDayToToday"  value="60"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">账户余额大于等于:</label>
                        <div class="controls">
                            <input type="text" id="smallYue" name="smallYue" value="0" placeholder=""/>
                            小于等于:<input type="text" id="bigYue" name="bigYue" placeholder="5" value="5"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">排除黑名单用户:</label>
                        <div class="controls">
                            <div class="radio">
                                <label>
                                    <input name="excludeBlackUser" type="radio" class="ace" value="1" checked="checked"/>
                                    <span class="lbl"> 是</span>
                                </label>
                            </div>
                            <!--
                            <div class="radio">
                                <label>
                                    <input name="excludeBlackUser" type="radio" class="ace" value = "0"/>
                                    <span class="lbl"> 否</span>
                                </label>
                            </div>
                            -->
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">召回日期(<font color="red">必填</font>),从:</label>
                        <div class="controls">
                            <input type="text" id="recall_start_time" data-oval="" />
                                   <input type="hidden" name="beginTime" id="recall_start_time_hidden" />
                            到:<input type="text" id="recall_end_time" data-oval=""  />
                                   <input type="hidden" name="endTime" id="recall_end_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">召回时间点(<font color="red">必填</font>),上午:</label>
                        <div class="controls">
                            <input type="text" name="recallRate" class="input-large" value="10"/>点,
                            下午:<input type="text" name="recallRate" class="input-large" value="19"/>点
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">召回方式(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select class="form-control" id="form-field-select-2" multiple="multiple" name="recallMethod">
                                <c:forEach items="${recallMethods}" var="recallMethod" varStatus="st">
                                    <option value="${recallMethod}" selected>${recallMethod.method}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">奖励方式:(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="rewardMethod" id="rewardMethod">
                                    <option value="card:3">3天加速卡</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">召回失败,处罚方式:(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="penalizeMethod" id="penalizeMethod">
                                <c:forEach items="${penalizeMethods}" var="penalizeMethod" varStatus="st">
                                    <option value="${penalizeMethod}">${penalizeMethod.desc}</option>
                                </c:forEach>
                            </select>
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
    $("#menu_recall").addClass('active');

    if($("#small_register_time").length > 0){
        $("#small_register_time").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
        $("#big_register_time").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
        gx();
        $("#small_register_time").slTime({
            callback:function(){
                gx();
            }
        });
        $("#big_register_time").slTime({
            callback:function(){
                gx();
            }
        });
    }

    if($("#recall_start_time").length > 0){
        $("#recall_start_time").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
        $("#recall_end_time").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
        gx2();
        $("#recall_start_time").slTime({
            callback:function(){
                gx2();
            }
        });
        $("#recall_end_time").slTime({
            callback:function(){
                gx2();
            }
        });
    }

    function gx(){
        var start = new Date($("#small_register_time").val().replace(/-/g,   "/")).getTime();
        var end = new Date($("#big_register_time").val().replace(/-/g,   "/")).getTime();

        $("#small_register_time_hidden").val(start);
        $("#big_register_time_hidden").val(end);
    }

    function gx2(){
        var start = new Date($("#recall_start_time").val().replace(/-/g,   "/")).getTime();
        var end = new Date($("#recall_end_time").val().replace(/-/g,   "/")).getTime();
        $("#recall_start_time_hidden").val(start);
        $("#recall_end_time_hidden").val(end);
    }

    function cancel() {
        history.go(-1);
    }
</script>
</html>