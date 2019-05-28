<?php
namespace es\fdi\ucm\aw;

class Usuario{

	private $id;
    private $nombreUsuario;
    private $nombre;
    private $password;
    private $rol;

    private function __construct($nombreUsuario, $nombre, $password, $rol){
        $this->nombreUsuario= $nombreUsuario;
        $this->nombre = $nombre;
        $this->password = $password;
        $this->rol = $rol;
    }

    public function id(){
        return $this->id;
    }

    public function rol(){
        return $this->rol;
    }

    public function nombreUsuario(){
        return $this->nombreUsuario;
    }

    public function compruebaPassword($password){
        return password_verify($password, $this->password);
    }

    public function cambiaPassword($nuevoPassword)
    {
        $this->password = self::hashPassword($nuevoPassword);
    }




	public static function buscaUsuario($nombreUsuario){
		$app= Aplicacion::getSingleton();
		$conn= $app->conexionBD();
		$consulta = sprintf("SELECT * FROM Usuarios U WHERE U.nombreUsuario = '%s'", $conn->real_escape_string($nombreUsuario));
		$resultado= $conn->query($consulta);
		$result=false;
		if($resultado){
			if ( $resultado->num_rows == 1) {
                $fila = $resultado->fetch_assoc();
                $user = new Usuario($fila['nombreUsuario'], $fila['nombre'], $fila['password'], $fila['rol']);
                $user->id = $fila['id'];
                $result = $user;
            }
            $resultado->free();
            return $result;
		}
		else{
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
		}
		return false;
	}

	public function login($nombreUsuario,$password){
		$user = self::buscaUsuario($nombreUsuario);
        if ($user && $user->compruebaPassword($password)) {
            return $user;
        }
        return false;
	}

	private static function hashPassword($password){
        return password_hash($password, PASSWORD_DEFAULT);
    }
        private static function inserta($usuario){
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("INSERT INTO Usuarios(nombreUsuario, nombre, password, rol) VALUES('%s', '%s', '%s', '%s')"
            , $conn->real_escape_string($usuario->nombreUsuario)
            , $conn->real_escape_string($usuario->nombre)
            , $conn->real_escape_string($usuario->password)
            , $conn->real_escape_string($usuario->rol));
        if ( $conn->query($query) ){
            $usuario->id = $conn->insert_id;
        }
        else{
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $usuario;
    }
    
    private static function actualiza($usuario){
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("UPDATE Usuarios U SET nombreUsuario = '%s', nombre='%s', password='%s', rol='%s' WHERE U.id=%i"
            , $conn->real_escape_string($usuario->nombreUsuario)
            , $conn->real_escape_string($usuario->nombre)
            , $conn->real_escape_string($usuario->password)
            , $conn->real_escape_string($usuario->rol)
            , $usuario->id);
        if ( $conn->query($query) ){
            if ( $conn->affected_rows != 1) {
                echo "No se ha podido actualizar el usuario: " . $usuario->id;
                exit();
            }
        }
        else{
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        
        return $usuario;
    }
    public static function guarda($usuario)
    {
        if ($usuario->id !== null) {
            return self::actualiza($usuario);
        }
        return self::inserta($usuario);
    }

	public function crea($nombreUsuario,$nombre,$password,$rol){
		$user = self::buscaUsuario($nombreUsuario);
        if ($user){
            return false;
        }
        $user = new Usuario($nombreUsuario, $nombre, self::hashPassword($password), $rol);
        return self::guarda($user);
	}
}

?>