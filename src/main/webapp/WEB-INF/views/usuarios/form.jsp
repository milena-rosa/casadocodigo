<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>



<tags:pageTemplate titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">

		<h1><fmt:message key="titulo.cadastro_usuario" /></h1>
		<form:form action="${s:mvcUrl('UC#gravar').build() }" method="POST" commandName="usuario">
			<div class="form-group">
				<label><fmt:message key="usuario.nome" /></label>
				<form:input path="nome" cssClass="form-control" />
				<form:errors path="nome" />
			</div>
			<div class="form-group">
		        <label><fmt:message key="usuario.email" /></label>
				<form:input path="email" cssClass="form-control" />
		        <form:errors path="email" />
			</div>
			<div class="form-group">
				<label><fmt:message key="usuario.senha" /></label>
				<form:password path="senha" cssClass="form-control" />
		        <form:errors path="senha" />
			</div>
			<div class="form-group">
				<label><fmt:message key="usuario.senha_repetida" /></label>
				<form:password path="senhaRepetida" cssClass="form-control"/>
		        <form:errors path="senhaRepetida" />
			</div>
			<button type="submit" class="btn btn-primary"><fmt:message key="botao.cadastrar" /> </button>
		</form:form>
	</section>
</tags:pageTemplate>