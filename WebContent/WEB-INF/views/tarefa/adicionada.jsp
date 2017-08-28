<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tarefa adicionada</title>

</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<body>

<%-- <c:import url="/WEB-INF/views/cabecalho.jsp" /> --%>

<h2><fmt:message key="tarefa.adicionada.com.sucesso" /></h2>

<a href="listaTarefas"><fmt:message key="tarefa.adicionada.lista_tarefa"/></a>

</body>
</html>