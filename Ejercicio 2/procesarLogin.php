<?php
session_start();

if(isset($_POST["user"] ) && isset($_POST["pwd"] )){
	if( $_POST["user"] === "user" && $_POST["pwd"]=== "userpass"){
		$_SESSION['nombre']="Juan";
		$_SESSION['login']=true;
	}
	else if($_POST["user"] === "admin" && $_POST["pwd"]=== "adminpass"){
		$_SESSION['nombre']="Administrador";
		$_SESSION['login']=true;
		$_SESSION['esAdmin']=true;
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="estilo.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Login</title>
	
</head>
<body>		
	<div id="contenedor">
		<?php
		require('cabecera.php');

		?>
		<?php
		require('sidebarIzq.php');

		?>
		<?php
		require('sidebarDer.php');

		?>
		<div id="contenido">
			<?php
			if(isset($_SESSION['login']) && $_SESSION['login']) {
				echo"
				<h1>Bienvenido $_SESSION[nombre]</h1>
				<p> Usa el menú de la izquierda para navegar. </p>
				";
			}
			else{
				echo"
				<h1>Error!</h1>
				<p> El usuario o contraseña no son válidos..</p>
				";
			}
			?>
		</div>
		<?php
		require('pie.php');
		?>
	</div> <!-- Fin del contenedor -->

</body>
</html>