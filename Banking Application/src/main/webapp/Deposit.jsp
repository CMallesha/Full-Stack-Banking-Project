<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Deposit</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #374785;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }

        .deposit-container {
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
        .sucs{
            text-align: center;
            color: brown;
            font-weight: bold;
        }
        .fail{
            text-align: center;
            color: red;
            font-weight: bold;
        }
        footer {
        background-color: #242426; /* Dark blue background */
        color: white; /* White text */
        text-align: center; /* Center align the text */
        padding: 15px 0; /* Top and bottom padding */
        font-size: 14px; /* Font size */
        position: fixed; /* Make the footer stick to the bottom */
        left: 0;
        width: 100%;
        bottom: 0;
        box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* Shadow for better visual effect */
    }

    footer a {
        color: #ffd700; /* Gold color for links */
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline; /* Underline on hover */
    }
    </style>
</head>

<body>
    <div class="container">
        <div class="deposit-container">
            <div class="left-section">
                <img src="https://c8.alamy.com/comp/2BWPYX6/deposit-icon-simple-element-from-banking-collection-creative-deposit-icon-for-web-design-templates-infographics-and-more-2BWPYX6.jpg"
                    alt="Bank Icon">
                <h2>Deposit Money</h2>
                <p>Securely add funds to your account in minutes.</p>
                
            <%String Success=(String)request.getAttribute("deposited");%>
            <%if(Success!=null) {%>
            <h5 class="sucs"><%=Success %></h5>
            <%} %>
            
            <%String Failure=(String)request.getAttribute("depositfail");%>
            <%if(Failure!=null) {%>
            <h5 class="fail"><%=Failure %></h5>
            <%} %>
            
            </div>
            <div class="right-section">
                <h2 class="form-header">Fill in the details</h2>
                <form action="deposit" method="POST">
                    <div class="mb-3">
                        <label for="accountNumber" class="form-label">Account Number</label>
                        <input type="text" class="form-control" id="accountNumber" name="accountNumber"
                            placeholder="Enter your account number" required>
                    </div>
                    <div class="mb-3">
                        <label for="amount" class="form-label">Deposit Amount</label>
                        <input type="number" class="form-control" id="amount" name="amount"
                            placeholder="Enter the amount to deposit" required>
                    </div>
                    <button type="submit" class="btn btn-custom">Deposit</button>
                </form>
                <div class="text-center mt-3">
                    <a href="Dashboard.jsp" class="text-decoration-none" style="color: #374785; font-weight: bold;">&#8592; Back to Dashboard</a>

                </div>
                
            </div>
        </div>
    </div>
    
    <footer>
    © 2024 MSpace Bank. All rights reserved.
   </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>