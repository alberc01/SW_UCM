$(document).ready(function() {

	$("#correoOK").hide();
	$("#userOK").hide();
    $("#valido").hide();
    $("#invalido").show();
	$("#usuValido").hide();
    $("#usuNoValido").show();
	$("#campoEmail").change(function(){
		const campo = $("#campoEmail"); // referencia jquery al campo
		campo[0].setCustomValidity(""); // limpia validaciones previas
        $("#valido").hide();
        $("#invalido").show();
		// validación html5, porque el campo es <input type="email" ...>
		const esCorreoValido = campo[0].checkValidity();
		if (esCorreoValido && correoValidoComplu(campo.val())) {
			// el correo es válido y acaba por @ucm.es: marcamos y limpiamos quejas
			// tu código aquí: coloca la marca correcta
             $("#invalido").hide();
			$("#valido").show();
		      campo[0].setCustomValidity("");

		} else {			
			// correo invalido: ponemos una marca y nos quejamos
			$("#valido").hide();
            $("#invalido").show();
			// tu código aquí: coloca la marca correcta

			campo[0].setCustomValidity(
				"El correo debe ser válido y acabar por @ucm.es");
		}
	});

	
	$("#campoUser").change(function(){
		var url = "comprobarUsuario.php?user=" + $("#campoUser").val();
		$.get(url,usuarioExiste);
    });


	function correoValidoComplu(correo) {
		// tu codigo aqui (devuelve true ó false)
        expr = /^([a-zA-Z0-9_\.\-])+@ucm.es$/;
		if(expr.test(correo))return true;
		return false;
	}

	function usuarioExiste(data,status) {
		const campoU = $("#campoUser");
		if(data=="disponible"){
			$("#usuValido").show();
			$("#usuNoValido").hide();
			campoU[0].setCustomValidity("");
		}
		else{
			$("#usuValido").hide();
    		$("#usuNoValido").show();
			campoU[0].setCustomValidity(
				"El usuario ya existe");
		}
	}
})