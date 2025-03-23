<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
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
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.6);
            width: 90%;
            max-width: 400px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .success-icon {
            width: 70px;
            height: 70px;
            background-color: #28a745;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 15px;
            position: relative;
            animation: pulse 1.5s infinite;
        }

        .success-icon::before {
            content: "✔";
            font-size: 36px;
            color: #ffffff;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(40, 167, 69, 0.4);
            }
            70% {
                box-shadow: 0 0 0 15px rgba(40, 167, 69, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(40, 167, 69, 0);
            }
        }

        .success-message {
            font-size: 20px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }

        .success-submessage {
            font-size: 13px;
            color: #b0b7b8;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        h2 {
            color: #ffffff;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            letter-spacing: 0.3px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            text-align: left;
            background: #2a3537;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #3a4445;
            font-size: 13px;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px 12px;
            border-bottom: 1px solid #3a4445;
        }

        th {
            background-color: #2f3b3d;
            font-weight: 600;
            color: #ffffff;
            text-align: center;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
        }

        td {
            color: #b0b7b8;
        }

        .back-button {
            margin-top: 10px;
        }

        a {
            padding: 10px 20px;
            font-size: 13px;
            text-decoration: none;
            background: #1a73e8;
            color: #ffffff;
            border-radius: 8px;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            display: inline-block;
            letter-spacing: 0.5px;
        }

        a:hover {
            background: #1557b0;
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon"></div>
        <div class="success-message">Your payment was successful</div>
        <div class="success-submessage">Thank you for your payment. We will be in contact with more details shortly.</div>
        <h2>Payment Receipt</h2>
        <table>
            <tr>
                <th colspan="2">Transaction Details</th>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${transaction.description}</td>
            </tr>
            <tr>
                <td>Subtotal:</td>
                <td>${transaction.amount.details.subtotal} USD</td>
            </tr>
            <tr>
                <td>Tax:</td>
                <td>${transaction.amount.details.tax} USD</td>
            </tr>
            <tr>
                <td><b>Total:</b></td>
                <td><b>${transaction.amount.total} USD</b></td>
            </tr>
            <tr>
                <th colspan="2">Payer Information</th>
            </tr>
            <tr>
                <td>First Name:</td>
                <td>${payer.firstName}</td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>${payer.lastName}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${payer.email}</td>
            </tr>
        </table>
        <div class="back-button">
            <a href="<%= request.getContextPath() %>/pages/HomePage.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>