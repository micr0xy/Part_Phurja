<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="extend_files/js_css.jsp"%>
</head>
<body>
	<%@include file="extend_files/navbar.jsp"%>


	<!-- Creation of register info form -->
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Create an account!</h4>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name
								</label> <input type="text" class="form-control" id="username"
									required="required" name="fname">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No. </label> <input type="number" class="form-control"
									required="required" name="phone">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label" 
									for="exampleCheck1">Agree to the Terms and Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="extend_files/footer.jsp"%>

</body>
</html>