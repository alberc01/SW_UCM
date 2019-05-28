var target = $('#target');

var commands = ["Ir", "Recoger", "Inventario", "Atacar", "Salir"];
var ctx, canvas;

var arrayMzUsados=[];
var idMapaAct;
var cargadoAct;
/*
 * Parametros:
 * Objeto
 * Transparencia
 * Posicion con respecto al resto del canvas (over...)
 */

 function draw(ctx, objeto, trans, composite){

 	var img = new Image();
 	img.src = objeto.rutaImagen;
 	img.onload = function() {
 		ctx.beginPath();
 		ctx.globalCompositeOperation = composite;
 		ctx.globalAlpha = trans;
                ctx.drawImage(img,objeto.x, objeto.y,objeto.w,objeto.h); //Deberia ser height y weight???
            };
        }

 //esta funcion realmente llama a draw recorriendo aaray de objetos y monstruos
 //Las rutas de la bbdd deben ser /img/nombre.png
 function drawObject(objeto){
 	var trans = 0;
 	var t = objeto.tipo;
 	switch(t){
 		case "consumible":
 		trans = 1;
 		break;
 		case "enemigo":
 		trans = objeto.vida/100;
 		break;
 		default:
 		trans = 1;
 		break;
 	}
 	draw(ctx,objeto,trans,"source-over");
 }

 function drawAll(ctx, objeto, trans, composite){
 	for(var i=0;i<objeto.length;i++){
 		var img = new Image();
 		img.src = objeto.rutaImagen;
 		img.onload = function() {
 			ctx.beginPath();
 			ctx.globalCompositeOperation = composite;
 			ctx.globalAlpha = trans;
 			ctx.drawImage(img,objeto.x, objeto.y, objeto.w, objeto.h);
 		};
 	}
 }


 function changeRoom(dir) {

 	var act = null;
 	var maz = mapaCargado.mazmorraActual;

 	if (maz !== undefined) {

 		switch(dir){
 			case "norte":
 			if(maz.mazmorraNorte !== null)
 				act = mapaCargado.mazmorras[maz.mazmorraNorte -1];

 			break;
 			case "sur":
 			if(maz.mazmorraSur !== null)
 				act = mapaCargado.mazmorras[maz.mazmorraSur -1];
 			break;
 			case "este":
 			if(maz.mazmorraEste !== null)
 				act = mapaCargado.mazmorras[maz.mazmorraEste-1];
 			break;
 			case "oeste":
 			if(maz.mazmorraOeste !== null)
 				act = mapaCargado.mazmorras[maz.mazmorraOeste-1];
 			break;
 			default:
 			break;
 		}

 		if(act != null){
 			$('#description').empty();
 			$('#barras').empty();
 			ctx.clearRect(0, 0, canvas.width, canvas.height);
 			mapaCargado.setMazmorraAct(act);
 			mapaCargado.personaje.setMazmorraAct(act);
 			$('#description').append(mapaCargado.mazmorraActual.historiaPrincipal );
 			barraProgreso();
 			actualizaCanvas(mapaCargado, mapaCargado.mazmorraActual.idMazmorra);

            //esto mejor meterlo en el evento click del inventario .
            /*
        }*/
    }
} 
}
function consume(boton){
	var consumible = mapaCargado.personaje.inventario[boton.value];

	if(consumible.getCategoria() == "salud"){
		mapaCargado.personaje.consumePocion(consumible);

        //$('#valorArm').html(mapaCargado.personaje.getFuerza());
        //$('#valorDef').html(mapaCargado.personaje.getVida());
        //$('#valorLl').html(mapaCargado.personaje.tieneLLave());
        $('#barras').empty();
        $('#vidaInv').empty()
        $('#vidaInvImg').empty()
        $('#valorArm').html(mapaCargado.personaje.getFuerza());
        $('#valorDef').html(mapaCargado.personaje.getVida());
        $('.valorLlave').html(mapaCargado.personaje.tieneLLave());
        barraProgreso();
        console.log(mapaCargado.personaje.inventario)
        refrescaInv();
    }
    else if(consumible.getCategoria() == "key"){
    	if(mapaCargado.esFinal() && mapaCargado.personaje.tieneLLave() && !mapaCargado.tieneEnemigos()){
    		$(panel).empty()
            //ctx.clearRect(0, 0, canvas.width, canvas.height);
	    //usuarioTerminaPartida();	//para actualizar base de datos al finalizar la partida
	    usuarioTermina();
	    panel.append('<img id="imgFinal" src="img/Final.png">');
	}
}
}

//actualiza los datos al terminar una partida
function usuarioTermina(){

	$.ajax({
		type: "POST",
		url: "usuarioTermina.php",
		success: function (msg){
			panel.append('<img id="imgFinal" src="img/Final.png">');
		}
	});
}


