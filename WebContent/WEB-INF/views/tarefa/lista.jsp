<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title><fmt:message key="tarefa.lista.titulo"/></title>

</head>
<body>

	<a href="novaTarefa"><fmt:message key="tarefa.lista.subtitulo"/></a>
	<br />
	<br />
	<table>
		<tr>
			<th><fmt:message key="tarefa.lista.id" /></th>
			<th><fmt:message key="tarefa.lista.descricao" /></th>
			<th><fmt:message key="tarefa.lista.finalizado" /></th>
			<th><fmt:message key="tarefa.lista.dt_finalizacao" /></th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td><fmt:message key="tarefa.lista.nao_finalizado"/></td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td><fmt:message key="tarefa.lista.finalizado"/></td>
				</c:if>
				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>