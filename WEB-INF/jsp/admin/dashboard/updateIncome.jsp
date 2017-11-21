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
            <h1>编辑收入统计</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/dashboard/updateStatsIncome" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">日期</label>
                        <div class="controls">
                            <input type="text" id="date" name="date" class="input-xlarge" value="${statsIncome.date}" readonly/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">广点通</label>
                        <div class="controls">
                            <input type="text" id="gdtIncome" name="gdtIncome" class="input-xlarge" value="${statsIncome.gdtIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">百度广告</label>
                        <div class="controls">
                            <input type="text" id="baiduAdsIncome" name="baiduAdsIncome" class="input-xlarge" value="${statsIncome.baiduAdsIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">欧朋</label>
                        <div class="controls">
                            <input type="text" id="operaIncome" name="operaIncome" class="input-xlarge" value="${statsIncome.operaIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">推啊</label>
                        <div class="controls">
                            <input type="text" id="tuiAIncome" name="tuiAIncome" class="input-xlarge" value="${statsIncome.tuiAIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">搜狗搜索</label>
                        <div class="controls">
                            <input type="text" id="sogouSearchIncome" name="sogouSearchIncome" class="input-xlarge" value="${statsIncome.sogouSearchIncome}"/>
                        </div>
                    </div>
                     <div class="control-group">
                        <label class="control-label">360搜索</label>
                        <div class="controls">
                            <input type="text" id="qihuSearchIncome" name="qihuSearchIncome" class="input-xlarge" value="${statsIncome.qihuSearchIncome}"/>
                        </div>
                    </div>
                     <div class="control-group">
                        <label class="control-label">神马搜索</label>
                        <div class="controls">
                            <input type="text" id="shenmaSearchIncome" name="shenmaSearchIncome" class="input-xlarge" value="${statsIncome.shenmaSearchIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">百度搜索</label>
                        <div class="controls">
                            <input type="text" id="baiduSearchIncome" name="baiduSearchIncome" class="input-xlarge" value="${statsIncome.baiduSearchIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">联想搜索</label>
                        <div class="controls">
                            <input type="text" id="lianxiangSearchIncome" name="lianxiangSearchIncome" class="input-xlarge" value="${statsIncome.lianxiangSearchIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">变现猫</label>
                        <div class="controls">
                            <input type="text" id="bxmIncome" name="bxmIncome" class="input-xlarge" value="${statsIncome.bxmIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">小说</label>
                        <div class="controls">
                            <input type="text" id="novelIncome" name="novelIncome" class="input-xlarge" value="${statsIncome.novelIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">销售</label>
                        <div class="controls">
                            <input type="text" id="salesIncome" name="salesIncome" class="input-xlarge" value="${statsIncome.salesIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">58</label>
                        <div class="controls">
                            <input type="text" id="wbIncome" name="wbIncome" class="input-xlarge" value="${statsIncome.wbIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Google广告</label>
                        <div class="controls">
                            <input type="text" id="googleAdIncome" name="googleAdIncome" class="input-xlarge" value="${statsIncome.googleAdIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">卡券</label>
                        <div class="controls">
                            <input type="text" id="cardIncome" name="cardIncome" class="input-xlarge" value="${statsIncome.cardIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">兑换资源</label>
                        <div class="controls">
                            <input type="text" id="exchangeResourceIncome" name="exchangeResourceIncome" class="input-xlarge" value="${statsIncome.exchangeResourceIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">召回失败,清空余额</label>
                        <div class="controls">
                            <input type="text" id="clearYueIncome" name="clearYueIncome" class="input-xlarge" value="${statsIncome.clearYueIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">麦田广告</label>
                        <div class="controls">
                            <input type="text" id="maitianIncome" name="maitianIncome" class="input-xlarge" value="${statsIncome.maitianIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">其他</label>
                        <div class="controls">
                            <input type="text" id="otherIncome" name="otherIncome" class="input-xlarge" value="${statsIncome.otherIncome}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">备注</label>
                        <div class="controls">
                            <textarea id="remark" name="remark" class="input-xlarge" style="height: 100px;" value="${statsIncome.remark}">${statsIncome.remark}</textarea>
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
    $("#menu_home").addClass('active open');
    $("#menu_statsIncome").addClass('active');
    function cancel() {
        location.reload();
    }
</script>
</html>