<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  			<h2><fmt:message key="mensagem.authentication" /></h2>
		</div>
		<c:if test="${usuarioNaoEncontrado != null}">
			<div class="alert alert-danger" role="alert"><fmt:message key="mensagem.userNotFound" /></div>
		</c:if>
		<form action="executa" method="POST">
			<input type="hidden" name="tarefa" value="Login" />
			<div class="form-group">
				<label for="email"><fmt:message key="mensagem.email" /></label> <input type="email"
					class="form-control" id="email" name="email" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="senha"><fmt:message key="mensagem.password" /></label> <input type="password"
					class="form-control" id="senha" name="senha" placeholder="Senha">
			</div>
			<button type="submit" class="btn btn-default"><fmt:message key="mensagem.send" /></button>
			<a href="novoUsuario.jsp"><fmt:message key="mensagem.newUser" /></a>
		</form>
	</div>
	<c:import url="/footer.jsp" />
</body>
</html>