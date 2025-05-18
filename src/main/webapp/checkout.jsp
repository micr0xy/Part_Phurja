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
<title>Checkout Page</title>

<%@include file="extend_files/js_css.jsp"%>

<style>
.checkout-box {
	border: 1px solid #ced4da;
	border-radius: 5px;
	padding: 20px;
	margin-top: 20px;
}
</style>

</head>
<body>
	<%@include file="extend_files/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>


	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>



	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<div class="container mt-5">
		<h2>Checkout</h2>
		<div class="checkout-box">
			<form action="order" method="post">

				<input type="hidden" value="${userobj.id}" name="id" >

				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="username"
						class="form-control form-control-sm" id="name"
						value="${userobj.name }" required>
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="email" name="email"
						class="form-control form-control-sm" id="email"
						value="${userobj.email }" required>
				</div>
				<div class="form-group">
					<label for="phone">Phone Number</label> <input type="tel"
						name="phone" class="form-control form-control-sm" id="phone"
						value="${userobj.phone }" required>
				</div>
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						class="form-control form-control-sm" id="address" name="address"
						placeholder="Enter your address" required>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="city">City</label> <input type="text" name="city"
							class="form-control form-control-sm" id="city"
							placeholder="Enter your city" required>
					</div>
					<div class="form-group col-md-6">
						<label for="state">State</label> <input type="text" name="state"
							class="form-control form-control-sm" id="state"
							placeholder="Enter your state" required>
					</div>
				</div>
				<div class="form-group">
					<label for="paymentMethod">Payment Method</label> <select
						class="form-control form-control-sm" id="paymentMethod"
						name="payment">
						<option value="noselect" n>--Select--</option>
						<option value="COD">Cash On Delivery</option>
						<option value="FP" n>Fonepay</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary btn-sm">Order
					Now</button>
				<a href="index.jsp" type="button" class="btn btn-secondary btn-sm">Continue
					Shopping</a>
			</form>
		</div>
	</div>

	<div
		style="margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">
		<%@include file="extend_files/footer.jsp"%>
	</div>
</body>
</html>
