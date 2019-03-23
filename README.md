# Spring-MVCI---Alura
## Projeto realizado no primeiro curso de Spring MVC da Alura
*****
## 1:
  - jdk1.8.0_201 instalado
  - jre1.8.0_201 instalado
  - Git instalado
  - MySQL 8.0.15 instalado
  - Apache-maven-3.6.0 instalado
  - Apache-tomcat-9.0.16 instalado
*****
## 2:  
  - Repositório criado no git
  - Repositório clonado no Eclipse
  - Projeto criado com Jboss - Forge 3.9.2
        -> cmd - forge/bin/forge.bat (Para Windows) = "project-new --named casadocodigo"
  - Projeto importado para o Eclipse como 'Existing Maven Project'
  - Servidor Tomcat associado ao Eclipse e projeto 'casadocodigo' adicionado ao servidor local
  - index.html criado na src\main\web\app para verificar o servidor online
        -> localhost:8080/casadocodigo/
*****
## 3:
  - Adicionando Dependencias do Maven necessárias para o projeto:
        1 - spring-webmvc - 4.1.0.RELEASE
        2 - tomcat-servlet-api - 7.0.30
              2.1 - <scope>provided</scope>
        3 - javax.servlet.jsp-api - 2.2.1
              3.1 - <scope>provided</scope>
        4 - jstl-api - 1.2
              4.1 - <exclusions>
                   	<exclusion><groupId>javax.servlet</groupId><artifactId>servlet-api</artifactId></exclusion>
                   </exclusions>
        5 - jstl-impl - 1.2
              5.1 - <exclusions>
			<exclusion><groupId>javax.servlet</groupId><artifactId>servlet-api</artifactId></exclusion>
		   </exclusions>
        6 - slf4j-api - 1.6.1
        7 - jcl-over-slf4j - 1.6.1
              7.1 - <scope>runtime</scope>
        8 - slf4j-log4j12 - 1.6.1
              8.1 - <scope>runtime</scope>
        9 - log4j - 1.2.16
              9.1 - <scope>runtime</scope>
*****              

