package com.bank.dao;

import java.util.List;

import com.bank.dto.Customer;

public interface CustomerDAO {

	public boolean insertCustomer(Customer c);
	public Customer getCustomer(long AccNum,int Pin);
	public Customer getCustomer(long Phone,String mail);
	public Customer getCustomer(long AccNum);
	public Customer getCustomerbyphone(long phone);
	public List getCustomer();
	public boolean updateCustomer(Customer c);
	public boolean deleteCustomer(Customer c);
	
}
