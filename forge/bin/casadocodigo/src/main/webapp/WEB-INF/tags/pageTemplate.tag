<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="fixedFooter" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />

<title>${titulo} - Casa do Código</title>

<c:url value="/resources/css" var="contextPath"/>
<c:url value="/resources/js" var="jp"/>
<link rel="stylesheet" href="${contextPath}/bootstrap.min.css"/>
<link rel="stylesheet" href="${contextPath}/bootstrap-theme.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${jp}/bootstrap.min.js"></script>
<style>
	body{padding-top:90px;}
</style>

</head>

<body class="${bodyClass}">

<%@include file="/WEB-INF/views/cabecalho.jsp"%>

<jsp:doBody/>

<jsp:invoke fragment="extraScripts"></jsp:invoke>

<%@include file="/WEB-INF/views/rodape.jsp"%>
	
<script>
	console.log("Script padrão de todas as páginas é colocado aqui!");
</script>

</body>

</html>