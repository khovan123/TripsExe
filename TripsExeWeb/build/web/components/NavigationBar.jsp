<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<section
    class="fixed z-10 px-[128px] bg-[#0f0f10] w-full h-fit py-1 flex items-center justify-center"
    >
    <nav class="w-full flex items-center justify-between py-1 bg-[#0f0f10]">
        <div class="flex flex-row items-center flex-1">
            <div class="relative">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
                    viewBox="0 0 30 30"
                    width="20px"
                    height="20px"
                    fill="currentColor"
                    >
                <path
                    d="M 13 3 C 7.4889971 3 3 7.4889971 3 13 C 3 18.511003 7.4889971 23 13 23 C 15.396508 23 17.597385 22.148986 19.322266 20.736328 L 25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969 L 20.736328 19.322266 C 22.148986 17.597385 23 15.396508 23 13 C 23 7.4889971 18.511003 3 13 3 z M 13 5 C 17.430123 5 21 8.5698774 21 13 C 21 17.430123 17.430123 21 13 21 C 8.5698774 21 5 17.430123 5 13 C 5 8.5698774 8.5698774 5 13 5 z"
                    />
                </svg>
                <input
                    placeholder="Search..."
                    class="pl-10 py-2 px-3 rounded-md placeholder:text-gray-400 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-[#202227] text-white w-64"
                    />
            </div>
    class="fixed z-10 px-[128px] bg-[#0f0f10] w-full h-fit py-1 flex items-center justify-center"
    >
    <nav class="w-full flex items-center justify-between py-1 bg-[#0f0f10]">
        <div class="flex flex-row items-center flex-1">
            <div class="relative">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
                    viewBox="0 0 30 30"
                    width="20px"
                    height="20px"
                    fill="currentColor"
                    >
                <path
                    d="M 13 3 C 7.4889971 3 3 7.4889971 3 13 C 3 18.511003 7.4889971 23 13 23 C 15.396508 23 17.597385 22.148986 19.322266 20.736328 L 25.292969 26.707031 A 1.0001 1.0001 0 1 0 26.707031 25.292969 L 20.736328 19.322266 C 22.148986 17.597385 23 15.396508 23 13 C 23 7.4889971 18.511003 3 13 3 z M 13 5 C 17.430123 5 21 8.5698774 21 13 C 21 17.430123 17.430123 21 13 21 C 8.5698774 21 5 17.430123 5 13 C 5 8.5698774 8.5698774 5 13 5 z"
                    />
                </svg>
                <input
                    placeholder="Search..."
                    class="pl-10 py-2 px-3 rounded-md placeholder:text-gray-400 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-[#202227] text-white w-64"
                    />
            </div>

            <div class="flex-1 flex flex-row justify-end">
                <button
                    id="home-btn"
                    class="text-gray-300 hover:text-[#0f6fec] px-[16px] duration-300 bg-transparent focus:outline-none hover:cursor-pointer"
                    >
                    Home
                </button>
                <button
                    id="pages-btn"
                    class="text-gray-300 hover:text-[#0f6fec] px-[16px] duration-300 bg-transparent focus:outline-none hover:cursor-pointer"
                    >
                    Pages
                </button>
                <button
                    id="account-btn"
                    class="text-gray-300 hover:text-[#0f6fec] px-[16px] duration-300 bg-transparent focus:outline-none hover:cursor-pointer"
                    >
                    Account
                </button>
                <button
                    id="my-network-btn"
                    class="text-gray-300 hover:text-[#0f6fec] px-[16px] duration-300 bg-transparent focus:outline-none hover:cursor-pointer"
                    >
                    My Network
                </button>
            </div>
        </div>

        <ul class="flex items-center">
            <li class="ml-2">
                <button
                    id="chat-btn"
                    class="size-[40px] flex items-center justify-center bg-[#202227] rounded-md group focus:outline-none hover:cursor-pointer"
                    >
                    <svg
                        stroke="currentColor"
                        class="text-gray-400 group-hover:text-white duration-300"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 16 16"
                        height="15"
                        width="15"
                        xmlns="http://www.w3.org/2000/svg"
                        >
                    <path
                        d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"
                        />
                    </svg>
                </button>
            </li>

            <li class="ml-2">
                <button
                    id="settings-btn"
                    class="size-[40px] flex items-center justify-center bg-[#202227] rounded-md group focus:outline-none hover:cursor-pointer"
                    >
                    <svg
                        stroke="currentColor"
                        class="text-gray-400 group-hover:text-white duration-300"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 16 16"
                        height="15"
                        width="15"
                        xmlns="http://www.w3.org/2000/svg"
                        >
                    <path
                        d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"
                        />
                    </svg>
                </button>
            </li>

            <li class="ml-2">
                <button
                    id="notification-btn"
                    class="size-[40px] flex items-center justify-center bg-[#202227] rounded-md group focus:outline-none hover:cursor-pointer"
                    >
                    <svg
                        stroke="currentColor"
                        class="text-gray-400 group-hover:text-white duration-300"
                        fill="currentColor"
                        stroke-width="0"
                        viewBox="0 0 16 16"
                        height="15"
                        width="15"
                        xmlns="http://www.w3.org/2000/svg"
                        >
                    <path
                        d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"
                        />
                    </svg>
                </button>
            </li>

            <li class="ml-2 relative">
                <button
                    id="open-user-dialog"
                    class="size-[40px] flex items-center justify-center bg-[#202227] rounded-md hover:cursor-pointer focus:outline-none"
                    >
                    <img
                        src='<c:url value="/public/images/dog-avatar.jpg"/>'
                        alt="User Profile"
                        class="w-10 h-10 rounded-md object-cover"
                        />
                </button>

                <div
                    id="user-dialog"
                    class="absolute right-0 w-64 mt-2 bg-[#0f0f10] border border-[#202227] rounded-md hidden z-50"
                    >
                    <div class="flex items-center space-x-3 p-4 pb-0">
                        <img
                            src='<c:url value="/public/images/dog-avatar.jpg"/>'
                            alt="User Profile"
                            class="w-12 h-12 rounded-full"
                            >
                        <div>
                            <div class="flex items-center">
                                <p class="font-semibold text-white mr-3">Khang Nguyễn</p>
                            </div>
                            <p class="text-sm text-gray-400">Web Developer at FSoft</p>
                        </div>
                    </div>

                    <div class="p-4">
                        <button
                            id="view-profile-btn"
                            class="block w-full py-[8px] rounded bg-[#0f6fec1a] text-sm font-medium text-[#0f6fec] hover:text-white hover:bg-[#0f6fec] hover:cursor-pointer duration-400"
                            >
                            View profile
                        </button>
                        <button
                            id="sign-out-btn"
                            class="flex items-center mt-3 space-x-3 text-gray-300 hover:text-blue-600 transition-all duration-300 bg-transparent focus:outline-none"
                            >
                            <svg
                                class="w-5 h-5"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
                                />
                            </svg>
                            <span>Sign Out</span>
                        </button>
                    </div>
                </div>
            </li>
        </ul>
    </nav>

    <!-- Script để xử lý tất cả sự kiện click -->
    <script>
        (function () {
            // Đóng gói logic trong IIFE để tránh xung đột
            const openUserDialogBtn = document.getElementById("open-user-dialog");
            const userDialog = document.getElementById("user-dialog");
            const viewProfileBtn = document.getElementById("view-profile-btn");
            const signOutBtn = document.getElementById("sign-out-btn");
            const homeBtn = document.getElementById("home-btn");
            const pagesBtn = document.getElementById("pages-btn");
            const accountBtn = document.getElementById("account-btn");
            const myNetworkBtn = document.getElementById("my-network-btn");
            const chatBtn = document.getElementById("chat-btn");
            const settingsBtn = document.getElementById("settings-btn");
            const notificationBtn = document.getElementById("notification-btn");

            // Xử lý mở/ẩn dialog
            if (openUserDialogBtn && userDialog) {
                openUserDialogBtn.addEventListener("click", (e) => {
                    e.preventDefault();
                    userDialog.classList.toggle("hidden");
                });

                document.addEventListener("click", (e) => {
                    if (
                            !openUserDialogBtn.contains(e.target) &&
                            !userDialog.contains(e.target)
                            ) {
                        userDialog.classList.add("hidden");
                    }
                });
            }

            // Xử lý điều hướng cho các nút
            if (viewProfileBtn) {
                viewProfileBtn.addEventListener("click", () => {
                    window.location.href = "/TripsExeWeb/pages/UserProfile.jsp";
                });
            }

            if (signOutBtn) {
                signOutBtn.addEventListener("click", () => {
                    // Thay thế "#" bằng đường dẫn thực tế nếu cần
                    window.location.href = "#";
                });
            }

            if (homeBtn) {
                homeBtn.addEventListener("click", () => {
                    window.location.href = "/TripsExeWeb/pages/HomePage.jsp";
                });
            }

            if (pagesBtn) {
                pagesBtn.addEventListener("click", () => {
                    window.location.href = "#";
                });
            }

            if (accountBtn) {
                accountBtn.addEventListener("click", () => {
                    window.location.href = "#";
                });
            }

            if (myNetworkBtn) {
                myNetworkBtn.addEventListener("click", () => {
                    window.location.href = "#";
                });
            }

            if (chatBtn) {
                chatBtn.addEventListener("click", () => {
                    window.location.href = "/TripsExeWeb/pages/ChattingPage.jsp";
                });
            }

            if (settingsBtn) {
                settingsBtn.addEventListener("click", () => {
                    window.location.href = "./SettingPage.jsp";
                });
            }

            if (notificationBtn) {
                notificationBtn.addEventListener("click", () => {
                    window.location.href = "#";
                });
            }
        })();
    </script>
</section>