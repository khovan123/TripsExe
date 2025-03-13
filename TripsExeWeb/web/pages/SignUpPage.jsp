<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
            }

            input[type="checkbox"] {
                appearance: none;
                -webkit-appearance: none;
                width: 14px;
                height: 14px;
                background-color: #4a4a4a;
                border: 1px solid #666;
                border-radius: 3px;
                cursor: pointer;
                position: relative;
            }

            input[type="checkbox"]:checked {
                background-color: #155DFC;
                border-color: #155DFC;
            }

            input[type="checkbox"]:checked::after {
                content: "✓";
                color: white;
                font-size: 10px;
                font-weight: 700;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body class="bg-[#191A1F] flex items-center justify-center min-h-screen">
        <div class="bg-[#141519] p-12 rounded-md shadow-lg w-full max-w-md text-center border-1 border-[#303135] flex flex-col gap-6">
            <h2 class="text-white font-bold text-4xl">Sign up</h2>
            <p class="text-gray-400 text-base">
                Already have an account? <a href="signInPage.jsp" class="text-blue-500 hover:underline">Sign in here</a>
            </p>
            <form class="flex flex-col gap-6">
                <div class="relative">
                    <input type="email" placeholder="Enter your email" class="w-full bg-[#191A1F] text-white rounded-md focus:outline-none border-1 border-[#303135] px-5 py-2 focus:border-blue-500 text-lg placeholder:text-[#ccc]" required>
                    <p class="text-[#ccc] text-sm text-left mt-1">We'll never share your email with anyone else.</p>
                </div>
                <div class="">
                    <input type="password" placeholder="Enter new password" class="w-full bg-[#191A1F] text-white rounded-md focus:outline-none border-1 border-[#303135] px-5 py-2 focus:border-blue-500 text-lg placeholder:text-[#ccc]" required>
                </div>
                <div class="">
                    <p class="text-[#ccc] text-left text-sm pb-5">Easy peasy!</p>
                    <input type="password" placeholder="Confirm password" class="w-full bg-[#191A1F] text-white rounded-md focus:outline-none border-1 border-[#303135] px-5 py-2 focus:border-blue-500 text-lg placeholder:text-[#ccc]" required>
                </div>
                <div class="flex justify-between items-center text-gray-400 text-xs">
                    <label class="flex items-center text-base">
                        <input type="checkbox" name="remember" class="mr-2">
                        Keep me signed in
                    </label>
                </div>
                <button type="submit" class="w-full text-white p-2 rounded-md bg-blue-500">Sign me up</button>
            </form>
            <p class="text-[#ccc] text-base">© 2025 All rights reserved</p>
        </div>
    </body>
</html>
