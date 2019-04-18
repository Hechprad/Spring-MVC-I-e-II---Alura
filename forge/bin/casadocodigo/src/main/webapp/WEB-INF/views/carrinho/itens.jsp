<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Seu carrinho de compras">

<jsp:attribute name="extraScripts">
	<script>
		console.log("Finalização de compra de ${carrinhoCompras.quantidade} itens");
	</script>
</jsp:attribute>

<jsp:body>
	<section class="container middle">
		<h2 id="cart-title"><fmt:message key="itens.titulo"/></h2>
		<table id="cart-table" style="width: 100%;table-layout:fixed;" class="table table-bordered table-striped">
			<c:if test="${carrinhoCompras.quantidade > 0}">
			<thead>
				<tr>
					<th>Item</th>
					<th style="text-align: center; width: 100px;"><fmt:message key="itens.preco"/></th>
					<th style="text-align: center; width: 100px;"><fmt:message key="itens.quantidade"/></th>
					<th style="text-align: center; width: 100px;"><fmt:message key="itens.total"/></th>
					<th style="text-align: center; width: 100px;"><fmt:message key="itens.excluir"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.itens}" var="item"> <!-- c:forEach PARA LISTAR OS ITENS -->
					<tr>
						<td class="cart-img-col" style="text-align: left; vertical-align: middle;">
							<p style="font-size: 25px;">${item.produto.titulo}</p>
							<img src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145" width="71px" height="100px" />
						</td>
						<td class="numeric-cell" style="text-align: center; vertical-align: middle;">${item.preco}</td>
						<td class="quantity-input-cell" style="vertical-align: middle;">
							<input class="form-control" style="text-align:center; width: 80px;" type="number" min="0" id="quantidade" name="quantidade"
							value="${carrinhoCompras.getQuantidade(item)}"/>
							</td>
						<td class="numeric-cell" style="text-align: center; vertical-align: middle;">
							${carrinhoCompras.getTotal(item)}
							<fmt:message key="itens.valor_subtotal"/>
						</td>
						<td class="remove-item" style="text-align: center; vertical-align: middle;">
							<form:form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).arg(1,item.tipoPreco).build()}" method="POST">
								<button type="submit" class="btn btn-default" title="Excluir">
  									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
							</form:form>	
						</td>
					</tr>
				</c:forEach> <!-- FIM DO c:forEach -->
			</tbody>
			
			<tfoot>
				<tr>
					<td style="text-align: center; vertical-align: middle;">
						<form:form action="${s:mvcUrl('PC#finalizar').build()}" method="POST">
							<button type="submit" class="btn btn-primary" name="checkout" value="Finalizar compra">
								<fmt:message key="itens.finalizar_compra"/>
							</button>
						</form:form>
					</td>
					<td colspan="4" style="text-align: center; vertical-align: middle;">
						<p style="font-size: 25px;">
							<b>
							<fmt:message key="itens.valor_total">
								<fmt:param value="${carrinhoCompras.total}"/>
							</fmt:message>
							</b>
						</p>
					</td>
				</tr>
			</tfoot>
			</c:if>
			<c:if test="${carrinhoCompras.quantidade <= 0}">
			<tr>
				<td colspan="5" style="text-align: center; vertical-align: middle;">
					<p style="font-size: 25px;"><b><fmt:message key="itens.carrinho_vazio"/></b></p>
				</td>
			</tr>
			<br/>
			</c:if>
		</table>
	</section>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</jsp:body>
</tags:pageTemplate>