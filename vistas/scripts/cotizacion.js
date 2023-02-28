var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();

	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);	
	});
	
	//Cargamos los items al select proveedor
	$.post("../ajax/cotizacion.php?op=selectCliente", function(r){
	            $("#idcliente").html(r);
	            $('#idcliente').selectpicker('refresh');
	});

	
}

$("#frmContacto").on("submit",function(e)
	{
		e.preventDefault(); 
	 
		guardarContacto(e);

		//frmContacto.reset();
		
	});
	
	/* $("#frmBuscarContacto").on("submit",function(e)
	{
  
		e.preventDefault(); 
		buscarContacto();	
	 
 
	}); */
//Función limpiar
function limpiar()
{
	
	$("#idcliente").val("");
	$("#idcliente").selectpicker('refresh');
	$('#filaContacto').remove();
	$("#idcotizacion").val("");
	$("#subtotal").val("");
	$("#igv").val("");
	$("#btnBuscarContacto").prop("disabled",false);

	$("#cliente").val("");
	$("#serie_comprobante").val("");
	$("#num_comprobante").val("");
	$("#impuesto").val("0");

	$("#total_cotizacion").val("");
	$(".filas").remove();
	$("#total").html("0");

	//Obtenemos la fecha actual
	var now = new Date();
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);
	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $('#fecha_hora').val(today);

    //Marcamos el primer tipo_documento
    $("#tipo_comprobante").val("Boleta");
	$("#tipo_comprobante").selectpicker('refresh');
}

//Función mostrar formulario
function mostrarform(flag)
{
	limpiar();
	if (flag)
	{
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		//$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
		listarArticulos();

		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").show();
		detalles=0;
	}
	else
	{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		$("#btnagregar").show();
	}
}

//Función cancelarform
function cancelarform()
{
	limpiar();
	mostrarform(false);
}

