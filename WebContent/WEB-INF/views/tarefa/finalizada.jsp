<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<td>${tarefa.id}</td>
<td>${tarefa.descricao}</td>
<td><fmt:message key="tarefa.lista.finalizado"/></td>
<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
<td><a href="removeTarefa?id=${tarefa.id}"><fmt:message key="tarefa.lista.remover"/></a></td>
<td><a href="mostraTarefa?id=${tarefa.id}"><fmt:message key="tarefa.lista.alterar"/></a></td>
<td><a href="#" onclick="excluiTarefa(${tarefa.id})"><fmt:message key="tarefa.lista.excluir"/></a></td>