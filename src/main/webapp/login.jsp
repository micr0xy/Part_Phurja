<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="extend_files/js_css.jsp"%>
</head>
<body>
	<%@include file="extend_files/navbar.jsp"%>

	<!-- Login form -->
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login</h4>
						
						
						<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
												
						<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						
						<form action="login" method="post">
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
							<button type="submit" class="btn btn-primary btn-block">Sign In</button>
						</form>
						<div class="text-center mt-2">
							<a href="register.jsp">Create an account</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="extend_files/footer.jsp"%>

</body>
</html>
