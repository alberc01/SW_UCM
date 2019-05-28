<?php

namespace es\ucm\fdi\aw;
use es\ucm\fdi\aw\Aplicacion as App;

//Clase que crea un objeto mazmorra
class MazmorrasConsumibles
{

  //Agus
    public static function guardarMazmorraConsumible($mazmorraConsum){
      $result_array=array();
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();

      $query = sprintf("INSERT INTO mazmorraconsumibles (idMazmorra,idConsumible,x,y) VALUES ('%s','%s','%s','%s')",
            $conn->real_escape_string($mazmorraConsum['idMazmorra']), 
            $conn->real_escape_string($mazmorraConsum['idConsumible']),
            $conn->real_escape_string($mazmorraConsum['x']),
            $conn->real_escape_string($mazmorraConsum['y']));
          $rs = $conn->query($query);

          if($rs){
           //Cojo los datos de este primer insert, para ver desde que id empieza.
            $query = sprintf("SELECT * FROM mazmorraconsumibles WHERE mazmorraconsumibles.idMazmorra = (SELECT MAX(idMazmorra) FROM mazmorraconsumibles)");
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
    private $idConsumible;
    private $x;
    private $y;


    private function __construct($idMazmorra,$idConsumible,$x,$y){
        $this->idMazmorra=$idMazmorra;
        $this->idConsumible = $idConsumible;
        $this->x=$x;
        $this->y=$y;
 
    }

    public function getIdMazmorra(){ 
        return $this->idMazmorra;
    }
    private function getIdConsumible(){ 
       return $this->idConsumible;
    }
    
    private function getX(){
        return $this->x;
    }
    private function getY(){
       return $this->y;
    }
   
    
    
}