<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String logIned = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
            for (Cookie c : cookies) {  
                if (c.getName().equals("logIned")) {
                    logIned = (String) c.getValue();
                    break;
                }
            }
        } 
    if(logIned!=null && logIned.equals("true")){
        response.sendRedirect(request.getContextPath()+"HomePage.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<script src="https://unpkg.com/@tailwindcss/browser@4"></script>-->
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
            }

            input[type="checkbox"] {
                appearance: none;
                -webkit-appearance: none;
                width: 14px;
                height: 14px;
                background-color: #4a4a4a;
                border: 1px solid #666;
                border-radius: 3px;
                cursor: pointer;
                position: relative;
            }

            input[type="checkbox"]:checked {
                background-color: #155DFC;
                border-color: #155DFC;
            }

            input[type="checkbox"]:checked::after {
                content: "✓";
                color: white;
                font-size: 10px;
                font-weight: 700;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body class="bg-[#191A1F] flex items-center justify-center min-h-screen">
        <div class="bg-[#141519] p-12 rounded-md shadow-lg w-full max-w-md text-center border-1 border-[#303135] flex flex-col gap-6">
            <h2 class="text-white font-bold text-4xl">Sign in</h2>
            <p class="text-gray-400 text-base">
                Don't have an account? <a href="SignUpPage.jsp" class="text-blue-500 hover:underline">Click here to sign up</a>
            </p>
            <form action="/TripsExeWeb/signIn" method="POST" class="flex flex-col gap-4">
                <div class="relative">
                    <input name="email" value="${email!=null?email:''}" type="email" placeholder="user@demo.com" class="w-full bg-[#191A1F] text-white rounded-md focus:outline-none border-1 border-[#303135] px-5 py-2 focus:border-blue-500 text-lg placeholder:text-[#ccc]" required>
                    <c:if test="${error1!=null}">
                        <p class="text-red-600 text-left">${error1}</p>
                    </c:if>
                </div>
                <div class="relative">
                    <input name="password" type="password" placeholder="••••" class="w-full bg-[#191A1F] text-white rounded-md focus:outline-none border-1 border-[#303135] px-5 py-2 focus:border-blue-500 text-lg placeholder:text-[#ccc]" required>
                    <c:if test="${error2!=null}">
                        <p class="text-red-600 text-left">${error2}</p>
                    </c:if>               
                </div>
                <div class="flex justify-between items-center text-gray-400 text-xs">
                    <label class="flex items-center text-base">
                        <input type="checkbox" name="remember" class="mr-2">
                        Remember me?
                    </label>
                    <a href="#" class="text-blue-500 text-base hover:underline">Forgot password?</a>
                </div>
                <button type="submit" class="w-full text-white p-2 rounded-md bg-blue-500">Login</button>
            </form>
            <p class="text-[#ccc] text-base">© 2025 All rights reserved</p>
        </div>
    </body>
</html>
