<?php

require_once __DIR__.'/includes/config.php';

?><!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<?= $app->resuelve('/css/estilo.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?= $app->resuelve('/css/estiloSidebarIz.css') ?>" />

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<title>Login</title>
</head>
<body>
	<div id="contenedor">
	<?php $app->doInclude('comun/cabecera.php');?>
		<div class="flexDesign">
		<?php $app->doInclude('comun/sidebarIzq.php');?>
			<div id="contenido">
			<h2>Ranking</h2>
				<p>En la sección de <a href ='ranking.php'>Ranking</a> aparecen los jugadores con las mejores puntuaciones.</p>
				<p>La puntuación de cada jugador dependerá del tiempo jugado, los mapas creados y la valoración de los otros usuarios a los mapas creados. Cuanto más alta sea la puntuación más arriba 
				del ranking estará.</p> 
				<p>Además como bonus por dedicar tiempo al juego se otorgarán regalos, y cuanto mejor sea la posición ocupada, mejores serán los premios que se otrogarán.</p>
			</div>
		</div>
	<?php
	$app->doInclude('comun/pie.php');
	?>
	</div>
</body>
</html>