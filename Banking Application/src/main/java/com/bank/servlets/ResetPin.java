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

@WebServlet("/resetPin")
public class ResetPin extends HttpServlet {
   
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//creating session
		HttpSession session=req.getSession(false);
		Customer c=(Customer)session.getAttribute("customer");
		CustomerDAO cdao=new CustomerDAOImpl();
		
		//grtting data from the UI
		String phone=req.getParameter("phone");
		String newpin=req.getParameter("newPin");
		String cnfnewpin=req.getParameter("confirmPin");
		
		//converting to java datatypes
		long PhoneNum=Long.parseLong(phone);
		int NEWPIN=Integer.parseInt(newpin);
		int CNFPIN=Integer.parseInt(cnfnewpin);
		
		if(c.getPhone()==PhoneNum && NEWPIN==CNFPIN) {
			c.setPin(CNFPIN);
			boolean res=cdao.updateCustomer(c);
			
			if(res) {
				req.setAttribute("resetsuccuess", "Pin Reset Successfull login with New Pin");
				RequestDispatcher rd=req.getRequestDispatcher("ResetPin.jsp");
				rd.forward(req, resp);
			}else {
				req.setAttribute("resetfailed", "Reset pin failed");
				RequestDispatcher rd=req.getRequestDispatcher("ResetPin.jsp");
				rd.forward(req, resp);
			}
			
		}else {
			req.setAttribute("resetfail", "Reset pin failed due to data mismatch!");
			RequestDispatcher rd=req.getRequestDispatcher("ResetPin.jsp");
			rd.forward(req, resp);
		}
		
	}
}
