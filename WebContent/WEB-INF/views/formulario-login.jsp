<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title><fmt:message key="login.titulo"/></title>
</head>
<body>

	<h2><fmt:message key="login.subtitulo"/></h2>
	<form action="efetuaLogin" method="post">
		<fmt:message key="login.login"/><input type="text" name="login" /> <br />
		<fmt:message key="login.senha"/><input type="password" name="senha" /> <br />
		<input type="submit" value="<fmt:message key="login.bt_entrar_tarefas"/>" />
	</form>

</body>
</html>