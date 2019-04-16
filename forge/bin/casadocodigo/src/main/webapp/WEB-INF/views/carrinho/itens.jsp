<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
	      	
	      	<security:authorize access="hasAnyRole('ROLE_ADMIN')">
		        <li><a href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a></li>
		        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
	        </security:authorize>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li ><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
	        <security:authorize access="hasRole('ROLE_ADMIN')">
	        <li>
	        	<a href="#">
	        		<security:authentication property="principal" var="usuario"/>
	        		Usuário: ${usuario.nome}
	        	</a>
	        	<li><a href="logout">Sair</a></li>
	        </li>
	        </security:authorize>
	      </ul>
	    </div>
	  </div>
	</nav>

	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
		<table id="cart-table" style="width: 100%;table-layout:fixed;" class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th >Item</th>
					<th >Preço</th>
					<th>Quantidade</th>
					<th >Total</th>
					<th ></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.itens}" var="item"> <!-- c:forEach PARA LISTAR OS ITENS -->
					<tr>
						<td class="cart-img-col"><img src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145"
							width="71px" height="100px" />
						</td>
						<td class="item-title">${item.produto.titulo}</td>
						<td class="numeric-cell">${item.preco}</td>
						<td class="quantity-input-cell">
							<input type="number" min="0" id="quantidade" name="quantidade"
							value="${carrinhoCompras.getQuantidade(item)}"/>
							</td>
						<td class="numeric-cell">${carrinhoCompras.getTotal(item)}</td>
						<td class="remove-item">
							<form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).arg(1,item.tipoPreco).build()}" method="POST">
								<input type="image" src="${contextPath}/resources/imagens/excluir.png" 
									alt="Excluir" title="Excluir" />
							</form>	
						</td>
					</tr>
				</c:forEach> <!-- FIM DO c:forEach -->
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<form action="${s:mvcUrl('PC#finalizar').build()}" method="POST">
							<input type="submit" class="checkout" name="checkout" value="Finalizar compra" />
						</form>
					</td>
					<td class="numeric-cell">${carrinhoCompras.total}</td>
					<td></td>
				</tr>
			</tfoot>
		</table>
	</section>
</body>
</html>