<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="resources/js/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/tarefas.css" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title><fmt:message key="tarefa.lista.titulo"/></title>

</head>
<body>

<script type="text/javascript">

function finalizaAgora(id) {
	
	$.post("finalizaTarefa", {'id' : id}, function(resposta) {
		$("#lista_tr_" + id).html(resposta);
	});
}


function excluiTarefa(id){
	$.post("excluiTarefa", {'id' : id} , function(){
		$("#lista_tr_" + id).hide();
	});
	
}

</script>

	<a href="novaTarefa"><fmt:message key="tarefa.lista.subtitulo"/></a>
	<br />
	<br />
	<table id="tarefa_lista_tarefa">
		<tr>
			<th><fmt:message key="tarefa.lista.campo.id" /></th>
			<th><fmt:message key="tarefa.lista.campo.descricao" /></th>
			<th><fmt:message key="tarefa.lista.campo.finalizado" /></th>
			<th><fmt:message key="tarefa.lista.campo.dt_finalizacao" /></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="lista_tr_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td>
						<a href="#" onClick="finalizaAgora(${tarefa.id})">
							<fmt:message key="tarefa.lista.finaliza_agora"/>
						</a>
					</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td><fmt:message key="tarefa.lista.finalizado"/></td>
				</c:if>
				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
				<td><a href="removeTarefa?id=${tarefa.id}"><fmt:message key="tarefa.lista.remover"/></a></td>
				<td><a href="mostraTarefa?id=${tarefa.id}"><fmt:message key="tarefa.lista.alterar"/></a></td>
				<td><a href="#" onclick="excluiTarefa(${tarefa.id})"><fmt:message key="tarefa.lista.excluir"/></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>