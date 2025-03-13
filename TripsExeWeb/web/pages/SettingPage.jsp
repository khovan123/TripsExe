<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Settings</title>
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
                --bs-border-color: #4b5563; /* Default Tailwind gray-600 */
            }

            .btn-dashed {
                background: linear-gradient(90deg, var(--bs-border-color) 50%, transparent 50%),
                    linear-gradient(0deg, var(--bs-border-color) 50%, transparent 50%),
                    linear-gradient(90deg, var(--bs-border-color) 50%, transparent 50%),
                    linear-gradient(0deg, var(--bs-border-color) 50%, transparent 50%);
                background-repeat: repeat-x, repeat-y, repeat-x, repeat-y;
                background-size: 10px 2px, 2px 10px, 10px 2px, 2px 10px;
                background-position: left top, right top, left bottom, left top;
                padding: 12px 16px;
                display: inline-block; /* Ensure the link behaves like a button */
                text-decoration: none; /* Remove underline */
                color: #1e90ff; /* Match Tailwind blue-400 */
                transition: color 0.3s; /* Smooth color transition */
            }

            .btn-dashed:hover {
                animation: border-dance 4s infinite linear;
                text-decoration: none; /* Prevent underline on hover */
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
    <body class="bg-[#191A1F] text-gray-200 min-h-screen flex px-48 py-4">
        <div class="m-4 flex flex-col gap-8 h-screen">
            <div class="bg-[#141519] pt-5 rounded border-2 border-[#303135]">
                <nav class="flex flex-col gap-2 px-5">
                    <a href="#account-settings" class="flex items-center p-2 bg-[#0F6FEC]/25 text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">👤</span> Account
                    </a>
                    <a href="#notifications" class="flex items-center p-2 text-[#ddd] hover:text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">🔔</span> Notification
                    </a>
                    <a href="#privacy-safety" class="flex items-center p-2 text-[#ddd] hover:text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">🔒</span> Privacy and safety
                    </a>
                    <a href="#communications" class="flex items-center p-2 text-[#ddd] hover:text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">📞</span> Communications
                    </a>
                    <a href="#messaging" class="flex items-center p-2 text-[#ddd] hover:text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">💬</span> Messaging
                    </a>
                    <a href="#close-account" class="flex items-center p-2 text-[#ddd] hover:text-[#0F6FEC] font-bold rounded px-4">
                        <span class="mr-2">🗑️</span> Close account
                    </a>
                </nav>
                <a href="#" class="block text-center border-t-2 border-[#303135] py-2 text-sm">View profile</a>
            </div>
            <div class="text-[#ccc] text-xs text-center text-base">
                <p>
                    <a href="#" class="hover:underline">About</a>
                    <a href="#" class="ml-2 hover:underline">Settings</a>
                    <a href="#" class="ml-2 hover:underline">Support</a>
                    <a href="#" class="ml-2 hover:underline">Docs</a>

                </p>
                <p>
                    <a href="#" class="ml-2 hover:underline">Help</a>
                    <a href="#" class="ml-2 hover:underline">Privacy & terms</a>

                </p>
                <p></p>
                <p class="mt-2">©2025</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="flex-1 m-4 p-5 overflow-y-auto bg-[#141519] border-2 border-[#303135] rounded">
            <!-- Account Settings Section -->
            <jsp:include page="../components/setting/AccountSection.jsp"/>

            <!-- Delete Account Section -->
            <jsp:include page="../components/setting/CloseAccountSection.jsp"/>

            <!-- Privacy and Safety Section -->
            <jsp:include page="../components/setting/PrivacySection.jsp"/>
        </div>
    </body>
</html>
