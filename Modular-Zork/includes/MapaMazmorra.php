<?php
namespace es\ucm\fdi\aw;
use es\ucm\fdi\aw\Aplicacion as App;

//Clase que crea un objeto con todos los consumibles, enemigos, mazmorras y personaje del mapa
class MapaMazmorra
{
     /************************************ MODIFICACIONES BEA **********************************************/
    //Array necesita el idMapa, idMazmorras
    public static function guardarConexion($idMapa,$idMazmorra,$mazmorraNorte,$mazmorraEste,$mazmorraSur,$mazmorraOeste,$mazmorraInicial,$mazmorraFinal){  //guarda las conexiones entre mazmorras, mazmorraNorte,Sur....
      $res = "";
      $app = App::getSingleton(); 
      $conn = $app->conexionBd();

        $query = sprintf("UPDATE mapacontiene SET mapacontiene.mazmorraNorte = '$mazmorraNorte' ,mapacontiene.mazmorraEste = '$mazmorraEste',mapacontiene.mazmorraSur= '$mazmorraSur',mapacontiene.mazmorraOeste= '$mazmorraOeste',mapacontiene.mazmorraInicial= '$mazmorraInicial',mapacontiene.mazmorraFinal= '$mazmorraFinal' WHERE mapacontiene.idMapa = %s and mapacontiene.idMazmorra = %s",$idMapa,$idMazmorra);
      
        $rs = $conn->query($query);
        if($rs){
            $query = sprintf("SELECT * FROM mapacontiene WHERE mapacontiene.idMapa = (SELECT MAX(idMapa) FROM mapacontiene)");
            $rs = $conn->query($query);

            if($rs && $rs->num_rows > 0){
              $row = $rs->fetch_assoc();
     	        $rs->free();

              $res = new MapaMazmorra($row['idMapa'], $row['idMazmorra'],$row['mazmorraNorte'],$row['mazmorraSur'],$row['mazmorraEste'],$row['mazmorraOeste'],$row['mazmorraInicial'],$row['mazmorraFinal']);
     	      }else
                echo $conn->error;
        }else
                echo $conn->error;

          return $res;
      }

      public static function guardarMapaContiene($idMapa,$maz,$n){  //guarda las conexiones entre mazmorras, mazmorraNorte,Sur....
          $res = [];
          $app = App::getSingleton(); 
          $conn = $app->conexionBd();

          for($i=0;$i<$n;$i++){
            $query = sprintf("INSERT INTO mapacontiene (idMapa,idMazmorra) VALUES ('%s','%s')",$conn->real_escape_string($idMapa), $conn->real_escape_string($maz[$i]['id']));
            $rs = $conn->query($query);
        
            if($rs){
              $query = sprintf("SELECT * FROM mapacontiene WHERE mapacontiene.idMapa = (SELECT MAX(idMapa) FROM mapacontiene)");
              $rs = $conn->query($query);

              if($rs && $rs->num_rows > 0){
                $row = $rs->fetch_assoc();
                $rs->free();

                array_push($res, $row);
            }else
                echo $conn->error;
          }else
                echo $conn->error;
        }

          return $res;
      }


      public static function guardarNorte($idMapa,$idMazmorra,$sur){  //Una mazmorra se ha conectado a este idMazmorra por el norte, tendremos que conectar esa mazmorra a esta por el sur
          $app = App::getSingleton(); 
          $conn = $app->conexionBd();

          $query = sprintf("INSERT INTO mapacontiene (idMapa,idMazmorra) VALUES ('%s','%s')",$conn->real_escape_string($idMapa), $conn->real_escape_string($idMazmorra));
          $rs = $conn->query($query);
        
          if($rs){
            $query = sprintf("SELECT * FROM mapacontiene WHERE mapacontiene.idMapa = (SELECT MAX(idMapa) FROM mapacontiene)");
            $rs = $conn->query($query);

            if($rs && $rs->num_rows > 0){
              $row = $rs->fetch_assoc();
              $rs->free();

              $res = new MapaMazmorra($row['idMapa'], $row['idMazmorra'],$row['mazmorraNorte'],$row['mazmorraSur'],$row['mazmorraEste'],$row['mazmorraOeste'],$row['mazmorraInicial'],$row['mazmorraFinal']);
            }else
                echo $conn->error;
          }else
                echo $conn->error;

          return $res;
      }



      /************************************ MODIFICACIONES BEA **********************************************/
    
    private $idMapa;
    private $idMazmorra;
    private $mazmorraNorte;
    private $mazmorraSur;
    private $mazmorraEste;
    private $mazmorraOeste;
    private $mazmorraInicial;    
    private $mazmorraFinal;
    
    public function __construct($idMapa,$idMazmorra,$mazmorraNorte,$mazmorraSur,$mazmorraEste,$mazmorraOeste, $mazmorraInicial,$mazmorraFinal)
    {
        $this->idMapa=$idMapa;
        $this->idMazmorra=$idMazmorra;
        $this->mazmorraNorte=$mazmorraNorte;
        $this->mazmorraSur=$mazmorraSur;
        $this->mazmorraEste=$mazmorraEste;
        $this->mazmorraOeste=$mazmorraOeste;
        $this->mazmorraInicial=$mazmorraInicial;
        $this->mazmorraFinal=$mazmorraFinal;

    }

    private function size(){
        return  $this->tamanio;
    }
    private function getMazmorras(){
        
        return  $this->mazmorras;
    }
    private function setMazmorras($mazmorras){
        $this->mazmorras=$mazmorras;
        
    }
    private function getConsumibles(){
        return $this->consumibles;
    }
    private function getEnemigos(){
        return $this->enemigos;
    }

    private function getPersonaje(){
        return $this->personaje;
    }
    
}








