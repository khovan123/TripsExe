<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
            }
        </style>
    </head>
    <body class="bg-[#191a1f]">
        <jsp:include page="/components/NavigationBar.jsp"/>
        <div class="px-[328px] pt-20 text-white min-h-fit flex">
            <div
                id="notification-dialog"
                class="w-full bg-[#141519] border border-[#202227] rounded-md"
                >
                <div
                    class="p-5 flex justify-between items-center border-b border-[#202227] sticky top-0"
                    >
                    <div class="flex items-center">
                        <p class="font-semibold text-white">Notifications</p>
                        <span class="ml-2 bg-[#d6293e1a] text-[#d6293e] text-sm font-medium px-2 py-0.5 rounded-md">2 new</span>
                    </div>
                    <!--<button class="text-[#0f6fec] text-sm hover:underline">Clear all</button>-->
                </div>

                <div class="p-2 space-y-1">
                    <div class="p-4 flex items-start bg-[#202227] rounded-md">
                        <img
                            src='<c:url value="/public/images/avatar.png"/>'
                            alt="Avatar"
                            class="w-10 h-10 rounded-full"
                            />
                        <div class="mx-4">
                            <p class="text-gray-500 text-sm">
                                <span class="font-semibold text-white">Minh Phan</span> sent
                                you a friend request.
                            </p>
                            <div class="mt-2 flex space-x-2 w-fit">
                                <button
                                    class="bg-[#0f6fec] text-white text-sm font-medium px-3 py-1 rounded hover:bg-[#0e5bd1] duration-300"
                                    >
                                    Accept
                                </button>
                                <button
                                    class="bg-[#d6293e1a] text-[#d6293e] text-sm font-medium px-3 py-1 rounded hover:bg-[#d6293e] hover:text-white duration-300"
                                    >
                                    Delete
                                </button>
                            </div>
                        </div>
                        <p class="text-gray-500 font-normal text-sm text-nowrap ml-auto">47 min</p>
                    </div>
                    <div class="p-4 flex items-start bg-[#202227] rounded-md">
                        <img
                            src='<c:url value="/public/images/avatar.png"/>'
                            alt="Avatar"
                            class="w-10 h-10 rounded-full"
                            />
                        <div class="mx-4">
                            <p class="text-gray-500 text-sm">
                                <span class="font-semibold text-white">Huy Quang</span> sent
                                you a friend request.
                            </p>
                            <div class="mt-2 flex space-x-2 w-fit">
                                <button
                                    class="bg-[#0f6fec] text-white text-sm font-medium px-3 py-1 rounded hover:bg-[#0e5bd1] duration-300"
                                    >
                                    Accept
                                </button>
                                <button
                                    class="bg-[#d6293e1a] text-[#d6293e] text-sm font-medium px-3 py-1 rounded hover:bg-[#d6293e] hover:text-white duration-300"
                                    >
                                    Delete
                                </button>
                            </div>
                        </div>
                        <p class="text-gray-500 font-normal text-sm text-nowrap ml-auto">47 min</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
