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
                font-family: 'Segoe UI', 'Arial', sans-serif;
                background-color: #1c2526;
                color: #b0b7b8;
                width: 100%;
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            .container {
                background: #252f31;
                padding: 20px;
                border-radius: 16px;
                box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.6);
                text-align: center;
                width: 90%;
                max-width: 320px;
                transition: transform 0.3s ease;
            }

            .container:hover {
                transform: translateY(-5px);
            }

            h1 {
                font-size: 20px;
                font-weight: 600;
                color: #d9534f;
                margin-bottom: 12px;
                letter-spacing: 0.3px;
            }

            p {
                font-size: 14px;
                color: #b0b7b8;
                margin-bottom: 15px;
                line-height: 1.5;
            }

            .back-button {
                display: inline-block;
                padding: 10px 20px;
                font-size: 13px;
                font-weight: 600;
                text-decoration: none;
                background: #1a73e8;
                color: #ffffff;
                border-radius: 8px;
                transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
                letter-spacing: 0.5px;
            }

            .back-button:hover {
                background: #1557b0;
                transform: translateY(-3px);
                box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
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