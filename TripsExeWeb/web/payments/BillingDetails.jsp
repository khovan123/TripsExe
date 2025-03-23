<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', 'Arial', sans-serif;
            background-color: #1c2526;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .order-summary {
            width: 90%;
            max-width: 320px;
            background: #252f31;
            border-radius: 16px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.6);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .order-summary:hover {
            transform: translateY(-5px);
        }

        .order-summary h2 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #ffffff;
            letter-spacing: 0.3px;
        }

        .order-summary p {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            margin: 8px 0;
            color: #b0b7b8;
        }

        .order-summary p.total {
            font-weight: 600;
            font-size: 16px;
            border-top: 1px solid #3a4445;
            padding-top: 10px;
            color: #ffffff;
            margin-top: 10px;
        }

        .secure-checkout {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            color: #b0b7b8;
            margin-top: 10px;
        }

        .secure-checkout i {
            margin-right: 6px;
            color: #1a73e8;
            font-size: 13px;
        }

        .save-btn {
            background: #1a73e8;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
            width: 100%;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            letter-spacing: 0.5px;
        }

        .save-btn:hover {
            background: #1557b0;
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
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

        <form action="/TripsExeWeb/authorize-payment" method="POST">
            <input type="hidden" name="amount" value="27.00">
            <input type="hidden" name="packageDescription" value="Social - Network & Communication">
            <button type="submit" class="save-btn">Proceed to Payment</button>
        </form>
    </div>
</body>
</html>