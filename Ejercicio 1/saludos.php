<?php
$loop = $_GET['num'];
if($loop!=42){
	for ($i=0; $i < $loop; $i++) { 
		echo '<p>'. $i . ' - ¡Hola mundo! </p>';
	}
}
else{
	echo 
	'<h1>
		Me has pedido que te salude 42 veces.
	</h1>
	<p>
		En realidad, esa es la respuesta a la pregunta final sobre la vida, el universo y todo lo demas.
	</p>';
}
?>