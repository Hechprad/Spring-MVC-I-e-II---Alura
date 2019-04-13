<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<c:url value="/resources/css" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

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

<script src="resources/js/bootstrap.min.js"></script>
</head>
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
			<li class="category"><a href="produtos/form">Cadastrar </a></li>
			<li class="category"><a href="produtos">Listar Produtos </a></li>
		</ul>
	</nav>
	
	<h1 class="text-center">Lista de Produtos</h1>
	<br>
	<div class="alert alert-success container text-center" role="alert" style="font-size: 30px;">llllllllllll${sucesso}</div>
	<div class="alert alert-danger container text-center" role="alert" style="font-size: 30px;">kkkkkkkk${falha}</div>
	<br>
	<div class="container, w-100 p-2, shadow-lg p-3 mb-5 bg-white rounded">
		<table class="table table-dark table-bordered table-striped table-hover">
			<tr class="bg-danger">
				<th scope="col">ID do Livro</th>
				<th scope="col">Título</th>
				<th scope="col">Descrição</th>
				<th scope="col">Páginas</th>
				<th scope="col">Data de Lançamento</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<th scope="row">${produto.id}</th>	
					<td  align="center" valign="middle"><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>	
					<td class="text-break"  align="center" valign="middle">${produto.descricao}</td>		
					<td align="center" valign="middle">${produto.paginas}</td>	
					<td align="center" valign="middle"><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></td>	
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<a href="/casadocodigo">HOME</a>
	<br>
	<a href="produtos/form">Cadastrar novo produto</a>
</body>
</html>