<?php
if (strlen(session_id()) < 1)
  session_start();
require_once "../modelos/Cotizacion.php";

$cotizacion = new Cotizacion();
// condicion de una sola linea
$idcotizacion = isset($_POST["idcotizacion"])? limpiarCadena($_POST["idcotizacion"]):"";
$idcliente = isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$idusuario = $_SESSION["idusuario"];
$tipo_comprobante = isset($_POST["tipo_comprobante"])? limpiarCadena($_POST["tipo_comprobante"]):"";
$serie_comprobante = isset($_POST["serie_comprobante"])? limpiarCadena($_POST["serie_comprobante"]):"";
$num_comprobante = isset($_POST["num_comprobante"])? limpiarCadena($_POST["num_comprobante"]):"";
$fecha_hora = isset($_POST["fecha_hora"])? limpiarCadena($_POST["fecha_hora"]):"";
$impuesto = isset($_POST["impuesto"])? limpiarCadena($_POST["impuesto"]):"";
$subtotal_add = isset($_POST["txtSubTotal"])? limpiarCadena($_POST["txtSubTotal"]):"";
$igv_add = isset($_POST["txtIgv"])? limpiarCadena($_POST["txtIgv"]):"";
$total_cotizacion = isset($_POST["total_cotizacion"])? limpiarCadena($_POST["total_cotizacion"]):"";

$tipoMoneda = isset($_POST["tipoMoneda"])? limpiarCadena($_POST["tipoMoneda"]):"";


//Contacto
$idcontacto = isset($_POST["idcontacto"])? intval($_POST["idcontacto"]):"";
$nombre = isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
$apellido = isset($_POST["apellido"])? limpiarCadena($_POST["apellido"]):"";
$dni = isset($_POST["dni"])? limpiarCadena($_POST["dni"]):"";
$email = isset($_POST["email"])? limpiarCadena($_POST["email"]):"";
$celular = isset($_POST["celular"])? limpiarCadena($_POST["celular"]):"";
$whatsapp = isset($_POST["whatsapp"])? limpiarCadena($_POST["whatsapp"]):"";


$idcontacto_tabla = isset($_POST["idcontacto_tabla"])? limpiarCadena($_POST["idcontacto_tabla"]):"";

