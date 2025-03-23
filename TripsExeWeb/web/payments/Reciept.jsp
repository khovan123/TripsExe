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
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 40%;
            max-width: 450px;
            text-align: center;
        }

        h2 {
            color: #222;
            font-size: 20px;
            margin-bottom: 15px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            text-align: left;
            background: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f7f7f7;
            font-weight: bold;
            color: #333;
            text-align: center;
        }

        td {
            color: #444;
        }

        .back-button {
            margin-top: 15px;
        }

        a {
            padding: 10px 18px;
            font-size: 14px;
            text-decoration: none;
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
            border-radius: 6px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
            display: inline-block;
        }

        a:hover {
            background: linear-gradient(to right, #0056b3, #003d82);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
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
