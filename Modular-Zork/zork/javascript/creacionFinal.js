var panel = $('#zork-area');

/* Coge el evento de click del boton que aparece en creacionFinal.php */
$(document).on('click', '#paso1', function(e) {
    $(function(){ 
          $.ajax({ 
            method: "GET", 
            url: "loadMazmorras.php", //Crea un mapa nuevo y carga las mazmorras disponibles
            success: function( data ) { 

                var result= $.parseJSON(data); 
                panel.append('<br><button id="getvalue">Paso 2</button>');

                var myArrayMap = [];
               
                if(result.length !== 0){
                    $.each( result, function( key, value ) { 
                            myArrayMap.push(value);
                     }); 
                      
                    panel.empty(); //Vaciamos el panel
                    gestionaSeleccion(myArrayMap);
                }
                else{
                    alert("Error al cargar la base de datos");
                    p.empty();   
                }
            }
          });  
    }); 
});


/* Gestiona los datos de la llamada AJAX */
function gestionaSeleccion(myArrayMap){
	//Cargamos el mapa nuevo en un objeto Mapa
	var mapa = new Mapa(myArrayMap[1][0].id, myArrayMap[1][0].nombre , myArrayMap[1][0].dificultad , myArrayMap[1][0].precio , myArrayMap[1][0].numMazmorras, 
	myArrayMap[1][0].recompensa, myArrayMap[1][0].propietario ,myArrayMap[1][0].rutaImagen, myArrayMap[1][0].descripcion, myArrayMap[1][0].valoracion,
	myArrayMap[1][0].numJugado , myArrayMap[1][0].terminadoCreado , null);

	mapa.inicializa();

	//Cargamos las mazmorras disponibles
	var mazmorras = [];
	for(var i=0;i<myArrayMap[0].length;i++){
		var m = new Mazmorra(myArrayMap[0][i].id, myArrayMap[0][i].nombre, myArrayMap[0][i].numSalidas, myArrayMap[0][i].numEnemigos,
		 myArrayMap[0][i].recompensa, myArrayMap[0][i].rutaImagen, myArrayMap[0][i].historia, myArrayMap[0][i].x, myArrayMap[0][i].y,
		  myArrayMap[0][i].w, myArrayMap[0][i].h);

		m.inicializa();
		mazmorras[i] = m;
	}

	var array = []; //Nuevo array con los objetos mapa, mazmorras disponibles
	array.push(mapa);
	array.push(mazmorras);
    seleccionaMazmorras(array);
}




/* Muestra las mazmorras disponibles, recoge la seleccion de las mazmorras */
function seleccionaMazmorras(datos){
	    panel.append("Selecciona la mazmorra que quieras crear");
	    panel.append("<form name=fmazmorra>");

	    //Muestra todas las mazmorras
	    for(var i=0; i<datos[1].length; i++){     
	        panel.append('<legend><input type="checkbox" name="mazmorras" id="'
	        	+ datos[1][i].idMazmorra +'">Mazmorra: '+i+"</legend><p>Nombre:   "+ datos[1][i].nombre+"</p> ");
	    }
	    panel.append('<p></p><button id="getvalue">Paso 2</button>'); 
	    panel.append("</form>");

	    jQuery('#getvalue').on('click', function(e) {
	    	var maz = [];
	    	var checkboxes;
	    	var count = 0;

	    	for(var i=0; i < datos[1].length;i++){
	    		checkboxes = document.getElementById(datos[1][i].idMazmorra);
	    		if(checkboxes.checked){
	       			selValue = datos[1][i].idMazmorra -1;
	        		maz.push(datos[1][selValue]);
	        		count++;
	        	}
	        }

	        if(count < datos[0].numMazmorras){
	        	panel.append("¡Debes seleccionar " + datos[0].numMazmorras + " mazmorras!");
	        }else if(count > datos[0].numMazmorras){
	        	panel.append("¡Solo puedes seleccionar " + datos[0].numMazmorras + " mazmorras!");
	        }else{
	        	panel.empty();
	        	guardarSeleccion(datos,datos[0].id,maz, datos[0].numMazmorras);
	        }
	    });
}


