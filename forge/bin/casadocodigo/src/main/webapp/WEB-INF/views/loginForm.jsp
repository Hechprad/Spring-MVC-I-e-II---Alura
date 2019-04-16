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
	      <ul class="nav navbar-nav navbar-right">
	        <li ><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>

<div class="container">
	<h1 class="text-center">Login da Casa do Código</h1>
	<div class="form-group container" style="width: 400px;">
	<!-- action="${s:mvcUrl('PC#gravar').build()}" pega o método gravar do ProdutoController -->
	<form:form servletRelativeAction="/login" method="POST">
			<label>E-mail</label>
			<input name="username" type="text" class="form-control" placeholder="Digite seu e-mail"/>
			<label>Senha</label>
			<input name="password" type="password" class="form-control" placeholder="Digite sua senha"/>
		<br>
		<button type="submit" class="btn btn-primary center-block">Entrar</button><br>
	</form:form>
	</div>
</div>
</body>
</html>