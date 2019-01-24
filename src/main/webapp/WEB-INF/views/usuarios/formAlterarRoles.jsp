<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>



<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">

		<h1>
			<fmt:message key="titulo.cadastro_permissoes" /> ${usuario.nome} 
		</h1>
		
		<p><strong><fmt:message key="usuario.roles"/></strong></p>
		<form:form action="${s:mvcUrl('UC#atualizarRoles').arg(0, usuario.email).build()}" method="POST" modelAttribute="usuario" commandName="usuario">
			<form:checkboxes element="div" items="${roles}" path="roles"  />
			<button type="submit" class="btn btn-primary"><fmt:message key="botao.atualizar" /> </button>
		</form:form>

	</section>
</tags:pageTemplate>