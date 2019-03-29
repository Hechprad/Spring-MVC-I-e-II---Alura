<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>

<form action="/casadocodigo/produtos" method="POST">
	<div>
		<form:errors path="produto.titulo" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Título</label>
		<br>
		<input type="text" name="titulo">
	</div>
	<div>
		<form:errors path="produto.descricao" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Descrição</label>
		<br>
		<textarea rows="10" cols="20" name="descricao"></textarea>
	</div>
	<div>
		<form:errors path="produto.paginas" cssStyle="font-size: 20px; color: red;"/>
		<br>
		<label>Páginas</label>
		<br>
		<input type="text" name="paginas">
	</div>
	<br>
	<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
		<div>
			<input type="hidden" name="precos[${status.index}].tipo" value="${tipoPreco}">
			<label>${tipoPreco}</label>
			<br>
			<input type="text" name="precos[${status.index}].valor">
		</div>
	</c:forEach>
	<br>
	<button type="submit">Cadastrar</button><br>
</form>

</body>
</html>