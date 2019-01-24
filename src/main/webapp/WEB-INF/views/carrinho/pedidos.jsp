<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:url value="/" var="contextPath" />

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código">


	<jsp:body>
		<section class="container middle">
			<h2><fmt:message key="titulo.lista_pedidos" /></h2>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Valor</th>
						<th>Data Pedido</th>
						<th>Títulos</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listaPedidos.pedidos}" var="pedido">
						<tr>
							<td>${pedido.id}</td>
							<td>${pedido.valor}</td>
							<td><fmt:formatDate value="${pedido.data.time}"
									pattern="dd/MM/yyyy" /></td>
							<td>
								<c:forEach items="${pedido.produtos}" var="produto"
									varStatus="i">
									<c:choose>
										<c:when test="${i.count == pedido.totalProdutos}">
											${produto.titulo}
										</c:when>
										<c:otherwise>
											${produto.titulo},
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</jsp:body>

</tags:pageTemplate>