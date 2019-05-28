<?php

use es\ucm\fdi\aw\Aplicacion as App;
use es\ucm\fdi\aw\Usuario as Usuario;
?>

<div id="contenido">
	<div class="misObjetos">

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
						$tipo= "mapas";
						
						$query = sprintf("SELECT mapas.nombre, mapas.numMazmorras, mapas.dificultad, mapas.valoracion, mapas.numJugado, mapas.rutaImagen FROM mapas,comprados 
							WHERE comprados.idUsuario=%s AND comprados.tipo='%s' AND comprados.idObjeto=mapas.id ORDER BY dificultad DESC", $user->id(),$tipo);
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
				
				
				
	<div class="Table">
					<div class="Title">
						<h3>Enemigos</h3>
					</div>
					<div class="Heading">
						<div class="Cell"> <p></p> </div>
						<div class="Cell"> <p>Nombre</p> </div>
						<div class="Cell">  <p>Precio</p> </div>
						<div class="Cell">  <p>Fuerza</p>  </div>
						<div class="Cell"> <p>Habilidad</p>  </div>
						<div class="Cell"> <p>Vida</p> </div>
						<div class="Cell"> <p>Imagen</p> </div>
					</div>
					<?php
						$indice = 1;
						$datos;
						$app = App::getSingleton();
						$conn = $app->conexionBd();
						$name = $app->nombreUsuario();
						$user = Usuario::buscaUsuarioPorNombre($name);
						$tipo= "enemigo";
						
						$query = sprintf("SELECT enemigo.nombre, enemigo.precio, enemigo.fuerza, enemigo.habilidad, enemigo.vida, enemigo.rutaImagen FROM enemigo,comprados 
							WHERE comprados.idUsuario=%s AND comprados.tipo='%s' AND comprados.idObjeto=enemigo.id ORDER BY nombre DESC", $user->id(),$tipo);
						$rs = $conn->query($query) or die ($conn->error. " en la línea ".(__LINE__-1));
						
						if ($rs && $rs->num_rows > 0) {
							while ($fila = $rs->fetch_assoc()) {
								$nombre = $fila['nombre'];
								$precio = $fila['precio'];
								$fuerza = $fila['fuerza'];
								$habilidad = $fila['habilidad'];
								$vida = $fila['vida'];
								$rutaImagen = $fila['rutaImagen'];
									echo "<div class='Row'>";
										echo "<div class='Cell'><p>$indice</p></div>";
										echo "<div class='Cell'><p>$nombre</p></div>";
										echo "<div class='Cell'><p>$fuerza</p></div>";
										echo "<div class='Cell'><p>$habilidad</p></div>";
										echo "<div class='Cell'><p>$vida</p></div>";
										echo "<div class='Cell'><p>$precio</p></div>";
										echo "<div class='Cell'><img class='imgObj' src='$rutaImagen'/></div>";
									echo "</div>";
								$indice = $indice + 1;
							}
							echo "</table>";
							$rs->free();
						}
					?>
					
				</div>
				
				
				
	<div class="Table">
					<div class="Title">
						<h3>Personajes</h3>
					</div>
					<div class="Heading">
						<div class="Cell"> <p></p> </div>
						<div class="Cell"> <p>Nombre</p> </div>
						<div class="Cell">  <p>Precio</p> </div>
						<div class="Cell">  <p>Fuerza</p>  </div>
						<div class="Cell"> <p>Habilidad</p>  </div>
						<div class="Cell"> <p>Vida</p> </div>
						<div class="Cell"> <p>Imagen</p> </div>
					</div>
					<?php
						$indice = 1;
						$datos;
						$app = App::getSingleton();
						$conn = $app->conexionBd();
						$name = $app->nombreUsuario();
						$user = Usuario::buscaUsuarioPorNombre($name);
						$tipo= "personaje";
						
						$query = sprintf("SELECT personaje.nombre, personaje.precio, personaje.fuerza, personaje.habilidad, personaje.vida, personaje.rutaImagen FROM personaje,comprados 
							WHERE comprados.idUsuario=%s AND comprados.tipo='%s' AND comprados.idObjeto=personaje.id ORDER BY nombre DESC", $user->id(),$tipo);
						$rs = $conn->query($query) or die ($conn->error. " en la línea ".(__LINE__-1));
						
						if ($rs && $rs->num_rows > 0) {
							while ($fila = $rs->fetch_assoc()) {
								$nombre = $fila['nombre'];
								$precio = $fila['precio'];
								$fuerza = $fila['fuerza'];
								$habilidad = $fila['habilidad'];
								$vida = $fila['vida'];
								$rutaImagen = $fila['rutaImagen'];
									echo "<div class='Row'>";
										echo "<div class='Cell'><p>$indice</p></div>";
										echo "<div class='Cell'><p>$nombre</p></div>";
										echo "<div class='Cell'><p>$fuerza</p></div>";
										echo "<div class='Cell'><p>$habilidad</p></div>";
										echo "<div class='Cell'><p>$vida</p></div>";
										echo "<div class='Cell'><p>$precio</p></div>";
										echo "<div class='Cell'><img class='imgObj' src='$rutaImagen'/></div>";
									echo "</div>";
								$indice = $indice + 1;
							}
							echo "</table>";
							$rs->free();
						}
					?>
					
				</div>
				
				
	<div class="Table">
					<div class="Title">
						<h3>Objetos</h3>
					</div>
					<div class="Heading">
						<div class="Cell"> <p></p> </div>
						<div class="Cell"> <p>Nombre</p> </div>
						<div class="Cell"> <p>Categoria</p> </div>
						<div class="Cell">  <p>Precio</p> </div>
						<div class="Cell">  <p>Fuerza</p>  </div>
						<div class="Cell"> <p>Habilidad</p>  </div>
						<div class="Cell"> <p>Vida</p> </div>
						<div class="Cell"> <p>Imagen</p> </div>
					</div>
					<?php
						$indice = 1;
						$datos;
						$app = App::getSingleton();
						$conn = $app->conexionBd();
						$name = $app->nombreUsuario();
						$user = Usuario::buscaUsuarioPorNombre($name);
						$tipo= "consumibles";
						
						$query = sprintf("SELECT consumibles.nombre, consumibles.categoria, consumibles.precio, consumibles.fuerza, consumibles.habilidad, consumibles.vida, consumibles.rutaImagen FROM consumibles,comprados 
							WHERE comprados.idUsuario=%s AND comprados.tipo='%s' AND comprados.idObjeto=consumibles.id ORDER BY nombre DESC", $user->id(),$tipo);
						$rs = $conn->query($query) or die ($conn->error. " en la línea ".(__LINE__-1));
						
						if ($rs && $rs->num_rows > 0) {
							while ($fila = $rs->fetch_assoc()) {
								$nombre = $fila['nombre'];
								$categoria = $fila['categoria'];
								$precio = $fila['precio'];
								$fuerza = $fila['fuerza'];
								$habilidad = $fila['habilidad'];
								$vida = $fila['vida'];
								$rutaImagen = $fila['rutaImagen'];
									echo "<div class='Row'>";
										echo "<div class='Cell'><p>$indice</p></div>";
										echo "<div class='Cell'><p>$nombre</p></div>";
										echo "<div class='Cell'><p>$categoria</p></div>";
										echo "<div class='Cell'><p>$fuerza</p></div>";
										echo "<div class='Cell'><p>$habilidad</p></div>";
										echo "<div class='Cell'><p>$vida</p></div>";
										echo "<div class='Cell'><p>$precio</p></div>";
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
</div>
