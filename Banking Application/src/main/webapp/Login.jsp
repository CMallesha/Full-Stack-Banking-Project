<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3b4e9a;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            display: flex;
            background: #1e2957;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .left-section {
            padding: 40px;
            background: #2d3e89;
            color: white;
            text-align: center;
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .left-section img {
            width: 80px;
            margin-bottom: 20px;
        }

        .left-section h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .left-section p {
            font-size: 14px;
            color: #ccc;
            line-height: 1.5;
        }

        .right-section {
            padding: 40px;
            background: #ffffff;
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-control {
            border-radius: 8px;
            margin-bottom: 15px;
            height: 45px;
        }

        .btn-primary {
            background-color: #f8aa27;
            border: none;
            border-radius: 8px;
            padding: 12px;
        }

        .btn-primary:hover {
            background-color: #e09723;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #3b4e9a;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
        .sucs{
            text-align: center;
            color: green;
            font-weight: bold;
        }
        .fail{
            text-align: center;
            color: red;
            font-weight: bold;
        }
                /* Footer */
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
    <div class="login-container">
        <!-- Left Section -->
        <div class="left-section">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0iWsmy4Wl1XseUoHLLW8vBkahGkVbCeWvxw&s" alt="Bank Icon">
            <h3>Welcome Back!</h3>
            <p>Access your account securely with your account number and PIN.</p>
        </div>

        <!-- Right Section -->
        <div class="right-section">
            <h4 class="mb-4 text-center">Login to Your Account</h4>
            
            
            <%String Success=(String)request.getAttribute("success");%>
            <%if(Success!=null) {%>
            <h5 class="sucs"><%=Success %></h5>
            <%} %>
            
         <%String Failure=(String)request.getAttribute("failure");
         if(Failure!=null){%>
         <h3 class="fail"><%=Failure %></h3>
         <%}%>
         
            <form action="Login" method="post">
                <input type="text" class="form-control" placeholder="Enter your account number" name="accountNumber" required>
                <input type="password" class="form-control" placeholder="Enter your PIN" name="pin" required>
                <button type="submit" class="btn btn-primary w-100">Login</button>
                <div class="login-link mt-3">
                    <p>Don't have an account? <a href="SignUp.jsp">Sign up here</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
    <footer>
    © 2024 MSpace Bank. All rights reserved.
   </footer>
</html>

    