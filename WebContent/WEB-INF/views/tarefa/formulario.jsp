<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/jquery-ui.min.css">

<title><fmt:message key="tarefa.formulario.titulo"/></title>

</head>

<body>

<%-- <c:import url="/WEB-INF/views/cabecalho.jsp" /> --%>

<h3><fmt:message key="tarefa.formulario.titulo"/></h3>

<h3><form:errors path="tarefa.descricao" cssStyle="color:red"/></h3>

<form action="adicionaTarefa" method="post">

	<fmt:message key="tarefa.formulario.campo.descricao"/> 
	<br />
	<textarea name="descricao" rows="5" cols="100"></textarea>
	<br />
	
	<fmt:message key="tarefa.formulario.campo.data_finalizacao"/>
	<!--<input type="text" name="dataFinalizacao" /> -->
	<caelum:campoData id="dataFinalizacao" />
	<br />

	<input type="submit" value="<fmt:message key="tarefa.formulario.botao.adicionar"/>">
	
</form>

</body>
</html>