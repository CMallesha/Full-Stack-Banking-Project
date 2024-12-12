<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #374785;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }

        .transfer-container {
            max-width: 600px;
            background: #ffffff;
            border-radius: 8px;
            display: flex;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .left-section {
            background-color: #5063f0;
            color: #ffffff;
            padding: 40px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .left-section img {
            width: 100px;
            margin-bottom: 20px;
        }

        .right-section {
            padding: 40px;
            flex: 1;
        }

        .form-label {
            color: #374785;
            font-weight: bold;
        }

        .btn-custom {
            background-color: #f0ad4e;
            color: #ffffff;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
        }

        .btn-custom:hover {
            background-color: #e9963f;
        }

        .form-header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #374785;
            margin-bottom: 20px;
        }

        .sucs {
            text-align: center;
            color: brown;
            font-weight: bold;
        }

        .fail {
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="transfer-container">
            <div class="left-section">
                <img src="https://cdn-icons-png.flaticon.com/512/4291/4291676.png" alt="Bank Transfer Icon">
                <h2>Transfer Money</h2>
                <p>Securely transfer funds to other accounts instantly.</p>

                <% String transferSuccess = (String) request.getAttribute("transferSuccess"); %>
                <% if (transferSuccess != null) { %>
                <h5 class="sucs"><%= transferSuccess %></h5>
                <% } %>

                <% String transferFailure = (String) request.getAttribute("transferFailure"); %>
                <% if (transferFailure != null) { %>
                <h5 class="fail"><%= transferFailure %></h5>
                <% } %>

            </div>
            <div class="right-section">
                <h1 class="form-header">Fill in the details</h1>
                <form action="transfer" method="POST">
                    <div class="mb-3">
                        <label for="beneficiaryAccount" class="form-label">Beneficiary Account Number</label>
                        <input type="text" class="form-control" id="beneficiaryAccount" name="beneficiaryAccount" placeholder="Enter beneficiary account number" required>
                    </div>
                    <div class="mb-3">
                        <label for="beneficiaryName" class="form-label">Beneficiary Name</label>
                        <input type="text" class="form-control" id="beneficiaryName" name="beneficiaryName" placeholder="Enter beneficiary name" required>
                    </div>
                    <div class="mb-3">
                        <label for="amount" class="form-label">Transfer Amount</label>
                        <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter the amount to transfer" required>
                    </div>
                    <div class="mb-3">
                        <label for="beneficiarypin" class="form-label">User Pin</label>
                        <input type="password" class="form-control" id="userpin" name="userpin" placeholder="Enter your pin" required>
                    </div>
                    <button type="submit" class="btn btn-custom">Transfer</button>
                </form>
                <div class="text-center mt-3">
                    <a href="Dashboard.jsp" class="text-decoration-none" style="color: #374785; font-weight: bold;">&#8592; Back to Dashboard</a>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
    