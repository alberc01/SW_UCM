<?php

require_once __DIR__.'/includes/config.php';

?><!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<?= $app->resuelve('/css/estilo.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?= $app->resuelve('/css/estiloSidebarIz.css') ?>" />

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
  	<title>Portada</title>
</head>
<body>
<div id="contenedor">
<?php $app->doInclude('comun/cabecera.php');?>
	<div class="flexDesign">
	<?php $app->doInclude('comun/sidebarIzq.php');
	$app->doInclude('contenidos/contenidoAyuda.php');?>
	</div>
<?php $app->doInclude('comun/pie.php');
?>
</div>
</body>
</html>