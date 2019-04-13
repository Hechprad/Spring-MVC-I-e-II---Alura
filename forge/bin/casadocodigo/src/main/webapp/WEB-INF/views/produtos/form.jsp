<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>

<c:url value="/resources/css" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>

<link href="${contextPath}/bootstrap.min.css" rel="stylesheet"/>
<link href="${contextPath}/bootstrap-grid.min.css" rel="stylesheet"/>

<link href="${contextPath}/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' />
<link href="${contextPath}/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/fontello.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/guia-do-programador-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}/produtos.css" rel="stylesheet" type="text/css" media="all" />
<link rel="canonical" href="http://www.casadocodigo.com.br/" />

<body>

	<header id="layout-header">
		<div class="clearfix container">
			<a href="/casadocodigo" id="logo"> </a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
						<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre Nós</a></li>
						<li><a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<nav class="categories-nav">
		<ul class="container">
			<li class="category"><a href="/casadocodigo">Home</a></li>
			<li class="category"><a href="/casadocodigo/produtos/form">Cadastrar </a></li>
			<li class="category"><a href="/casadocodigo/produtos">Listar Produtos </a></li>
		</ul>
	</nav>

<!-- action="${s:mvcUrl('PC#gravar').build()}" pega o método gravar do ProdutoController -->
<form:form action="${s:mvcUrl('PC#gravar').build()}" method="POST" 
		commandName="produto" enctype="multipart/form-data">
	<div>
		<form:errors path="titulo" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Título</label>
		<br>
		<form:input path="titulo"/>
	</div>
	<div>
		<form:errors path="descricao" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Descrição</label>
		<br>
		<form:textarea rows="15" cols="100" path="descricao"/>
		<br>
	</div>
	<div>
		<form:errors path="paginas" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Páginas</label>
		<br>
		<form:input path="paginas"/>
		<br>
	</div>
	<div>
		<form:errors path="dataLancamento" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Data de Lançamento</label>
		<br>
		<form:input path="dataLancamento" placeholder="dd/mm/yyyy"/>
		<br>
	</div>
	<br>
	<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
		<div>
			<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
			<label>${tipoPreco}</label>
			<br>
			<form:input path="precos[${status.index}].valor"/>
		</div>
	</c:forEach>
	<br>
	<div>
		<label>Sumário</label>
		<br>
		<input name="sumario" type="file">
	</div>
	<br>
	<button type="submit">Cadastrar</button><br>
</form:form>

</body>
</html>