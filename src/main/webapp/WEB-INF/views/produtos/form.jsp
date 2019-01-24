<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>



<tags:pageTemplate titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">

		<h1><fmt:message key="titulo.cadastro_produto" /> </h1>
		<form:form action="${s:mvcUrl('PC#gravar').build() }" method="post" commandName="produto" enctype="multipart/form-data">
			<div class="form-group">
				<label><fmt:message key="produtos.titulo" /></label>
				<form:input path="titulo" cssClass="form-control" />
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
		        <label><fmt:message key="produtos.descricao" /></label>
				<form:textarea path="descricao" cssClass="form-control" />
		        <form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label><fmt:message key="produtos.paginas" /></label>
				<form:input path="paginas" cssClass="form-control" />
		        <form:errors path="paginas" />
			</div>
			<div class="form-group">
				<label><fmt:message key="produtos.data_lancamento" /></label>
				<form:input path="dataLancamento" cssClass="form-control"/>
		        <form:errors path="dataLancamento" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>${tipoPreco}</label>
					<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
					<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
				</div>
			</c:forEach>
			<div class="form-group">
			    <label><fmt:message key="produtos.sumario" /> </label>
			    <input name="sumario" type="file" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary"><fmt:message key="botao.cadastrar" /> </button>
		</form:form>
	</section>
</tags:pageTemplate>