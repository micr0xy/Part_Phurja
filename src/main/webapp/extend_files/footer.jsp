<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
body {
	margin: 0;
	padding: 0;
	display: flex;
	min-height: 100vh;
	flex-direction: column;
	flex-grow: 1;
}

.footer {
	background-color: #001f3f;
	color: navy;
	text-align: center;
	padding: 20px 0;
	width: 100%;
	bottom: 0;
	left: 0;
}
</style>
</head>
<body>
	<footer class="footer bg-dark text-light py-3">
		<div class="container text-center">
			<span>&copy; 2024 PartPurja. All rights reserved.</span>
		</div>
	</footer>

	<script>
		window.addEventListener('scroll', function() {
			var contentHeight = document.body.scrollHeight;
			var scrollPosition = window.scrollY + window.innerHeight;

			if (scrollPosition >= contentHeight) {
				document.querySelector('.footer').style.display = 'block';
			} else {
				document.querySelector('.footer').style.display = 'none';
			}
		});
	</script>
</body>
</html>
