<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                <nav class="space-y-4 mx-5 mt-5 ">
                    <a href="#" class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group">
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
                <!--                <div class="bg-[#1a1a1b] rounded-lg p-4 mb-4">
                                    <div class="flex items-center space-x-2 mb-4">
                                        <h3 class="text-gray-400">Post a Story</h3>
                                    </div>
                                    <div class="flex space-x-2">
                                        <img src="https://via.placeholder.com/40" alt="User Story" class="w-10 h-10 rounded-full">
                                        <img src="https://via.placeholder.com/40" alt="User Story" class="w-10 h-10 rounded-full">
                                        <img src="https://via.placeholder.com/40" alt="User Story" class="w-10 h-10 rounded-full">
                                    </div>
                                </div>-->

                <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <div class="flex mb-4">
                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-10 h-10 rounded-full mr-3">
                        <textarea placeholder="Share your thoughts..." class="flex-1 min-h-[60px] bg-[#191A1F] text-gray-400 p-3 rounded-md focus:outline-none resize-none overflow-hidden border-none"></textarea>
                    </div>
                    <div class="flex space-x-3">
                        <button class="flex items-center text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#0CBC87] w-[12px] mr-[8px] text-success pe-2" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"></path></svg>
                            <span class="text-sm font-medium">Photo</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#4F9EF8] w-[12px] mr-[8px] text-info pe-2" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M6 3a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path><path d="M9 6a3 3 0 1 1 0-6 3 3 0 0 1 0 6"></path><path d="M9 6h.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 7.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 16H2a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z"></path></svg>
                            <span class="text-sm font-medium">Video</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#D6293E] w-[12px] mr-[8px] text-danger pe-2" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5m9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5M11.5 7a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"></path></svg>
                            <span class="text-sm font-medium">Event</span>
                        </button>
                        <button class="flex items-center space-x-1 text-gray-400 hover:cursor-pointer hover:text-[#0f6fec] duration-300 bg-[#202227] py-[4px] px-[8px] rounded-lg">
                            <svg class="text-[#F7C32E] w-[12px] mr-[8px] text-warning pe-2" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5M4.285 9.567a.5.5 0 0 1 .683.183A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683M10 8c-.552 0-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5S10.552 8 10 8"></path></svg>
                            <span class="text-sm font-medium">Feeling/Activity</span>
                        </button>
                    </div>
                </div>

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
                        <!--                        <button class="ml-auto text-gray-400 hover:text-white px-1 py-2 relative group p-10">
                                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"></path></svg>
                                                </button>-->
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
                                    <!--<button class="hover:text-white">View 2 replies</button>-->
                                    <span class="cursor-default select-none">45 minutes ago</span>
                                </div>

                                <!--                                <div class="space-y-3 mt-3 ml-10">
                                                                     Reply 1: Dennis Barrett 
                                                                    <div class="flex space-x-3">
                                                                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                                                                        <div class="flex-1">
                                                                            <div class="bg-[#191A1F] p-3 rounded-lg">
                                                                                <p class="font-semibold text-white">Dennis Barrett</p>
                                                                                <p class="text-gray-300">See reserved goodness felicity shy civility domestic had but. Drawings offended yet answered Jennings perceive.</p>
                                                                            </div>
                                                                            <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                                                                <button class="hover:text-white">Like (5)</button>
                                                                                <button class="hover:text-white">Reply</button>
                                                                                <span>2 hours ago</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                
                                                                     Reply 2: Lori Ferguson 
                                                                    <div class="flex space-x-3">
                                                                        <img src="./../public/images/avatar.png" alt="User Profile" class="w-8 h-8 rounded-full">
                                                                        <div class="flex-1">
                                                                            <div class="bg-[#191A1F] p-3 rounded-lg">
                                                                                <p class="font-semibold text-white">Lori Ferguson</p>
                                                                                <p class="text-gray-300">Wishing calling is warrant settled was lucky.</p>
                                                                            </div>
                                                                            <div class="flex space-x-3 text-gray-400 text-sm mt-1">
                                                                                <button class="hover:text-white">Like (0)</button>
                                                                                <button class="hover:text-white">Reply</button>
                                                                                <span>35 minutes ago</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                
                                                                     Load More Replies 
                                                                    <button class="text-gray-400 hover:text-white text-sm ml-10">... Load more replies</button>
                                                                </div>-->
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
                                    <!--<button class="hover:text-white">View 2 replies</button>-->
                                    <span class="cursor-default select-none">50 minutes ago</span>
                                </div>
                            </div>
                        </div>

                        <!-- Load More Comments -->
                        <button class="text-gray-400 text-sm hover:text-[#0f6fec] hover:cursor-pointer">... Load more comments</button>
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
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
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
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
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
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
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
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
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
                                <span><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></span>
                            </button>
                        </div>
                    </div>
                    <button class="block w-full py-[8px] mt-4 rounded bg-[#0f6fec1a] text-sm font-medium text-[#0f6fec] hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400">View more</button>
                </div>
            </aside>
        </div>
    </body>
</html>