/* Guarda las mazmorras seleccionadas en la BBDD, crea nuevas mazmorras con las caracteristicas de las seleccionadas y crea sus relaciones con el mapa */
function guardarSeleccion(datos,idMapa,mazmorras,numMazmorras){ 
	
         $.ajax({ 
			 method: "GET", 
			 url: "loadCrearMazmorras.php",
			 data: {idMapa,mazmorras,numMazmorras},
			 success: function (msg){
					var result= $.parseJSON(msg); 
					var myArray = [];
					if(result.length !== 0){
						$.each( result, function( key, value ) {
								myArray.push(value);
						}); 
						datos.push(myArray);
						gestionaConexion(datos);
					}
					else{
						alert("Error al cargar la base de datos");
						p.empty();
					}
			 }
           }); 
   
}

function gestionaConexion(datos){
	datos[3] = []; //Para guardar las conexiones
	var m;

	for(var i =0; i < datos[2].length;i++){
		var m = new MapaMazmorra(datos[0].id,datos[2][i].id,null,null,null,null,0,0);
		m.inicializa();
		datos[3].push(m);
	}
	seleccionaConexion(datos, 1);
}

function desactivarBotones(id){
    document.getElementById(id).disabled=true;
}

function datoValido(datos,i){
	var j =0;

	while(datos[j].idMazmorra != i) j++;
	if(j == datos.length) return false;
	else return true;
}

function seleccionaConexion(datos,n){
	var norte = null;
	var sur = null;
	var este = null;
	var oeste = null;
	var ini = 0;
	var fin = 0;

	panel.append("<h1> LISTA DE MAZMORRAS SELECCIONADAS DISPONIBLES </h1>");
	for(var i=0; i<datos[2].length;i++){
		panel.append("<p>Id Mazmorra "+i+" : " + datos[2][i].id +"</p>");
	}

	

	panel.append("<p>Norte: <input type='text' name='txtnorte' id='txtnorte'><button id='norte'>Guardar</button></form></p>");
	panel.append("<p>Sur: <input type='text' name='txtsur' id='txtsur'><button id='sur'>Guardar </button></form></p>");
	panel.append("<p>Este: <input type='text' name='txteste' id='txteste'><button id='este'>Guardar </button></form></p>");
	panel.append("<p>Oeste: <input type='text' name='txtoeste' id='txtoeste'><button id='oeste'>Guardar </button></form></p>");
	panel.append("<p>Inicial: <input type='text' name='txtini' id='txtini'><button id='ini'>Guardar </button></form></p>");
	panel.append("<p>Final: <input type='text' name='txtfin' id='txtfin'><button id='fin'>Guardar </button></form></p>");
	panel.append('<p></p><button id="sigMaz">Mazmorra '+ n +'</button>');
	//Comprobacion de conexiones posibles
	validacionBotones(datos[3][n-1]);

	jQuery('#norte').on('click', function(e) {
		norte = document.getElementById("txtnorte").value;
		if(!datoValido(datos[3],norte)) norte = null;
	});

	jQuery('#sur').on('click', function(e) {
		sur = document.getElementById("txtsur").value;
		if(!datoValido(datos[3],sur)) sur = null;
	});

	jQuery('#este').on('click', function(e) {
		este = document.getElementById("txteste").value;
		if(!datoValido(datos[3],este)) este = null;
	});

	jQuery('#oeste').on('click', function(e) {
		oeste = document.getElementById("txtoeste").value;
		if(!datoValido(datos[3],oeste)) oeste = null;
	});

	jQuery('#ini').on('click', function(e) {
		ini = document.getElementById("txtini").value;
		if(ini != 0 || ini != 1) ini = 0;
	});

	jQuery('#fin').on('click', function(e) {
		fin = document.getElementById("txtfin").value;
		if(fin != 0 || fin != 1) fin = 0;
	});


	//Cuando se rellenen los campos se pasa a la sig mazmorra
		jQuery('#sigMaz').on('click', function(e) {
			var m = datos[3][n - 1];
			comprobarConexiones(datos,m,norte,sur,este,oeste,ini,fin);
			//Cargar datos en BBDD
			guardarSeleccionConexion(datos[0].id,m.idMazmorra,m.mazmorraNorte,m.mazmorraSur,m.mazmorraEste,m.mazmorraOeste,m.mazmorraInicial,m.mazmorraFinal);
	    	panel.empty();
	    	if(n < datos[2].length){
	    		seleccionaConexion(datos, n + 1);
	    	}
	    	else 
	    		cargaConsumibles(datos);
	    });
}