//Se encarga de refrescar el inventario para que se muestren los objetos actualizados
function refrescaInv(){

	var textohtmlPociones="";
	var textohtmlArmas="";
	var inventario=mapaCargado.personaje.inventario;
	for (var i = 0; i < inventario.length; i++){
        //console.log("aqui que "+ inventario[i])
        if(inventario[i].getCategoria()=="salud")
        	textohtmlPociones+='<button id="vidaInv" onclick="consume(this)" value="'+i+'"><img id="vidaInvImg" src="'+inventario[i].rutaImagen+'"></button>';
        else if(inventario[i].getCategoria()=="key")
        	textohtmlPociones+='<button id="vidaInv" onclick="consume(this)" value="'+i+'"><img id="keyInvImg" src="'+inventario[i].rutaImagen+'"></button>';
        else
        	textohtmlArmas+='<button id="armasInv" value="'+i+'"><img id="armasInvImg" src="'+inventario[i].rutaImagen+'"></button>';
    }
    $('#armas').html(textohtmlArmas);
    $('#consumibles').html(textohtmlPociones);

    /*$('buton').on('click', function(e) {
        consume(this)
        console.log("you clicked" , this.value)
    });*/

}


/*
Mete objeto en el inventario y lo pinta , actualizando la imagen principal 
*/
function pickUpThings(objeto){

	quitaConsumible(objeto);
	mapaCargado.cogeConsumible(objeto);


    //aqui se guarda el estado de la partida
    //if(objeto.getId()==1 || objeto.getId()==8)
    //guardarEstado(idMapaAct);
    //--------------------------------------------------



    $('#valorArm').html(mapaCargado.personaje.getFuerza());
    $('#valorDef').html(mapaCargado.personaje.getVida());
    $('.valorLlave').html(mapaCargado.personaje.tieneLLave());

    refrescaInv()
    
    $('#barras').empty();
    barraProgreso();
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    actualizaCanvas(mapaCargado,mapaCargado.mazmorraActual.idMazmorra);
    //console.log(mapaCargado.personaje.inventario)
        //refrescaInv();
        
    }



//funcion que determina que hacer cuando se ataca a un enemigo npc
function atacar(){
	maz  = mapaCargado.mazmorras[mapaCargado.mazmorraActual.idMazmorra - 1];
  if(maz.listaMonstruos !== null && maz.listaMonstruos.length !== 0){ // si existe mounstruo
  	$('#barras').empty();

  	mapaCargado.personaje.ataca(maz.listaMonstruos[0]);

  	if(mapaCargado.personaje.vidaAct <= 0){
  		gameOver();
  	}
  	if(mapaCargado.mazmorraActual.listaMonstruos[0].vida <= 0){
  		quitaEnemigo(mapaCargado.mazmorraActual.listaMonstruos[0]);
  		mapaCargado.mazmorraActual.listaMonstruos.pop();
  	}
  	barraProgreso();

  	ctx.clearRect(0, 0, canvas.width, canvas.height);
  	actualizaCanvas(mapaCargado,mapaCargado.mazmorraActual.idMazmorra);
  }

}

//comandos que se parsean para lo botones del usuario
function playerInput(input) {
	var command = input.split(" ")[0];
	switch (command) {
		case "ir":
            var dir = input.split(" ")[1]; // norte, sur, este, oeste
            changeRoom(dir);
            break;
            case "ayuda":
            showHelp();
            break;
            case "inventario":
            showinventario();
            break;
            case "recoger":
            //SE PRESUPONE QUE SOLO HAY UN OBJETO
            if(mapaCargado.mazmorraActual.listaConsumibles !== null && mapaCargado.mazmorraActual.listaConsumibles.length !== 0)
            	pickUpThings(mapaCargado.mazmorraActual.listaConsumibles[0]);
            break;
            case "atacar":
            atacar();
            break;
            case "guardar":
            guardarEstado(idMapaAct,cargadoAct);
            break;
            default:
            //$('#target').append('<div id="target">Comando invalido!</div>');
        }



    }


    function actualizaCanvas(mapa,mazmorraAct){
    	var maz =mapaCargado.mazmorraActual;
    	draw(ctx,maz,1, "destination-over");
            //Comprobar en todos que no es nulo
            if(mapa.personaje !== null)
            	draw(ctx,mapa.personaje,mapa.personaje.factorTrasparencia, "source-over");

            if(maz.listaConsumibles !== null && maz.listaConsumibles.length !== 0)
            	drawObject(maz.listaConsumibles[0]);

            if(maz.listaMonstruos !== null && maz.listaMonstruos.length !== 0)
            	drawObject(maz.listaMonstruos[0]);
        }

        function loadButton(){

        	$('#mainPanel').append('<div id="botonesPanel"></div>');

        	$('#botonesPanel').append('<div id="direction"></div>');
        	$('#direction').append('<button id="north" value="Ir norte"></button>');
        	$('#direction').append('<button id="west" value="Ir oeste"></button>');
        	$('#direction').append('<button id="east" value="Ir este"></button>');
        	$('#direction').append('<button id="south" value="Ir sur"></button>');

        	$('#botonesPanel').append('<div id="actions"></div>');
        	$('#actions').append('<button id="recoger" title="Recoger" value="recoger"></button>');
        	$('#actions').append('<button id="atacar" title="Atacar" value="atacar"></button>');
        	$('#actions').append('<button id="guardar" title="Guardar" value="guardar"></button>');



    /*$('#mainPanel').append('<div id="direction"></div>')
    $('#direction').append('<button id="north" value="Ir norte"></button>');
    $('#direction').append('<button id="west" value="Ir oeste"></button>')
    $('#direction').append('<button id="east" value="Ir este"></button>')
    $('#direction').append('<button id="south" value="Ir sur"></button>')

    $('#mainPanel').append('<div id="actions"></div>')
    $('#actions').append('<button id="recoger" title="Recoger" value="recoger"></button>');
    $('#actions').append('<button id="atacar" title="Atacar" value="atacar"></button>');
    $('#actions').append('<button id="guardar" title="Guardar" value="guardar"></button>');*/

    consumido();

    inventario();
    refrescaInv();

    $(document).ready(function () {
    	$("button").click(function (e) {
    		var valor = this.value;
    		valor = valor.toLowerCase()
    		playerInput(valor)
    	});
    });



    

}

