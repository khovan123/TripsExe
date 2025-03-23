<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cancel Payment</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html, body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                color: #333;
                width: 100%;
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            .container {
                background: #ffffff;
                padding: 25px 30px;
                border-radius: 12px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 400px;
                max-width: 90%;
            }

            h1 {
                font-size: 22px;
                color: #d9534f;
                margin-bottom: 15px;
            }

            p {
                font-size: 16px;
                color: #555;
                margin-bottom: 20px;
            }

            .back-button {
                display: inline-block;
                padding: 12px 18px;
                font-size: 14px;
                font-weight: bold;
                text-decoration: none;
                background: linear-gradient(to right, #dc3545, #b52b37);
                color: white;
                border-radius: 6px;
                transition: background 0.3s ease, transform 0.2s ease;
            }

            .back-button:hover {
                background: linear-gradient(to right, #b52b37, #8e1e28);
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Payment Cancelled</h1>
            <p>Your payment has been cancelled. If this was a mistake, you can try again.</p>
            <a href="<%= request.getContextPath()%>/pages/HomePage.jsp" class="back-button">Back to Home</a>
        </div>
    </body>
</html>
