<?php
require_once __DIR__.'/includes/config.php';
if(isset($_SESSION['idPartida'])){
	$idPartida=$_SESSION['idPartida'];
	
	$mapa=es\ucm\fdi\aw\Mapa::getMapaPartida($idPartida);
	echo print_r($mapa);
	$con=es\ucm\fdi\aw\Usuario::actualizarUsuarioFinPartida($mapa);
	$objetosUsados = es\ucm\fdi\aw\Partida::eliminarObjetosUsados($idPartida);

	if($objetosUsados){
		$invContiene = es\ucm\fdi\aw\Partida::eliminarInventarioContiene($idPartida);
		if($invContiene){
			$inventario = es\ucm\fdi\aw\Partida::eliminarInventario($idPartida);
			if($inventario){
				$partida = es\ucm\fdi\aw\Partida::eliminarPartida($idPartida);
				if($partida){
					$con=es\ucm\fdi\aw\Usuario::actualizarUsuarioFinPartida($mapa);
				}
				else{
					echo json_encode("Error al eliminar de partida");
				}
			}
			else{
				echo json_encode("Error al eliminar de inventario");
			}
		}
		else{
			echo json_encode("Error al eliminar de inventarioContiene");
		}
	}
	else{
		echo json_encode("Error al eliminar de objetosUsados");
	}	
}
?>
