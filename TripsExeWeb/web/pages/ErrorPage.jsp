<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>404 - Page Not Found</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body{
                background-image: url('https://cdn-front.freepik.com/common/error-bg.png?w=2776&h=2776');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                min-height: 100vh;
                margin: 0;
                padding: 0;
            }
        </style>
    </head>
    <body class="bg-gray-900 min-h-screen flex items-center justify-center text-white">
        <div class="text-center">
            <h1 class="text-8xl font-bold mb-4">404</h1>
            <h2 class="text-3xl font-bold mb-4">Page Not Found!</h2>
            <c:if test="${error!=null}">
                <p class="text-gray-400 mb-6 max-w-md mx-auto">${error}</p>
            </c:if>
            <c:if test="${error==null}">
                <p class="text-gray-400 mb-6 max-w-md mx-auto">Either something went wrong or this page doesn't exist anymore.</p>
            </c:if>
            <a href="#" class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-md inline-block">
                Go to home page
            </a>
        </div>
    </body>
</html>
