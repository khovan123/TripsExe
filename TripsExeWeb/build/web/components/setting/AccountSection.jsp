<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Account Settings</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-900">
        <c:if test="${empty user}">
            <c:redirect url="signInPage.jsp" />
        </c:if>

        <form method="POST" action="">
            <section id="account-settings" class="p-6">
                <h1 class="text-xl text-white mb-2 font-bold">Account settings</h1>
                <p class="text-gray-400 mb-6">He moonlights difficult engrossed it, sportsmen. Interested has all Devonshire difficulty gay assistance joy.
                    <br/>
                    Unaffected at ye of compliment alteration to.
                </p>
                <c:if test="${not empty error}">
                    <p class="text-red-500 mb-4">${errorMsg}</p>
                </c:if>
                <c:if test="${not empty success}">
                    <p class="text-green-500 mb-4">${successMsg}</p>
                </c:if>
                <div class="grid grid-cols-3 gap-4 mb-4">
                    <div>
                        <label class="block text-gray-400 mb-1">Fullname</label>
                        <input type="text" value="${user.fullName}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="fullName">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-400 mb-1">Additional name</label>
                        <input type="text" value="${user.additionalName}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="additionalName">
                    </div>
                    <div class="mb-4">               
                        <label class="block text-gray-400 mb-1">Gender</label>
                        <div class="h-full">
                            <div class="flex items-center gap-6 h-2/3">
                                <div class="flex items-center gap-2">
                                    <input 
                                        ${user.gender?"checked":""}
                                        type="radio" 
                                        name="gender" 
                                        value="male" 
                                        class="appearance-none w-5 h-5 bg-[#191A1F] border-2 border-[#303135] rounded-full checked:border-[#0F6FEC] checked:bg-[#0F6FEC] checked:bg-opacity-20 focus:outline-none cursor-pointer transition-all duration-200 relative checked:after:content-[''] checked:after:absolute checked:after:w-2.5 checked:after:h-2.5 checked:after:bg-[#0F6FEC] checked:after:rounded-full checked:after:top-1/2 checked:after:left-1/2 checked:after:-translate-x-1/2 checked:after:-translate-y-1/2 hover:border-[#0F6FEC]"
                                        >
                                    <span class="text-gray-400 text-sm">Male</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <input
                                        ${user.gender?"":"checked"}
                                        type="radio" 
                                        name="gender" 
                                        value="female" 
                                        class="appearance-none w-5 h-5 bg-[#191A1F] border-2 border-[#303135] rounded-full checked:border-[#0F6FEC] checked:bg-[#0F6FEC] checked:bg-opacity-20 focus:outline-none cursor-pointer transition-all duration-200 relative checked:after:content-[''] checked:after:absolute checked:after:w-2.5 checked:after:h-2.5 checked:after:bg-[#0F6FEC] checked:after:rounded-full checked:after:top-1/2 checked:after:left-1/2 checked:after:-translate-x-1/2 checked:after:-translate-y-1/2 hover:border-[#0F6FEC]"
                                        >
                                    <span class="text-gray-400 text-sm">Female</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                    <div>
                        <label class="block text-gray-400 mb-1">User name</label>
                        <input type="text" value="${user.username}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="username">
                    </div>
                    <div>
                        <label class="block text-gray-400 mb-1">Birthday</label>
                        <input type="date" value="${user.dob}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="dob">
                    </div>
                </div>

                <div class="mb-4 flex items-center custom-checkbox">
                    <input type="checkbox" name="allowTeam" value="true" <c:if test="${true}">checked</c:if> class="mr-2">
                        <label class="text-gray-400 text-sm">Allow anyone to add you to their team</label>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                        <div>
                            <label class="block text-gray-400 mb-1">Phone number</label>
                            <input type="text" value="${user.phoneNumber}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="phoneNumber">
                    </div>
                    <div>
                        <label class="block text-gray-400 mb-1">Email</label>
                        <input type="email" value="${user.email}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="email">
                    </div>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-400 mb-1">Overview</label>
                    <textarea class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" rows="4" name="overview">${user.overview}</textarea>
                    <p class="text-gray-500 text-xs mt-1">Character limit: 300</p>
                </div>

                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Save changes</button>
            </section>
        </form>
    </body>
</html>