<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@include file="/WEB-INF/views/cabecalho.jsp" %>

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