function validacionBotones(datos){
	if(datos.mazmorraNorte != null) desactivarBotones("norte");
	if(datos.mazmorraSur != null) desactivarBotones("sur");
	if(datos.mazmorraEste != null) desactivarBotones("este");
	if(datos.mazmorraOeste != null) desactivarBotones("oeste");
	if(datos.mazmorraInicial != 0) desactivarBotones("ini");
	if(datos.mazmorraFinal != 0) desactivarBotones("fin");
}

function comprobarConexiones(datos,conexiones,norte,sur,este,oeste,ini,fin){
	if(norte != null){
		conexiones.mazmorraNorte = norte;
		var i=0;
		while(datos[3][i].idMazmorra != norte) i++;
		var maz = datos[3][i];

		maz.mazmorraSur = conexiones.idMazmorra;
		datos[3][i] = maz;
	}

	if(sur != null){
		conexiones.mazmorraSur = sur;
		var i=0;
		while(datos[3][i].idMazmorra != sur) i++;
		var maz = datos[3][i];
		
		maz.mazmorraNorte = conexiones.idMazmorra;
		datos[3][i] = maz;
	}

	if(este != null){
		conexiones.mazmorraEste = este;
		var i=0;
		while(datos[3][i].idMazmorra != este) i++;
		var maz = datos[3][i];

		maz.mazmorraOeste = conexiones.idMazmorra;
		datos[3][i] = maz;
	}


	if(oeste != null){
		conexiones.mazmorraOeste = oeste;
		var i=0;
		while(datos[3][i].idMazmorra != oeste) i++;
		var maz = datos[3][i];

		maz.mazmorraEste = conexiones.idMazmorra;
		datos[3][i] = maz;
	}

	if(ini == 1){
		conexiones.mazmorraInicial = ini;
	}

	if(fin == 1){
		conexiones.mazmorraInicial = fin;
	}

	var j=0;
		while(datos[3][j].idMazmorra != conexiones.idMazmorra) j++;
	datos[3][j] =conexiones;
}


function guardarSeleccionConexion(idMapa,idMazmorra,norte,sur,este,oeste,ini,fin){
	 $.ajax({ 
			 method: "GET", 
			 url: "loadConexion.php",
			 data:{idMapa,idMazmorra,norte,sur,este,oeste,ini,fin},
			 success: function (msg){

					var result= $.parseJSON(msg); 
					//panel.append(result);
			}
            }); 
}


function cargaConsumibles (datos){
	$.ajax({ 
            method: "GET", 
            url: "loadConsumiblesTodos.php", 
            success: function( data ) { 

                var result= $.parseJSON(data); 
                

                var myArrayMap = [];
               
                if(result.length !== 0){
                    $.each( result, function( key, value ) { 
                            myArrayMap.push(value);
                     }); 
                      
                    panel.empty(); //Vaciamos el panel
                    console.log (myArrayMap)
                    cargaEnemigo (datos,myArrayMap)
                }
                else{
                    alert("Error al cargar la base de datos");
                    p.empty();   
                }
            }
          });  
}

function cargaEnemigo (datos,arayConsumibles){
	$.ajax({ 
            method: "GET", 
            url: "loadEnemigosTodos.php", 
            success: function( data ) { 

                var result= $.parseJSON(data); 
                
                //console.log (result)
                var arrayEnemigo = [];
              
                if(result.length !== 0){
                    $.each( result, function( key, value ) { 
                            arrayEnemigo.push(value);
                     }); 
                      
                    panel.empty(); //Vaciamos el panel
                    console.log (arrayEnemigo)
                    selectConsumible(datos,arrayEnemigo, arayConsumibles, 0)
             
                }
                else{
                    alert("Error al cargar la base de datos");
                    p.empty();   
                }
            }
          });  
}

