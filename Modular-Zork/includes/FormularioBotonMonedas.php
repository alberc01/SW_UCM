<?php

namespace es\ucm\fdi\aw;

class FormularioBotonMonedas extends Form
{

  const HTML5_EMAIL_REGEXP = '^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';

  public function __construct()
  {
    parent::__construct('formBotonMonedas');
  }
  
  protected function generaCamposFormulario ($datos)
  {
  	$camposFormulario=<<<EOF
    <fieldset>
      <legend>Añadir monedas</legend>
  		<p><label>¿Cuántas monedas necesitas?</label></p>
      <p><input type="number" name="monedas" min="1" max="10000"/></p>
		  <button type="submit">Comprar</button>
    </fieldset>

EOF;
    return $camposFormulario;
  }

	/**
   * Procesa los datos del formulario.
   */
    protected function procesaFormulario($datos)
    {
        $result = array();
        $ok = true;
        $cant = $datos['monedas'] ?? '' ;
        if ( !$cant || $cant < 0) {
          $result[] = 'Error al acceder a los datos';
          $ok = false;
        }
          
        if ( $ok ) {

        	if(Aplicacion::getSingleton()->usuarioLogueado()){
            $user = Usuario::buscaUsuarioPorNombre($_SESSION['nombre']);
        		$res = $user->sumaMonedas($cant);
    		    if ( $res ) {
    		      $result = \es\ucm\fdi\aw\Aplicacion::getSingleton()->resuelve('/tienda.php');
    		    }else {
    		      $result[] = 'No se ha podido realizar la compra';
    		    }
    		}else{
    			$result[] = "Necesitas Iniciar sesión para poder comprar";
    		}
        }
        return $result;
    }
}