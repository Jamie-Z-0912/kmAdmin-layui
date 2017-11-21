<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/km_task/v2/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/km_task/v2/css/main.css" />
</head>
<body>
<!-- 页面 -->
<div class="admin-main">
    <form class="layui-form" id="queryForm" action="">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input class="layui-input" name="startTime" id="q_startTime" placeholder="开始时间"/>
            </div>
            <div class="layui-input-inline t-c">—</div>
            <div class="layui-input-inline">
                <input class="layui-input" name="endTime" id="q_endTime" placeholder="结束时间"/>
            </div>
        </div>
        <button class="layui-btn" lay-submit lay-filter="check"><i class="layui-icon">&#xe615;</i> 查询</button>
        <a class="layui-btn js-operation" data-type="derived"><i class="layui-icon">&#xe601;</i> 导出</a>
    </form>
    <table class="layui-table" lay-even="" lay-skin="row">
        <colgroup>
            <col width="72">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="6.9%">
            <col width="">
        </colgroup>
        <thead>
            <tr>
                <th>日期</th>
                <th>总收入</th>
                <th>广点通</th>
                <th>推啊</th>
                <th>变现猫</th>
                <th>搜狗</th>
                <th>联想</th>
                <th>欧朋</th>
                <th>360</th>
                <th>小说</th>
                <th>H5广告</th>
                <th>麦田广告</th>
                <th>系统内部收入</th>
                <th>其他</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${statsIncomes}" var="tj" varStatus="st">
                <tr>
                    <td>${tj.date}</td>
                    <td>${tj.totalIncome}</td>
                    <td>${tj.gdtIncome}</td>
                    <td>${tj.tuiAIncome}</td>
                    <td>${tj.bxmIncome}</td>
                    <td>${tj.sogouSearchIncome}</td>
                    <td>${tj.lianxiangSearchIncome}</td>
                    <td>${tj.operaIncome}</td>
                    <td>${tj.qihuSearchIncome}</td>
                    <td>${tj.novelIncome}</td>
                    <td>
                        <fmt:formatNumber value="${tj.baiduAdsIncome + tj.googleAdIncome}" pattern="#0.00" />
                    </td>
                    <td>
                        ${tj.maitianIncome}
                    </td>
                    <td>
                        <fmt:formatNumber value="${tj.clearYueIncome + tj.cardIncome + tj.exchangeResourceIncome}" pattern="#0.00" />
                    </td>
                    <td>
                        <fmt:formatNumber value="${tj.otherIncome + tj.baiduSearchIncome + tj.wbIncome + tj.salesIncome + tj.shenmaSearchIncome}" pattern="#0.00" />
                    </td>
                    <td>
                    <a class="js-operation" data-type="edit" data-id="${tj.date}" href="javascript:;">编辑</a>
                        <c:choose>
                            <c:when test="${tj.remark == null or tj.remark == ''}"> </c:when>
                            <c:otherwise>
                                <a class="show_bak" data-date="${tj.date}" href="javascript:void(0)">备注</a>
                                <div class="hide">${tj.remark}</div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="note">
        Note：
        <ul>
            <li>H5广告 = 百度广告收入 + Google广告收入</li>
            <li>系统内部收入 = 卡券收入 + 资源兑换收入 + 召回清空余额</li>
            <li>其他 = 百度搜索 + 58 + 销售收入 + 神马搜索 + 其他</li>
        </ul>
    </div>
</div>

<!-- 表单 -->
<div id="formPane" style="display: none;padding: 10px;">
    <form id="test" class="layui-form layui-form-pane1">
        <div class="layui-form-item">
            <label class="layui-form-label w40">日期</label>
            <div class="layui-input-block">
                <input type="text" name="date" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">广点通</label>
            <div class="layui-input-block">
                <input type="text" name="gdtIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">百度广告</label>
            <div class="layui-input-block">
                <input type="text" name="baiduAdsIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">欧朋</label>
            <div class="layui-input-block">
                <input type="text" name="operaIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">推啊</label>
            <div class="layui-input-block">
                <input type="text" name="tuiAIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">搜狗搜索</label>
            <div class="layui-input-block">
                <input type="text" name="sogouSearchIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">360搜索</label>
            <div class="layui-input-block">
                <input type="text" name="qihuSearchIncome"class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">神马搜索</label>
            <div class="layui-input-block">
                <input type="text" name="shenmaSearchIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">百度搜索</label>
            <div class="layui-input-block">
                <input type="text" name="baiduSearchIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">联想搜索</label>
            <div class="layui-input-block">
                <input type="text" name="lianxiangSearchIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">变现猫</label>
            <div class="layui-input-block">
                <input type="text" name="bxmIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">小说</label>
            <div class="layui-input-block">
                <input type="text" name="novelIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">销售</label>
            <div class="layui-input-block">
                <input type="text" name="salesIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">58</label>
            <div class="layui-input-block">
                <input type="text" name="wbIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">Google广告</label>
            <div class="layui-input-block">
                <input type="text" name="googleAdIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">卡券</label>
            <div class="layui-input-block">
                <input type="text" name="cardIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">兑换资源</label>
            <div class="layui-input-block">
                <input type="text" name="exchangeResourceIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">召回失败,清空余额</label>
            <div class="layui-input-block">
                <input type="text" name="clearYueIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">麦田广告</label>
            <div class="layui-input-block">
                <input type="text" name="maitianIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">其他</label>
            <div class="layui-input-block">
                <input type="text" name="otherIncome" class="layui-input" value="0.0">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label w40">备注</label>
            <div class="layui-input-block">
                <textarea name="remark" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item t-r" id="updateBtn">
            <div class="layui-btn" lay-submit lay-filter="update">修改</div>
        </div>
        <button type="reset" id="reset" class="layui-hide">重置</button>
    </form>
</div>
<div id="bakView" style="display: none;padding: 10px;"></div>

<script src="/km_task/v2/plugins/layui/layui.min.js"></script>
<script>
    layui.config({
        base: '/km_task/v2/js/page/',
        version: new Date().getTime(),
        debug: false 
    })
    .extend({'global': 'public/global'})
    .use('daIncome');
</script>

</body>
<script>
// $("#menu_home").addClass('active open');
// $("#menu_statsIncome").addClass('active');

// if($("#startTime").length > 0){
//     $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd hh:mm:ss"));
//     $("#endTime").val(new Date(${end_time}).format("yyyy-MM-dd hh:mm:ss"));
//     gx();
//     $("#startTime").slTime({
//         callback:function(){
//             gx();
//         }
//     });
//     $("#endTime").slTime({
//         callback:function(){
//             gx();
//         }
//     });
// }

// function gx(){
//     var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
//     var end = new Date($("#endTime").val().replace(/-/g,   "/")).getTime();
//     $("#start_time_hidden").val(start);
//     $("#end_time_hidden").val(end);
// }

// function query(){
//     var starttime = $("#start_time_hidden").val();
//     var endtime = $("#end_time_hidden").val();
//     window.location.href = "admin/dashboard/income?start_time=" + starttime + "&end_time=" + endtime;
// }

// function expt(){
//     var starttime = $("#start_time_hidden").val();
//     var endtime = $("#end_time_hidden").val();
//     window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
// }

// $('.show_bak').on('click', function(){
//     var _self = $(this), date = _self.data('date');
//     var txt = _self.next().text();
//     $('#bakView').text(txt);
//     layer.open({
//         title:date+' 备注信息',
//         type: 1,
//         skin: 'layui-layer-rim',
//         content: $('#bakView'),
//         cancel: function(){
//             $('#bakView').empty();
//         }
//     });
// })
</script>
</html>