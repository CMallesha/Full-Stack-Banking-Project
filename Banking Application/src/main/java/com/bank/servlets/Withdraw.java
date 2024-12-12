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

@WebServlet("/withdraw")
public class Withdraw extends HttpServlet {
	
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
		
        if (AccNumber == c.getAccNum()&&c.getBal()>Amount) {
            c.setBal(c.getBal() - Amount);
            if (c.getBal() > 0) {
                boolean res = cdao.updateCustomer(c);
                if (res) {
                    req.setAttribute("withdrwan", "Amount " + Amount + " has been withdraw Successfully! And Your Updated Balance is: " + c.getBal());
                    RequestDispatcher rd = req.getRequestDispatcher("Withdraw.jsp");
                    rd.forward(req, resp);
        
                    Transaction t = new Transaction();
                    t.setTransactionId(TransactionID.generateTransactionId());
                    t.setUser(c.getAccNum());
                    t.setRec_acc(c.getAccNum());
                    t.setTransaction("DEBITED");
                    t.setAmount(Amount);
                    t.setBalance(c.getBal());
                    boolean res1 = tdao.insertTransaction(t);
                    if (res1) {
                        // Implement here recent transactions
                        session.setAttribute("transaction", t);
                        RequestDispatcher rdp1 = req.getRequestDispatcher("#");
                        rdp1.forward(req, resp);
                    } else {
                        // Implement here recent transaction
                        req.setAttribute("Tranasctionfail", "Amount " + Amount + " has been failed to Deposit! try again");
                        RequestDispatcher rdp2 = req.getRequestDispatcher("#");
                        rdp2.forward(req, resp);
                    }
                } else {
                    req.setAttribute("withdrawfail", "Amount " + Amount + " has been failed to withdraw! try again");
                    RequestDispatcher rd = req.getRequestDispatcher("Withdraw.jsp");
                    rd.forward(req, resp);
                }
            } else {
                req.setAttribute("withdrawinsufficient", "Withdraw fail Due to insufficient balance!");
                RequestDispatcher rd = req.getRequestDispatcher("Withdraw.jsp");
                rd.forward(req, resp);

            }
        }else {
            req.setAttribute("withdrawfailAccountNum", "Amount " + Amount + " has been failed to withdraw due to account number mismath! OR Insufficient Balace try again");
            RequestDispatcher rd = req.getRequestDispatcher("Withdraw.jsp");
            rd.forward(req, resp);
        }
        
}
}