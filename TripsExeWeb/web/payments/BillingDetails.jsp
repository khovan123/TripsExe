<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .order-summary {
            width: 350px;
            background: linear-gradient(to bottom, #ffffff, #f8f9fa);
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 25px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .order-summary:hover {
            transform: scale(1.02);
        }

        .order-summary h2 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }

        .order-summary p {
            display: flex;
            justify-content: space-between;
            font-size: 15px;
            margin: 10px 0;
            color: #444;
        }

        .order-summary p.total {
            font-weight: bold;
            font-size: 18px;
            border-top: 2px solid #ddd;
            padding-top: 12px;
            color: #000;
        }

        .secure-checkout {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            color: #555;
            margin-top: 12px;
        }

        .secure-checkout i {
            margin-right: 6px;
            color: #28a745;
            font-size: 14px;
        }

        .save-btn {
            background: linear-gradient(to right, #28a745, #218838);
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 18px;
            width: 100%;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .save-btn:hover {
            background: linear-gradient(to right, #218838, #1e7e34);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="order-summary">
        <h2>Order Summary</h2>
        <p>
            <span>Social - Network & Communication</span>
            <span>$24.00</span>
        </p>
        <p>
            <span>Handling Fee:</span>
            <span>$3.00</span>
        </p>
        <p class="total">
            <span>Total:</span>
            <span>US$27.00</span>
        </p>
        <div class="secure-checkout">
            <i class="fas fa-lock"></i> Secure checkout
        </div>

        <form action="authorize_payment" method="POST">
            <input type="hidden" name="amount" value="27.00">
            <input type="hidden" name="packageDescription" value="Social - Network & Communication">
            <button type="submit" class="save-btn">Proceed to Payment</button>
        </form>
    </div>
</body>
</html>
