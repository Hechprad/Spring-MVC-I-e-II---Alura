<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Error">

	<section id="index-section" class="container middle">
		<p style="font-size: 20px; text-align: center;"><fmt:message key="error.subtitulo"/></p>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div class="container">
			<p style="font-size: 50px; text-align: center;"><s:message code="error.mensagem"/></p>
			<!-- 
				Mensagem: ${exception.message}
				<c:forEach items="${exception.stackTrace}" var="stk">
					${stk}
				</c:forEach>
			 -->
		</div>
	</section>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</tags:pageTemplate>