function selectConsumible(datos, arrEnemigo, arrConsmubles, index){

		var idConsum = -1;
		var idEnem = -1;
		panel.append("<h2>Selecciona objetos y enemigos para cada mazmorra</h2>");
		//panel.append("<p>Mazmorra "+ datos[1][i].idMazmorra +"</p>");
		panel.append("<form>");

		
		panel.append('<p>Consumibles</p>')

		panel.append('<img id="consumibles" src = "img/pngZork/vacio.png" >')
		panel.append('<input type="Radio" name="objetos" id="consum" value="'+idConsum+'" checked>');
		for(var i=0; i < arrConsmubles.length;i++){
			panel.append('<img id="consumibles" src = "'+arrConsmubles[i].rutaImagen+'">')
			//necesito su id para meterlo en mazmorra consumible
			panel.append('<input type="Radio" name="objetos" id="consum" value="'+arrConsmubles[i].id+'">');
		}
		panel.append('<p>Enemigos</p>')

		panel.append('<img id="enemigos" src = "img/pngZork/vacio.png" >')
		panel.append('<input type="Radio" name="enemig" id="enem" value="'+idEnem+'" checked>');
		for(var i=0; i < arrEnemigo.length;i++){
			panel.append('<img id="enemigos" src = "'+arrEnemigo[i].rutaImagen+'">')
			panel.append('<input type="Radio" name="enemig" id="enem" value="'+arrEnemigo[i].id+'">');
		}
		panel.append("</form>");
		

		    panel.append('<p></p><button id="getvalue">Paso siguiente</button>'); 
		    

		    jQuery('#getvalue').on('click', function(e) {

		    	//console.log($("#consum").val())
		    	var radioConsum = document.getElementsByName('objetos');
				for (var i = 0, length = radioConsum.length; i < length; i++) {
	    			if (radioConsum[i].checked) {
	    				idConsum = radioConsum[i].value
	        				console.log(radioConsum[i].value)
	        				break;
	    			}
				}
		    	
		    	var radioEnem = document.getElementsByName('enemig');

				for (var i = 0, length = radioEnem.length; i < length; i++) {
	    			if (radioEnem[i].checked) {
	    				idEnem = radioEnem[i].value 
	        				console.log(radioEnem[i].value)
	        				break;
	    			}
				}
				panel.empty()
				guardaConsumible(datos[2][index].id, idConsum)
				guardaEnemigo(datos[2][index].id, idEnem)
				if(index < datos[2].length-1){
					
					selectConsumible(datos, arrEnemigo, arrConsmubles, index+1)
				}
				/*else{
					guardaConsumible(idMazmorra, idConsum)
					//guardaEnemigos(idMazmorra, idEnem)
				}*/
				
					//guardarConsumibles y enemigos en BD
		    });
}

function guardaConsumible(idMazmorra, idConsum){

	if(idConsum != -1){
		var mazmorrasConsum  = new MazmorraConsunmible(idMazmorra, idConsum, 350, 250);
		mazmorrasConsum.inicializa();

		$.ajax({ 
			 method: "GET", 
			 url: "guardaConsumibles.php",
			 data: {mazmorrasConsum},
			 success: function (msg){
					var result= $.parseJSON(msg); 
					var myArray = [];
					if(result.length !== 0){
					   /* from result create a string of data and append to the div */
						$.each( result, function( key, value ) {
								myArray.push(value);
						}); 
						//datos.push(myArray);
						//gestionaConexion(datos);
					}
					else{
						alert("Error al cargar la base de datos");
						p.empty();
					}
			 }
           }); 
		

	}
	
}
function guardaEnemigo(idMazmorra, idEnem){

	if(idEnem != -1){
		var mazmorrasEnem  = new MazmorraEnemigo(idMazmorra, idEnem, 440, 150);
		mazmorrasEnem.inicializa();

		$.ajax({ 
			 method: "GET", 
			 url: "guardaEnemigos.php",
			 data: {mazmorrasEnem},
			 success: function (msg){
					var result= $.parseJSON(msg); 
					var myArray = [];
					if(result.length !== 0){
					   /* from result create a string of data and append to the div */
						$.each( result, function( key, value ) {
								myArray.push(value);
						}); 
						//datos.push(myArray);
						//gestionaConexion(datos);
					}
					else{
						alert("Error al cargar la base de datos");
						p.empty();
					}
			 }
           }); 
		

	}
	
}


