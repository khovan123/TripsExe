<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Package Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .package-details {
            width: 60%;
        }
        .order-summary {
            width: 35%;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }
        .package-details h2, .order-summary h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .order-summary p {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            margin: 10px 0;
        }
        .order-summary p.total {
            font-weight: bold;
            font-size: 16px;
            border-top: 1px solid #ddd;
            padding-top: 10px;
        }
        .secure-checkout {
            display: flex;
            align-items: center;
            font-size: 12px;
            color: #555;
            margin-top: 10px;
        }
        .secure-checkout::before {
            content: "🔒";
            margin-right: 5px;
        }
        .save-btn {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        .save-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Package Details Section -->
        <div class="package-details">
            <h2>Select Package</h2>
            <form action="authorize_payment" method="POST">
                <div class="form-group">
                    <label for="amount">Price of Package (USD) *</label>
                    <input type="text" id="amount" name="ammount" value="27.00" readonly required>
                </div>
                <div class="form-group">
                    <label for="packageDescription">Package Description *</label>
                    <input type="text" id="packageDescription" name="packageDescription" value="Social - Network & Commumnication" readonly required>
                </div>
                <button type="submit" class="save-btn">Proceed to Payment</button>
            </form>
        </div>

        <!-- Order Summary Section -->
        <div class="order-summary">
            <h2>Order Summary</h2>
            <p>
                <span>Social - Network & Comm...</span>
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
            <div class="secure-checkout">Secure checkout</div>
        </div>
    </div>
</body>
</html>