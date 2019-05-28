<?php
session_start();
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
			<h1> Acceso al sistema</h1>
			<form action="procesarLogin.php" method="POST">
				<fieldset>
					<legend>Usuario y constraseña</legend>
					<p>
						<label>Name:</label> <input type="text" name="user">
					</p>
					<p>
						<label>Password:</label> <input type="Password" name="pwd">
					</p>
					<button type="submit">Entrar</button>
				</fieldset>
			</form>
		</div>
		<?php
		require('pie.php');
		?>


	</div> <!-- Fin del contenedor -->
</body>
</html>