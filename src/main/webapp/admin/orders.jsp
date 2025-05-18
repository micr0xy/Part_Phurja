<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductOrder"%>
<%@page import="com.DAO.ProductOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory: Orders</title>
<%@include file="js_css.jsp"%>
</head>
<body>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container mt-5">
		<h2>All Orders</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Order Id</th>
					<th>Name</th>
					<th>Item</th>
					<th>Price</th>
					<th>Address</th>
					<th>Payment Method</th>
				</tr>
			</thead>
			<tbody>
				<%
				DBConnect conn = new DBConnect();
				ProductOrderImpl dao = new ProductOrderImpl(conn);
				List<ProductOrder> list = dao.getProduct();
				for (ProductOrder p : list) {
				%>

				<tr>
					<td><%=p.getOrderId()%></td>
					<td><%=p.getUserName()%></td>
					<td><%=p.getProdName()%></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getFullAdd()%></td>
					<td><%=p.getPaymentMethod()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>



