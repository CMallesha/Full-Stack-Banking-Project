<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;   
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 240px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #1e2957;
            color: white;
            padding: 20px;
        }

        .sidebar .nav-link {
            color: #ccc;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
            display: flex;
            align-items: center;
        }

        .sidebar .nav-link:hover {
            background-color: #2d3e89;
            color: white;
        }

        .sidebar .nav-link i {
            margin-right: 10px;
        }

        /* Navbar */
        .navbar {
           margin-left: 240px;
           background-color: #ffffff;
           border-bottom: 1px solid #ddd;
        }

       /* Navbar Brand */
        .navbar .navbar-brand {
           color: #1e2957;
           font-weight: bold;
        }

         /* Navbar Links */
         .navbar .nav-item {
            margin-right: 20px; /* Adds spacing between navbar items */
        }

         .navbar .nav-item .nav-link {
            margin-right: 10px;
            color: #666;
         }

          /* Navbar Buttons */
          .navbar .nav-item .btn {
              padding: 6px 15px;
              border-radius: 20px;
              font-size: 14px;
         }

       .btn-profile {
            background-color: #1e2957;
            color: white;
            border: none;
        }

        .btn-profile:hover {
            background-color: #2d3e89;
        }

        .btn-logout {
            background-color: #f44336;
            color: white;
            border: none;
        }

        .btn-logout:hover {
            background-color: #d32f2f;
        }

        /* Main Section */
        .main-content {
            margin-left: 240px;
            padding: 20px;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #f8aa27;
            color: white;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-body h5 {
            font-size: 20px;
        }

        /* Footer */
       footer {
           margin-top: auto;
           padding: 20px;
           background-color: #ffffff;
           border-top: 1px solid #ddd;
           text-align: center;
           font-size: 14px;
           color: #666;
      }
      .fail{
            text-align: center;
            color: red;
            font-weight: bold;
      }
      .recenttrans {
            color: white;
            font-weight: bold;
            background-color: #28a745; /* Green background */
            padding: 10px 20px; /* Adds space around the text */
            border-radius: 8px; /* Rounded corners */
            text-align: center; /* Centers the text */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Adds a subtle shadow */
            font-size: 1.5rem; /* Increases the font size */
            letter-spacing: 1px; /* Adds spacing between letters */
       }
    </style>
</head>

<body>

    <%Customer c=(Customer)session.getAttribute("customer"); %>
    <%Transaction t=(Transaction)session.getAttribute("tran"); %>
    
   <%TransactionDAO tdao=new TransactionDAOImpl();  
     ArrayList<Transaction> transList=(ArrayList<Transaction>)tdao.getTransaction(t.getUser());
     Iterator<Transaction> it=transList.iterator(); %>
     
   <%if(c.getAccNum()==1100110011){ %> 
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-white mb-4">Bank Dashboard</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="#"><i class="bi bi-speedometer2"></i> Admin Dashboard</a>
            <a class="nav-link" href="Deposit.jsp"><i class="bi bi-wallet2"></i> Deposit Money</a>
            <a class="nav-link" href="Withdraw.jsp"><i class="bi bi-graph-up"></i> Withdraw Money</a>
            <a class="nav-link" href="Transactions.jsp"><i class="bi bi-arrow-left-right"></i> Account Statements</a>
            <a class="nav-link" href="TransferAmt.jsp"><i class="bi bi-graph-up"></i> Transfer Amount</a>
            <a class="nav-link" href="UpdateAccount.jsp"><i class="bi bi-credit-card"></i> Update Account</a>
            <a class="nav-link" href="ResetPin.jsp"><i class="bi bi-gear"></i> Reset Your PIN</a>
        </nav>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Bank Application</a>
            
            <%String Failure=(String)request.getAttribute("failure");%>
            <%if(Failure!=null) {%>
            <h3 class="fail"><%=Failure %></h3>
            <%} %>
            
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="Profile.jsp"><button class="btn btn-profile">Profile</button></a>
                </li>
                
                <li class="nav-item">
                    <a href="ViewUsers.jsp"><button class="btn btn-profile">View Users</button></a>
                </li>
                
                <li class="nav-item">
                    <a href="ViewAllTransactions.jsp"><button class="btn btn-profile">View Transactions</button></a>
                </li>
                
                <li class="nav-item">
                <form action="logout" method="get">
                    <button class="btn btn-logout" name="logout" value="logout" type="submit">Logout</button>
                </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h3 class="mb-4">Welcome Admin, <%=c.getName()%></h3>

            <!-- Dashboard Cards -->
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Number</div>
                        <div class="card-body">
                            <h5><%=c.getAccNum() %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Net Balance</div>
                        <div class="card-body">
                            <h5><%=c.getBal() %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Type of Account</div>
                        <div class="card-body">
                            <h5>Savings Account</h5>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Transaction Table -->
            
     <%TransactionDAO atdao=new TransactionDAOImpl();  
     ArrayList<Transaction> atransList=(ArrayList<Transaction>)tdao.getTransaction();
     Iterator<Transaction> ait=atransList.iterator(); %>
            <div class="mt-4">
                <h4 class="recenttrans">Last Five Recent Transactions</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                                <th>Date</th>
                                <th>Transaction ID</th>
                                <th>UserAccount</th>
                                <th>RecverAccount</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Balance (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% int i=1;
                    while(ait.hasNext() && i<=5){
                          Transaction T=ait.next();
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
                     <% i++;
                        } 
                     %>       
                    </tbody>
                </table>
                <a href="Profile.jsp"><button class="btn btn-profile">View All</button></a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 BankName. All rights reserved.
    </footer>

    <!-- Bootstrap Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
    <%} else{%>
        <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-white mb-4">Bank Dashboard</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="#"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a class="nav-link" href="Deposit.jsp"><i class="bi bi-wallet2"></i> Deposit Money</a>
            <a class="nav-link" href="Withdraw.jsp"><i class="bi bi-graph-up"></i> Withdraw Money</a>
            <a class="nav-link" href="Transactions.jsp"><i class="bi bi-arrow-left-right"></i> Account Statements</a>
            <a class="nav-link" href="TransferAmt.jsp"><i class="bi bi-graph-up"></i> Transfer Amount</a>
            <a class="nav-link" href="UpdateAccount.jsp"><i class="bi bi-credit-card"></i> Update Account</a>
            <a class="nav-link" href="ResetPin.jsp"><i class="bi bi-gear"></i> Reset Your PIN</a>
        </nav>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Bank Application</a>
            
            <%String Failure=(String)request.getAttribute("failure");%>
            <%if(Failure!=null) {%>
            <h3 class="fail"><%=Failure %></h3>
            <%} %>
            
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="Profile.jsp"><button class="btn btn-profile">Profile</button></a>
                </li>
                <li class="nav-item">
                <form action="logout" method="get">
                    <button class="btn btn-logout" name="logout" value="logout" type="submit">Logout</button>
                </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h3 class="mb-4">Welcome, <%=c.getName()%></h3>

            <!-- Dashboard Cards -->
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Number</div>
                        <div class="card-body">
                            <h5><%=c.getAccNum() %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Net Balance</div>
                        <div class="card-body">
                            <h5><%=c.getBal() %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Type of Account</div>
                        <div class="card-body">
                            <h5>Savings Account</h5>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Transaction Table -->
            <div class="mt-4">
                <h4 class="recenttrans">Last Five Recent Transactions</h4>
                <table class="table table-bordered">
                    <thead>
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
                    <% int i=1;
                    while(it.hasNext() && i<=5){
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
                     <% i++;
                        } 
                     %>       
                    </tbody>
                </table>
                <a href="Profile.jsp"><button class="btn btn-profile">View All</button></a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 BankName. All rights reserved.
    </footer>

    <!-- Bootstrap Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
    
    <%} %>
</body>

</html>
    