$nombre_contacto = isset($_POST["nombre_contacto"])? limpiarCadena($_POST["nombre_contacto"]):"";
$serie_comprobante = '0';
//op significa Operacion
switch($_GET["op"]){
    case 'guardaryeditar':

        if(empty($idcotizacion)){

            if(empty($idcontacto_tabla)){
                echo "Registre el contacto";
            }else{

                $rspta=$cotizacion->insertar($idcliente,$idusuario,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$subtotal_add,$igv_add,$total_cotizacion,$_POST["idarticulo"],$_POST["unidadMedida"],$_POST["cantidad"],$_POST["precio_cotizacion"],$_POST["descuento"],$tipoMoneda,$idcontacto_tabla);
              // echo $rspta;
               echo $rspta ? "Cotización registrada" : "No se registraron todos los datos de la cotizacion satisfactoriamente";
            }
        }
        
    break;
    case 'anular':
    
        $rspta=$cotizacion->anular($idcotizacion);
        echo $rspta ? "Cotización Eliminada" : "Cotización no se puede Eliminar";
    break;

    case 'mostrar':
        $rspta=$cotizacion->mostrar($idcotizacion);
        echo json_encode($rspta);
    break;
    case 'listarDetalle':
        //Obtiene el idcotizacion
        $id=$_GET['id']; 

        $rspta = $cotizacion->listarDetalle($id);
        $subTotal_=0.00;
        $total=0.00;
        echo '
        <thead style="background-color:#A9D0F5">
        <th>Opciones</th>
        <th>Artículo</th>
        <th>Unidad Medida</th>
        <th>Cantidad</th>
        <th>Precio cotizacion</th>
        <th>Descuento</th>
        <th>Subtotal</th>
        </thead>';
        while ($reg = $rspta->fetch_object())
        {
            echo '<tr class="filas"><td></td><td>'.$reg->nombre. ' - '. $reg->iddetalle_cotizacion.'</td> <td>'.$reg->unidadmedida.'</td><td>'.$reg->cantidad.'</td><td>'.$reg->precio_cotizacion.'</td><td>'.$reg->descuento.'</td><td>'.$reg->subtotal.'</td></tr>';
            $subTotal_ =$subTotal_+($reg->precio_cotizacion*$reg->cantidad-$reg->descuento);
            $igv_ =$subTotal_*0.18;
            $total =$subTotal_+$igv_;
            
        }

        function addTwoDecimals($number){
           return  number_format((float)$number, 2, '.', '');
        }
        echo '
        <tfoot>
        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>SubTotal</td>
                            <td><input placeholder="SubTotal" id="subtotal" value="'.addTwoDecimals($subTotal_)  .'" readonly disabled ></td>
                          </tr>
                          <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>IGV</td>
                            <td><input placeholder="IGV" id="igv" value="'. addTwoDecimals($igv_).'" readonly disabled></td>
                          </tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>TOTAL</th>
            <th><h4 id="total">S/ '. addTwoDecimals($total).'</h4> <input type="hidden" name="total_cotizacion" id="total_cotizacion"> </th>
        </tfoot>';
    break;
    case 'listar':
        $rspta=$cotizacion->listar();
        $data = Array();
        while ($reg=$rspta->fetch_object()){
            if($reg->tipo_comprobante=='Ticket')
            {
                $url='../reportes/exCotizacion.php?id=';
            }
            else{
                $url='../reportes/exCotizacion.php?id=';

            }
            $data[]=array(
                "0"=>($reg->estado=='Aceptado')?'<button class="btn btn-warning" onclick="mostrar('.$reg->idcotizacion.')"><i class="fa fa-eye"></i></button>'.
                    ' <button class="btn btn-danger" onclick="anular('.$reg->idcotizacion.')"><i class="fa fa-close"></i></button>'.' <a class="btn btn-info" target="_blank" href="'.$url.$reg->idcotizacion.'"> <i class="fa fa-print"></a>':
                    ' <button class="btn btn-danger" onclick="anular('.$reg->idcotizacion.')"><i class="fa fa-close"></i></button>'.'<button class="btn btn-warning" onclick="mostrar('.$reg->idcotizacion.')"><i class="fa fa-eye"></i></button>',
 
                "1"=>formatDateMysql($reg->fecha),
                "2"=>$reg->cliente . " - ".$reg->idcotizacion,
                "3"=>$reg->usuario,
               
                "4"=>$reg->tipomoneda,
                "5"=>$reg->serie_comprobante. '-' .$reg->num_comprobante,
                "6"=>number_format($reg->total_cotizacion,2,SPD,SPM),
                "7"=>($reg->estado=='Aceptado')?'<span class="label bg-green">Aceptado</span>':
                '<span class="label bg-red">Anulado</span>'
            );

        }
        $results= array(
            "sEcho"=>1, //info para datatables
            "iTotalRecords"=>count($data),
            "iTotalDisplayRecords"=>count($data),
            "aaData"=>$data);
        echo json_encode($results);
    break;
    case 'selectCliente':
        require_once "../modelos/Persona.php";
        $persona = new Persona();
        $rspta = $persona->listarC();
        echo '<option value="0" disabled >Seleccione</option>';
        while ($reg = $rspta->fetch_object())
            {
              echo '<option value=' . $reg->idpersona . '>' . $reg->nombre . '</option>';
            }
    break;

    case 'listarArticulosCotizacion':
        require_once "../modelos/Articulo.php";
        $articulo=new Articulo();
        $rspta=$articulo->listarActivosVenta();
        $data = Array();
        while ($reg=$rspta->fetch_object()){
            $data[]=array(         
                "0"=>'<button class="btn btn-warning" onclick="agregarDetalle('.$reg->idarticulo.',\''.$reg->unidadmedida.'\',\''.$reg->nombre.'\',\''.$reg->precio_venta.'\')"><span class="fa fa-plus"></span></button>',
                "1"=>$reg->nombre,
                "2"=>$reg->categoria,
                "3"=>$reg->codigo,
                "4"=>$reg->stock,
                "5"=>MMONEY.number_format($reg->precio_venta,2,SPD,SPM),
                "6"=>'<img width="50" height="50" src="../files/articulos/'.$reg->imagen.'">'
            );
    
        }
    $results= array(
        "sEcho"=>1, //info para datatables
        "iTotalRecords"=>count($data),
        "iTotalDisplayRecords"=>count($data),
        "aaData"=>$data);
    echo json_encode($results);   
    break;


    case 'buscarContacto':
      
        $rspta=$cotizacion->buscarContacto($nombre_contacto);
        $data = Array();
        while ($reg=$rspta->fetch_object()){
            $data[]=array(      
                "0"=>'<span class="btn btn-warning" onclick="mostrarContactoDetalle('.$reg->idcontacto.',\''.$reg->nombre.'\',\''.$reg->apellido.'\')"><span class="fa fa-plus"></span></span>',   
    
                "1"=>$reg->nombre,
                "2"=>$reg->apellido,
                "3"=>$reg->celular
            );
    
        }
    $results= array(
        "sEcho"=>1, //info para datatables
        "iTotalRecords"=>count($data),
        "iTotalDisplayRecords"=>count($data),
        "aaData"=>$data);
    echo json_encode($results);   

    break;

    case 'guardarContacto':

        if(empty($idcontacto)){
            $option = 1;
            $rspta=$cotizacion->insertarContacto($nombre,$apellido,$dni,$email,$celular,$whatsapp);

        }

        if($rspta > 0 )
		    {
            if($option == 1){
                echo "Contacto registrado";
            }else{
                echo "Contacto no se pudo registrar";
            }       
        }else if($rspta == 'exist'){
            echo "El contacto registrado ya existe";
        }
    break;

}
?>