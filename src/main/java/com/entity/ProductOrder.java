package com.entity;

public class ProductOrder {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phone;
	private String fullAdd;
	private String prodName;
	private String price;
	private String paymentMethod;

	public String getOrderId() {
		return orderId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "ProductOrder [id=" + id + ", userName=" + userName + ", email=" + email + ", phone=" + phone
				+ ", fullAdd=" + fullAdd + ", paymentMethod=" + paymentMethod + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public ProductOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

}
