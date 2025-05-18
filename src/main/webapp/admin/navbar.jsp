<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DAO.ItemDAOimpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.ItemDetails"%>
<%@ page import="java.util.List"%>




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


<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand brand-text" href="../index.jsp">PartPurja</a>
		<ul class="navbar-nav ml-auto">
			<c:if test="${not empty userobj}">
				<li class="nav-item"><a class="nav-link" href="home.jsp"> <i
						class="fas fa-home"></i> Home
				</a></li>
				<li class="nav-item"><a class="nav-link">${userobj.name}</a></li>
				<li class="nav-item"><a class="nav-link" href="../logout">Logout</a>
				</li>
			</c:if>
			<c:if test="${empty userobj}">
				<li class="nav-item"><a class="nav-link" href="../login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="../register.jsp">Register</a></li>
			</c:if>
		</ul>
	</div>
</nav>
