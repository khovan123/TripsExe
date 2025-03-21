<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Review Your Payment</title>
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
            .pay-button {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Please Review Before Paying</h2>
            <form action="execute_payment" method="POST">
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />

                <table>
                    <tr>
                        <th colspan="2">Transaction Details</th>
                        <td input type="hidden" name="paymentId" value="${param.paymentId}"></td>
                        <td input type="hidden" name="PayerID" value="${param.PayerID}"></td>
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

                    <tr>
                        <th colspan="2">Shipping Address</th>
                    </tr>
                    <tr>
                        <td>Recipient Name:</td>
                        <td>${shippingAddress.recipientName}</td>
                    </tr>
                    <tr>
                        <td>Line 1:</td>
                        <td>${shippingAddress.line1}</td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>${shippingAddress.city}</td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td>${shippingAddress.state}</td>
                    </tr>
                    <tr>
                        <td>Country Code:</td>
                        <td>${shippingAddress.countryCode}</td>
                    </tr>
                    <tr>
                        <td>Postal Code:</td>
                        <td>${shippingAddress.postalCode}</td>
                    </tr>
                </table>

                <div class="pay-button">
                    <input type="submit" value="Pay Now" />
                </div>
            </form>
        </div>
    </body>
</html>
