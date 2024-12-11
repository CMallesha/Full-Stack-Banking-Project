package com.bank.dto;

public class Customer {
	
	private long AccNum;
	private String Name;
	private long Phone;
	private String mail;
	private double Bal;
	private int Pin;
	
	public Customer(long accNum, String name, long phone, String mail, double bal, int pin) {
		super();
		AccNum = accNum;
		Name = name;
		Phone = phone;
		this.mail = mail;
		Bal = bal;
		Pin = pin;
	}
	
	public Customer() {
		super();
	}

	public long getAccNum() {
		return AccNum;
	}

	public void setAccNum(long accNum) {
		AccNum = accNum;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public long getPhone() {
		return Phone;
	}

	public void setPhone(long phone) {
		Phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public double getBal() {
		return Bal;
	}

	public void setBal(double bal) {
		Bal = bal;
	}

	public int getPin() {
		return Pin;
	}

	public void setPin(int pin) {
		Pin = pin;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Customer [accno=" + AccNum + ", name=" + Name + ", phone=" + Phone + ", mail=" + mail + ", bal=" + Bal
				+ ", pin=" + Pin + "]";
	}
	
	
}
