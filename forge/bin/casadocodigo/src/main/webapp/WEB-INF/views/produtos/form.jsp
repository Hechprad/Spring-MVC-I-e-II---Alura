<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>
<body>

<form action="/produtos" method="POST">
	<div>
		<label>Título</label>
		<br>
		<input type="text" name="titulo">
	</div>
	<div>
		<label>Descrição</label>
		<br>
		<textarea rows="10" cols="20" name="descricao"></textarea>
	</div>
	<div>
		<label>Páginas</label>
		<br>
		<input type="text" name="paginas">
	</div>
	<br>
	<button type="submit">Cadastrar</button><br>
</form>

</body>
</html>