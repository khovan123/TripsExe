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
            }
        </style>
    </head>
    <body>
        <main class="py-8 px-40 h-screen bg-[#191A1F]">
            <!-- Sidebar -->
            <section
                class="bg-[#141519] flex rounded-lg text-white h-[100%] border-1 border-[#303135]"
                >
                <aside class="w-1/4 border-r-1 border-[#303135]">
                    <div
                        class="flex justify-between items-center border-b-1 p-6 border-[#303135]"
                        >
                        <h2 class="text-lg font-bold">
                            Active chats
                            <span class="text-green-500 bg-[#132624] py-1 px-3 rounded-lg"
                                  >6</span
                            >
                        </h2>
                        <button class="text-blue-400">...</button>
                    </div>
                    <div class="p-5">
                        <div class="relative">
                            <input
                                type="text"
                                placeholder="Search for message"
                                class="w-full py-2 px-4 m-0 bg-[#191A1F]/50 rounded-md outline-none placeholder:text-gray-300 border-1 border-gray-500 focus:border-blue-500"
                                />
                            <span class="absolute right-2 top-1/2 -translate-y-1/2">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-search"
                                    >
                                <circle cx="11" cy="11" r="8" />
                                <path d="m21 21-4.3-4.3" />
                                </svg>
                            </span>
                        </div>
                    </div>
                    <ul class="px-5 py-3 flex flex-col gap-4">
                        <li
                            class="flex items-start bg-[#141E2E] rounded-md gap-2 px-5 py-2"
                            >
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Frances Guerrero</p>
                                <p class="text-sm text-gray-400">Frances sent a photo.</p>
                            </div>
                        </li>
                        <li
                            class="flex items-start bg-[#141E2E] rounded-md gap-2 px-5 py-2"
                            >
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Lori Ferguson</p>
                                <p class="text-sm text-gray-400">
                                    You missed a call from Carolyn 🤙
                                </p>
                            </div>
                        </li>
                        <li
                            class="flex items-start bg-[#141E2E] rounded-md gap-2 px-5 py-2"
                            >
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Samuel Bishop</p>
                                <p class="text-sm text-gray-400">
                                    Day sweetness why cordinally 😊
                                </p>
                            </div>
                        </li>
                        <li
                            class="flex items-start bg-[#141E2E] rounded-md gap-2 px-5 py-2"
                            >
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Dennis Barrett</p>
                                <p class="text-sm text-gray-400">Happy birthday🎂</p>
                            </div>
                        </li>
                        <li
                            class="flex items-start bg-[#141E2E] rounded-md gap-2 px-5 py-2"
                            >
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Judy Nguyen</p>
                                <p class="text-sm text-gray-400">Thank you!</p>
                            </div>
                        </li>
                    </ul>
                </aside>

                <!-- Main Chat Area -->
                <aside class="w-3/4 p-4 flex flex-col">
                    <div class="flex items-center justify-between pr-4 border-b-1 border-[#303135]">
                        <div class="grow flex items-start gap-2 mb-4">
                            <span>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="45"
                                    height="45"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="lucide lucide-user-round bg-red-500 rounded-full"
                                    >
                                <circle cx="12" cy="8" r="5" />
                                <path d="M20 21a8 8 0 0 0-16 0" />
                                </svg>
                            </span>
                            <div class="grow">
                                <p class="font-bold">Judy Nguyen</p>
                                <div
                                    class="text-sm text-gray-400 flex justify-start items-center"
                                    >
                                    <span>
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            viewBox="0 0 24 24"
                                            fill="#00C950"
                                            stroke="#00C950"
                                            stroke-width="0.75"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="lucide lucide-circle-small"
                                            >
                                        <circle cx="12" cy="12" r="6" />
                                        </svg>
                                    </span>
                                    <span class="pb-[4px]">online</span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <span>Call</span>
                        </div>
                    </div>
                    <div class="grow h-4/5 overflow-y-auto bg-[#141519] p-4 rounded">
                        <div class="flex flex-col gap-10">
                            <div class="flex items-start gap-2">
                                <span>
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="45"
                                        height="45"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="lucide lucide-user-round bg-red-500 rounded-full"
                                        >
                                    <circle cx="12" cy="8" r="5" />
                                    <path d="M20 21a8 8 0 0 0-16 0" />
                                    </svg>
                                </span>
                                <div>
                                    <p class="text-sm bg-[#202227] py-2 px-3 rounded-md">
                                        How promotion excellent curiosity yet attempted happiness
                                        Gay prosperous impression 🎉
                                    </p>
                                    <span class="text-xs text-gray-300">1:42 PM</span>
                                </div>
                            </div>
                            <div class="flex justify-end">
                                <div>
                                    <p class="text-sm bg-[#0F6FEC] py-2 px-3 rounded-md">
                                        Congratulations!
                                    </p>
                                    <span class="text-xs text-gray-300">1:52 PM</span>
                                </div>
                            </div>
                            <div class="flex items-start gap-2">
                                <span>
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="45"
                                        height="45"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="lucide lucide-user-round bg-red-500 rounded-full"
                                        >
                                    <circle cx="12" cy="8" r="5" />
                                    <path d="M20 21a8 8 0 0 0-16 0" />
                                    </svg>
                                </span>
                                <div>
                                    <p class="text-sm bg-[#202227] py-2 px-3 rounded-md">👋</p>
                                    <span class="text-xs text-gray-300">1:52 PM</span>
                                </div>
                            </div>
                            <div class="flex justify-end">
                                <div>
                                    <p class="text-sm bg-[#0F6FEC] py-2 px-3 rounded-md">
                                        And sir dare view but over man so at within mr to simple
                                        assure Mr disposing.
                                    </p>
                                    <span class="text-xs text-gray-300">1:52 PM</span>
                                </div>
                            </div>
                            <div class="flex items-start gap-2">
                                <span>
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="45"
                                        height="45"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="lucide lucide-user-round bg-red-500 rounded-full"
                                        >
                                    <circle cx="12" cy="8" r="5" />
                                    <path d="M20 21a8 8 0 0 0-16 0" />
                                    </svg>
                                </span>
                                <div>
                                    <p class="text-sm bg-[#202227] py-2 px-3 rounded-md">
                                        Traveling alteration impression 🎉 six all uncommonly
                                        Chamber hearing joy highest private.
                                    </p>
                                    <span class="text-xs text-gray-300">1:52 PM</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Message Input -->
                    <div class="flex items-center gap-2">
                        <input
                            type="text"
                            placeholder="Type a message"
                            class="flex-1 p-2 bg-gray-[#191A1F]/50 rounded-md outline-none border-1 border-gray-500 focus:border-blue-500 placeholder:text-gray-300"
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
</html>
