<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/jquery-ui.min.css">

<title><fmt:message  key="tarefa.mostra.titulo" /></title>
</head>
<body>

	<h3><fmt:message key="tarefa.mostra.subtitulo"/> - ${tarefa.id}</h3>
	
	<form action="alteraTarefa" method="post">
	
		<input type="hidden" name="id" value="${tarefa.id}" /> 
		<fmt:message key="tarefa.mostra.descricao"/>
		<br />
		<textarea name="descricao" cols="100" rows="5">${tarefa.descricao}</textarea>
		<br /> 
		<fmt:message key="tarefa.mostra.finalizado"/>
		<input type="checkbox" name="finalizado" value="true" ${(tarefa.finalizado ? 'checked' : '')} /> 
		<br /> 
		<fmt:message key="tarefa.mostra.dt_finalizacao"/>
		<br /> 
		<input type="text" id="dataFinalizacao" name="dataFinalizacao" value="<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>" />
		<br /> 
		<input type="submit" value="<fmt:message key="tarefa.mostra.btn_alterar"/>"/>
	</form>

<script>
	$("#dataFinalizacao").datepicker({dateFormat: 'dd/mm/yy'});
</script>


</body>
</html>