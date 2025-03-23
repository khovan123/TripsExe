<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("error",null);
    session.setAttribute("success",null);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Account Settings</title>
        <!--<script src="https://unpkg.com/@tailwindcss/browser@4"></script>-->
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .custom-checkbox input[type="checkbox"] {
                appearance: none;
                -webkit-appearance: none;
                width: 14px;
                height: 14px;
                background-color: #4a4a4a;
                border: 1px solid #303135;
                border-radius: 3px;
                cursor: pointer;
                position: relative;
            }

            .custom-checkbox input[type="checkbox"]:checked {
                background-color: #1e90ff;
                border-color: #1e90ff;
            }

            .custom-checkbox input[type="checkbox"]:checked::after {
                content: "✓";
                color: white;
                font-size: 10px;
                font-weight: 900;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            :root {
                --bs-border-color: #4b5563;
            }

            .btn-dashed {
                background: linear-gradient(
                    90deg,
                    var(--bs-border-color) 50%,
                    transparent 50%
                    ),
                    linear-gradient(0deg, var(--bs-border-color) 50%, transparent 50%),
                    linear-gradient(90deg, var(--bs-border-color) 50%, transparent 50%),
                    linear-gradient(0deg, var(--bs-border-color) 50%, transparent 50%);
                background-repeat: repeat-x, repeat-y, repeat-x, repeat-y;
                background-size: 10px 2px, 2px 10px, 10px 2px, 2px 10px;
                background-position: left top, right top, left bottom, left top;
                padding: 12px 16px;
                display: inline-block;
                text-decoration: none;
                color: #1e90ff;
                transition: color 0.3s;
            }

            .btn-dashed:hover {
                animation: border-dance 4s infinite linear;
                text-decoration: none;
            }

            @keyframes border-dance {
                0% {
                    background-position: left top, right top, right bottom, left bottom;
                }
                100% {
                    background-position: right top, right bottom, left bottom, left top;
                }
            }
        </style>
    </head>
    <body class="bg-[#191A1F]">
        <jsp:include page="/components/NavigationBar.jsp" />

        <div class="px-[128px] pt-20 text-white min-h-fit flex">
            <aside class="w-1/4 h-fit mr-6 border-2 border-[#303135] bg-[#141519] rounded-md">
                <nav id="nav-container" class="flex flex-col gap-2 py-4">
                    <button
                        onclick="toggleOption(this)"
                        id="account-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/connections-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Account</span
                        >
                    </button>
                    <button
                        onclick="toggleOption(this)"
                        id="notify-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/notification-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Notification</span
                        >
                    </button>
                    <button
                        onclick="toggleOption(this)"
                        id="privacy-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/privacy-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Privacy and safety</span
                        >
                    </button>
                    <button
                        onclick="toggleOption(this)"
                        id="communicate-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/communication-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Communications</span
                        >
                    </button>
                    <button
                        onclick="toggleOption(this)"
                        id="message-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/messaging-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Messaging</span
                        >
                    </button>
                    <button
                        onclick="toggleOption(this)"
                        id="close-account-btn"
                        type="button"
                        class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group py-3 px-8"
                        >
                        <img
                            src="./../public/images/navigation/close-icon.svg"
                            class="w-[20px]"
                            />
                        <span
                            class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
                            >Close account</span
                        >
                    </button>
                </nav>
                <a
                    href="/TripsExeWeb/post-load-me"
                    class="font-semibold block text-center border-t-2 border-[#303135] py-4 hover:text-[#0f6fec]"
                    >View profile</a
                >
            </aside>

            <div id="component-setting" class="w-3/4 p-5 overflow-y-auto bg-[#141519] border-2 border-[#303135] rounded">
                <div id="account-section" class="section hidden">
                    <jsp:include page="../components/setting/AccountSection.jsp"/>
                </div>
                <div id="privacy-section" class="section hidden">
                    <jsp:include page="../components/setting/PrivacySection.jsp"/>
                </div>
                <div id="close-account-section" class="section hidden">
                    <jsp:include page="../components/setting/CloseAccountSection.jsp"/>
                </div>
            </div>
        </div>

        <script>
            const navEl = document.getElementById("nav-container");
            const allButtonEl = navEl.querySelectorAll("button");
            const componentSettingEl = document.getElementById("component-setting");
            const allSections = componentSettingEl.querySelectorAll(".section");

            function toggleOption(buttonEl) {
                for (let item of allButtonEl) {
                    item.classList.remove("bg-[#0f6fec]");
                    item.classList.add("hover:text-[#0f6fec]");
                    let textEl = item.querySelector("span");
                    textEl.classList.add("group-hover:text-[#0f6fec]");
                }

                buttonEl.classList.add("bg-[#0f6fec]");
                buttonEl.classList.remove("hover:text-[#0f6fec]");
                let buttonTextEl = buttonEl.querySelector("span");
                buttonTextEl.classList.remove("group-hover:text-[#0f6fec]");

                allSections.forEach(section => section.classList.add("hidden"));

                const sectionId = buttonEl.id.replace("-btn", "-section");
                const selectedSection = document.getElementById(sectionId) || document.getElementById("account-section");
                selectedSection.classList.remove("hidden");
            }

            document.getElementById("account-section").classList.remove("hidden");
            allButtonEl[0].classList.add("bg-[#0f6fec]");

            const messageContainer = document.getElementById("message-container");
            if (messageContainer.children.length > 0) {
                setTimeout(() => {
                    messageContainer.style.display = "none";
                }, 2000);
            }
        </script>
    </body>
</html>