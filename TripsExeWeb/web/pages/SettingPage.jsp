<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        --bs-border-color: #4b5563; /* Default Tailwind gray-600 */
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
  <body class="bg-[#191A1F]">
    <jsp:include page="/components/NavigationBar.jsp" />

    <div class="px-[128px] pt-20 text-white min-h-fit flex">
      <aside
        class="w-1/4 h-fit mr-6 border border-[#202227] bg-[#141519] rounded-md"
      >
        <nav class="flex flex-col gap-2 p-5">
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/connections-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Account</span
            >
          </a>
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/notification-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Notification</span
            >
          </a>
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/privacy-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Privacy and safety</span
            >
          </a>
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/communication-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Communications</span
            >
          </a>
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/messaging-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Messaging</span
            >
          </a>
          <a
            href="#"
            class="flex items-center space-x-3 text-gray-300 hover:text-[#0f6fec] group"
          >
            <img
              src="./../public/images/navigation/close-icon.svg"
              class="w-[20px]"
            />
            <span
              class="font-bold text-white group-hover:text-[#0f6fec] duration-300"
              >Close account</span
            >
          </a>
        </nav>
        <a
          href="#"
          class="block text-center border-t-2 border-[#303135] py-2 text-sm"
          >View profile</a
        >
        <!-- <div class="text-[#ccc] text-xs text-center text-base">
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
        </div> -->
      </aside>

      <!-- Main Content -->
      <div
        class="w-3/4 p-5 overflow-y-auto bg-[#141519] border-2 border-[#303135] rounded"
      >
        <!-- Account Settings Section -->
        <jsp:include page="../components/setting/AccountSection.jsp" />

        <!-- Delete Account Section -->
        <jsp:include page="../components/setting/CloseAccountSection.jsp" />

        <!-- Privacy and Safety Section -->
        <jsp:include page="../components/setting/PrivacySection.jsp" />
      </div>
    </div>
  </body>
</html>
