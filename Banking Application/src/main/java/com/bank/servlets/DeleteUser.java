package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionID;

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
		String amount=req.getParameter("amt");
		double Amt=Double.parseDouble(amount);
		
		Customer admin=(Customer)session.getAttribute("customer");
		
		
		CustomerDAO cdao=new CustomerDAOImpl();
		TransactionDAO tdao=new TransactionDAOImpl();
		Customer c=cdao.getCustomer(UserAccount);
		
		Transaction t1=null;
		Transaction t2=null;
		
		
		if(c.getAccNum()!=admin.getAccNum()) {
			
			c.setAccNum(UserAccount);
			c.setBal(c.getBal()-Amt);
			
			boolean c_res=cdao.updateCustomer(c);
			if(c_res)
			{
				t1=new Transaction();
				t1.setTransactionId(TransactionID.generateTransactionId());
				t1.setUser(c.getAccNum());
				t1.setRec_acc(admin.getAccNum());
				t1.setTransaction("DEBITED");
				t1.setAmount(Amt);
				t1.setBalance(c.getBal());
				boolean res1=tdao.insertTransaction(t1);
			}
			admin.setBal(admin.getBal()+Amt);
			boolean receiver_res=cdao.updateCustomer(admin);
			if(receiver_res)
			{
				{
					t2=new Transaction();
					t2.setTransactionId(t1.getTransactionId());
					t2.setUser(admin.getAccNum());
					t2.setRec_acc(c.getAccNum());
					t2.setTransaction("CREDITED");
					t2.setAmount(Amt);
					t2.setBalance(admin.getBal());
					boolean res1=tdao.insertTransaction(t2);
				}
			}

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