//Función Listar
function listar()
{
	tabla=$('#tbllistado').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [		          
		        //    'copyHtml5',
		            'excelHtml5',
		        //    'csvHtml5',
		            'pdf'
		        ],
		"ajax":
				{
					url: '../ajax/cotizacion.php?op=listar',
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 20,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}


//Función ListarArticulos
function listarArticulos()
{
	tabla=$('#tblarticulos').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [		          
		            
		        ],
		"ajax":
				{
					url: '../ajax/cotizacion.php?op=listarArticulosCotizacion',
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 10,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}

function setearTipoMoneda(){
	var tipo_moneda=$("#tipo_moneda option:selected").text();
	  console.log(tipo_moneda);
  	if (tipo_moneda=='DOLARES')
    {
		 $("#tipoMoneda").val(tipo_moneda);
    }
    else 
    {
        $("#tipoMoneda").val(tipo_moneda);
    }
}
//Función para guardar o editar

function guardaryeditar(e){

	e.preventDefault();

	var idcontacto_tabla = $("#idcontacto_tabla").val();
	var idcliente = $("#idcliente").val();
	var total_cotizacion = $("#total_cotizacion").val();

	if(total_cotizacion == 0 || total_cotizacion == null){
	bootbox.alert("Porfavor, Vuelve agregar los productos, no se agrego el monto total");
	} else if(idcliente == null) {
		bootbox.alert("Porfavor, Seleccione el Cliente");
	}else if(idcontacto_tabla == undefined){
		bootbox.alert("Porfavor, Seleccione el contacto");
	}else{
		setearTipoMoneda();
		//$("#btnGuardar").prop("disabled",true);
		var formData = new FormData($("#formulario")[0]);

		$.ajax({
			url: "../ajax/cotizacion.php?op=guardaryeditar",
			type: "POST",
			data: formData,
			contentType: false,
			processData: false,

			success: function(datos)
			{                    
				bootbox.alert(datos);	          
				mostrarform(false);
				listar();
			}

		});
		limpiar();
	}
}

function guardarContacto()
{
	var formData = new FormData($("#frmContacto")[0]);

	$.ajax({
		url: "../ajax/cotizacion.php?op=guardarContacto",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {                    
			bootbox.alert(datos);	              
			$("#modalAddCustomer").modal("hide");
	         
	    }

	});
	limpiar();
}
$('#btnBuscarContacto').click(function () {
	buscarContacto();
 });
function buscarContacto()
{	
	tabla=$('#detalleBusqueda').dataTable(
		{
			"aProcessing": true,//Activamos el procesamiento del datatables
			"aServerSide": true,//Paginación y filtrado realizados por el servidor
			dom: 'Bfrtip',//Definimos los elementos del control de tabla
			buttons: [		          
						
					],
			"ajax":
					{
						url: '../ajax/cotizacion.php?op=buscarContacto',
						type : "POST",
						dataType : "json",						
						error: function(e){
							console.log(e.responseText);	
						}
					},
			"bDestroy": true,
			"iDisplayLength": 10,//Paginación
			"order": [[ 0, "desc" ]]//Ordenar (columna,orden)
		}).DataTable();
}
function mostrarContactoDetalle(idcontacto,nombre,apellido)
  {

    if (idcontacto !="")
    {
     
    	var fila='<tr class="filas2" id="filaContacto">'+
    	'<td><input type="hidden" name="idcontacto_tabla" value="'+idcontacto+'" id="idcontacto_tabla"  > <input type="text" name="nombre_tabla" id="nombre_tabla" value="'+nombre+'"></td>'+
    	'<td><input type="text" name="apellido_tabla" id="apellido_tabla" value="'+apellido+'"></td>'+
    	'</tr>';
    	cont++;
     
    	$('#tablaDetalleContacto').append(fila);

	 
		$("#modalSearchCustomer").modal("hide");
	 
		$("#btnBuscarContacto").prop("disabled",true);
    }
    else
    {
    	bootbox.alert("Error al ingresar el detalle, revisar los datos del artículo");
    }
  }

function mostrar(idcotizacion)
{
	$.post("../ajax/cotizacion.php?op=mostrar",{idcotizacion : idcotizacion}, function(data, status)
	{
		data = JSON.parse(data);		
		mostrarform(true);
		mostrarDetalle(data.idcotizacion);
		$("#idcliente").val(data.idcliente);
		$("#idcliente").selectpicker('refresh');
		$("#tipo_comprobante").val('COTIZACION');
		$("#tipo_comprobante").selectpicker('refresh');
		$("#serie_comprobante").val(data.serie_comprobante);
		$("#num_comprobante").val(data.num_comprobante);
		$("#fecha_hora").val(data.fecha);
		$("#impuesto").val(data.impuesto);
		$("#idcotizacion").val(data.idcotizacion);
		


		var fila='<tr class="filas2" id="filaContacto">'+
    	'<td><input type="hidden" name="idcontacto_tabla" value="'+data.idcontacto_con+'" id="idcontacto_tabla"  ><input type="text" name="nombre_tabla" id="nombre_tabla" value="'+data.nombre+'"></td>'+
    	'<td><input type="text" name="apellido_tabla" id="apellido_tabla" value="'+data.apellido+'"></td>'+
    	'</tr>';
    
     
    	$('#tablaDetalleContacto').append(fila);


		//Ocultar y mostrar los botones
		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").hide();
 	});
}
function mostrarDetalle(idcotizacion){
	$.post("../ajax/cotizacion.php?op=listarDetalle&id="+idcotizacion,function(r){
		$("#detalles").html(r);
});
}
function activar(idcotizacion)
{
	bootbox.confirm("¿Está Seguro de activar el artículo?", function(result){
		if(result)
        {
        	$.post("../ajax/cotizacion.php?op=activar", {idcotizacion : idcotizacion}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});	
        }
	})
}

//Función para anular registros
function anular(idcotizacion)
{
	bootbox.confirm("¿Está Seguro de eliminar la cotizacion?", function(result){
		if(result)
        {
        	$.post("../ajax/cotizacion.php?op=anular", {idcotizacion : idcotizacion}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});	
        }
	})
}

//Declaración de variables necesarias para trabajar con las compras y
//sus detalles
var impuesto=18;
var cont=0;
var detalles=0;
//$("#guardar").hide();
$("#btnGuardar").hide();
$("#tipo_comprobante").change(marcarImpuesto);

function marcarImpuesto()
  {
	 
  	var tipo_comprobante=$("#tipo_comprobante option:selected").text();
	  console.log(tipo_comprobante);
  	if (tipo_comprobante=='COTIZACION')
    {
       $("#impuesto").val(impuesto); 
		console.log("cotizacion:"+impuesto);
    }
    else 
    {
        $("#impuesto").val("0"); 
    }
  }

