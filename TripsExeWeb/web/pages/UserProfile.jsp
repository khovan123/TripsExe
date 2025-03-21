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
    <body class="bg-[#191a1f]">
        <jsp:include page="/components/NavigationBar.jsp"/> 

        <div class="px-[128px] pt-20 text-white min-h-fit flex">
            <main class="w-4/6 mr-6">
                <div class="mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <img src="./../public/images/profile-background.jpg" alt="User Background" class="w-full h-[200px] object-cover rounded-t-lg">
                    <div class="px-5 flex flex-row">                    
                        <div class="relative">
                            <img src="./../public/images/avatar.png" alt="User Profile" class="w-32 h-32 rounded-full border-[3px] object-cover border-white -mt-12">
                        </div>
                        <div class="ml-6 mt-3">
                            <div class="flex flex-row items-center">
                                <h1 class="text-lg font-bold pr-1">Nguyễn Khang</h1>
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="text-success small text-[#0CBC87]" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M10.067.87a2.89 2.89 0 0 0-4.134 0l-.622.638-.89-.011a2.89 2.89 0 0 0-2.924 2.924l.01.89-.636.622a2.89 2.89 0 0 0 0 4.134l.637.622-.011.89a2.89 2.89 0 0 0 2.924 2.924l.89-.01.622.636a2.89 2.89 0 0 0 4.134 0l.622-.637.89.011a2.89 2.89 0 0 0 2.924-2.924l-.01-.89.636-.622a2.89 2.89 0 0 0 0-4.134l-.637-.622.011-.89a2.89 2.89 0 0 0-2.924-2.924l-.89.01zm.287 5.984-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708.708"></path></svg>
                            </div>
                        </div>
                        <div class="ml-auto mt-3">
                            <div>                            
                                <button class="flex items-center px-4 py-2 rounded-lg bg-[#d6293e1a] text-sm font-medium text-[#d6293e] pointer hover:text-white hover:bg-[#D6293E] hover:cursor-pointer duration-400">
                                    <svg class="mr-[8px]" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="pe-1" height="19" width="19" xmlns="http://www.w3.org/2000/svg"><path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"></path></svg>
                                    <span class="font-medium text-base">Edit profile</span>
                                </button>     
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 pt-2 px-5">
                        <ul class="flex flex-row">
                            <li class="px-4 py-3 border-b-[3px] border-[#0f6fec]">
                                <a class="text-base font-semibold text-[#0f6fec] hover:text-[#0f6fec] hover:cursor-pointer">Feed</a>
                            </li>
                            <li class="px-4 py-3">
                                <a class="text-base font-semibold text-gray-300 hover:text-[#0f6fec] hover:cursor-pointer">About</a>
                            </li>
                            <li class="px-4 py-3">
                                <a class="text-base font-semibold text-gray-300 hover:text-[#0f6fec] hover:cursor-pointer">Connections</a>
                            </li>
                        </ul>
                    </div>
                </div>
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
                        <button class="text-gray-400 text-sm hover:text-[#0f6fec] hover:cursor-pointer">... Load more comments</button>
                    </div>
                </div>
            </main>
            <aside class="w-2/6">
                <div class="p-5 mb-5 border border-[#202227] bg-[#141519] rounded-md">
                    <h3 class="text-lg font-bold mb-2">About</h3>
                    <div>
                        <p class="text-gray-400 mb-4">He moonlights difficult engrossed it, sportsmen. Interested has all Devonshire difficulty gay assistance joy.</p>
                        <ul>
                            <li class="text-gray-400 flex flex-row items-center mb-2">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="fa-fw pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M6.445 11.688V6.354h-.633A13 13 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23"></path><path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"></path></svg>
                                <span class="ml-1 mr-1">Born:</span>
                                <strong> February 3, 2004 </strong>
                            </li>
                            <li class="text-gray-400 flex flex-row items-center mb-2">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="fa-fw pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"></path></svg>
                                <span class="ml-1 mr-1">Status:</span>
                                <strong> Single </strong>
                            </li>
                            <li class="text-gray-400 flex flex-row items-center mb-2">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="fa-fw pe-1" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"></path></svg>
                                <span class="ml-1 mr-1">Email:</span>
                                <strong> khangdev.030204@gmail.com </strong>
                            </li>
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
    </body>
</html>
