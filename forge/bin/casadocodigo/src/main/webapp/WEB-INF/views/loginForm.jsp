<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib  tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Login" fixedFooter="navbar-fixed-bottom">
	<div class="container">
		<h1 class="text-center"><fmt:message key="login.subtitulo"/></h1>
		<div class="form-group container" style="width: 400px;">
		<!-- action="${s:mvcUrl('PC#gravar').build()}" pega o método gravar do ProdutoController -->
		<form:form servletRelativeAction="/login" method="POST">
				<label><fmt:message key="login.email"/></label>
				<input name="username" type="text" class="form-control" placeholder='<fmt:message key="login.email.placeholder"/>'/>
				<label><fmt:message key="login.senha"/></label>
				<input name="password" type="password" class="form-control" placeholder='<fmt:message key="login.senha.placeholder"/>'/>
			<br>
			<button type="submit" class="btn btn-primary center-block"><fmt:message key="login.entrar"/></button><br>
		</form:form>
		</div>
	</div>
</tags:pageTemplate>