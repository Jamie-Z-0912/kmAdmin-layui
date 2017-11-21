<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
    <title><%=request.getAttribute("title")%></title>
    <meta content='<%=request.getAttribute("image")%>' itemprop='image' property='og:image' />
    <meta name="description" content='<%=request.getAttribute("desc")%>'/>
    <script src="http://api.kuaima.cn/km_task/js/web/main.min.js"></script>
    <script>
        operation({
            isValid: '<%=request.getAttribute("isValid")%>',
            basePath: '<%=request.getAttribute("baseUrl")%>',
            taskId: '<%=request.getAttribute("taskId")%>',
            originUrl: '<%=(String)request.getAttribute("originUrl")%>'
        });
    </script>
    </head>
    <body>
    </body>
</html>