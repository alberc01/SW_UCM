<?php
namespace es\fdi\ucm\aw;
class Aplicacion{

	private static $instancia;
	private $datosBD;
	private $inicializada=false;
	private $conn;

	public static function getSingleton(){
		if(!self::$instancia instanceof self)
			self::$instancia = new self;

		return self::$instancia;

	}
	/**evitar instancias de clase, deben estar implementadas**/
	protected function __construct() {
	}
	private function __clone(){
		parent::__clone();
	}
	private function __wakeup(){
		return parent::__wakeup();
	}

	public function init($datosBD){
		if(!$this->inicializada){
			$this->datosBD=$datosBD;
			$this->inicializada=true;
		}
	}

	public function conexionBD(){
			if($this->inicializada){
				if(! $this->conn){

					$this->conn = new \mysqli(
							$this->datosBD['host'],
							$this->datosBD['user'],
							$this->datosBD['pass'],
							$this->datosBD['bd'],
					);/** iniciar la conexion con la base de datos usando los campos de la variable $datosDB **/

					if($this->conn->connect_errno){
						echo "Error de conexión a la BD: (" . $this->conn->connect_errno . ") " . utf8_encode($this->conn->connect_error);
						exit();
					}
					if(!$this->conn->set_charset("utf8mb4")){
							echo "Error al configurar la codificación de la BD: (" . $this->conn->errno . ") " . utf8_encode($this->conn->error);
						exit();

					}

				}
				return $this->conn;
			}
			else{
				echo'La aplicacion no ha sido inicializada';
				exit();
			}

	}
	public function apagar(){
			if($this->inicializada){
				if($this->conn != null){
					$this->conn->close();
				}
			}
			else{
				echo'La aplicacion no ha sido inicializada';
				exit();
			}

	}

}

?>