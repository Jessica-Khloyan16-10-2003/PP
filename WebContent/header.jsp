<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #E6F9E6;">
	<!--Company Header Starting  -->
	<div class="container-fluid text-center"
		style="margin-top: 45px; background-color: #33cc33; color: white; padding: 5px;">
		<h2 ch>Уют Вашего дома</h2>
		<h6>Мы специализируемся на качестве и Вашем комфорте</h6>
		<form class="form-inline" action="index.jsp" method="get">
			<div class="input-group">
				<input type="text" class="form-control" size="50" name="search"
					placeholder="Найти..." required>
				<div class="input-group-btn">
					<input type="submit" class="btn btn-danger" value="Поиск" />
				</div>
			</div>
		</form>
		<p align="center"
			style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
			id="message"></p>
	</div>
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>DomusInterior</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Вход</a></li>
					<li><a href="register.jsp">Регистрация</a></li>
					<li><a href="index.jsp">Товары</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Категории <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=mobile">Диваны</a></li>
							<li><a href="index.jsp?type=tv">Тумбы</a></li>
							<li><a href="index.jsp?type=laptop">Лампы</a></li>
							<li><a href="index.jsp?type=camera">Стулья</a></li>
							<li><a href="index.jsp?type=speaker">Журнальные столы</a></li>
							<li><a href="index.jsp?type=tablet">Зеркала</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>DomusInterior</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon glyphicon-home">Товары</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Категории <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=mobile">Диваны</a></li>
							<li><a href="userHome.jsp?type=tv">Тумбы</a></li>
							<li><a href="userHome.jsp?type=laptop">Лампы</a></li>
							<li><a href="userHome.jsp?type=camera">Стулья</a></li>
							<li><a href="userHome.jsp?type=speaker">Журнальные столы</a></li>
							<li><a href="userHome.jsp?type=tablet">Зеркала</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Корзина
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Заказ</a></li>
					<li><a href="userProfile.jsp">Профиль</a></li>
					<li><a href="./LogoutSrv">Выход</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Center</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Товары</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Категории <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=mobile">Диваны</a></li>
							<li><a href="adminViewProduct.jsp?type=tv">Тумбы</a></li>
							<li><a href="adminViewProduct.jsp?type=laptop">Лампы</a></li>
							<li><a href="adminViewProduct.jsp?type=camera">Стулья</a></li>
							<li><a href="adminViewProduct.jsp?type=speaker">Журнальные столы</a></li>
							<li><a href="adminViewProduct.jsp?type=tablet">Зеркала</a></li>
						</ul></li>
					<li><a href="adminStock.jsp">Склад</a></li>
					<li><a href="shippedItems.jsp">Отгруженные заказы</a></li>
					<li><a href="unshippedItems.jsp">Заказы</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Модифицировать товары<span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Добавить товар</a></li>
							<li><a href="removeProduct.jsp">Удалить товар</a></li>
							<li><a href="updateProductById.jsp">Изменить товар</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Выход</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>