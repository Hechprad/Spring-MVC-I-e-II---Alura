<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

	<section id="index-section" class="container middle">
		<p style="font-size: 50px; text-align: center;">Livros disponíveis, aproveite!</p>
		<br/>
		<br/>
		<div class="container">
			<table style="width: 100%;table-layout:fixed;" class="table">
			<tr class="clearfix book-collection">
				<c:forEach items="${produtos}" var="produto" begin="0" end="4">
					<td style="text-align: center; vertical-align: middle; width: 200px;">
						<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}" class="block clearfix">
						<span style="font-size: 20px; color: orange;" class="product-title">${produto.titulo}</span><br>
						<img width="143" height="202" src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="${produto.titulo}" title="${produto.titulo}" /><br> 
						<small class="buy-button" style="font-size: 20px;">Compre</small>
						</a>
					</td>
				</c:forEach>
			</tr>
			<tr class="clearfix book-collection">
				<c:forEach items="${produtos}" var="produto" begin="5" end="9">
					<td style="text-align: center; vertical-align: middle; width: 200px;">
						<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}" class="block clearfix">
						<span style="font-size: 20px; color: orange;" class="product-title">${produto.titulo}</span><br>
						<img width="143" height="202" src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="${produto.titulo}" title="${produto.titulo}" /><br> 
						<small class="buy-button" style="font-size: 20px;">Compre</small>
						</a>
					</td>
				</c:forEach>
			</tr>
			</table>
		</div>
		
	</section>

</body>

<%@include file="/WEB-INF/views/rodape.jsp" %>

</html>

