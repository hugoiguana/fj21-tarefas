<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página inicial</title>

<script type="text/javascript">

function Redirecionar(){
	
	var nomeInformado = prompt("Favor informar um nome: ", "");
	
	window.location.href = "/olaMundoSpring";
}
	
</script>

</head>
<body>
	<center>
		<h2>INICIANDO O SISTEMA EM SPRING MVC</h2>
		<h3>
			<a href="#" onclick="Redirecionar();">Click aqui para informar o nome</a>
		</h3>
	</center>
</body>
</html>