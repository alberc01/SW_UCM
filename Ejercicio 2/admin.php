<?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="estilo.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Admin</title>
	
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
			if(isset($_SESSION['esAdmin'])){
				if($_SESSION['esAdmin']){
					echo"<h1>Consola de administración</h1>
					<p>Aquí estarían todos los controles de administración</p>
					";
				}
			}
			else{
				echo"<h1>Acceso Denegado</h1>
				<p>No tienes permisos suficientes para administrar la web..</p>
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
