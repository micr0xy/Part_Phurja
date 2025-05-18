<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="js_css.jsp"%>

<style type="text/css">
.grid-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 50px;
}

.grid-item {
	flex: 0 0 calc(25% - 20px);
	text-align: center;
}

.card {
	border: 1px solid #ccc;
	padding: 20px;
	border-radius: 10px;
}

.card-body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.card-body i {
	margin-bottom: 10px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>


	<div class="container">
		<div class="grid-container">
			<a href="addItems.jsp" class="grid-item">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-plus fa-3x"></i>
						<h4>Add Items</h4>
					</div>
				</div>
			</a> <a href="allItems.jsp" class="grid-item">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-list fa-3x"></i>
						<h4>All Items</h4>
					</div>
				</div>
			</a> <a href="orders.jsp" class="grid-item">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-shopping-cart fa-3x"></i>
						<h4>Orders</h4>
					</div>
				</div>
			</a> <a href="#" class="grid-item" data-bs-toggle="modal"
				data-bs-target="#logoutModal">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-sign-out-alt fa-3x"></i>
						<h4>Log Out</h4>
					</div>
				</div>
			</a>
		</div>
	</div>

	<!-- Vertically centered modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirm Logout</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to logout?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="../logout" class="btn btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
