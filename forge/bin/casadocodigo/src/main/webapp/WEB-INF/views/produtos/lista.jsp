<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib  tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Lista de Livros">
	<div class="container" >
		<h1 class="text-center" style="font-size: 30px"><fmt:message key="lista.subtitulo"/></h1>
			
			<!-- alertas de mensagem após cadastro de livro -->
			<c:if test="${sucesso != null}"> 
				<div class="alert alert-success text-center alert-dismissible" role="alert" style="font-size: 30px;">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${sucesso}
				</div>
			</c:if>
			<c:if test="${falha != null}"> 
				<div class="alert alert-danger text-center alert-dismissible" role="alert" style="font-size: 30px;">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${falha}
				</div>
			</c:if>
		
		<table style="width: 100%;table-layout:fixed;" class="table table-bordered table-striped table-hover">
			<tr>
				<th style="width: 50px; table-layout:fixed;" colspan="1" class="text-center"><fmt:message key="lista.id_do_livro"/></th>
				<th style="width: 100px; table-layout:fixed;" colspan="1"class="text-center"><fmt:message key="lista.titulo"/></th>
				<th style="width: 300px; table-layout:fixed;" colspan="1"class="text-center"><fmt:message key="lista.descricao"/></th>
				<th style="width: 70px; table-layout:fixed;" colspan="1"class="text-center"><fmt:message key="lista.paginas"/></th>
				<th style="width: 100px; table-layout:fixed;" colspan="1"class="text-center"><fmt:message key="lista.data_de_publicacao"/></th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td class="text-center">${produto.id}</td>	
					<td class="text-center"><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>	
					<td class="text-center">${produto.descricao}</td>		
					<td class="text-center">${produto.paginas}</td>	
					<td class="text-center"><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></td>	
				</tr>
			</c:forEach>
		</table>
	</div>
	<br/><br/>
</tags:pageTemplate>