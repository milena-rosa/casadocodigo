<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">
		<h1><a href="${s:mvcUrl('PC#form').build()}"><fmt:message key="titulo.cadastro_produto" /></a></h1>

		<h1><fmt:message key="titulo.lista_produtos"/></h1>
	
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th><fmt:message key="produtos.titulo"/></th>
				<th><fmt:message key="produtos.descricao"/></th>
				<th><fmt:message key="produtos.precos"/></th>
				<th><fmt:message key="produtos.paginas"/></th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build() }">${produto.titulo}</a> </td>
					<td>${produto.descricao}</td>
					<td>${produto.precos}</td>
					<td>${produto.paginas}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</tags:pageTemplate>