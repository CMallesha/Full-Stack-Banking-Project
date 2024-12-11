package com.bank.servlets;

import java.io.IOException;

import com.bank.dto.TransactionID;
import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deposit")
public class Deposit extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//accesing the session 
		HttpSession session=req.getSession(false);
		
		//collecting data from the user
		String acccount=req.getParameter("accountNumber");
		String amount=req.getParameter("amount");
		
		//converting to java datatypes
		long AccNumber=Long.parseLong(acccount);
		double Amount=Double.parseDouble(amount);
		
		CustomerDAO cdao=new CustomerDAOImpl();
		TransactionDAO tdao=new TransactionDAOImpl();
		Customer c=(Customer)session.getAttribute("customer");	//getting data from session and storing in c variable
		
		if(AccNumber==c.getAccNum()) {
		c.setBal(c.getBal()+Amount);
		boolean res=cdao.updateCustomer(c);
		if(res){
			
			 req.setAttribute("deposited", "Amount "+Amount+" has been added Successfully! And Your Updated Balance is: "+c.getBal());
			 RequestDispatcher rd=req.getRequestDispatcher("Deposit.jsp");
			 rd.forward(req, resp);
			 
		 Transaction t=new Transaction();
		 
		 t.setTransactionId(TransactionID.generateTransactionId());
		 t.setUser(c.getAccNum());
		 t.setRec_acc(c.getAccNum());
		 t.setTransaction("CREDITED");
		 t.setAmount(Amount);
		 t.setBalance(c.getBal());
		 boolean res1=tdao.insertTransaction(t);
		 if(res1)
		 {
//			 implemt here recent transactions
			 session.setAttribute("transaction", t);
			 RequestDispatcher rdp1=req.getRequestDispatcher("Profile.jsp");
			 rdp1.forward(req, resp);
		 }
		 else
		 {
//			 implemet here recent tramsaction
			 req.setAttribute("Tranasctionfail", "Amount "+Amount+" has been failed to Deposit! try again");
			 RequestDispatcher rdp2=req.getRequestDispatcher("Deposit.jsp");
			 rdp2.forward(req, resp);
		 }
		 }
		}else {
			 req.setAttribute("depositfail", "Amount "+Amount+" has been failed to Deposit! try again");
			 RequestDispatcher rd=req.getRequestDispatcher("Deposit.jsp");
			 rd.forward(req, resp);

	}

}
}
