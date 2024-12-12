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
import jakarta.servlet.http.HttpSession;


@WebServlet("/updateProfile")
public class UpdateAccount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
		//creating and accesing session here
		HttpSession session=req.getSession(false);
		
		//getting data from UI
		String accno=req.getParameter("accountNumber");
		String name=req.getParameter("fullName");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		
		//converting to java data types
		long AccNumber=Long.parseLong(accno);
		long PhoneNum=Long.parseLong(phone);
		
		//jdbc implementaion
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=(Customer)session.getAttribute("customer"); //getting data from session and store in c
		
		if(c.getAccNum()==AccNumber) {
			c.setName(name);
			c.setMail(email);
			c.setPhone(PhoneNum);
			
			boolean res=cdao.updateCustomer(c);
			if(res) {
				req.setAttribute("updatesuccuess", "User data updated Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
				rd.forward(req, resp);
			}else {
				req.setAttribute("updatefailed", "Update user Data failed");
				RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
				rd.forward(req, resp);
			}
			
		}else {
			req.setAttribute("updatefail", "Update user data failed due to data mismatch!");
			RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
			rd.forward(req, resp);
		}
		
		
		
		
	}

}
