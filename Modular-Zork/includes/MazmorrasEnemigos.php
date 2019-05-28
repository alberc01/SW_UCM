<?php

namespace es\ucm\fdi\aw;
use es\ucm\fdi\aw\Aplicacion as App;

//Clase que crea un objeto mazmorra
class MazmorrasEnemigos
{

  //Agus
    public static function guardarMazmorraEnemigo($mazmorrasEnem){
      $result_array=array();
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();

      $query = sprintf("INSERT INTO mazmorraenemigo (idMazmorra,idEnemigo,x,y) VALUES ('%s','%s','%s','%s')",
            $conn->real_escape_string($mazmorrasEnem['idMazmorra']), 
            $conn->real_escape_string($mazmorrasEnem['idEnemigo']),
            $conn->real_escape_string($mazmorrasEnem['x']),
            $conn->real_escape_string($mazmorrasEnem['y']));
          $rs = $conn->query($query);

          if($rs){
           //Cojo los datos de este primer insert, para ver desde que id empieza.
            $query = sprintf("SELECT * FROM mazmorraenemigo WHERE mazmorraenemigo.idMazmorra = (SELECT MAX(idMazmorra) FROM mazmorraenemigo)");
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
        $rs->free();
        return $result_array;
    }
  /************************************ MODIFICACIONES agus **********************************************/
    
   
 

    private $idMazmorra;
    private $idEnemigo;
    private $x;
    private $y;


    private function __construct($idMazmorra,$idEnemigo,$x,$y){
        $this->idMazmorra=$idMazmorra;
        $this->idEnemigo = $idEnemigo;
        $this->x=$x;
        $this->y=$y;
 
    }

    public function getIdMazmorra(){ 
        return $this->idMazmorra;
    }
    private function getIdEnemigo(){ 
       return $this->idEnemigo;
    }
    
    private function getX(){
        return $this->x;
    }
    private function getY(){
       return $this->y;
    }
   
    
    
}