function agregarDetalle(idarticulo,unidadmedida,articulo,precio_cotizacion)
  {
  	var cantidad=1;
    var descuento=0;

    if (idarticulo!="")
    {
    	var subtotal=cantidad*precio_cotizacion;
    	var fila='<tr class="filas" id="fila'+cont+'">'+
    	'<td><button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')">X</button></td>'+
    	'<td><input type="hidden" name="idarticulo[]" value="'+idarticulo+'">'+articulo+'</td>'+
    	'<td><input type="text" name="unidadMedida[]"  id="unidadMedida[]" value="'+unidadmedida+'"></td>'+
		'<td><input type="text" name="cantidad[]" onkeyup="modificarSubototales()" id="cantidad[]" value="'+cantidad+'"></td>'+
    	'<td><input type="text" name="precio_cotizacion[]" onkeyup="modificarSubototales()" id="precio_cotizacion[]" value="'+precio_cotizacion+'"></td>'+
    	'<td><input type="text" name="descuento[]" value="'+descuento+'"></td>'+
    	'<td><span name="subtotal" id="subtotal'+cont+'">'+subtotal+'</span></td>'+
    	'<td><button type="button" onclick="modificarSubototales()" class="btn btn-info"><i class="fa fa-refresh"></i></button></td>'+
    	'</tr>';
    	cont++;
    	detalles=detalles+1;
    	$('#detalles').append(fila);
    	modificarSubototales();
    }
    else
    {
    	bootbox.alert("Error al ingresar el detalle, revisar los datos del artículo");
    }
  }


  function modificarSubototales()
  {
  	var cant = document.getElementsByName("cantidad[]");
    var prec = document.getElementsByName("precio_cotizacion[]");
    var desc = document.getElementsByName("descuento[]");
    var sub = document.getElementsByName("subtotal");

    for (var i = 0; i <cant.length; i++) {
    	var inpC=cant[i];
    	var inpP=prec[i];
    	var inpD=desc[i];
    	var inpS=sub[i];

    	inpS.value=(inpC.value * inpP.value)-inpD.value;
    	document.getElementsByName("subtotal")[i].innerHTML = inpS.value.toFixed(2);
    }
    calcularTotales();

  }
  function calcularTotales(){
  	var sub = document.getElementsByName("subtotal");
  	var subtotal = 0.0;

  	for (var i = 0; i <sub.length; i++) {
		subtotal += document.getElementsByName("subtotal")[i].value;
		var igv = 0.18*subtotal;
		var total;
		total = subtotal+igv;

	}
/* 	$("#subtotal").html("S/. " + subtotal.toFixed(2)); */
	$("#subtotal").val( subtotal.toFixed(2));
	$("#igv").val(igv.toFixed(2));
	$("#total").html("S/ " + total.toFixed(2));
    $("#total_cotizacion").val(total);
    evaluar();
  }
/*   onkeyup="myFunction()" */
  function evaluar(){
  	if (detalles>0)
    {
      $("#btnGuardar").show();
    }
    else
    {
      $("#btnGuardar").hide(); 
      cont=0;
    }
  }

  

  function eliminarDetalle(indice){
  	$("#fila" + indice).remove();
  	calcularTotales();
  	detalles=detalles-1;
  	evaluar()
  }


init();

$('#formulario  input[type=radio]').on('change', function() {

let consinigv = $('input[name=consinigv]:checked', '#formulario').val();
	if(consinigv == 'conigv'){
	//	console.log('Agregar Igv');
	 
		let  total = document.querySelector("#total_cotizacion").value;
		let  igv = document.querySelector("#igv").value;
		
		res = total - igv;
		let montobase = res/1.18;
		let igvnuevo = montobase*0.18;
	/* 	console.log('Total: '+total + '|||'+ 'IGV: '+igv+ '|||'+ ' TotalNuevo: '+res+ '|||'+ ' IGVNuevo: '+0.00);
		console.log('montobase: '+montobase.toFixed(2) + '|||'+ 'IGVNuevo: '+igvnuevo.toFixed(2)); */
		
		$("#subtotal").val(montobase.toFixed(2));
		$("#igv").val(igvnuevo.toFixed(2));
		$("#total").html("S/ " + res.toFixed(2));
		$("#total_cotizacion").val(res);

	}else{
		/* console.log('Quitar Igv'); */
		calcularTotales();
	}
 });

