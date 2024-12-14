<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Application - Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .card {
            margin-top: 20px;
        }

        .back-btn {
            padding: 15px 25px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(45deg, #ff6f61, #ff3d29);
            border-radius: 12px;
            text-decoration: none;
            margin-top: 20px;
            display: block;
            width: fit-content;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            margin-left: auto;
            margin-right: auto;
        }

        .back-btn:hover {
            background: linear-gradient(45deg, #ff3d29, #ff6f61);
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .back-btn:active {
            transform: translateY(1px);
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

<%Customer c=(Customer)session.getAttribute("customer"); %>
<%Transaction t=(Transaction)session.getAttribute("tran"); %>

<%TransactionDAO tdao=new TransactionDAOImpl();  
  ArrayList<Transaction> transactionList=(ArrayList<Transaction>)tdao.getTransaction(t.getUser());
  Iterator<Transaction> it=transactionList.iterator(); %>

    <div class="container mt-5">
        <!-- Profile Header -->
        <div class="profile-header">
            <h1>Customer Profile</h1>
            <p>Hey! <%=c.getName()%> Welcome to your profile page</p>
        </div>

        <!-- Customer Information -->
        <div class="card shadow">
            <div class="card-body">
                <h5 class="card-title">Customer Information</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Name:</strong> <%=c.getName() %></p>
                        <p><strong>Email:</strong> <%=c.getMail() %> </p>
                        <p><strong>Pin:</strong> <%=c.getPin() %> </p>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Phone:</strong> <%=c.getPhone() %></p>
                        <p><strong>Account Number:</strong> <%=c.getAccNum()%></p>
                        <p><strong>Balance:</strong> <%=c.getBal() %> </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Transaction History -->
        <div class="card shadow">
            <div class="card-body">
                <h5 class="card-title">Transaction History</h5>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Date</th>
                                <th>Transaction ID</th>
                                <th>RecverAccount</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Balance (₹)</th> 
                            </tr>
                        </thead>
                        
                        <tbody>
                        
                        <%while(it.hasNext()){
                          Transaction T=it.next();
                        %>
                            <tr>
                                <td><%=T.getDate() %></td>
                                <td><%=T.getTransactionId() %></td>
                                <td><%=T.getRec_acc() %></td>
                                <td><%=T.getAmount() %></td>
                                <td><span class="badge bg-success"><%=T.getTransaction() %></span></td>
                                <td><%=T.getBalance() %></td>
                            </tr>
                          <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Back to Dashboard Button (Placed below the table) -->
        <a href="Dashboard.jsp" class="back-btn">Back to Dashboard</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <footer>
    © 2024 MSpace Bank. All rights reserved.
   </footer>
</html>
