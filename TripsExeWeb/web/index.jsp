<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.sendRedirect("./pages/HomePage.jsp");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:include page="/components/Button.jsp"/>
    </body>
</html>
