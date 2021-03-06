<?php

namespace es\ucm\fdi\aw;
use es\ucm\fdi\aw\Aplicacion as App;

//Clase que crea un objeto mazmorra
class Mazmorras
{
  /************************************ MODIFICACIONES BEA **********************************************/



    public static function guardarMazmorra($idMapa,$maz,$n){  //Se crean X mazmorras
      $result_array=array();
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();
     
      //Hacer un for, devolver array con los reg nuevos
      for($i=0;$i<$n;$i++){
          $query = sprintf("INSERT INTO mazmorras (nombre,rutaImagen,w,h) VALUES ('%s','%s','%s','%s')",
            $conn->real_escape_string($maz[$i]['nombre']), $conn->real_escape_string($maz[$i]['rutaImagen']),$conn->real_escape_string($maz[$i]['w']),$conn->real_escape_string($maz[$i]['h']));
          $rs = $conn->query($query);

          if($rs){
           //Cojo los datos de este primer insert, para ver desde que id empieza.
            $query = sprintf("SELECT * FROM mazmorras WHERE mazmorras.id = (SELECT MAX(id) FROM mazmorras)");
            $rs = $conn->query($query);

            if($rs && $rs->num_rows > 0){
              $row = $rs->fetch_assoc();
              array_push($result_array, $row);
            }else
                echo"$conn->error";
          }else{
            echo"$conn->error";
            return false;
          }
      }
        $rs->free();
        return $result_array;
    }

    //Devuelve el registro
    public static function cargaUltimaMazmorra(){
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();
      $query = sprintf("SELECT * FROM mazmorras WHERE mazmorras.id = (SELECT MAX(id) FROM mazmorras)");
      $rs = $conn->query($query);
      if ($rs && $rs->num_rows > 0) {
        $fila = $rs->fetch_assoc(); 
        $mazmorra = new Mazmorras($fila['id'], $fila['nombre'], $fila['numSalidas'], $fila['numEnemigos'],$fila['recompensa'],$fila['rutaImagen'],$fila['historia'],$fila['x'], $fila['y'],$fila['w'],$fila['h']);
            $rs->free();
        }
        return $mazmorra;

    }
    





    
/************************************ MODIFICACIONES BEA **********************************************/

  //devuelve una lista con todos los mapas existentes
    public static function cargaMazmorra(){
      $result_array=array();
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();
      $query = sprintf("SELECT * FROM mazmorras");
      $rs = $conn->query($query);
      if ($rs) {
        if ($rs->num_rows > 0) {
            while($row = $rs->fetch_assoc()) {
                array_push($result_array, $row);
            }
            $rs->free();
        }
        return $result_array;

      }
    }
 
    public static function buscaMazmorraPorId($id)
  {
      $result_array=array();
      $app = App::getSingleton();
      $conn = $app->conexionBd();
      $query = sprintf("SELECT * FROM mazmorras WHERE mazmorra.id =%s",$id);
      $rs = $conn->query($query);
      if ($rs && $rs->num_rows == 1) {
        $fila = $rs->fetch_assoc(); 
        $mazmorra = new Mazmorras($fila['id'], $fila['nombre'], $fila['numSalidas'], $fila['numEnemigos'],$fila['recompensa'],$fila['rutaImagen'],$fila['historia']);
        $rs->free();
        return $mazmorra;
      }
      
      return false;
  }  


    private $id;
    private $nombre;
    private $numSalidas;
    private $numEnemigos;
    private $recompensa;
    private $rutaImagen;
    private $historia;
    private $x;
    private $y;
    private $w;
    private $h;

    private function __construct($id,$nombre,$numSalidas,$numEnemigos,$recompensa,$rutaImagen,$historia,$x,$y,$w,$h){
        $this->id=$id;
        $this->nombre=$nombre;
        $this->numSalidas=$numEnemigos;
        $this->recompensa=$recompensa;
        $this->rutaImagen=$rutaImagen;
        $this->historia=$historia;
        $this->x=$x;
        $this->y=$y;
        $this->w=$w;
        $this->h=$h;  
    }

    public function getId(){ 
        return $this->id;
    }
    private function getNombre(){ 
       return $this->nombre;
    }
    private function getNumSalidas(){
        return $this->numSalidas;
    }
    private function getRecompensa(){
       return $this->recompensa;
    }
    private function getRutaImagen(){
        
        return $this->rutaImagen;
    }
    private function getHistoria(){
        return $this->historia;
    }

    private function getX(){
        return $this->x;
    }
    private function getY(){
       return $this->y;
    }
    private function getW(){
       return $this->w;
    }
    private function getH(){
        return $this->h;   
    }
    
    
}