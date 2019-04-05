# 📌Spring-MVC-I---Alura
***
## Projeto realizado no primeiro curso de Spring MVC da Alura 
(Site de uma loja de livros)
***
### Configurações iniciais

## 1:
  - jdk1.8.0_201 instalado
  - jre1.8.0_201 instalado
  - Git instalado
  - MySQL 8.0.15 instalado
  - Apache-maven-3.6.0 instalado
  - Apache-tomcat-9.0.16 instalado -> endereço do server local: 'http://localhost:8080/casadocodigo'
***
## 2:  
  - Repositório criado no git
  - Repositório clonado no Eclipse
  - Projeto criado com Jboss - Forge 3.9.2
        -> cmd - forge/bin/forge.bat (Para Windows) = "project-new --named casadocodigo"
  - Projeto importado para o Eclipse como 'Existing Maven Project'
  - Servidor Tomcat associado ao Eclipse e projeto 'casadocodigo' adicionado ao servidor local
  - index.html criado na src\main\web\app para verificar o servidor online
        -> localhost:8080/casadocodigo/
***
## 3:
Adicionando Dependências do Maven necessárias para o projeto👓

  - spring-webmvc - 4.1.0.RELEASE
  - tomcat-servlet-api - 7.0.30
  	```sh
	<scope>provided</scope>
	```
  - javax.servlet.jsp-api - 2.2.1
  	```sh
	<scope>provided</scope>
	```
  - jstl-api - 1.2
  	```sh
	<exclusions>
		<exclusion><groupId>javax.servlet</groupId><artifactId>servlet-api</artifactId></exclusion>
	</exclusions>
	```
  - jstl-impl - 1.2
  	```sh
	<exclusions>
		<exclusion><groupId>javax.servlet</groupId><artifactId>servlet-api</artifactId></exclusion>
	</exclusions>
	```
  - slf4j-api - 1.6.1
  - jcl-over-slf4j - 1.6.1
  	```sh
	<scope>runtime</scope>
	```
  - slf4j-log4j12 - 1.6.1
  	```sh
	<scope>runtime</scope>
	```
  - log4j - 1.2.16
  	```sh
	<scope>runtime</scope>
	```
Dependências JPA
  - hibernate-entitymanager - 4.3.0.Final
  - hibernate-core - 4.3.0.Final
  - hibernate-jpa-2.1-api - 1.0.0.Final
  - spring-orm - 4.1.0.RELEASE
  - mysql-connector-java - 8.0.15
  
Dependências de Validação de Dados
  - validation-api - 1.0.0.GA
  - hibernate-validator - 4.2.0.Final
  
Dependência de conversão para objeto da classe DadosPagamento em JSON - Aula 14 - Módulo 1
-> versão da dependência atualizada para evitar um problema de vulnerabilidade na versão utilizada na época em que o curso foi gravado
  - jackson-core - 2.9.8
  - jackson-databind - 2.9.8
***          

