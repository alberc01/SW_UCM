<?php

use es\ucm\fdi\aw\Aplicacion as App;
use es\ucm\fdi\aw\Usuario as Usuario;
?>
<div id="contenido">
				<h2>Mapas propios creados</h2>
				<div class="Table">
					<div class="Title">
						<h3>Mapas</h3>
					</div>
					<div class="Heading">
						<div class="Cell"> <p></p> </div>
						<div class="Cell"> <p>Nombre</p> </div>
						<div class="Cell">  <p>Num Mazmorras</p> </div>
						<div class="Cell">  <p>Dificultad</p>  </div>
						<div class="Cell"> <p>Valoración</p>  </div>
						<div class="Cell"> <p>Numero de veces jugado</p> </div>
						<div class="Cell"> <p>Imagen</p> </div>
					</div>
					<?php
						$indice = 1;
						$datos;
						$app = App::getSingleton();
						$conn = $app->conexionBd();
						$name = $app->nombreUsuario();
						$user = Usuario::buscaUsuarioPorNombre($name);
						
						$query = sprintf("SELECT nombre, numMazmorras, dificultad, valoracion, numJugado, rutaImagen FROM mapas 
							WHERE mapas.propietario=%s ORDER BY dificultad DESC", $user->id());
						$rs = $conn->query($query) or die ($conn->error. " en la línea ".(__LINE__-1));
						
						if ($rs && $rs->num_rows > 0) {
							while ($fila = $rs->fetch_assoc()) {
								$nombre = $fila['nombre'];
								$numMazmorras = $fila['numMazmorras'];
								$dificultad = $fila['dificultad'];
								$valoracion = $fila['valoracion'];
								$numJugado = $fila['numJugado'];
								$rutaImagen = $fila['rutaImagen'];
									echo "<div class='Row'>";
										echo "<div class='Cell'><p>$indice</p></div>";
										echo "<div class='Cell'><p>$nombre</p></div>";
										echo "<div class='Cell'><p>$dificultad</p></div>";
										echo "<div class='Cell'><p>$numMazmorras</p></div>";
										echo "<div class='Cell'><p>$valoracion</p></div>";
										echo "<div class='Cell'><p>$numJugado</p></div>";
										echo "<div class='Cell'><img class='imgObj' src='$rutaImagen'/></div>";
									echo "</div>";
								$indice = $indice + 1;
							}
							echo "</table>";
							$rs->free();
						}
					?>
					
				</div>
			</div>