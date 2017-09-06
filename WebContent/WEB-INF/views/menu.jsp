<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title><fmt:message key="menu.titulo"/></title>
</head>
<body>

	<h2><fmt:message key="menu.subtitulo1"/></h2>
	
	<p><fmt:message key="menu.subtitulo2"/>, ${usuarioLogado.login}</p>
	<a href="listaTarefas">
		<fmt:message key="menu.clique_aqui1"/>
	</a> <fmt:message key="menu.clique_aqui2"/>

</body>
</html>