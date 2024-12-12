<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot PIN</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #74b9ff, #a29bfe);
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 400px;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .icon {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #0984e3;
            color: #ffffff;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin: -50px auto 15px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            font-size: 24px;
            color: #2d3436;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-custom {
            background-color: #0984e3;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            width: 100px;
        }

        .btn-custom:hover {
            background-color: #0652dd;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }

        /* Custom Button Styles */
        .btn-custom {
            background-color: #0984e3;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-align: center;
        }

        .btn-custom:hover {
            background-color: #0652dd;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .btn-custom:active {
            background-color: #04499e;
            transform: translateY(0);
        }

        .btn-custom a {
            color: white;
            text-decoration: none;
        }

        .btn-custom a:hover {
            text-decoration: none;
        }

        /* Back to Login Button Styles */
        .back-to-login a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e17055;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .back-to-login a:hover {
            background-color: #d35400;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .back-to-login a:active {
            background-color: #c0392b;
            transform: translateY(0);
        }

    </style>
</head>
<body>

<div class="container">
    <div class="icon">
        <i class="bi bi-key" style="font-size: 30px;">🔑</i>
    </div>
    <div class="form-header">
        <h2>Forgot PIN</h2>
    </div>
    <form action="/resetPin" method="post">
        <!-- New PIN -->
        <div class="mb-3">
            <label for="newPin" class="form-label">New PIN</label>
            <input type="password" class="form-control" id="newPin" name="newPin" placeholder="Enter new PIN" required>
        </div>

        <!-- Confirm New PIN -->
        <div class="mb-3">
            <label for="confirmPin" class="form-label">Confirm New PIN</label>
            <input type="password" class="form-control" id="confirmPin" name="confirmPin" placeholder="Confirm new PIN" required>
        </div>

        <div class="button-group">
            <button type="submit" class="btn btn-custom">Continue</button>
            <button type="button" class="btn btn-custom" >Cancel</button>
        </div>
    </form>
    <div class="back-to-login">
        <a href="/login">Back to Login</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
