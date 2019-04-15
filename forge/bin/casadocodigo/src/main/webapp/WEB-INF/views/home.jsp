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
	      	
	      	<security:authorize access="hasRole('ROLE_ADMIN')">
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
	        </li>
	        </security:authorize>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>

	<section id="index-section" class="container middle">
		<h1 class="cdc-call">Livros disponíveis, aproveite!</h1>
		<ul class="clearfix book-collection">
			<c:forEach items="${produtos}" var="produto">
				<li>
					<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}" class="block clearfix">
					<h2 class="product-title">${produto.titulo}</h2> 
					<img width="143" height="202" src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="${produto.titulo}" title="${produto.titulo}" /> 
					<small class="buy-button">Compre</small>
					</a>
				</li>
			</c:forEach>
		</ul>

		<h2 class="cdc-call">Diferenciais da Casa do Código</h2>

		<ul id="cdc-diferenciais" class="clearfix">
			<li class="col-left">
				<h3>E-books sem DRM. Leia onde quiser</h3>
				<p>
					<span class="sprite" id="sprite-drm"></span> Nossos e-books não possuem DRM, ou seja, você pode ler em qualquer computador, tablet e smartphone.
				</p>
			</li>
			<li class="col-right">
				<h3>Autores de renome na comunidade</h3>
				<p>
					<span class="sprite" id="sprite-renome"></span> Autores que participam ativamente na comunidade com Open Source, listas de discussão, grupos e
					mais.
				</p>
			</li>
			<li class="col-left">
				<h3>Receba atualizações dos e-books</h3>
				<p>
					<span class="sprite" id="sprite-atualizacoes"></span> Quando você compra um e-book, automaticamente tem direito às atualizações e correções dele.
				</p>
			</li>
			<li class="col-right">
				<h3>Livros com curadoria da Caelum</h3>
				<p>
					<span class="sprite" id="sprite-caelum"></span> Desenvolvedores experientes que avaliam e revisam os livros constantemente.
				</p>
			</li>
		</ul>



	</section>


	<footer id="layout-footer">
		<div class="clearfix container">
			<div id="collections-footer">
				<!-- cdc-footer -->
				<p class="footer-title">Coleções de Programação</p>
				<ul class="footer-text-links">
					<li><a href="/collections/livros-de-java">Java</a></li>
					<li><a href="/collections/livros-desenvolvimento-web">Desenvolvimento Web</a></li>
					<li><a href="/collections/livros-de-mobile">Mobile</a></li>
					<li><a href="/collections/games">Games</a></li>
					<li><a href="/collections/livros-de-front-end">Front End</a></li>
				</ul>
				<p class="footer-title">Outros Assuntos</p>
				<ul class="footer-text-links">
					<li><a href="/collections/livros-de-agile">Agile</a></li>
					<li><a href="/collections/outros">e outros...</a></li>
				</ul>
			</div>
			<div id="social-footer">
				<!-- books-footer -->
				<p class="footer-title">Links da Casa do Código</p>
				<ul class="footer-text-links">
					<li><a href="http://livros.casadocodigo.com.br" rel="nofollow">Meus E-books</a></li>
					<li><a href="/pages/sobre-a-casa-do-codigo">Sobre a Casa do Código</a></li>
					<li><a href="/pages/perguntas-frequentes">Perguntas Frequentes</a></li>
					<li><a href="https://www.caelum.com.br">Caelum - Ensino e Inovação</a></li>
					<li><a href="http://www.codecrushing.com/" rel="nofollow">Code Crushing</a></li>
					<li><a href="http://www.casadocodigo.com.br/pages/politica-de-privacidade" rel="nofollow">Política de Privacidade</a></li>
				</ul>
				<p class="footer-title">Redes Sociais</p>
				<ul>
					<li class="social-links"><a href="http://www.twitter.com/casadocodigo" target="_blank" id="twitter" rel="nofollow">Facebook</a> <a
						href="http://www.facebook.com/casadocodigo" target="_blank" id="facebook" rel="nofollow">Twitter</a></li>
				</ul>
			</div>
			<div id="newsletter-footer">
				<!-- social-footer -->
				<p class="footer-title">Receba as Novidades e Lançamentos</p>
				<div id="form-newsletter">
					<form action="" method="POST" id="ss-form" class="form-newsletter">
						<ul>
							<li><input type="hidden" name="pageNumber" value="0" /><input type="hidden" name="backupCache" value="" /><input type="email"
								name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com" /></li>
							<li><input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter" /></li>
						</ul>
					</form>
					<ul>
						<li class="ie8"><a href="" rel="nofollow">Receba as Novidades e Lançamentos</a></li>
					</ul>
				</div>
				<ul class="footer-payments">
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
	</footer>

</body>
</html>

