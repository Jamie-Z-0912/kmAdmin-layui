<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>

<em>
    {
        "layouts":[
            <c:forEach items="${layouts}" var="lay" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"layout":"${lay.layout}","desc":"${lay.desc}"}</c:forEach>
        ],
        "applications":[
            <c:forEach items="${applications}" var="app" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${app}"</c:forEach>
        ],
        "platforms":[
            <c:forEach items="${platforms}" var="pt" varStatus="st"><c:if test="${st.index!=0}">,</c:if>"${pt}"</c:forEach>
        ],
        "adsLocations":[
            <c:forEach items="${adsLocations}" var="loa" varStatus="st"><c:if test="${st.index!=0}">,</c:if>{"location":"${loa.location}","desc":"${loa.desc}"}</c:forEach>
        ]
    }
</em>
<!-- <form action="admin/ads/add" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
    <div class="control-group">
        <label class="control-label">广告标题/热词(<font color="red">必填</font>)
        <div class="controls">
            <textarea id="title" name="title" class="input-xlarge" style="height: 100px;" placeholder="热词可批量添加,以英文逗号分隔,一次最多50个"></textarea>
        </div>
    </div>

    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
        <label class="control-label">图片</label>
        <div class="controls zlappend">
            <div class='table-pic' style="float: left;">
                <div class="table-picboxW">
                    <div class='table-picbox'>
                        <span><img src="assets/img/avatar.jpg!w160.jpg"
                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                            href="javascript:;" class="table-picevent">点击上传
                        <input type="file" name="file" class="js-files" id="file0" value="点击上传" />
                    </a>
                    </div>
                </div>
            </div>
            <div class="table-pic" style="float: left;cursor: pointer; font-size: 80px;text-align: center; line-height: 130px; color: #888;" id="addTuPian">＋</div>
            <input type="hidden" name="images" id="topic_image" value="" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">广告来源</label>
        <div class="controls">
            <input type="text" id="source" name="source" class="input-xlarge" value=""/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">广告布局</label>
        <div class="controls">
            <select name="layout" id="layout" style="width: 180px;">
                <c:forEach items="${layouts}" var="layout" varStatus="st">
                    <option value="${layout.layout}">${layout.desc}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">广告原始链接</label>
        <div class="controls">
            <script>
            function convert(){
                var txt = $('#originUrl').val();
                var url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=https://wap.sogou.com/web/sl?bid=sogou-mobb-b4892f808f9efbd5&keyword=';
                $('#originUrl').val(url+encodeURI(txt));
            }
            </script>
            <input type="text" id="originUrl" name="originUrl" class="input-large" class="input-xxlarge" value=""/> <a id="sogouLink" href="javascript:convert()">转成sogou链接</a>
        </div>
    </div>

    <div class="control-group">
         <label class="control-label">投放应用(<font color="red">必填</font>)</label>
         <div class="controls">
             <select name="application" id="application" style="width: 180px;">
                 <option value="" <c:if test="${'' == application}">selected</c:if>>默认</option>
                 <c:forEach items="${applications}" var="app">
                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app}</option>
                 </c:forEach>
             </select>
         </div>
    </div>

    <div class="control-group">
        <label class="control-label">投放平台(<font color="red">必填</font>)</label>
        <div class="controls">
            <select name="platform" id="platform" style="width: 180px;">
                <c:forEach items="${platforms}" var="pt" varStatus="st">
                    <option value="${pt}" <c:if test="${pt == 'DEFAULT'}">selected</c:if>>${pt}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">广告标识(建议2个字)</label>
        <div class="controls">
            <input type="text" id="tips" name="tips" class="input-xlarge" value="广告"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">投放位置(<font color="red">必填</font>)</label>
        <div class="controls">
            <select name="adsLocation" id="adsLocation" style="width: 180px;">
                <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st">
                    <option value="${adsLocation.location}">${adsLocation.desc}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <script type="text/javascript">
        $('#adsLocation').on('change', function(){
                var v = $(this).val();
                if(v == 'timeline_first'){
                    $('#sogouLink').show();
                }else{
                    $('#sogouLink').hide();
                    var url;
                    var txt = $('#originUrl').val();
                    switch(v){
                        case 'related_recom_first': //相关推荐第一位
                            url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                        case 'checkin_alert': //签到弹窗
                            url = 'http://browser.kuaima.cn/tongji/4qianDao.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                        case 'km_zq_banner': //我的tab 的banner
                            url = 'http://browser.kuaima.cn/tongji/3zhuanQian.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                        case 'announcement': //小喇叭
                            url = 'http://browser.kuaima.cn/tongji/6taskTrumpet1_3_0.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                        case 'km_task_banner': //任务tab的banner
                            url = 'http://browser.kuaima.cn/tongji/5taskBanner1_3_0.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                        case 'task_tab_upper_right_icon': //任务tab的右上角
                            url = 'http://browser.kuaima.cn/tongji/7taskTopRight1_3_0.html?url=';
                            $('#originUrl').val(url+encodeURI(txt));
                            break;
                    }
                }
            })
    </script>

    <div class="control-group">
        <label class="control-label">登陆才能点击(<font color="red">必填</font>)</label>
        <div class="controls">
           <select name="needLogin" id="needLogin" style="width: 180px;">
                   <option value="0" selected>否</option>
                   <option value="1">是</option>
           </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">开始时间(<font color="red">必填</font>)<br />
        </label>
        <div class="controls">
            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
            <input  type="hidden" name="start_time" id="start_time_hidden" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">结束时间(<font color="red">必填</font>)<br />
        </label>
        <div class="controls">
            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
            <input  type="hidden" name="end_time" id="end_time_hidden" />
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
</form> -->
