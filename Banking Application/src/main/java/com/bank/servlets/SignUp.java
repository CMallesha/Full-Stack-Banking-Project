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
		
		//collecting data from the user
		String name=req.getParameter("name");
		String phoneNumber=req.getParameter("phone");
		  long phone=Long.parseLong(phoneNumber);
	    String email=req.getParameter("mail");
	    String pin=req.getParameter("pin");
	      int Pin=Integer.parseInt(pin);
	    String cnfpin=req.getParameter("cnfpin");
	      int confirmPin=Integer.parseInt(cnfpin);
	      
	   //jdbc implementaion
	      
	      Customer c=new Customer();
	      CustomerDAO cdao=new CustomerDAOImpl();
	      
	      if(Pin==confirmPin) {
	    	  c.setName(name);
	    	  c.setPhone(phone);
	    	  c.setMail(email);
	    	  c.setPin(Pin);
	    	  
	    	  boolean res=cdao.insertCustomer(c);
	    	  
	    	  if(res) {
	    		    req.setAttribute("success", "Signup Succesfull");
			    	RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
			    	rd.forward(req, resp);
	    	  }else {
			    	req.setAttribute("failure", "Signup failed!");
			    	RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
			    	rd.forward(req, resp);
	    	  }
	      }
	   
	
		
	}

}
