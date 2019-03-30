<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 40%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>
	<h1>Lista de Produtos</h1>
	<br>
	<div style="font-size: 30px; color: green;">${sucesso}</div>
	<br>
	<table>
		<tr>
			<td>ID do Livro</td>
			<td>Título</td>
			<td>Descrição</td>
			<td>Páginas</td>
			<td>Data de Lançamento</td>
		</tr>
		<c:forEach items="${produtos}" var="produto">
			<tr>
				<td>${produto.id}</td>	
				<td>${produto.titulo}</td>	
				<td>${produto.descricao}</td>		
				<td>${produto.paginas}</td>	
				<td><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></td>	
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="/casadocodigo">HOME</a>
	<br>
	<a href="produtos/form">Cadastrar novo produto</a>
</body>
</html>