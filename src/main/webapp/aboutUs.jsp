<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About PartPurja</title>
<%@include file="extend_files/js_css.jsp"%>
<%@include file="extend_files/navbar.jsp"%>
<style>

.about-section {
	padding: 100px;
	text-align: center;
	background-color: #f9f9f9;
}

.about-section h2 {
	font-size: 45px;
	margin-bottom: 20px;
}

.about-section p {
	font-size: 20px;
	color: #666;
	line-height: 1.8;
}

.social-links {
	margin-top: 50px;
}

.social-links a {
	display: inline-block;
	margin: 0 10px;
	font-size: 24px;
	color: #666;
}

.social-links a:hover {
	color: #000;
}
</style>
</head>
<body>
	<!-- About Section -->
	<div class="about-section">
		<div class="container">
			<h2>About PartPurja</h2>
			<p>Welcome to PartPurja, your one-stop solution for buying
				authentic bike products and accessories! Shopping your favorite bike
				products has never been simpler.</p>
			<p>At PartPurja, we believe in making shopping fun and
				convenient. With our user-friendly platform, you can explore a
				number of products from the comfort of your home.</p>
			<p>We aim to provide you with the best products at reasonable
				prices.</p>
			<p>Connect with us on social media:</p>
			<!-- Social Media Links -->
			<div class="social-links">
				<a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a> <a
					href="#" target="_blank"><i class="fab fa-twitter"></i></a> <a
					href="#" target="_blank"><i class="fab fa-instagram"></i></a> <a
					href="#" target="_blank"><i class="fab fa-pinterest"></i></a>
			</div>
		</div>
	</div>
	<%@include file="extend_files/footer.jsp"%>
</body>
</html>
