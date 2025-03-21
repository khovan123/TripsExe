<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <script src="https://unpkg.com/@tailwindcss/browser@4.0.0"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
            }

            .dialog-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }
            .dialog {
                background: #2A2C31;
                border-radius: 8px;
                width: 500px;
                max-width: 90%;
                padding: 16px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
                color: #D1D2D3;
                font-family: Arial, sans-serif;
            }

            .dialog-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 16px;
            }
            .dialog-header h2 {
                font-size: 18px;
                font-weight: 600;
                margin: 0;
            }
            .dialog-header button {
                background: none;
                border: none;
                color: #D1D2D3;
                font-size: 20px;
                cursor: pointer;
            }

            .user-info {
                display: flex;
                align-items: center;
                margin-bottom: 12px;
            }
            .user-info img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 12px;
            }
            .user-info div {
                flex: 1;
            }
            .user-info div p {
                margin: 0;
                font-size: 14px;
                font-weight: 600;
            }
            .user-info select {
                background: #191A1F;
                color: #D1D2D3;
                border: 1px solid #202227;
                border-radius: 4px;
                padding: 4px 8px;
                font-size: 12px;
                cursor: pointer;
            }

            .dialog textarea {
                width: 100%;
                min-height: 60px;
                background: #191A1F;
                color: #D1D2D3;
                padding: 12px;
                border-radius: 6px;
                border: 1px solid #202227;
                outline: none;
                resize: none;
                font-size: 16px;
                font-family: Arial, sans-serif;
            }
            .dialog textarea:focus {
                border-color: #3B82F6;
            }
            .dialog textarea::placeholder {
                color: #A0A0A0;
            }

            .dialog-footer {
                margin-top: 16px;
            }
            .dialog-footer .add-to-post {
                background: #191A1F;
                border: 1px solid #202227;
                border-radius: 6px;
                padding: 8px 12px;
                margin-bottom: 12px;
            }
            .dialog-footer .add-to-post span {
                font-size: 14px;
                color: #D1D2D3;
            }
            .dialog-footer .add-to-post .icons {
                display: flex;
                gap: 12px;
                justify-content: space-between;
            }
            .dialog-footer .add-to-post .icons button {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 20px;
            }
            .dialog-footer .post-button {
                width: 100%;
                background: #4A4E54;
                color: #D1D2D3;
                border: none;
                border-radius: 6px;
                padding: 10px;
                font-size: 16px;
                cursor: not-allowed;
                opacity: 0.5;
            }
            .dialog-footer .post-button.enabled {
                background: #1A73E8;
                cursor: pointer;
                opacity: 1;
            }
        </style>
    </head>
    <body class="bg-[#191a1f]">
        <jsp:include page="/components/NavigationBar.jsp"/> 

        <div class="px-[128px] pt-20 text-white min-h-fit flex">
            <aside class="w-1/4 h-fit mr-6 border border-[#202227] bg-[#141519] rounded-md">
                <img src="./../public/images/profile-background.jpg" alt="User Background" class="w-full h-14 object-cover rounded-t-lg">
                <div class="relative">
                    <img src="./../public/images/avatar.png" alt="User Profile" class="w-16 h-16 rounded-md border-[3px] object-cover border-white absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                </div>
                <div class="mx-5 mt-11 pb-4 flex flex-col justify-center border-b border-[#202227]">
                    <h2 class="text-lg font-semibold text-center">Khang Nguyễn</h2>
                    <p class="text-sm text-gray-400 text-center">Web Developer at FSoft</p>
                    <p class="text-base text-gray-400 mt-4 text-center">I’d love to change the world, but they won’t give me the source code.</p>
                    <div class="flex justify-between mt-4 text-center divide-x divide-gray-700">
                        <div class="flex-1">
                            <p class="font-bold">256</p>
                            <p class="text-sm text-gray-400">Post</p>
                        </div>
                        <div class="flex-1">
                            <p class="font-bold">2.5K</p>
                            <p class="text-sm text-gray-400">Followers</p>
                        </div>
                        <div class="flex-1">
                            <p class="font-bold">365</p>
                            <p class="text-sm text-gray-400">Following</p>
                        </div>
                    </div>
                </div>
                <nav class="space-y-4 mx-5 mt-5">
                    <a href="/TripsExeWeb/pages/UserProfile.jsp" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/feed-icons.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Feed</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/connections-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Connections</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/news-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Latest News</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/event-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Events</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/group-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Groups</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/notification-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Notifications</span>
                    </a>
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
                        <img src="./../public/images/navigation/setting-icon.svg" class="w-[20px]"/>
                        <span class="font-bold text-white group-hover:text-[#0f6fec] duration-300">Settings</span>
                    </a>
                </nav>
                <a href="#" class="block mt-4 py-3 text-[#0f6fec] text-sm font-medium text-center hover:cursor-pointer border-t-[1px] border-[#202227]">View Profile</a>
            </aside>

            <main class="w-2/4 mr-6 overflow-y-auto">
                <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <div class="flex mb-4">
                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-10 h-10 rounded-full mr-3">
                        <textarea id="open-post-dialog" name="content" placeholder="Share your thoughts..." class="flex-1 min-h-[60px] bg-[#191A1F] text-gray-400 p-3 rounded-md focus:outline-none resize-none overflow-hidden border-none"></textarea>
                    </div>
                    <div class="flex space-x-3">
                        <button id="open-photo-dialog" class="flex items-center text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#0CBC87] w-[12px] mr-[8px] text-success" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"></path></svg>
                            <span class="text-sm font-medium">Photo</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#4F9EF8] w-[12px] mr-[8px] text-info" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M6 3a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path><path d="M9 6a3 3 0 1 1 0-6 3 3 0 0 1 0 6"></path><path d="M9 6h.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 7.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 16H2a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z"></path></svg>
                            <span class="text-sm font-medium">Video</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#D6293E] w-[12px] mr-[8px] text-danger" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5m9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5M11.5 7a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"></path></svg>
                            <span class="text-sm font-medium">Event</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#F7C32E] w-[12px] mr-[8px] text-warning" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5M4.285 9.567a.5.5 0 0 1 .683.183A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683M10 8c-.552 0-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5S10.552 8 10 8"></path></svg>
                            <span class="text-sm font-medium">Feeling/Activity</span>
                        </button>
                    </div>
                </div>
                <c:if test="${posts==null}">
                    <p class="text-center text-info mb-5">Add new friend to see new post!</p>
                </c:if>
                <c:if test="${posts!=null}">
                    <c:forEach var="post" items="${posts}">
                        <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md" id=post.getPostId()>
                            <div class="flex items-center space-x-3 mb-4">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-10 h-10 rounded-full">
                                <div>
                                    <div class="flex items-center">
                                        <p class="font-semibold text-white mr-3">Khang Nguyễn</p>
                                        <span class="mr-3 text-gray-400">•</span>
                                        <span class="text-sm text-gray-400 ">2 hours ago</span>
                                    </div>
                                    <p class="text-sm text-gray-400">Web Developer at FSoft</p>
                                </div>
                            </div>
                            <p class="text-gray-300 mb-4">Một FE Dev có các triệu chứng như đau lưng, mỏi gối, rụng tóc,... nhưng iu nghề <3 </p>
                            <img src="./../public/images/post-image.jpg" alt="Post Image" class="w-full rounded-lg mb-4">
                            <div class="flex items-center justify-between text-gray-400 text-sm mb-4">
                                <div class="flex space-x-4">
                                    <button class="flex items-center hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"></path></svg>
                                        <span>Liked (56)</span>
                                    </button>
                                    <button class="flex items-center space-x-1 hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9 9 0 0 0 8 15"></path></svg>
                                        <span>Comments (12)</span>
                                    </button>
                                </div>
                                <button class="flex items-center space-x-1 hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="flip-horizontal ps-1" height="16" width="16" xmlns="http://www.w3.org/2000/svg"><path d="M5.921 11.9 1.353 8.62a.72.72 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"></path></svg>
                                    <span>Share (3)</span>
                                </button>
                            </div>
                            <div class="mb-4 flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                                <div class="relative py-2 w-full">
                                    <input placeholder="Add a comment..." class="w-full min-h-[40px] bg-[#202227] text-gray-400 pl-3 pr-10 py-2 rounded-md focus:outline-none resize-none overflow-hidden border-1 border-gray-700 text-white placeholder:text-gray-400"/>
                                    <button class="flex items-center justify-center w-12 h-10 absolute right-2 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-[#0f6fec] hover:cursor-pointer duration-300">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="w-4 h-4" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="space-y-4">
                                <div class="flex space-x-3">
                                    <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                                    <div class="flex-1">
                                        <div class="bg-[#202227] p-3 rounded-lg">
                                            <p class="font-bold text-base text-white mb-1">Minh Phan</p>
                                            <p class="text-sm font-normal text-gray-300">Lưng t cũng không khác lưng m là mấy, tóc t cũng thế</p>
                                        </div>
                                        <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                            <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Like (3)</button>
                                            <span class="mr-3 text-gray-400">•</span>
                                            <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Reply</button>
                                            <span class="mr-3 text-gray-400">•</span>
                                            <span class="cursor-default select-none">45 minutes ago</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex space-x-3">
                                    <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                                    <div class="flex-1">
                                        <div class="bg-[#202227] p-3 rounded-lg">
                                            <p class="font-bold text-base text-white mb-1">Huy Quang</p>
                                            <p class="text-sm font-normal text-gray-300">Lưng m đau tuổi với lưng t</p>
                                        </div>
                                        <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                            <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Like (2)</button>
                                            <span class="mr-3 text-gray-400">•</span>
                                            <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Reply</button>
                                            <span class="mr-3 text-gray-400">•</span>
                                            <span class="cursor-default select-none">50 minutes ago</span>
                                        </div>
                                    </div>
                                </div>
                                <button class="text-gray-4 00 text-sm hover:text-[#0f6fec] hover:cursor-pointer">... Load more comments</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <div class="flex items-center space-x-3 mb-4">
                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-10 h-10 rounded-full">
                        <div>
                            <div class="flex items-center">
                                <p class="font-semibold text-white mr-3">Khang Nguyễn</p>
                                <span class="mr-3 text-gray-400">•</span>
                                <span class="text-sm text-gray-400 ">2 hours ago</span>
                            </div>
                            <p class="text-sm text-gray-400">Web Developer at FSoft</p>
                        </div>
                    </div>
                    <p class="text-gray-300 mb-4">Một FE Dev có các triệu chứng như đau lưng, mỏi gối, rụng tóc,... nhưng iu nghề <3 </p>
                    <img src="./../public/images/post-image.jpg" alt="Post Image" class="w-full rounded-lg mb-4">
                    <div class="flex items-center justify-between text-gray-400 text-sm mb-4">
                        <div class="flex space-x-4">
                            <button class="flex items-center hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"></path></svg>
                                <span>Liked (56)</span>
                            </button>
                            <button class="flex items-center space-x-1 hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9 9 0 0 0 8 15"></path></svg>
                                <span>Comments (12)</span>
                            </button>
                        </div>
                        <button class="flex items-center space-x-1 hover:cursor-pointer hover:text-[#0f6fec] duration-300">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="flip-horizontal ps-1" height="16" width="16" xmlns="http://www.w3.org/2000/svg"><path d="M5.921 11.9 1.353 8.62a.72.72 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"></path></svg>
                            <span>Share (3)</span>
                        </button>
                    </div>
                    <div class="mb-4 flex items-center space-x-3">
                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                        <div class="relative py-2 w-full">
                            <input placeholder="Add a comment..." class="w-full min-h-[40px] bg-[#202227] text-gray-400 pl-3 pr-10 py-2 rounded-md focus:outline-none resize-none overflow-hidden border-1 border-gray-700 text-white placeholder:text-gray-400"/>
                            <button class="flex items-center justify-center w-12 h-10 absolute right-2 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-[#0f6fec] hover:cursor-pointer duration-300">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="w-4 h-4" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4">
                        <div class="flex space-x-3">
                            <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                            <div class="flex-1">
                                <div class="bg-[#202227] p-3 rounded-lg">
                                    <p class="font-bold text-base text-white mb-1">Minh Phan</p>
                                    <p class="text-sm font-normal text-gray-300">Lưng t cũng không khác lưng m là mấy, tóc t cũng thế</p>
                                </div>
                                <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                    <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Like (3)</button>
                                    <span class="mr-3 text-gray-400">•</span>
                                    <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Reply</button>
                                    <span class="mr-3 text-gray-400">•</span>
                                    <span class="cursor-default select-none">45 minutes ago</span>
                                </div>
                            </div>
                        </div>
                        <div class="flex space-x-3">
                            <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                            <div class="flex-1">
                                <div class="bg-[#202227] p-3 rounded-lg">
                                    <p class="font-bold text-base text-white mb-1">Huy Quang</p>
                                    <p class="text-sm font-normal text-gray-300">Lưng m đau tuổi với lưng t</p>
                                </div>
                                <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                    <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Like (2)</button>
                                    <span class="mr-3 text-gray-400">•</span>
                                    <button class="hover:cursor-pointer hover:text-[#0f6fec] duration-300">Reply</button>
                                    <span class="mr-3 text-gray-400">•</span>
                                    <span class="cursor-default select-none">50 minutes ago</span>
                                </div>
                            </div>
                        </div>
                        <button class="text-gray-4 00 text-sm hover:text-[#0f6fec] hover:cursor-pointer">... Load more comments</button>
                    </div>
                </div>
            </main>

            <aside class="w-1/4">
                <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <h3 class="text-lg font-bold mb-4">Who to follow</h3>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-12 h-12 rounded-full">
                                <div>
                                    <p class="font-semibold">Minh Phan</p>
                                    <p class="text-sm text-gray-400">FE Developer</p>
                                </div>
                            </div>
                            <button class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c-17.67 0-32-14.33-32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-12 h-12 rounded-full">
                                <div>
                                    <p class="font-semibold">Huy Quang</p>
                                    <p class="text-sm text-gray-400">BE Developer</p>
                                </div>
                            </div>
                            <button class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c-17.67 0-32-14.33-32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-12 h-12 rounded-full">
                                <div>
                                    <p class="font-semibold">Duyên Võ</p>
                                    <p class="text-sm text-gray-400">Chicken Gang</p>
                                </div>
                            </div>
                            <button class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c-17.67 0-32-14.33-32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-12 h-12 rounded-full">
                                <div>
                                    <p class="font-semibold">Kiệt Nguyễn</p>
                                    <p class="text-sm text-gray-400">Designer</p>
                                </div>
                            </div>
                            <button class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c-17.67 0-32-14.33-32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-3">
                                <img src="./../public/images/avatar.png" alt="User Profile" class="w-12 h-12 rounded-full">
                                <div>
                                    <p class="font-semibold">Thư Nguyễn</p>
                                    <p class="text-sm text-gray-400">Designer, Freelancer</p>
                                </div>
                            </div>
                            <button class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c-17.67 0-32-14.33-32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                    </div>
                    <button class="block w-full py-[8px] mt-4 rounded bg-[#0f6fec1a] text-sm font-medium text-[#0f6fec] hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">View more</button>
                </div>
            </aside>
        </div>

        <div id="create-post-dialog" class="hidden">
            <form class="dialog hidden" action="/TripsExeWeb/post-add" method="post">
                <div class="dialog-header">
                    <h2>Create post</h2>
                    <button id="close-create-post-dialog">✕</button>
                </div>

                <div class="user-info">
                    <img src="./../public/images/avatar.png" alt="User Avatar">
                    <p>Khang Nguyễn</p>
                </div>

                <div>
                    <textarea placeholder="Share your thoughts..." name="content"></textarea>
                </div>

                <div id="photo-dialog" class="bg-black/50 flex items-center justify-center hidden">
                    <div class="bg-[#141519] rounded-lg p-6 w-full max-w-[500px] relative">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-white text-lg font-bold">Add photo</h2>
                            <button id="close-photo-dialog" class="text-gray-400 hover:text-white hover:cursor-pointer">
                                <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                            </button>
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-400 text-sm mb-2">Upload attachment</label>
                            <div class="border-2 border-dashed border-gray-500 rounded-lg p-6 text-center">
                                <svg class="mx-auto w-8 h-8 text-gray-400 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"/>
                                </svg>
                                <p class="text-gray-400 text-sm">Drag here or click to upload photo.</p>
                                <input type="file" class="hidden" accept="image/*" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dialog-footer">
                    <div class="add-to-post">
                        <div class="icons">
                            <button id="open-photo-dialog-from-create">📷</button>
                            <button>👤</button>
                            <button>😊</button>
                            <button>📍</button>
                            <button>GIF</button>
                        </div>
                    </div>
                    <button type="submit" class="post-button">Post</button>
                </div>
            </form>
        </div>
    </body>
    <script>
        const photoDialog = document.getElementById("photo-dialog");
        const closePhotoDialogBtn = document.getElementById("close-photo-dialog");
        const openCreatePostDialogBtn = document.getElementById("open-post-dialog");
        const createPostDialog = document.getElementById("create-post-dialog");
        const createPostDialogChild = createPostDialog.querySelector(".dialog");
        const closeCreatePostDialogBtn = document.getElementById("close-create-post-dialog");
        const openPhotoDialogFromCreateBtn = document.getElementById("open-photo-dialog-from-create");
        const textarea = createPostDialog.querySelector('textarea');

        closePhotoDialogBtn.addEventListener("click", () => {
            photoDialog.classList.add("hidden");
        });

        openCreatePostDialogBtn.addEventListener("click", () => {
            createPostDialog.classList.remove("hidden");
            createPostDialog.classList.add("dialog-overlay");
            createPostDialogChild.classList.remove("hidden");
        });

        closeCreatePostDialogBtn.addEventListener("click", () => {
            createPostDialog.classList.add("hidden");
            createPostDialog.classList.remove("dialog-overlay");
            createPostDialogChild.classList.add("hidden");
        });

        createPostDialog.addEventListener("click", (e) => {
            if (e.target === createPostDialog) {
                createPostDialog.classList.add("hidden");
                createPostDialog.classList.remove("dialog-overlay");
                createPostDialogChild.classList.add("hidden");
                textarea.value = '';
                photoDialog.classList.add("hidden");
            }
        });

        openPhotoDialogFromCreateBtn.addEventListener("click", () => {
            createPostDialog.classList.add("hidden");
            photoDialog.classList.remove("hidden");
        });

        textarea.addEventListener('input', function () {
            let postBtn = this.closest('.dialog').querySelector('.post-button');
            postBtn.classList.toggle('enabled', this.value.length > 0);
        });
    </script>
</html>