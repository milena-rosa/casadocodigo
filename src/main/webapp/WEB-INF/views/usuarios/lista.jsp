<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<c:url value="/" var="contextPath" />


<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">
		<c:if test="${not empty message }">
			<h2 class="cdc-call">${message }</h2>
		</c:if>

		<h1>
			<a href="${s:mvcUrl('UC#form').build()}"><fmt:message
					key="titulo.cadastro_usuario" /></a>
		</h1>

		<h1>
			<fmt:message key="titulo.lista_usuarios" />
		</h1>

		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th><fmt:message key="usuario.nome" /></th>
				<th><fmt:message key="usuario.email" /></th>
				<th><fmt:message key="usuario.roles" /></th>
				<th></th>
			</tr>
			<c:forEach var="usuario" items="${usuarios}">
				<tr>
					<td>${usuario.nome}</td>
					<td>${usuario.email}</td>
					<td>${usuario.roles}</td>
					<td>
						<a href="${s:mvcUrl('UC#formAlterarRoles').arg(0, usuario.email).build()}">
							<input type="image" src="${contextPath}resources/imagens/editar.png" alt="Alterar" title="Alterar" />
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</tags:pageTemplate>