<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String userId = null;   
    Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {  
                if (c.getName().equals("userId")) {
                    userId = (String) c.getValue();
                    break;
                }
            }
        }            
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=userId%></h1>
    </body>
</html>
