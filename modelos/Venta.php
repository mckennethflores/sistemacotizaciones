<?php
require_once "../config/Conexion.php";

class Venta
{
    public function __construct()
    {

    }
    public function insertar($idcliente,$idusuario,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$total_venta,$idarticulo,$cantidad,$precio_venta,$descuento)
    {
        $sql = "INSERT INTO venta (idcliente,idusuario,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total_venta,estado)
        VALUES ('$idcliente','$idusuario','$tipo_comprobante','$serie_comprobante','$num_comprobante','$fecha_hora','$impuesto','$total_venta', 'Aceptado')";
    
        $idventanew=ejecutarConsulta_retornarID($sql);
        $num_elementos=0;
        $sw=true;
        while($num_elementos < count($idarticulo))
        {
            $sql_detalle = "INSERT INTO detalle_venta(idventa,idarticulo,cantidad,precio_venta,descuento) VALUES('$idventanew','$idarticulo[$num_elementos]','$cantidad[$num_elementos]','$precio_venta[$num_elementos]','$descuento[$num_elementos]')";
            ejecutarConsulta($sql_detalle) or $sw = false;
            $num_elementos= $num_elementos+1;
        }

        return $sw;

    }
    public function activar($idventa)
    {
        $sql="UPDATE venta SET estado='Aceptado' WHERE idventa='$idventa' ";
        return ejecutarConsulta($sql);
    }
    public function anular($idventa)
    {
        $sql = "SELECT * FROM detalle_venta WHERE idventa = '$idventa'";
        $sql1 = ejecutarConsulta($sql);

        while ($reg = mysqli_fetch_array($sql1)) {

            $idarticulo = $reg['idarticulo'];
            $cantidad = $reg['cantidad'];
            
            $sql3 = "UPDATE articulo
            SET stock = stock + $cantidad
            WHERE idarticulo = '$idarticulo';";
            ejecutarConsulta($sql3);
            
        }
        $delete_sql_hijo = "DELETE FROM detalle_venta WHERE idventa = '$idventa'";
        ejecutarConsulta($delete_sql_hijo);

        $delete_sql_padre = "DELETE FROM venta WHERE idventa = '$idventa'";
        ejecutarConsulta($delete_sql_padre);
    }
    public function anular2($idingreso)
    {
        
        $sql = "SELECT * FROM detalle_ingreso WHERE idingreso = '$idingreso'";

        $sql1 = ejecutarConsulta($sql);
	 
        while ($reg = mysqli_fetch_array($sql1)) {

            $idarticulo = $reg['idarticulo'];
            $cantidad = $reg['cantidad'];
            
            $sql3 = "UPDATE articulo
            SET stock = stock - $cantidad
            WHERE idarticulo = '$idarticulo';";
            ejecutarConsulta($sql3);
            
        }
        $delete_sql_hijo = "DELETE FROM detalle_ingreso WHERE idingreso = '$idingreso'";
        ejecutarConsulta($delete_sql_hijo);

        $delete_sql_padre = "DELETE FROM ingreso WHERE idingreso = '$idingreso'";
        ejecutarConsulta($delete_sql_padre);
    }
    public function mostrar($idventa)
    {
        $sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idusuario,u.nombre as usuario,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario WHERE v.idventa='$idventa'";
        return ejecutarConsultaSimpleFila($sql);
    }
//al hacer click en el ojo este codigo trae el detalle
    public function listarDetalle($idventa)
    {
        $sql="SELECT dv.iddetalle_venta, dv.idventa,dv.idarticulo,a.nombre,dv.cantidad,dv.precio_venta,dv.descuento,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal FROM detalle_venta dv inner join articulo a on dv.idarticulo=a.idarticulo where dv.idventa='$idventa'";
        return ejecutarConsulta($sql);
    }

    public function listar()
    {
        $sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idusuario,u.nombre as usuario,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,v.total_venta,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario ORDER BY v.idventa desc";
        return ejecutarConsulta($sql);
    }
// Reporte de ventas para pdf factura
    public function ventacabecera($idventa){
        $sql="SELECT v.idventa,v.idcliente,p.nombre as cliente,p.direccion,p.tipo_documento,p.num_documento,p.email,p.telefono,v.idusuario,u.nombre as usuario,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,date(v.fecha_hora) as fecha,v.impuesto,v.total_venta FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario WHERE v.idventa='$idventa'";
        return ejecutarConsulta($sql);
    }

    public function ventadetalle($idventa){
        $sql="SELECT a.nombre as articulo,a.codigo,d.cantidad,d.precio_venta,d.descuento,(d.cantidad*d.precio_venta-d.descuento) as subtotal FROM detalle_venta d INNER JOIN articulo a ON d.idarticulo=a.idarticulo  WHERE d.idventa='$idventa'";
        return ejecutarConsulta($sql);
    }    
}
?>