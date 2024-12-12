<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            max-width: 500px;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .icon {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #6c5ce7;
            color: #ffffff;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: -60px auto 20px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            font-size: 26px;
            color: #2d3436;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-custom {
            background-color: #6c5ce7;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-custom:hover {
            background-color: #5a4bcf;
            transform: scale(1.05);
        }

        .btn-light-custom {
            border: 1px solid #6c5ce7;
            color: #6c5ce7;
            border-radius: 8px;
            padding: 10px 20px;
            width: 100%;
            margin-top: 10px;
            background-color: transparent;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-light-custom:hover {
            background-color: #6c5ce7;
            color: white;
        }

        .back-to-dashboard {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-dashboard a {
            text-decoration: none;
            color: #6c5ce7;
            font-weight: bold;
        }

        .back-to-dashboard a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="icon">
        <i class="bi bi-person-circle" style="font-size: 40px;">👤</i>
    </div>
    <div class="form-header">
        <h2>Update Profile</h2>
    </div>
    <form action="/updateProfile" method="post">
        <!-- Account Number -->
        <div class="mb-3">
            <label for="accountNumber" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" placeholder="Enter your account number" required>
        </div>

        <!-- Full Name -->
        <div class="mb-3">
            <label for="fullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>

        <!-- Phone Number -->
        <div class="mb-3">
            <label for="phone" class="form-label">Phone Number</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
        </div>

        <!-- Update Button -->
        <div class="button-group">
            <button type="submit" class="btn btn-custom">Update</button>
            <button type="reset" class="btn btn-light-custom">Reset</button>
        </div>
    </form>
    <div class="back-to-dashboard">
        <a href="/dashboard">Back to Dashboard</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>