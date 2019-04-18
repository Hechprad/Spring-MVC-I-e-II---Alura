<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>


<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li>home</li>
      	
      	<security:authorize access="hasAnyRole('ROLE_ADMIN')">
	        <li><a href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a></li>
	        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
        </security:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li ><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Seu Carrinho (${carrinhoCompras.quantidade})</a></li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <li>
        	<a href="#">
        		<security:authentication property="principal" var="usuario"/>
        		Usuário: ${usuario.nome}
        	</a>
        </li>
        <li><a href="/casadocodigo/logout">Sair</a></li>
        </security:authorize>
        <security:authorize access="isAnonymous()">
		<li><a href="${s:mvcUrl('LC#loginForm').build()}">Login</a></li>	        
        </security:authorize>
      </ul>
    </div>
  </div>
</nav>