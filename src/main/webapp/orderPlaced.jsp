<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<%@include file="extend_files/js_css.jsp"%>
</head>
<body>
    <%@include file="extend_files/navbar.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="alert alert-success" role="alert">
                    <h4 class="alert-heading">Congratulations!</h4>
                    <p>Your order has been placed successfully.</p>
                    <p>Your product will be delivered to your address within 3 working days.</p>
                </div>
                <a href="index.jsp" class="btn btn-primary">Home</a>
                <a href="order.jsp" class="btn btn-success">View Order</a>
            </div>
        </div>
    </div>

</body>
</html>
