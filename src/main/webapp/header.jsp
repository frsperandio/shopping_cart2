<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><fmt:message
					key="mensagem.title" /></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:if test="${usuarioLogado != null}">
					<li class="active"><a
						href="<c:url value="/executa?tarefa=AccessStore"/>"><fmt:message key="mensagem.store" /></a></li>
					<li><a href="<c:url value="/executa?tarefa=AccessUsuarios"/>"><fmt:message key="mensagem.users" /></a></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${usuarioLogado != null}">
					<li><a href="#">${usuarioLogado.getEmail()}</a></li>
					<li>
						<form action="executa" method="POST">
							<input type="hidden" name="tarefa" value="Logout" />
							<button class="btn btn-default glyphicon glyphicon-log-out" type="submit"><fmt:message key="mensagem.logout" /></button>
						</form>
					</li>
				</c:if>
			</ul>
		</div>	
	</div>	
</nav>