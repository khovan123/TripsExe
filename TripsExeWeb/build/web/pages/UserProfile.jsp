<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <script src="https://unpkg.com/@tailwindcss/browser@4.0.0"></script>
        <!--<script src="https://cdn.tailwindcss.com"></script>-->
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/NavigationBar.jsp"/> 
        <h1>User Profile</h1>
    </body>
</html>
