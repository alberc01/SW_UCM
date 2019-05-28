
<div id="cabecera">
	<h1>Mi gran página web</h1>
	<div class="saludo">
		<?php
		if(!isset($_SESSION['nombre'])){
			echo 'Usuario desconocido.';
			echo"<a href='login.php'>(Login)</a>";
		}
		else{
			echo "Bienvenido, $_SESSION[nombre] ";
			echo"<a href='logout.php'>(Salir)</a>";
		}
		?>

	</div>
</div>