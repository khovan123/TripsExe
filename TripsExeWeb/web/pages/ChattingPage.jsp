<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chat Interface</title>
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
                        class="flex justify-between items-center px-5 py-6 border-b-[1px] border-[#202227]"
                        >
                        <h5 class="text-xl font-bold">Active chats</h5>
                    </div>
                    <div class="p-5">
                        <div class="relative">
                            <input
                                placeholder="Search for chats"
                                class="pl-3 py-2 px-3 rounded-md placeholder:text-gray-400 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-[#191A1F] text-white w-64"
                                />
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400"
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
                    <ul class="px-5 flex flex-col">
                        <c:forEach var="friend" items="${friends}" varStatus="loop">
                            <li
                                onclick="openChat('${friend.getUserId()}');
                                        toggleSelection(this);"
                                class="flex items-start rounded-md gap-2 px-4 py-2 mb-[15px] cursor-pointer transition-all duration-200 ${loop.first ? 'bg-[#0D6EFD]' : ''}"
                                >
                                <img
                                    src='<c:url value="/public/images/dog-avatar.jpg"/>'
                                    alt="User Profile"
                                    class="w-12 h-12 object-cover rounded-full border-2 border-gray-400"
                                    />
                                <div class="flex flex-col flex-1">
                                    <p class="font-bold">${friend.getFullName()}</p>
                                    <p class="text-sm text-gray-400">...</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </aside>

                <aside class="w-3/4 flex flex-col px-5 py-6">
                    <div
                        class="flex items-center justify-between pb-3 border-b-[1px] border-[#202227]"
                        >
                        <div class="grow flex items-start gap-2">
                            <img
                                src='<c:url value="/public/images/avatar.png"/>'
                                alt="User Profile"
                                class="w-12 h-12 rounded-full"
                                />
                            <div>
                                <p class="font-bold">${fullName}</p>
                                <div
                                    class="text-sm text-gray-400 flex justify-start items-center"
                                    >
                                    <svg
                                        class="text-[#0cbc87] mr-1"
                                        stroke="currentColor"
                                        fill="currentColor"
                                        stroke-width="0"
                                        viewBox="0 0 512 512"
                                        height="1em"
                                        width="1em"
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
                        <div class="flex flex-row">
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

                    <div class="grow h-4/5 overflow-y-auto bg-[#141519] py-4 rounded">
                        <div class="flex flex-col gap-5" id="chat-box">
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
                        <button
                            class="bg-gray-500/10 w-10 h-8 rounded-md flex items-center justify-center border-1 border-gray-500/20"
                            >
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="#ffffff"
                                stroke-width="3"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="lucide lucide-link"
                                >
                            <path
                                d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"
                                />
                            <path
                                d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"
                                />
                            </svg>
                        </button>
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
        const currentUserId = "${userId}";
        const fullName = "${fullName}";
        let ws = null;
        let currentRoomId = null;

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
                ws.send("userId=" + currentUserId + "&fullName=" + fullName);
            };

            ws.onmessage = function (event) {
                let chatBox = document.getElementById("chat-box");
                let messageData = event.data.toString().split(":", 2);
                let senderId = messageData[0];
                let content = messageData[1] || event.data;
                let isCurrentUser = senderId == currentUserId;
                console.log(event.data);
                let lineStyle = isCurrentUser ? "justify-end" : "items-start gap-2";
                let messageStyle = isCurrentUser ? "bg-[#0F6FEC]" : "bg-[#202227]";
                const icon = isCurrentUser
                        ? ""
                        : `<span>
            <svg xmlns="http://www.w3.org/2000/svg"
            width="45"
            height="45"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-user-round bg-red-500 rounded-full">
            <circle cx="12" cy="8" r="5" />
            <path d="M20 21a8 8 0 0 0-16 0" />
            </svg>
            </span>`;
                chatBox.innerHTML +=
                        `<div class="flex ` +
                        lineStyle +
                        `">` +
                        icon +
                        `<div>
          <p class="text-sm py-2 px-3 rounded-md ` +
                        messageStyle +
                        `">` +
                        content +
                        `</p>
        </div>
        </div>`;
                chatBox.scrollIntoView({behavior: "smooth", block: "end"});
            };

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
                ws.send(message);
                document.getElementById("message").value = "";
            } else {
                console.log("WebSocket chưa sẵn sàng hoặc tin nhắn rỗng");
            }
        }

        function toggleSelection(selectedLi) {
            const allLi = document.querySelectorAll("li");
            allLi.forEach((li) => {
                li.classList.remove("bg-[#0D6EFD]");
            });
            selectedLi.classList.add("bg-[#0D6EFD]");
        }

        document.addEventListener("DOMContentLoaded", function () {
            const firstLi = document.querySelector("li");
            if (firstLi) {
                firstLi.classList.add("bg-[#0D6EFD]");
                const firstFriendId = "${friends.size() > 0 ? friends[0].getUserId() : ''}";
                if (firstFriendId) {
                    openChat(firstFriendId);
                }
            } else {
                console.log("Không tìm thấy thẻ li nào.");
            }
        });
    </script>
</html>
