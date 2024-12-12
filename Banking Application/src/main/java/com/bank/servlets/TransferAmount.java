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


@WebServlet("/transfer")
public class TransferAmount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	   //Creating sesion
		HttpSession session=req.getSession(false);
		Customer c=(Customer)session.getAttribute("customer");
		Transaction t=(Transaction)session.getAttribute("trans");
		
		//Collecting data from the user interface
		String bnfName=req.getParameter("beneficiaryName");
		String bnfaccnum=req.getParameter("beneficiaryAccount");
		String amt=req.getParameter("amount");
		String upin=req.getParameter("userpin");
		
		//converting to java datatypes
		long BnfAccNum=Long.parseLong(bnfaccnum);
		double Amount=Double.parseDouble(amt);
		int Pin=Integer.parseInt(upin);
		
		//jbdc implementation
		CustomerDAO cdao=new CustomerDAOImpl();
		TransactionDAO tdao=new TransactionDAOImpl();
		
		//two transactions should generate
		Transaction t1=null;   //sender
		Transaction t2=null;   //rcvr
		
		Customer receiver=cdao.getCustomer(BnfAccNum);  //getting information of reciver
		
		
		if(c.getAccNum()!=receiver.getAccNum() && c.getBal()>0 && c.getBal()>=Amount && Amount>0) {
			
			if(Pin==c.getPin()) {
				c.setBal(c.getBal()-Amount);
				boolean c_res=cdao.updateCustomer(c);
				if(c_res)
				{
					t1=new Transaction();
					t1.setTransactionId(TransactionID.generateTransactionId());
					t1.setUser(c.getAccNum());
					t1.setRec_acc(receiver.getAccNum());
					t1.setTransaction("DEBITED");
					t1.setAmount(Amount);
					t1.setBalance(c.getBal());
					boolean res1=tdao.insertTransaction(t1);
				}
				receiver.setBal(receiver.getBal()+Amount);
				boolean receiver_res=cdao.updateCustomer(receiver);
				if(receiver_res)
				{
					{
						t2=new Transaction();
						t2.setTransactionId(t1.getTransactionId());
						t2.setUser(receiver.getAccNum());
						t2.setRec_acc(c.getAccNum());
						t2.setTransaction("CREDITED");
						t2.setAmount(Amount);
						t2.setBalance(receiver.getBal());
						boolean res1=tdao.insertTransaction(t2);
					}
				}
				
				if(c_res&& receiver_res)
				{   
					req.setAttribute("transferSuccess", "Transaction successful! an amount "+Amount+" has been transfered");
					RequestDispatcher rd=req.getRequestDispatcher("TransferAmt.jsp");
					rd.forward(req, resp);
				}
				else
				{
					req.setAttribute("transferFailure", "Transaction failed!");
					RequestDispatcher rd=req.getRequestDispatcher("TransferAmt.jsp");
					rd.forward(req, resp);
				}
				
			}
		} 
		else
		{
			req.setAttribute("transferFailure", "Transaction failed! due to Data mismatch");
			RequestDispatcher rd=req.getRequestDispatcher("TransferAmt.jsp");
			rd.forward(req, resp);
		}
			
		
	}

}
