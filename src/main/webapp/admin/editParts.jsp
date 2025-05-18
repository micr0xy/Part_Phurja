<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DAO.ItemDAOimpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.ItemDetails"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory: Edit Items</title>

<%@include file="js_css.jsp"%>

<style>
/*centering the card */
.center-card {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid">
		<div class="center-card">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h3 class="card-title text-center">Add Item</h3>



						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DBConnect conn = new DBConnect();
						ItemDAOimpl dao = new ItemDAOimpl(conn);
						ItemDetails i = dao.getItemById(id);
						%>


						<form action="../editParts" method="post">
							<input type="hidden" name="id" value="<%=i.getItemId()%>">

							<div class="form-group">
								<label for="productName">Product Name:</label> <input
									type="text" class="form-control" id="productName" name="pName"
									value="<%=i.getProductName()%>">
							</div>
							<div class="form-group">
								<label for="price">Price:</label> <input type="number"
									class="form-control" id="price" name="price" step="1"
									value="<%=i.getPrice()%>">
							</div>
							<div class="form-group mt-3">
								<button type="submit" class="btn btn-primary btn-block">Update
									Item</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
