package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    // Collecting data from the user
	    String name = req.getParameter("name");
	    String phoneNumber = req.getParameter("phone");
	    long phone = Long.parseLong(phoneNumber);
	    String email = req.getParameter("mail");
	    String pin = req.getParameter("pin");
	    int Pin = Integer.parseInt(pin);
	    String cnfpin = req.getParameter("cnfpin");
	    int confirmPin = Integer.parseInt(cnfpin);

	    Customer c = new Customer();
	    CustomerDAO cdao = new CustomerDAOImpl();

	    if (Pin == confirmPin) {
	        c.setName(name);
	        c.setPhone(phone);
	        c.setMail(email);
	        c.setPin(Pin);

	        boolean isInserted = cdao.insertCustomer(c);
	        
	        if (isInserted) {
	            // Retrieve the generated account number
	            Customer c1 = cdao.getCustomer(phone, email);
	            long accountNumber=c1.getAccNum();
	            
	            if (accountNumber > 0) { // If valid account number retrieved
	                req.setAttribute("success", "Signup Successful");
	                req.setAttribute("accountNumber", accountNumber); // Store account number in request scope
	            } else {
	                req.setAttribute("failure", "Failed to retrieve account number.");
	            }
	            
	            RequestDispatcher rd = req.getRequestDispatcher("SignUp.jsp");
	            rd.forward(req, resp);
	        } else {
	            req.setAttribute("failure", "Signup failed!");
	            RequestDispatcher rd = req.getRequestDispatcher("SignUp.jsp");
	            rd.forward(req, resp);
	        }
	    } else {
	        req.setAttribute("failure", "PIN and Confirm PIN do not match!");
	        RequestDispatcher rd = req.getRequestDispatcher("SignUp.jsp");
	        rd.forward(req, resp);
	    }
	}


}
