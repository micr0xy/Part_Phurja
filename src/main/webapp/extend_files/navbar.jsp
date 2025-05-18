<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>



<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand brand-text" href="/Part-phurja">PartPurja</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<form class="d-flex mx-auto">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-light" type="submit">
					<i class="fas fa-search"></i>
				</button>

			</form>
			<ul class="navbar-nav ml-auto">

				<c:if test="${not empty userobj }">

					<li class="nav-item"><a class="nav-link"> <i
							class="fas fa-user-plus"></i> ${userobj.name}
					</a></li>
					<li class="nav-item"><a class="nav-link" href="myCart.jsp"><i
							class="fas fa-shopping-cart"></i> My Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>

				</c:if>

				<c:if test="${empty userobj }">
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp"><i
							class="fas fa-shopping-cart"></i> My Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About
							Us</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
