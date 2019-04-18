<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}"><fmt:message key="menu.casa_do_codigo"/></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li>home</li>
      	
      	<security:authorize access="hasAnyRole('ROLE_ADMIN')">
	        <li><a href="${s:mvcUrl('PC#listar').build()}"><fmt:message key="menu.lista_de_produtos"/></a></li>
	        <li><a href="${s:mvcUrl('PC#form').build()}"><fmt:message key="menu.cadastro_de_produtos"/></a></li>
        </security:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li >
        	<a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">
        		<!-- s:message ou fmt:message funcionam da mesma maneira, a 's' spring e mais espertona -->
        		<s:message code="menu.carrinho" arguments="${carrinhoCompras.quantidade}"/>
        	</a>
        </li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <li>
        	<a href="#">
        		<security:authentication property="principal" var="usuario"/>
        		<fmt:message key="menu.usuario"/>: ${usuario.nome}
        	</a>
        </li>
        <li><a href="/casadocodigo/logout"><fmt:message key="menu.sair"/></a></li>
        </security:authorize>
        <security:authorize access="isAnonymous()">
		<li><a href="${s:mvcUrl('LC#loginForm').build()}"><s:message code="menu.login"/></a></li>	        
        </security:authorize>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><s:message code="menu.idioma"/> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="?locale=pt_BR"><s:message code="menu.pt"/></a></li>
            <li><a href="?locale=en_US"><s:message code="menu.en"/></a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>