//--------------------------------------------------------clase mapa----------------------------------------------------------
var Mapa=function(id,nombre,dificultad,precio,numMazmorras,recompensa,propietario,rutaImagen,
				descripcion,valoracion,numJugado,terminadoCreado,mazmorras){
	var id;
	var nombre;
	var dificultad;
	var precio;
	var numMazmorras;
	var recompensa;
	var propietario;
	var rutaImagen;
	var descripcion;
	var valoracion;
	var numJugado;
	var terminadoCreado;
	var mazmorras; //Array que guardara las mazmorras seleccionadas

	
	this.inicializa=function(){
		this.id=id;
		this.nombre=nombre;
		this.dificultad=dificultad;
		this.precio=precio;
		this.numMazmorras=numMazmorras;
		this.recompensa=recompensa;
		this.propietario=propietario;
		this.rutaImagen=rutaImagen;
		this.descripcion=descripcion;
		this.valoracion=valoracion;
		this.numJugado=numJugado;
		this.terminadoCreado=terminadoCreado;
		this.mazmorras=new Array();
	}
	
}

//-------------------------------------------------------clase mapa contiene------------------------------------------------------//
var MapaMazmorra= function(idMapa,idMazmorra,norte, sur,este,oeste,inicio,final){
	
	var idMapa;
	var idMazmorra;
	var mazmorraNorte;
	var mazmorraSur;
	var mazmorraEste;
	var mazmorraOeste;
	var mazmorraInicial;
	var mazmorraFinal;

	
	this.inicializa= function(){
		this.idMapa=idMapa;
		this.idMazmorra=idMazmorra;
	 	this.mazmorraNorte=norte;
	 	this.mazmorraSur=sur;
	 	this.mazmorraEste=este;
	 	this.mazmorraOeste=oeste;
	 	this.mazmorraInicial=inicio;
	 	this.mazmorraFinal=final;
	}

};

//--------------------------------------------------------clase mazmorra----------------------------------------------------------
var Mazmorra= function(idMazmorra,nombre, numSalidas,numEnemigos,recompensa,rutaImagen,historia,x,y,w,h){
	
	var historia;
	var numSalidas;
	var recompensa;
	var idMazmorra;
	var numEnemigos;
	var rutaImagen;
	var x;
	var y;
	var w;
	var h;
	
	this.inicializa= function(){
		this.historia=historia;
		this.nombre=nombre;
		this.numSalidas=numSalidas;
		this.recompensa=recompensa;
		this.idMazmorra=idMazmorra;
		this.numEnemigos=numEnemigos;
		this.rutaImagen=rutaImagen;
		this.x=x;
		this.y=y;
		this.w=w;
		this.h=h;
	}
	this.getImagen=function(){
		return this.rutaImagen;
		
	}
	
	this.getId=function (){
		return this.idMazmorra;
		
	}
	this.getHistoriaPrincipal=function(){
		return this.historia;

	}
	
	this.getRecompensa= function(){
		return this.recompensa;
	}
	


};

//--------------------------------------------------------clase mazmorraConsumible--------------------------------------------------

var MazmorraConsunmible= function(idMazmorra,idConsumible,x,y){
	
	var idMazmorra;
	var idConsumible;
	var x;
	var y;
	
	this.inicializa= function(){
		this.idMazmorra=idMazmorra;
		this.idConsumible=idConsumible
		this.x=x;
		this.y=y;
	}
	
	


};

//--------------------------------------------------------clase mazmorraEnemigo--------------------------------------------------

var MazmorraEnemigo= function(idMazmorra,idEnemigo,x,y){
	
	var idMazmorra;
	var idEnemigo;
	var x;
	var y;
	
	this.inicializa= function(){
		this.idMazmorra=idMazmorra;
		this.idEnemigo=idEnemigo
		this.x=x;
		this.y=y;
	}
	
	


};


