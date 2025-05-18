<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ItemDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ItemDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PartPurja</title>
<%@include file="extend_files/js_css.jsp"%>

<!-- Custom CSS -->
<style>
/* Header */
.header {
	background-image: url("images/fahrrad.jpg");
	background-size: cover;
	background-position: center;
	height: 50vh;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: #ffffff;
	font-size: 2rem;
	padding-left: 20px; /* Add padding to the left */
	padding-right: 20px; /* Add padding to the right */
}

/* Featured Products */
.featured-products {
	margin-top: 50px;
}

.featured-products h3 {
	text-align: left;
	margin-bottom: 30px;
}

.card {
	margin-bottom: 20px;
	border: none;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.card-img-top {
	height: 200px;
	object-fit: cover;
	border-radius: 10px 10px 0 0;
}

.card-body {
	padding: 20px;
	text-align: center;
}

.card-title {
	font-size: 1.5rem;
	margin-bottom: 10px;
}

.card-text {
	font-size: 1.2rem;
	color: #6c757d;
	margin-bottom: 20px;
}

.btn-primary {
	width: 100%;
	border-radius: 25px;
	font-size: 1.2rem;
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

/* Alert box */
.alert {
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
	width: 300px;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	String cartMessage = (String) session.getAttribute("cartMessage");
	session.removeAttribute("cartMessage");
	%>

	<%@include file="extend_files/navbar.jsp"%>
	<header class="header">
		<h2>PartPurja: Bike Parts Store System</h2>
	</header>

	<div class="container featured-products">
		<h3 class="text-left">Featured Products</h3>
		<div class="row">
			<%
			ItemDAOimpl dao = new ItemDAOimpl(new DBConnect());
			List<ItemDetails> list = dao.getFeaturedItems();
			for (ItemDetails i : list) {
			%>
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top" src="bikeItems/<%=i.getProductImage()%>"
						alt="<%=i.getProductName()%>">
					<div class="card-body">
						<h5 class="card-title"><%=i.getProductName()%></h5>
						<p class="card-text">
							Rs.
							<%=i.getPrice()%></p>


						<%
						if (u == null) {
						%>
						<a href="login.jsp">View Details</a> <a href="login.jsp"
							class="btn btn-primary">Add to Cart</a>
						<%
						} else {
						%>
						<a href="viewItems.jsp?pid=<%=i.getItemId()%>">View Details</a> <a
							href="cart?pid=<%=i.getItemId()%>&&uid=<%=u.getId()%>"
							class="btn btn-primary">Add to Cart</a>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>

	<!-- Display cart message if present -->
	<%
	if (cartMessage != null && !cartMessage.isEmpty()) {
	%>
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<%=cartMessage%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>

	<%@include file="extend_files/footer.jsp"%>
</body>
</html>
