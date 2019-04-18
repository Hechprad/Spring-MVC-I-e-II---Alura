<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Livros de Java, Android, iOS, Mobile e muito mais!">

	<article id="${produto.id}">
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<h1 class="product-title">${produto.titulo}</h1>
				<img width="280px" height="395px"
					src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145"
					class="product-featured-image" />
				<p class="product-author">
					<span class="product-author-link"> </span>
				</p>
				<p class="book-description">${produto.descricao}</p>
			</div>
		</header>

		<section class="buy-options clearfix">
			<form:form servletRelativeAction="/carrinho/add" method="post" cssClass="container">
				<input type="hidden" value="${produto.id}" name="produtoId">
				<ul id="variants" class="clearfix">
					<c:forEach items="${produto.precos}" var="preco">
						<li class="buy-option">
							<input type="radio"name="tipoPreco"class="variant-radio"
								id="tipoPreco"value="${preco.tipo}"checked="checked" />
							<label class="variant-label">${preco.tipo}</label>
							<small class="compare-at-price">R$ 39,90</small>
							<p class="variant-price">${preco.valor}</p>
						</li>
					</c:forEach>
				</ul>
				<button type="submit" class="btn btn-primary"
					title="Compre Agora '${produto.titulo}'!">Compre Agora</button>
			</form:form>
		</section>

		<div class="container">
			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>Número de páginas: 
					<span>${produto.paginas}</span>
				</p>
				<p>Data de publicação: <fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></p>
			</section>
		</div>
	</article>

</tags:pageTemplate>