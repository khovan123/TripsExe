<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
            text-align: left;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
        }
        h2 {
            text-align: center;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
        }
        .back-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        a {
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
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