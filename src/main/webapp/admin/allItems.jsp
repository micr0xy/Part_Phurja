<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DAO.ItemDAOimpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.ItemDetails"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory: All Items</title>
<%@include file="js_css.jsp"%>

<style>
.center-heading {
	text-align: center;
}

.action-buttons a {
	display: inline-block;
	margin-right: 5px;
	padding: 3px 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-decoration: none;
}
</style>

</head>
<body>

	<%@include file="navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>


	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="center-heading">
			<h2>All Items</h2>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Product Image</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				DBConnect conn = new DBConnect();
				ItemDAOimpl dao = new ItemDAOimpl(conn);
				List<ItemDetails> list = dao.getAllItems();
				for (ItemDetails i : list) {
				%>

				<tr>
					<td><%=i.getItemId()%></td>
					<td><%=i.getProductName()%></td>
					<td>Rs.<%=i.getPrice()%></td>
					<td><img src="../bikeItems/<%=i.getProductImage()%>"
						style="width: 50px; height: 50px;"></td>
					<td class="action-buttons"><a
						href="editParts.jsp?id=<%=i.getItemId()%>" class="btn btn-primary">Edit</a>
						<a href="../delete?id=<%=i.getItemId()%>" class="btn btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 635px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>