//--------------------------------------------------------clase Consumible----------------------------------------------------------
var Consumible= function(id,categoria,nombre,fuerza,habilidad,vida,imagenConsumible,x,y,w,h,tipo){
	//cada consumible tendra una respuesta asociada por lo que en la base de datos debe estar pasada como parametro para cada consumible.
	//por ejemplo todos los onjetos consumibles se podran coger para añadirse al inventario.

	var categoria;
	var nombre;
	var fuerza;
	var habilidad;
	var vida;
	var rutaImagen;
	var id;
	var x;
	var y;
	var w;
	var h;
	var tipo;


	this.inicializa= function(){
		this.categoria=categoria;
		this.nombre=nombre;
		this.fuerza=fuerza;
		this.habilidad=habilidad;
		this.vida=vida;
		this.rutaImagen=imagenConsumible;
		this.x=x;
		this.y=y;
		this.w=w;
		this.h=h;
		this.tipo=tipo;
	}
	//por defecto los efetos que no esten contemplados segun la categoria valdran 0 y no NULL.
	this.getFuerza=function(){
		return this.fuerza;
	}
	this.getNombre=function(){
		return this.nombre;
	}
	this.getCategoria=function(){

		return this.categoria;

	}
	this.getHabilidad=function(){

		return this.habilidad;

	}
	this.getVida=function(){
		return this.vida;
	}
	this.getId=function(){
		return this.id;
	}

	this.getTipo=function(){
		return this.tipo;
	}

};

//--------------------------------------------------------clase Monstruo----------------------------------------------------------
var Monstruo= function(vida, ataque,imagenMonstruo,nombre,x,y,w,h,tipo){
	//en la base de datos los monstruos tendran unas respuestas asociadas fijas, ya que a un monstruo solo se le puede atacar o huir de el.

var vida;
var ataque;
var rutaImagen;
var listaRespuestas;
var nombre;
var x;
var y;
var w;
var h;
var tipo;

this.inicializa=function(){
	this.vida=vida;
	this.ataque=ataque;
	this.rutaImagen=imagenMonstruo;
	this.nombre=nombre;
	this.x = x;
	this.y=y;
	this.w=w;
	this.h=h;
	this.tipo=tipo;

	//this.listaRespuestas=respuestas;
}
this.getNombre=function(){
	return this.nombre;
}

this.perderVida=function(daño){
	this.vida-=daño;
}
this.getAtaque =function(){
	return this.ataque;
}
this.getListaRespuestas= function(){
	return this.listaRespuestas;
}
this.getVida = function(){
	return this.vida
}

};

//--------------------------------------------------------clase Personaje----------------------------------------------------------
var Personaje= function(vida,nombre,fuerza,inventario,imagen,x,y,w,h){ //Esta cruzado con partida por eso sabemos su posicion

	var vidaAct;
	var vidaMax;
	var inventario;
	var rutaImagen;
	var fuerza;
	var nombre;
	var fuerza;
	var mazMorraActual;
	var x;
	var y;
	var w;
	var h;

	this.inicializa=function(){
		this.vidaMax=vida;
		this.vidaAct=vida;
		this.nombre=nombre;
		this.fuerza=fuerza;
		this.rutaImagen=imagen;
		this.x = x;
		this.y=y;
		this.w=w;
		this.h=h;
		this.cargaInv(inventario);
	}
	this.cargaInv=function(inventario){
		for (var i = 0; i < inventario.length; i++) {
			this.inventario.push(inventario[i]);
		}
	}

	this.restavida=function(daño){
		this.vidaAct-=daño;
	}

	this.getVida=function(){
		return parseInt(this.vidaAct);
	}

	this.getFuerza=function(){
		return this.fuerza;

	}
	this.sumVidaMax= function(vida){

		this.vidaAct = this.vidaAct + vida;
	}
	this.sumFuerza= function(fuerzaObjeto){

		this.fuerza+=fuerzaObjeto;
	}
	this.insertaInventario=function(consumible){
		this.inventario.push(consumible.getId());
	}
	//Suma todos los campos del consumible para actualizar el estado del jugador en nivel de caracteristicas
	this.interactuarConsumible=function(consumible){
		if(consumible.getCategoria()!="pocion"){
			if(this.vidaAct < vidaMax )
				this.vidaAct+=consumible.getVida();
		}
		else{
			this.fuerza+=consumible.getVida();
			this.habilidad+=consumible.getHabilidad();
			this.vidaMax+=consumible.getVida();
		}
		eliminaInventario(consumible.getId());
	}
	this.eliminaInventario=function(idConsum){
		for (var j = 0; j < this.inventario.length; j++) {
			if(this.inventario[j]==idConsum){
				this.inventario.splice(j,1);
			}
		}
	}
	

};


