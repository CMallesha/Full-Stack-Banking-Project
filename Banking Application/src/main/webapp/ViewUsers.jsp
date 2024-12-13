<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@page import="com.bank.dao.CustomerDAOImpl"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Bank Application</title>
<style>
    /* General Page Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4f8;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h1 {
        text-align: center;
        margin: 20px 0;
        font-size: 2.5rem;
        color: #1e2957;
    }

    p.description {
        text-align: center;
        font-size: 1.2rem;
        margin: 0 0 30px 0;
        color: #555;
    }

    .container {
        width: 80%;
        margin: 0 auto;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 16px;
        font-family: Arial, sans-serif;
        text-align: left;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    /* Table Header */
    thead {
        background-color: #1e2957;
        color: #ffffff;
        text-transform: uppercase;
        font-weight: bold;
        letter-spacing: 0.1em;
    }

    thead th {
        padding: 12px;
    }

    /* Table Rows */
    td, th {
        padding: 12px 15px;
        border-bottom: 1px solid #ddd;
    }

    tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #dbe6fd;
        cursor: pointer;
    }

    /* Button Styling */
    input[type="submit"] {
        background-color: #ff4d4d;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 6px 12px;
        font-size: 14px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #cc0000;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Admin Dashboard</h1>
    <p class="description">Welcome to the Bank Application Admin Panel.</p>
    <p class="description">Here, you can view all registered users and manage them by deleting accounts when necessary.</p>
    
    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Balance</th>
                <th>Actions</th>
            </tr>
        </thead>
        <% 
            Customer c=(Customer)session.getAttribute("customer");
            CustomerDAO cdao = new CustomerDAOImpl(); 
            ArrayList<Customer> customerslist = (ArrayList<Customer>)cdao.getCustomer();
            Iterator<Customer> it = customerslist.iterator();
        %>
        <tbody>
            <% while (it.hasNext()) { 
                Customer s = it.next();
            %>
            <tr>
                <td><%= s.getAccNum() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getPhone() %></td>
                <td><%= s.getMail() %></td>
                <td><%= s.getBal() %></td>
                <td>
                    <form action="delete" method="post">
                        <input type="hidden" name="id" value="<%= s.getAccNum() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
