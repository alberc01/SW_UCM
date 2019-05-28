<?php
session_start();
if(isset($_SESSION['nombre']))unset($_SESSION['nombre']);
if(isset($_SESSION['login']))unset($_SESSION['login']);
if(isset($_SESSION['esAdmin']))unset($_SESSION['esAdmin']);
session_destroy();
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="estilo.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Portada</title>
	
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
			<h1>Hasta pronto!</h1>
		</div>
		<?php
		require('pie.php');
		?>
	</div> <!-- Fin del contenedor -->

</body>
</html>