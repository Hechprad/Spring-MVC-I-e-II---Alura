<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	td{word-wrap:break-word;}
	body{padding-top:70px;}
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
	        <li><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
	        <li>
	        	<a href="#">
	        		<security:authentication property="principal" var="usuario"/>
	        		Usuário: ${usuario.nome}
	        	</a>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>
	
	<div class="container" >
		<h1 class="text-center" style="font-size: 30px">Lista de Produtos</h1>
			
			<!-- alertas de mensagem após cadastro de livro -->
			<c:if test="${sucesso != null}"> 
				<div class="alert alert-success text-center alert-dismissible" role="alert" style="font-size: 30px;">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${sucesso}
				</div>
			</c:if>
			<c:if test="${falha != null}"> 
				<div class="alert alert-danger text-center alert-dismissible" role="alert" style="font-size: 30px;">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${falha}
				</div>
			</c:if>
		
		<table style="width: 100%;table-layout:fixed;" class="table table-bordered table-striped table-hover">
			<tr>
				<th class="text-center">ID do Livro</th>
				<th class="text-center">Título</th>
				<th class="text-center">Descrição</th>
				<th class="text-center">Páginas</th>
				<th class="text-center">Data de Lançamento</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td class="text-center">${produto.id}</td>	
					<td class="text-center"><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>	
					<td class="text-center">${produto.descricao}</td>		
					<td class="text-center">${produto.paginas}</td>	
					<td class="text-center"><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></td>	
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>