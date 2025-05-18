<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory: Add Items</title>

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


	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>


	<div class="container-fluid">
		<div class="center-card">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title text-center">Add Item</h2>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>



						<form action="../addItems" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="productName">Product Name:</label> <input
									type="text" class="form-control" id="productName" name="pName">
							</div>
							<div class="form-group">
								<label for="price">Price:</label> <input type="number"
									class="form-control" id="price" name="price" step="0.01">
							</div>
							<div class="form-group">
								<label for="picture">Product Photo:</label>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="picture"
										name="picture">
								</div>
							</div>
							<div class="form-group mt-3">
								<button type="submit" class="btn btn-primary btn-block">Add
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
