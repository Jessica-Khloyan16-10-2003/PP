<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Добавить товар</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
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

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./AddProductSrv" method="post"
				enctype="multipart/form-data" class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Добавить товар</h2>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Название товара</label> <input type="text"
							placeholder="Укажите название" name="name" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="producttype">Тип товара</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="mobile">Диван</option>
							<option value="tv">Тумба</option>
							<option value="camera">Лампа</option>
							<option value="laptop">Стул</option>
							<option value="tablet">Журнальный стол</option>
							<option value="speaker">Зеркало</option>
							<!-- <option value="other">Some Other Appliances</option> -->
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Описание товара</label>
					<textarea placeholder="Добавьте описание товара" name="info" class="form-control" id="last_name" required></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Цена за шт.</label> <input type="number"
							placeholder="Укажите стоимость за шт." name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Количество на складе</label> <input type="number"
							placeholder="Укажите кол-во на складе" name="quantity"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div>
					<div class="col-md-12 form-group">
						<label for="last_name">Изображение товара</label> <input type="file"
							placeholder="Выберите фото" name="image" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;">
						<button type="reset" class="btn btn-danger">Очистить форму</button>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-success">Добавить товар</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>