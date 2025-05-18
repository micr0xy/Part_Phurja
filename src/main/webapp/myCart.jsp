<%@page import="com.entity.User"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.ItemDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<%@include file="extend_files/js_css.jsp"%>
</head>
<body>
	<%@include file="extend_files/navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>




	<div class="container">
		<h2>My Cart</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Item Name</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>



				<%
				User u = (User) session.getAttribute("userobj");
				DBConnect conn = new DBConnect();
				CartDAOImpl dao = new CartDAOImpl(conn);
				List<Cart> cart = dao.getItemByUser(u.getId());
				Double total_price = 0.00;
				for (Cart c : cart) {
					total_price = c.getTotalPrice();
				%>

				<tr>
					<td><%=c.getProductName()%></td>
					<td><%=c.getPrice()%></td>
					<td><a
						href="remove_item?pid=<%=c.getPid()%>&&uid=<%=c.getUid()%>"
						class="btn btn-danger">Remove</a></td>
				</tr>

				<%
				}
				%>


			</tbody>
		</table>

		<div class="row">
			<div class="col-md-6">
				<h4>
					Total Amount: Rs.<%=total_price%></h4>
			</div>
			<div class="col-md-6">
				<a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
				<a href="checkout.jsp" class="btn btn-success">Checkout</a>
			</div>
		</div>
	</div>

	
	<div
		style="margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">
		<%@include file="extend_files/footer.jsp"%>
	</div>
</body>
</html>
