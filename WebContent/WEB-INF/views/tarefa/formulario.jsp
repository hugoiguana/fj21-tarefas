<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adiciona tarefa</title>

</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<body>

<%-- <c:import url="/WEB-INF/views/cabecalho.jsp" /> --%>

<h3>Adicionar tarefas</h3>

<h3><form:errors path="tarefa.descricao" cssStyle="color:red"/></h3>

<form action="adicionaTarefa" method="post">

	Descrição: 
	<br />
	<textarea name="descricao" rows="5" cols="100"></textarea>
<!-- 	Data Finalização: -->
<!-- 	<input type="text" name="dataFinalizacao" /> -->
<%-- 	<caelum:campoData id="dataFinalizacao" /> --%>
<!-- 	<br /> -->

	<input type="submit" value="Adicionar">
	
</form>

</body>
</html>