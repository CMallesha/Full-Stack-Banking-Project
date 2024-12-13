package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//Session object creation
		HttpSession session=req.getSession();
	
		//collecting data from the user
		String AccNum=req.getParameter("accountNumber");
		String pin=req.getParameter("pin");
		
		//converting to java datatypes
		long AccNumber=Long.parseLong(AccNum);
		int Pin=Integer.parseInt(pin);
		
		//jdbc implementation
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(AccNumber, Pin);
				
		
		// store customer object to session and innitilize transaction new object simultaneoulsy store in session TRANSACTION ATTRIBUTE SETTING 
		
		  if(c!=null) 
		  {   
			  Transaction ts = new Transaction();
			  ts.setUser(c.getAccNum());
			  session.setAttribute("tran", ts);
			  session.setAttribute("customer", c);
			  RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			  rd.forward(req, resp);
		  } 
		  else
		  {		  
			  req.setAttribute("failure", "Failed to Login");
			  RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			  rd.forward(req, resp);
		  }

	
	}
	
}
