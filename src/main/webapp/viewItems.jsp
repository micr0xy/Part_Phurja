<%@page import="com.entity.User"%>
<%@page import="com.entity.ItemDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Detail</title>
<%@include file="extend_files/js_css.jsp"%>
<style>
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.item-details-container {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-top: 20px;
}

.item-image-container {
	width: 40%;
	border-right: 1px solid #eee;
	padding-right: 20px;
}

.item-image {
	width: 100%;
	height: auto;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.item-description-container {
	width: 60%;
	padding-left: 20px;
}

.item-description {
	margin-top: 0;
	margin-bottom: 20px;
}

.item-price {
	font-size: 18px;
	font-weight: bold;
	margin-top: 20px;
}

.add-to-cart-btn {
	display: block;
	width: 100%;
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.add-to-cart-btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%@include file="extend_files/navbar.jsp"%>

	<%
		int pid = Integer.parseInt(request.getParameter("pid"));
		User u = (User) session.getAttribute("userobj");
		DBConnect conn = new DBConnect();
		ItemDAOimpl dao = new ItemDAOimpl(conn);
		ItemDetails i = dao.getItemById(pid);
		
		
	%>
	

	<div class="container">
		<div class="item-details-container">
			<div class="item-image-container">
				<img class="item-image" src="bikeItems/<%=i.getProductImage()%>"
					alt="Item Image">
			</div>
			<div class="item-description-container">
				<h2><%=i.getProductName()%></h2>
				<div class="item-description">
					<p>Product Details are to be placed here...</p>
				</div>
				<p class="item-price">Rs.<%=i.getPrice() %></p>
				<a href="cart?pid=<%=i.getItemId()%>&&uid=<%=u.getId()%>" class=" center add-to-cart-btn">Add to Cart</a>
			</div>
		</div>
	</div>

	<%@include file="extend_files/footer.jsp"%>
</body>
</html>
