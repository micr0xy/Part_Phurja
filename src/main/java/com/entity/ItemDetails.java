package com.entity;

public class ItemDetails {
	
	private int itemId;
	private String productName;
	private String price;
	private String productImage;
	public ItemDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ItemDetails(String productName, String price, String productImage) {
		super();
		this.productName = productName;
		this.price = price;
		this.productImage = productImage;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	@Override
	public String toString() {
		return "ItemDetails [itemId=" + itemId + ", productName=" + productName + ", price=" + price + ", productImage="
				+ productImage + "]";
	}

}
