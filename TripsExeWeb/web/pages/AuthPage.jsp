<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = -1;
    if(request.getSession(false) != null && request.getSession(false).getAttribute("userId") != null){
        id = (Integer) request.getSession(false).getAttribute("userId");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=id%></h1>
        <a href="AuthPage2.jsp">click me</a>
    </body>
</html>
