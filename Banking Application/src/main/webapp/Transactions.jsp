<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dto.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .btn-profile {
            background-color: #1e2957;
            margin-bottom: 10px;
            color: white;
            border: none;
        }

        .btn-profile:hover {
            background-color: #2d3e89;
        }

        h2 {
            color: #343a40;
            text-shadow: 2px 2px 4px #ccc;
            background: linear-gradient(90deg, #6c757d, #495057);
            color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background: linear-gradient(45deg, #343a40, #495057);
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table td, .table th {
            vertical-align: middle;
            text-align: center;
        }

        /* Center the button */
        .center-btn-container {
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 20px; /* Space above the button */
          margin-bottom: 50px; /* Increased space between button and footer */
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

<%Transaction ct=(Transaction)session.getAttribute("tran"); %>

<%TransactionDAO tdao=new TransactionDAOImpl();  
  ArrayList<Transaction> transactionList=(ArrayList<Transaction>)tdao.getTransaction(ct.getUser());
  Iterator<Transaction> it=transactionList.iterator(); %>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Real-Time Transaction Details</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Transaction ID</th>
                        <th scope="col">UserAccount</th>
                        <th scope="col">RecverAccount</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Status</th>
                        <th scope="col">Balance (₹)</th>
                    </tr>                  
                </thead>
                <tbody>
                    <%while(it.hasNext()){
                      Transaction T=it.next();
                    %>
                        <tr>
                            <td><%=T.getDate() %></td>
                            <td><%=T.getTransactionId() %></td>
                            <td><%=T.getUser() %></td>
                            <td><%=T.getRec_acc() %></td>
                            <td><%=T.getAmount() %></td>
                            <td><span class="badge bg-success"><%=T.getTransaction() %></span></td>
                            <td><%=T.getBalance() %></td>
                        </tr>
                    <%} %>    
                </tbody>
            </table>
        </div>

        <!-- Centered Back to Home Button -->
        <div class="center-btn-container">
            <a href="Dashboard.jsp"><button class="btn btn-profile">Back to Home</button></a>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

<footer>
    © 2024 MSpace Bank. All rights reserved.
</footer>

</html>


