<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>

<c:url value="/resources/css" var="contextPath"/>
<link rel="stylesheet" href="${contextPath}/bootstrap.min.css"/>
<link rel="stylesheet" href="${contextPath}/bootstrap-theme.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<style>
	body{padding:70px 0px;}
</style>

</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<li>home</li>
	        <li><a href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a></li>
	        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li ><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>

<div class="container">
	<h1 class="text-center">Cadastro de Produto</h1>
	<!-- action="${s:mvcUrl('PC#gravar').build()}" pega o método gravar do ProdutoController -->
	<form:form action="${s:mvcUrl('PC#gravar').build()}" method="POST" 
			commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<form:errors path="titulo" cssStyle="font-size: 20px; color: red;"/>
			<label>Título</label>
			<form:input path="titulo" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="descricao" cssStyle="font-size: 20px; color: red;"/>
			<label>Descrição</label>
			<form:textarea path="descricao" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="paginas" cssStyle="font-size: 20px; color: red;"/>
			<label>Páginas</label>
			<form:input path="paginas" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="dataLancamento" cssStyle="font-size: 20px; color: red;"/>
			<label>Data de Lançamento</label>
			<form:input path="dataLancamento" placeholder="dd/mm/yyyy" cssClass="form-control"/>
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div  class="form-group">
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
				<label>${tipoPreco}</label>
				<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
			</div>
		</c:forEach>
		<div class="form-group">
			<label>Sumário</label>
			<input name="sumario" type="file" class="form-control">
		</div>
		<br>
		<button type="submit" class="btn btn-primary">Cadastrar</button><br>
	</form:form>
</div>
</body>
</html>