<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Ассортимент продукции</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Склад</div>
	<div class="container-fluid">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #2c6c4b; color: white; font-size: 18px;">
					<tr>
						<th>Изображение</th>
						<th>Идентификатор товара</th>
						<th>Название</th>
						<th>Тип</th>
						<th>Цена за шт.</th>
						<th>Проданное кол-во</th>
						<th>Количество на складе</th>
						<th colspan="2" style="text-align: center">Действия</th>
					</tr>
				</thead>
				<tbody style="background-color: white; font-size: 16px;">



					<%
					ProductServiceImpl productDao = new ProductServiceImpl();
					List<ProductBean> products = new ArrayList<ProductBean>();
					products = productDao.getAllProducts();
					for (ProductBean product : products) {
					%>

					<tr>
						<td><img src="./ShowImage?pid=<%=product.getProdId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><a
							href="./updateProduct.jsp?prodid=<%=product.getProdId()%>"><%=product.getProdId()%></a></td>
						<%
						String name = product.getProdName();
						name = name.substring(0, Math.min(name.length(), 25)) + "..";
						%>
						<td><%=name%></td>
						<td><%=product.getProdType().toUpperCase()%></td>
						<td><%=product.getProdPrice()%></td>
						<td><%=new OrderServiceImpl().countSoldItem(product.getProdId())%></td>
						<td><%=product.getProdQuantity()%></td>
						<td>
							<form method="post">
								<button type="submit"
									formaction="updateProduct.jsp?prodid=<%=product.getProdId()%>"
									class="btn btn-primary">Изменить</button>
							</form>
						</td>
						<td>
							<form method="post">
								<button type="submit"
									formaction="./RemoveProductSrv?prodid=<%=product.getProdId()%>"
									class="btn btn-danger">Удалить</button>
							</form>
						</td>

					</tr>

					<%
					}
					%>
					<%
					if (products.size() == 0) {
					%>
					<tr style="background-color: grey; color: white;">
						<td colspan="7" style="text-align: center;">Не найдено товаров</td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>