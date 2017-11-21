<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1><span>资讯文章抓取</span>
            </h1>
		</div>
		<div class="row-fluid">
            <form action="admin/article/fetch?fetchType=1" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                <label class="control-label">分类</label>
                    <div class="controls">
                        <select name="categoryId" id="categoryId" style="width: 120px;">
                            <c:forEach items="${categories}" var="cat" varStatus="st">
                                <option value="${cat.id}" <c:if test="${cat.id == categoryId}">selected</c:if>>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                 </div>
                 <div class="control-group">
                     <label class="control-label">文章地址</label>
                     <div class="controls">
                         <input type="text" id="originUrl" name="originUrl" class="input-xxlarge"/>
                     </div>
                 </div>
                 <div class="control-group">
                      <label class="control-label">封面图片地址</label>
                      <div class="controls">
                          <input type="text" id="cover" name="cover" class="input-xxlarge"/>
                      </div>
                  </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 抓取单篇文章
                    </button>
                </div>
            </form>
        </div>
		<div class="row-fluid">
		    <form action="admin/article/fetch?fetchType=2" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                        <label class="control-label">省份</label>
                        <label>
                            <span></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <select name="province" id="province" style="width: 120px;" onchange='javascript:selectCity();'>
                                <c:forEach items="${provinces}" var="pro" varStatus="st">
                                    <option value="${pro}">${pro}</option>
                                </c:forEach>
                            </select>
                            <span>城市</span>
                            <select name="city" id="city" style="width: 120px;">
                                <c:forEach items="${xxcities}" var="city" varStatus="st">
                                    <option value="${city}">${city}</option>
                                </c:forEach>
                            </select>
                        </label>
                </div>
                 <div class="control-group">
                     <label class="control-label">公众号文章列表地址</label>
                     <div class="controls">
                         <input type="text" id="originUrl" name="originUrl" class="input-xxlarge"/>
                     </div>
                 </div>
                 <div class="control-group">
                      <label class="control-label">公众号列表页源码</label>
                      <div class="controls">
                            <textarea rows="8" id="content" name="content" class="input-xxlarge"></textarea>
                      </div>
                  </div>
                 <div class="control-group">
                      <label class="control-label">注意</label>
                      <div class="controls">
                        <span>1、选择城市;2、访问: http://weixin.sogou.com/; 3、搜索要抓取的公众号; 4、点击进入公众号详情,从地址栏复制文章列表url,粘贴url; 5、开始抓取</span>
                        <span>url方式无法抓取时,请直接粘贴列表页源码;</span>
                      </div>
                  </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 批量抓取
                    </button>
                </div>
            </form>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_article").addClass('active open');
$("#submenu_fetch").addClass('active');
function selectCity(){
    var province = $('#province option:selected').val();
    var city;
    if (province == '陕西') {
        city = "${xxcities}".replace("[","").replace("]","");
    } else if (province == '广东') {
        city = "${gdcities}".replace("[","").replace("]","");
    } else if (province == '江苏') {
        city = "${jscities}".replace("[","").replace("]","");
    } else {
        city = "${bjcities}".replace("[","").replace("]","");
    }
    city = city.split(",");
    var citySelect = document.getElementById('city');
    citySelect.options.length = 0;
    for (var i = 0; i < city.length; i++) {
        var option = document.createElement('option');
        citySelect.options.add(option);
        option.innerText = city[i];
        option.value = city[i];
    }
}
</script>
</html>