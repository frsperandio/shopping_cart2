<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="<fmt:message key="mensagem.lang" />">
<head>
<title><fmt:message key="mensagem.title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<style type="text/css">
	<c:import url="/WEB-INF/css/sticky-footer-navbar.css" />	
</style>
</head>
<body>
	<c:import url="/header.jsp" />
	<div class="container">
		<div class="page-header">
  			<h2><fmt:message key="mensagem.products" /></h2>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th><fmt:message key="mensagem.name" /></th>
					<th><fmt:message key="mensagem.image" /></th>
					<th><fmt:message key="mensagem.price" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${products}" varStatus="st">
					<tr id="product${p.id}">
						<td>${p.id}</td>
						<td>${p.name}</td>
						<td>
							<img alt="${p.name}" src="<c:url value="${p.image}"/>" width="100">
						</td>
						<td>
							<fmt:formatNumber value="${p.price}" type="currency"/>
						</td>
						<td>
							<form action="executa" method="POST">
		  						<input type="hidden" name="tarefa" value="AddItem" />
								<input type="hidden" name="id" value="${p.id}" />
								<input class="btn btn-default" value="<fmt:message key="mensagem.buy" />" type="submit" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-header">
  			<h2><fmt:message key="mensagem.title" /></h2>
		</div>
		<c:choose>
			<c:when test="${shoppingCart.getItems().size() > 0}">
				<table class="table">
					<thead>
						<tr>
							<th><fmt:message key="mensagem.product" /></th>
							<th><fmt:message key="mensagem.quantity" /></th>
							<th><fmt:message key="mensagem.price" /></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ci" items="${shoppingCart.getItems()}" varStatus="st">
							<tr id="product${ci.id}">
								<td>${ci.getProduct().getName()}</td>
								<td>${ci.quantity}</td>
								<td>
									<fmt:formatNumber value="${ci.amount}" type="currency"/>
								</td>
								<td>
									<form action="executa" method="POST">
				  						<input type="hidden" name="id" value="${ci.id}" />
										<input type="hidden" name="tarefa" value="RemoveItem" />
										<input class="btn btn-default" value="<fmt:message key="mensagem.remove" />" type="submit" />
									</form>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">
								<div class="pull-right">
									<b>Total:</b>
									<fmt:formatNumber value="${shoppingCart.getAmount()}" type="currency"/>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<fmt:message key="mensagem.shoppingCartEmpty" />
			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="/footer.jsp" />
</body>
</html>