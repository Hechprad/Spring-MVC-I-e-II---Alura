<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Cadastro de Livros">

<div class="container">
	<h1 class="text-center"><fmt:message key="form.subtitulo"/></h1>
	<!-- action="${s:mvcUrl('PC#gravar').build()}" pega o método gravar do ProdutoController -->
	<form:form action="${s:mvcUrl('PC#gravar').build()}" method="POST" 
			commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<form:errors path="titulo" cssStyle="font-size: 20px; color: red;"/>
			<label>
				<fmt:message key="form.titulo"/>
			</label>
			<form:input path="titulo" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="descricao" cssStyle="font-size: 20px; color: red;"/>
			<label>
				<fmt:message key="form.descricao"/>
			</label>
			<form:textarea path="descricao" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="paginas" cssStyle="font-size: 20px; color: red;"/>
			<label>
				<fmt:message key="form.paginas"/>
			</label>
			<form:input path="paginas" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="dataLancamento" cssStyle="font-size: 20px; color: red;"/>
			<label>
				<fmt:message key="form.data_de_publicacao"/>
			</label>
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
			<label>
				<fmt:message key="form.sumario"/>
			</label>
			<input name="sumario" type="file" class="form-control">
		</div>
		<br>
		<button type="submit" class="btn btn-primary"><fmt:message key="form.cadastrar"/></button>
		<br><br><br>
	</form:form>
</div>
</tags:pageTemplate>