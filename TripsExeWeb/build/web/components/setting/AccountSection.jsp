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

    <form method="POST" action="${pageContext.request.contextPath}/saveAccountSettings">
        <section id="account-settings" class="p-6">
            <h1 class="text-xl text-white mb-2 font-bold">Account settings</h1>
            <p class="text-gray-400 mb-6">He moonlights difficult engrossed it, sportsmen. Interested has all Devonshire difficulty gay assistance joy.
                <br/>
                Unaffected at ye of compliment alteration to.
            </p>
            <c:if test="${not empty errorMsg}">
                <p class="text-red-500 mb-4">${errorMsg}</p>
            </c:if>
            <c:if test="${not empty successMsg}">
                <p class="text-green-500 mb-4">${successMsg}</p>
            </c:if>
            <div class="grid grid-cols-3 gap-4 mb-4">
                <div>
                    <label class="block text-gray-400 mb-1">First name</label>
                    <input type="text" value="${firstName}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="firstName">
                </div>
                <div>
                    <label class="block text-gray-400 mb-1">Last name</label>
                    <input type="text" value="${lastName}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="lastName">
                </div>
                <div class="mb-4">
                    <label class="block text-gray-400 mb-1">Additional name</label>
                    <input type="text" value="${user.additionalName}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="additionalName">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                    <label class="block text-gray-400 mb-1">User name</label>
                    <input type="text" value="${user.username}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="username">
                </div>
                <div>
                    <label class="block text-gray-400 mb-1">Birthday</label>
                    <input type="text" value="${formattedDob}" placeholder="dd/MM/yyyy" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="dob">
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
                    <a href="#" class="mt-1 rounded text-[#ccc] font-semibold text-sm btn-dashed flex items-center gap-2 w-fit">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-fading-plus">
                                <path d="M12 2a10 10 0 0 1 7.38 16.75"/>
                                <path d="M12 8v8"/>
                                <path d="M16 12H8"/>
                                <path d="M2.5 8.875a10 10 0 0 0-.5 3"/>
                                <path d="M2.83 16a10 10 0 0 0 2.43 3.4"/>
                                <path d="M4.636 5.235a10 10 0 0 1 .891-.857"/>
                                <path d="M8.644 21.42a10 10 0 0 0 7.631-.38"/>
                            </svg>
                        </span>Add new phone number</a>
                </div>
                <div>
                    <label class="block text-gray-400 mb-1">Email</label>
                    <input type="email" value="${user.email}" class="w-full p-2 bg-[#191A1F] text-white rounded-md focus:outline-none border-2 border-[#303135] focus:border-[#0F6FEC]" name="email">
                    <a href="#" class="mt-1 rounded text-[#ccc] font-semibold text-sm btn-dashed flex items-center gap-2 w-fit">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-fading-plus">
                                <path d="M12 2a10 10 0 0 1 7.38 16.75"/>
                                <path d="M12 8v8"/>
                                <path d="M16 12H8"/>
                                <path d="M2.5 8.875a10 10 0 0 0-.5 3"/>
                                <path d="M2.83 16a10 10 0 0 0 2.43 3.4"/>
                                <path d="M4.636 5.235a10 10 0 0 1 .891-.857"/>
                                <path d="M8.644 21.42a10 10 0 0 0 7.631-.38"/>
                            </svg>
                        </span>Add new email address</a>
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