function consumido(){
	$('#botonesPanel').append('<div id="valoresGlobal"></div>');
	$('#valoresGlobal').append('<div id="consumido"></div>');
	$('#valoresGlobal').append('<div id="valores"></div>');


	$('#consumido').append('<img id="armasEscudos" src = "img/buttons/inventario.png">')
	$('#valores').append('<img id="imgInv" src = "img/buttons/valores.png">')
	$('#valores').append('<div class="valorArma" id="valorArm"> '+mapaCargado.personaje.getFuerza()+'</div> ')

	$('#consumido').append('<img id="llave" src = "img/buttons/llave.png">')
	$('#valores').append('<img id="imgInv3" src = "img/buttons/valores.png">')
	$('#valores').append('<div class="valorLlave id="valorLl">'+mapaCargado.personaje.tieneLLave()+'</div> ')

}

//Carga la informacion del inventario
function inventario(){
	$('#mainPanel').append('<div id="inventarioPanel"></div>');
	$('#inventarioPanel').append('<div id="consumibles"></div>');
	$('#inventarioPanel').append('<div id="armas"></div>');


}


//la barra de progreso en cuando a vida de enemigos y personaje 
function barraProgreso(){
	maz  = mapaCargado.mazmorras[mapaCargado.mazmorraActual.idMazmorra - 1];


	$('#barras').append('<div id="barraP"></div>')
	$('#barraP').append('<img id="vida" src = "img/buttons/vida.png">')
	$('#barraP').append('<progress id=barraVida value="'+mapaCargado.personaje.getVida()+'" max="'+mapaCargado.personaje.getVidaMax()+'">70 %</progress>')

	if(maz.listaMonstruos !== null && maz.listaMonstruos.length !== 0){
		$('#barras').append('<div id="barraM"></div>')
		$('#barraM').append('<img id="vida" src = "img/buttons/monstruoBar.png">')
		$('#barraM').append('<progress id=barraMonst value="'+mapaCargado.mazmorraActual.listaMonstruos[0].getVida()+'" max="100">70 %</progress>')
	}

}
//Redirige a juego.php por haber perdido la totalidad de la vida
function gameOver(){
	alert("Te has quedado sin vida vuelve a empezar");
	window.location.pathname = '/VM-0007/juego.php';

}

//la funcion que mueve el juego, se llama desde loadgameFinal.js
function startGame(mapaSele){
	idMapaAct=mapaSele;
	panel.append('<canvas id="canvas" height="410" width="720"  ></canvas>');

	canvas =document.getElementById('canvas');
	ctx = canvas.getContext('2d');

	if(mapaCargado !== null || mapaCargado.mazmorraActual !== null){
            //console.log(mapaCargado.mazmorraActual.idMazmorra);
            
            actualizaCanvas(mapaCargado,mapaCargado.mazmorraActual.idMazmorra);
            

            panel.append('<div id="target"></div>');
            $('#target').append('<div id="barras"></div>')
            barraProgreso()
            $('#target').append('<div id="description">' + mapaCargado.mazmorraActual.historiaPrincipal + '</div>');
            //$('#target').append('<input id="user-input" placeholder="inserta tu comando.."></input>');
            //$('#user-input').focus();

            $('#target').append('<div id="mainPanel"></div>')

            loadButton();
            
        }
    }




    function luchaFinal(){
    	$('#target').empty();
    	ctx.clearRect(0, 0, canvas.width, canvas.height);
    	$('#target').append('<input id="user-input" placeholder="inserta tu comando.."></input>');
    	$('#user-input').focus();

    	draw(ctx,mapaCargado.mazmorraFinal,1, "destination-over");
    	draw(ctx,personaje,personaje.vida/100, "source-over");
    	drawObject(mapaCargado.mazmorraFinal.listaConsumibles);
    	drawObject(mapaCargado.mazmorraFinal.listaMonstruos);
    }
