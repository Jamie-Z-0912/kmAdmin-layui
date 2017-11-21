<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp"/>
<jsp:include page="../sidebar.jsp"/>
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>金币活动管理</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="#" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <input id="activity_id" type="hidden" value="${activity.id}"/>

                    <div class="control-group">
                        <label class="control-label">活动状态</label>

                        <div class="controls">
                            <select id="act_status" name="status" style="width: 120px;">
                                <option value="on" <c:if test='${activity.status == "on"}'>selected</c:if>>开启
                                </option>
                                <option value="off" <c:if test='${activity.status == "off"}'>selected</c:if>>关闭
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br/>
                        </label>

                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge"/>
                            <input type="hidden" name="startTime" id="start_time_hidden" value="${beginTime}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br/>
                        </label>

                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge"/>
                            <input type="hidden" name="endTime" id="end_time_hidden" value="${endTime}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">活动文案</label>

                        <div class="controls">
                            <input type="text" id="rewardDesc" name="rewardDesc" data-oval=""
                                   value="${activity.rewardDesc}" class="start_time input-xlarge"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="button" onclick="changeActivity();">
                            <i class="icon-ok"></i> 保存
                        </button>
                        <button class="btn btn-info" type="button" onclick="addTr();">
                            <i class="icon-ok"></i> 新增规则
                        </button>
                        <button class="btn btn-info" type="button" onclick="delTr();">
                            <i class="icon-ok"></i> 删除规则
                        </button>
                    </div>
                </form>

                <div class="page-header position-relative">
                    <h1 style="color: #2679b5;font-size: 24px;font-weight: 300;">奖励规则</h1>
                </div>
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th>排名</th>
                        <th>奖励金币数量</th>
                        <th>奖励金额</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${rules}" var="rule">
                        <tr class="valid" data-id="${rule.id}" data-rank="${rule.rank}">
                            <td>${rule.rank}</td>
                            <td class="reward"><input value="${rule.reward}"></td>
                            <td class="rewardPrice"><input value="${rule.rewardPrice}"></td>
                            <td>
                                <span class="set_top update" data-id="${rule.id}" data-rank="${rule.rank}"
                                      onclick="changeCoin(this)"
                                      style="color: #4f99c6; text-decoration: none;cursor: pointer">
                                       修改
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp"/>
</body>
<script type="text/javascript">
$("#menu_coin").addClass('active open');//左侧导航栏选中状态
$("#submenu_activity_mag").addClass('active');//左侧导航栏选中状态

    function changeActivity() {
        var id = $("#activity_id").val();
        var status = $("#act_status").val();
        var beginTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var rewardDesc = $("#rewardDesc").val();
        $.ajax({
                    type: "POST",
                    data: {"id": id, "status": status, "beginTime": beginTime, "endTime": endTime, "rewardDesc": rewardDesc},
                    url: "${pageContext.request.contextPath}/admin/activity/updateActivity",
                    dataType: "json",
                    success: function (data) {
                        if (data.result) {
                            alert("success!");
                        } else {
                            alert("error!");
                        }
                    }
                }
        );
    }

    function changeCoin(node) {
        var id = $(node).data("id");
        var rank = $(node).data("rank");
        var rewardNode = $(node).parent("td").siblings(".reward").find("input");
        var rewardPriceNode = $(node).parent("td").siblings(".rewardPrice").find("input");
        var reward = parseInt(rewardNode.val());
        if (isNaN(reward) || reward <= 0) {
            alert("请输入正确金币数！");
            return;
        }

        var rewardPrice = parseInt(rewardPriceNode.val());
        if (isNaN(rewardPrice) || rewardPrice <= 0) {
            alert("请输入正确金额数！");
            return;
        }

        $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/admin/activity/updateRule?id=" + id + "&rank=" + rank + "&reward=" + reward + "&reward_price=" + rewardPrice,
                    dataType: "json",
                    success: function (data) {
                        if (data.result) {
                            rewardNode.val(reward);
                            rewardPriceNode.val(rewardPrice);
                            alert("success!");
                        } else {
                            alert("error!");
                        }
                    }
                }
        );
    }

    function addTr() {
        var lastValidTr = $(".table").find("tr.valid:last");
        var rank = lastValidTr.find("td:first").text();
        var newRank = parseInt(rank) + 1;
        var tmp = $('<tr class="valid"><td>' + newRank + '</td><td class="reward"><input value=""></td><td class="rewardPrice"><input value=""></td><td><span class="set_top update" data-rank="' + newRank + '" onclick="addRule(this);" style="color: #4f99c6; text-decoration: none;cursor:pointer;">添加</span></td></tr>');
        tmp.appendTo(lastValidTr.parent("tbody"));
    }

    function delTr() {
        var trs = $("tr.valid");
        if (trs.size() == 1) {
            alert("至少保留一个！");
            return;
        }
        var node = $("tr.valid:last");
        var id = node.data("id");
        var rank = node.data("rank");
        $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/admin/activity/delRule?id=" + id + "&rank=" + rank,
                    dataType: "json",
                    success: function (data) {
                        if (data.result) {
                            node.remove();
                        } else {
                            alert("error!");
                        }
                    }
                }
        );
    }

    function addRule(node) {
        var id = $("#activity_id").val();
        var rank = $(node).data("rank");
        var reward = parseInt($(node).parent("td").siblings(".reward").find("input").val());
        if (isNaN(reward) || reward <= 0) {
            alert("请输入正确金币数！");
            return;
        }
        var rewardPrice = parseInt($(node).parent("td").siblings(".rewardPrice").find("input").val());
        if (isNaN(rewardPrice) || rewardPrice <= 0) {
            alert("请输入正确金额数！");
            return;
        }
        $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/admin/activity/addRule?activity_id=" + id + "&rank=" + rank + "&reward=" + reward + "&reward_price=" + rewardPrice,
                    dataType: "json",
                    success: function (data) {
                        if (data.result) {
                            window.location.href = "admin/activity/show";
                        } else {
                            alert("error!");
                        }
                    }
                }
        );
    }

    if ($("#startTime").length > 0) {
        $("#startTime").val(new Date(${beginTime}).format("yyyy-MM-dd hh:mm:ss"));
        $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
        gx();
        $("#startTime").slTime({
            callback: function () {
                gx();
            }
        });
        $("#endTime").slTime({
            callback: function () {
                gx();
            }
        });
    }
    function gx() {
        var start = new Date($("#startTime").val().replace(/-/g, "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g, "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }
</script>
</html>