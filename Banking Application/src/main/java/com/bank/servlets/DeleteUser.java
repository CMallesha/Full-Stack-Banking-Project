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


@WebServlet("/delete")
public class DeleteUser extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
		
		//acces the session
		HttpSession session=req.getSession(false);
		
		//getting delete account num from viewuser.jsp 
		String uAccout=req.getParameter("accoutnumber");
		long UserAccount=Long.parseLong(uAccout);
		
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(UserAccount);
		
		if(c.getAccNum()!=1100110011) {
			boolean res=cdao.deleteCustomer(c);
			
				   if(res)
				   {
					   req.setAttribute("userdeleted","User data deleted successfully");
					   RequestDispatcher rd=req.getRequestDispatcher("ViewUsers.jsp");
					   rd.forward(req, resp);
				   }else {
					   req.setAttribute("failedtodelet","User data failed to delete");
					   RequestDispatcher rd=req.getRequestDispatcher("ViewUsers.jsp");
					   rd.forward(req, resp);
				   }

		}else {
			   req.setAttribute("failedtodeletadmin","Admin Account data can't  deleted");
			   RequestDispatcher rd=req.getRequestDispatcher("ViewUsers.jsp");
			   rd.forward(req, resp);
		}
		
		
		
	}

}
