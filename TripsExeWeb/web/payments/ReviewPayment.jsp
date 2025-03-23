<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Review Your Payment</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f9f9f9;
                color: #333;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
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

            .pay-button {
                margin-top: 15px;
            }

            input[type="submit"] {
                padding: 10px 18px;
                font-size: 14px;
                cursor: pointer;
                background: linear-gradient(to right, #4caf50, #388e3c);
                color: white;
                border: none;
                border-radius: 6px;
                font-weight: bold;
                transition: background 0.3s ease, transform 0.2s ease;
            }

            input[type="submit"]:hover {
                background: linear-gradient(to right, #388e3c, #2e7d32);
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Review Your Payment</h2>
            <form action="execute_payment" method="POST">
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />

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

                <div class="pay-button">
                    <input type="submit" value="Pay Now" />
                </div>
            </form>
        </div>
    </body>
</html>
