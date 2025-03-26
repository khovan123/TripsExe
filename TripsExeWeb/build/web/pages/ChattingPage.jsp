<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>TripsExe | Chat</title>
        <!--<script src="https://unpkg.com/@tailwindcss/browser@4"></script>-->
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
                padding: 0;
            }
            .scrollbar::-webkit-scrollbar {
                width: 8px;
            }

            .scrollbar::-webkit-scrollbar-track {
                border-radius: 100vh;
                background: #191a1f;
            }

            .scrollbar::-webkit-scrollbar-track:hover {
                background: #303135;
            }

            .scrollbar::-webkit-scrollbar-thumb {
                background: #757679;
                border-radius: 100vh;
            }

            .scrollbar::-webkit-scrollbar-thumb:hover {
                background: #8c8d8f;
            }
        </style>
    </head>
    <body class="bg-[#191a1f]">
        <jsp:include page="/components/NavigationBar.jsp" />
        <main class="pt-20 px-[128px] h-[95vh]">
            <section
                class="flex text-white h-[100%] border border-[#202227] bg-[#141519] rounded-md"
                >
                <aside class="w-1/4 border-r-[1px] border-[#202227]">
                    <div
                        class="flex justify-start items-center px-5 py-6 border-b-[1px] border-[#202227] gap-2"
                        >
                        <h5 class="text-xl font-bold">Active chats:</h5>
                        <h5 class="text-xl font-bold text-[#37b24d] bg-[#37b24d]/20 px-2 rounded-lg">${friends.size()}</h5>

                    </div>
                    <div class="p-5">
                        <div class="relative">
                            <input
                                id="search"
                                type="text"
                                placeholder="Search for chats"
                                onkeyup="handleSearch()"
                                onfocus="handleSearch()"
                                class="w-full pl-3 py-2 px-3 rounded-md placeholder:text-gray-400 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-[#191A1F] text-white"
                                />
                            <svg                                      
                                onclick="handleSearch()"
                                xmlns="http://www.w3.org/2000/svg"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 cursor-pointer"
                                viewBox="0 0 30 30"
                                width="20px"
                                height="20px"
                                fill="currentColor"
                                >
                            <path
                                d="M 13 3 C 7.4889971 3 3 7.4889971 3 13 C 3 18.511003 7.4889971 23 13 23 C 15.396508 23 17.597385 22.148986 19.322266 20.736328 L 25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969 L 20.736328 19.322266 C 22.148986 17.597385 23 15.396508 23 13 C 23 7.4889971 18.511003 3 13 3 z M 13 5 C 17.430123 5 21 8.5698774 21 13 C 21 17.430123 17.430123 21 13 21 C 8.5698774 21 5 17.430123 5 13 C 5 8.5698774 8.5698774 5 13 5 z"
                                />
                            </svg>
                        </div>
                    </div>
                    <ul class="px-5 flex flex-col" id="search-suggestions">
                        <c:forEach var="friend" items="${friends}" varStatus="loop">
                            <li
                                onclick="openChat('${friend.getUserId()}');
                                        toggleSelection(this, '${fn:escapeXml(friend.getFullName())}', '<c:url value="${friend.getAvatarUrl()}"/>');"
                                class="flex items-start rounded-md gap-2 px-4 py-2 mb-[15px] cursor-pointer transition-all duration-200 hover:bg-[#0D6EFD]/80"
                                >
                                <img                                    
                                    src='<c:url value="${friend.getAvatarUrl()}"/>'
                                    alt="User Profile"
                                    class="w-12 h-12 object-cover rounded-full border-2 border-gray-400"
                                    />
                                <div class="flex flex-col flex-1">
                                    <p class="font-bold" id="search-name">${friend.getFullName()}</p>
                                    <p id="msg-${friend.getUserId()}" class="text-sm text-gray-400">...</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>                    
                </aside>

                <aside class="w-3/4 flex flex-col px-5 py-6">
                    <div
                        class="flex items-center justify-between pb-3 border-b-[1px] border-[#202227]"
                        >
                        <div class="flex items-start gap-2 cursor-pointer hover:bg-white/25 rounded-lg px-[6px] py-[6px]">
                            <img
                                id="friend-avatar"
                                src='<c:url value="/public/images/avatar.png"/>'
                                alt="User Profile"
                                class="w-12 h-12 rounded-full border-2 border-gray-400"
                                />
                            <div>   
                                <p class="font-bold" id="friend-name">?</p>
                                <div
                                    class="text-sm text-gray-400 flex justify-start items-center"
                                    >
                                    <svg
                                        class="text-[#37b24d] mr-1"
                                        stroke="currentColor"
                                        fill="currentColor"
                                        stroke-width="0"
                                        viewBox="0 0 512 512"
                                        height="0.8em"
                                        width="0.8em"
                                        xmlns="http://www.w3.org/2000/svg"
                                        >
                                    <path
                                        d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"
                                        ></path>
                                    </svg>
                                    <span class="pb-[4px]">online</span>
                                </div>
                            </div>
                        </div>
                        <div class="grow flex flex-row justify-end">
                            <button
                                class="w-10 h-10 mr-[8px] rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-300"
                                >
                                <svg
                                    stroke="currentColor"
                                    fill="currentColor"
                                    stroke-width="0"
                                    viewBox="0 0 16 16"
                                    height="1em"
                                    width="1em"
                                    xmlns="http://www.w3.org/2000/svg"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"
                                    ></path>
                                </svg>
                            </button>
                            <button
                                class="w-10 h-10 mr-[8px] rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-300"
                                >
                                <svg
                                    stroke="currentColor"
                                    fill="currentColor"
                                    stroke-width="0"
                                    viewBox="0 0 16 16"
                                    height="1em"
                                    width="1em"
                                    xmlns="http://www.w3.org/2000/svg"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2z"
                                    ></path>
                                </svg>
                            </button>
                            <button
                                class="w-10 h-10 rounded-full bg-[#0f6fec1a] text-[#0f6fec] flex items-center justify-center hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-300"
                                >
                                <svg
                                    stroke="currentColor"
                                    fill="currentColor"
                                    stroke-width="0"
                                    viewBox="0 0 16 16"
                                    height="1em"
                                    width="1em"
                                    xmlns="http://www.w3.org/2000/svg"
                                    >
                                <path
                                    d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"
                                    ></path>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="grow h-4/5 overflow-y-auto bg-[#141519] rounded scrollbar">
                        <div class="flex flex-col gap-5 py-4" id="chat-box">
                        </div>
                    </div>
                    <!-- Message Input -->
                    <div class="flex items-center gap-2">
                        <input
                            id="message"
                            placeholder="Type a message"
                            class="w-full pl-3 py-2 px-3 rounded-md placeholder:text-gray-400 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-[#191A1F] text-white"
                            />
                        <button
                            class="bg-red-500/10 w-10 h-8 rounded-sm flex items-center justify-center border-1 border-red-500/20"
                            >
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                viewBox="0 0 24 24"
                                fill="#e42121"
                                stroke="#000"
                                stroke-width="1.5"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="lucide lucide-smile"
                                >
                            <circle cx="12" cy="12" r="10" />
                            <path d="M8 14s1.5 2 4 2 4-2 4-2" />
                            <line x1="9" x2="9.01" y1="9" y2="9" />
                            <line x1="15" x2="15.01" y1="9" y2="9" />
                            </svg>
                        </button>

                        <button id="custom-file-button" class="bg-gray-500/10 w-10 h-8 rounded-md flex items-center justify-center border border-gray-500/20 hover:bg-gray-500/20 duration-300">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" class="fs-6 text-gray-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M43.246 466.142c-58.43-60.289-57.341-157.511 1.386-217.581L254.392 34c44.316-45.332 116.351-45.336 160.671 0 43.89 44.894 43.943 117.329 0 162.276L232.214 383.128c-29.855 30.537-78.633 30.111-107.982-.998-28.275-29.97-27.368-77.473 1.452-106.953l143.743-146.835c6.182-6.314 16.312-6.422 22.626-.241l22.861 22.379c6.315 6.182 6.422 16.312.241 22.626L171.427 319.927c-4.932 5.045-5.236 13.428-.648 18.292 4.372 4.634 11.245 4.711 15.688.165l182.849-186.851c19.613-20.062 19.613-52.725-.011-72.798-19.189-19.627-49.957-19.637-69.154 0L90.39 293.295c-34.763 35.56-35.299 93.12-1.191 128.313 34.01 35.093 88.985 35.137 123.058.286l172.06-175.999c6.177-6.319 16.307-6.433 22.626-.256l22.877 22.364c6.319 6.177 6.434 16.307.256 22.626l-172.06 175.998c-59.576 60.938-155.943 60.216-214.77-.485z"></path>
                            </svg>
                        </button>

                        <input id="custom-file-input" class="hidden" type="file" name="image" accept="image/*" />
                        <button
                            onclick="sendMessage()"
                            class="bg-blue-500 w-10 h-8 rounded-md flex items-center justify-center"
                            >
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="#ffffff"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="lucide lucide-send"
                                >
                            <path
                                d="M14.536 21.686a.5.5 0 0 0 .937-.024l6.5-19a.496.496 0 0 0-.635-.635l-19 6.5a.5.5 0 0 0-.024.937l7.93 3.18a2 2 0 0 1 1.112 1.11z"
                                />
                            <path d="m21.854 2.147-10.94 10.939" />
                            </svg>
                        </button>
                    </div>
                </aside>
            </section>
        </main>
    </body>
    <script>
        const currentUserId = "${user.getUserId()}";
        const fullName = "${user.getFullName()}";
        let ws = null;
        let currentRoomId = null;
        let friendAvatarUrl = null;
        let liSelectedPre = null;
        let isSearch = false;
        function openChat(friendId) {
            if (ws) {
                ws.close();
            }
            currentRoomId =
                    "room_" +
                    Math.min(currentUserId, friendId) +
                    "_" +
                    Math.max(currentUserId, friendId);
            ws = new WebSocket(
                    "ws://localhost:8080/TripsExeWeb/chatendpoint/" + currentRoomId
                    );
            ws.onopen = function () {
                console.log("Connected to room: " + currentRoomId);
                let initobj = {
                    "load": {
                        "roomId": currentRoomId
                    }
                }
                ws.send(JSON.stringify(initobj));
            };
            ws.onmessage = function (event) {
                let data = event.data;
                console.log(data);
                let dataobj = JSON.parse(data);
                let msgFriendEl = document.getElementById("msg-" + friendId);
                let chatBox = document.getElementById("chat-box");
                let isCurrentUser = dataobj.userId == currentUserId;
                let lineStyle = isCurrentUser ? "justify-end pr-4" : "items-start gap-2";
                let messageStyle = isCurrentUser ? "bg-[#0F6FEC]" : "bg-[#202227]";
                if (!isCurrentUser)
                    msgFriendEl.innerText = dataobj.content;
                const avatar = isCurrentUser
                        ? ""
                        : `<img
                                src='<c:url value="?"/>'
                                alt="User Profile"
                                class="w-12 h-12 rounded-full friend-avatar"
                                />`;
                chatBox.innerHTML +=
                        `<div class="flex ` +
                        lineStyle +
                        `">` +
                        avatar +
                        `<div>
          <p class="text-sm py-2 px-3 rounded-md ` +
                        messageStyle +
                        `">` +
                        dataobj.content +
                        `</p>
        </div>
        </div>`;
                if (friendAvatarUrl != null) {
                    let friendAvatarChatBoxEl = document.querySelectorAll('#chat-box img');
                    friendAvatarChatBoxEl.forEach(item => {
                        item.src = friendAvatarUrl;
                    });
                }
                chatBox.scrollIntoView({behavior: "smooth", block: "end"});
            }
            ;
            ws.onerror = function (error) {
                console.error("WebSocket error: ", error);
            };
            ws.onclose = function () {
                let chatBox = document.getElementById("chat-box");
                chatBox.innerHTML = "";
                console.log("WebSocket closed");
            };
        }

        function sendMessage() {
            let message = document.getElementById("message").value;
            if (ws && message) {
                let messageobj = {
                    "message": {
                        "userId": currentUserId,
                        "roomId": currentRoomId,
                        "fullName": '${user.getFullName()}',
                        "content": message,
                        "imageUrl": null
                    }
                }
                ws.send(JSON.stringify(messageobj));
                document.getElementById("message").value = "";
            } else {
                console.log("WebSocket chưa sẵn sàng hoặc tin nhắn rỗng");
            }
        }

        function toggleSelection(selectedLi, fullname, avatarUrl) {
            let searchEl = document.getElementById("search");
            const allLi = document.querySelectorAll("#search-suggestions li");
            if (searchEl.value != null) {
                searchEl.value = '';
                allLi.forEach((li) => {
                    li.classList.remove("hidden");


                    li.classList.remove("bg-[#0D6EFD]");
                    li.classList.add("hover:bg-[#0D6EFD]/80")
                });
                liSelectedPre = selectedLi;
                selectedLi.classList.add("bg-[#0D6EFD]");
                selectedLi.classList.remove("hover:bg-[#0D6EFD]/80");
                let friendName = document.getElementById("friend-name");
                friendName.innerHTML = fullname;
                friendAvatarUrl = avatarUrl;
                let friendAvatarEl = document.getElementById("friend-avatar");
                friendAvatarEl.src = avatarUrl;
            }
        }
        function handleSearch()
        {
            isSearch = true;
            let searchEl = document.getElementById("search");
            let inputText = searchEl.value.toString().toLowerCase();
            let searchSuggestionsEl = document.getElementById("search-suggestions");
            let suggestionItemEl = searchSuggestionsEl.getElementsByTagName('li');
            if (inputText.length == 0) {
                for (let item of suggestionItemEl) {
                    item.classList.add("hidden");
                    item.classList.remove("bg-[#0D6EFD]");
                    item.classList.add("hover:bg-[#0D6EFD]/80");
                }
            } else {
                for (let item of suggestionItemEl) {
                    let nameEl = item.querySelector("#search-name");
                    let name = nameEl.textContent || nameEl.innerText;
                    if (name.toLowerCase().indexOf(inputText) > -1) {
                        item.classList.remove("hidden");
                    }
                }
            }
        }


        document.addEventListener("DOMContentLoaded", () => {
            const messageInput = document.getElementById("message");
            messageInput.addEventListener("keypress", (event) => {
                if (event.key === "Enter") {
                    event.preventDefault();
                    sendMessage();
                }
            });
        });

        document.addEventListener("DOMContentLoaded", () =>
        {
            const firstLi = document.querySelector("#search-suggestions li");
            if (firstLi) {
                liSelectedPre = firstLi;
                firstLi.classList.add("bg-[#0D6EFD]");
                firstLi.classList.remove("hover:bg-[#0D6EFD]/80");
                const firstFriendId = "${friends.size() > 0 ? friends[0].getUserId() : ''}";
                if (firstFriendId) {
                    let friendName = document.getElementById("friend-name");
                    friendName.innerHTML = '${friends[0].getFullName()}';
                    let friendAvatarEl = document.getElementById("friend-avatar");
                    friendAvatarUrl = '/TripsExeWeb/${friends[0].getAvatarUrl()}';
                    friendAvatarEl.src = friendAvatarUrl;

                    openChat(firstFriendId);
                }
            } else {
                console.log("error:404");
            }

            document.addEventListener("click", (event) => {
                const searchInput = document.getElementById("search");
                const suggestionItemEl = document.querySelectorAll("#search-suggestions li");
                if (event.target.value === undefined) {
                    searchInput.value = '';
                    for (let item of suggestionItemEl) {
                        item.classList.remove("hidden");
                        liSelectedPre.classList.add("bg-[#0D6EFD]");
                        liSelectedPre.classList.remove("hover:bg-[#0D6EFD]/80");
                    }
                }
            });
        }
        );

        window.onload = function () {
            if (performance.navigation.type === performance.navigation.TYPE_RELOAD) {
                console.log("Page reloaded, fetching data from /post-load");
                window.location.href = "/TripsExeWeb/chat";
            }
        };

        document.getElementById("custom-file-button").addEventListener("click", () => {
            document.getElementById("custom-file-input").click();
        });

        document.getElementById("custom-file-input").addEventListener("change", (event) => {
        const fileName = event.target.files[0]?.name || "No file chosen";
        console.log("Selected file:", fileName);
    });
    </script>
</html>