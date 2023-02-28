-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 28, 2023 at 10:31 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gruposantinidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE IF NOT EXISTS `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidadmedidaid` int(11) NOT NULL,
  `imagen` varchar(77) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL,
  PRIMARY KEY (`idarticulo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `unidadmedidaid`, `imagen`, `condicion`) VALUES
(1, 1, 'PInON1', 'Pinon de 2 pulgadas y media por 36 dientes con chaveta cuadrada de longitud 14 milimetros pasante, material acero bonificado con tratamiento termico', -69, 'DEMO', 3, '1646771843.png', 0),
(12, 1, '1', 'MOUSE', 1818, '', 0, '', 1),
(13, 1, '1', 'producto 1', 943, '1', 0, '', 1),
(14, 1, '12', 'producto 2', 931, '1', 0, '', 1),
(16, 2, '333', 'p 2', 2215, '2', 2, '', 0),
(17, 1, 'dsfsd', 'ewwefd', 2303, 'sdfdsf', 2, '', 0),
(18, 4, 'N1', 'NYLON FLEX', 530, '', 1, '', 0),
(19, 1, '123', 'HABITACION MATRIMONIAL', 196, 'HABITACION MATRIMONIAL', 4, '1651264393.jpg', 0),
(20, 1, '12525', 'GASEOSA INKA KOLA 500 Ml', 160, '1', 1, '1651264520.png', 1),
(21, 1, 'P0001', 'Logic Controls LR2000 - Impresora de recibos - línea térmica', 84, '', 7, '', 1),
(22, 1, 'P002', 'Honeywell Voyager Extreme Performance 1470g - USB Kit - escáner de código de barras', 99, '', 7, '', 1),
(23, 5, 'G111', 'GLOBO LATEX #7', 1999, '', 7, '1657241238.png', 1),
(24, 6, '145245', 'OCEAN BLUE 6MM', 97, '', 7, '', 1),
(25, 1, 'dfdg', 'helado', 101, '', 7, '1673564503.jpg', 1),
(26, 1, 'Sysrest1', 'Software de restaurante, Punto de Venta, RED Local', 2089, 'Software de restaurante, Punto de Venta, RED Local', 7, '', 1),
(27, 1, '123', 'Sistema para gestion, Marketing online', 105, '', 7, '', 1),
(28, 1, '32E3SS', 'TIENDA VIRTUAL E-COMMERCE', 97, '', 7, '', 1),
(29, 1, 'WEER233', 'PAGOS CON VISA', 98, '', 7, '', 1),
(30, 1, 'fgdf3434', 'DOMINIO Y HOSTING 4GB, 15 CORREOS', 291, '', 7, '', 1),
(31, 1, 'FGDF43', 'PAGOS CON PAYPAL', 98, '', 7, '', 1),
(32, 1, '124RW', 'SISTEMA PUNTO DE VENTAS, FACTURACION ELECTRONICA', 108, '', 7, '', 1),
(33, 1, 'SPRD5', 'Control de compras / adquisiciones para producción, Ingresos, Cotizaciones, Egresos / pagos a proveedores, Egresos financieros y/o administrativos y pagos a cuenta, Control de producción, Hoja de ruta de pedidos, Hoja de ruta de pedidos, Gastos de pe', 5, '', 7, '', 1),
(34, 1, '12345', 'TIENDA VIRTUAL SHOPIFY PERSONALIZACION', 111, 'TIENDA VIRTUAL SHOPIFY PERSONALIZACION', 7, '', 1),
(35, 1, 'WB01', 'WEBSITE BASIC / 5 PAGINAS (INICIO,NOSOTROS,PRODUCTOS,CONTACTO) / 1 FORM CONTACTO, CHAT WHATSAPP', 97, '', 7, '', 1),
(36, 1, 'WE02', 'WEBSITE Entrepreneur / 5 PAGINAS (INICIO,NOSOTROS,PRODUCTOS, CATEGORIAS,CONTACTO), BLOG, / 1 FORM CONTACTO, CHAT WHATSAPP,  3 ENL. REDES SOCIALES, OPT. SEO', 98, '1', 7, '', 1),
(37, 1, 'WC3', 'WEBSITE COMPANY/100% A MEDIDA/ PROGAMACION DESDE 0 / HASTA -24 PAGINAS (INICIO,NOSOTROS,PRODUCTOS, CATEGORIAS,CONTACTO, TERM. CONDICIONES, POLITICA. PRIV, LIBRO DE RECLAMACIO ), BLOG, / 1 FORM CONTACTO, CHAT WHATSAPP,  3 ENL. REDES SOCIALES, OPT. SEO', 98, '', 7, '', 1),
(38, 1, 'CSPE1', 'OPTIMIZACION SEO PLAN EMPRESA, SEO, SITEMAP XML, GOOGLE SEARCH CONSOLE, GOOGLE MAPS SEO, GRAPH, OPTIMIZACION TIEMPO CARGA, CLOUDFLARE', 97, '', 7, '', 1),
(39, 1, '11ssasa', 'Ub. Taxi, Reservas de serv de taxistas, Choferes, Taxis, Usuarios, Pasajeros', 0, '', 7, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'PRODUCTOS FISICOS', 'PRODUCTOS FISICOS', 1),
(2, 'COMPUTADORAS', '', 1),
(3, 'pernos', 'PERNOS', 1),
(4, 'PLANCHAS', '', 1),
(5, 'GLOBOS', '', 1),
(6, 'vidrios', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `idcontacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `whatsapp` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idcontacto`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `dni`, `email`, `celular`, `whatsapp`) VALUES
(1, 'Mckenneth', 'Flores', '48039832', 'informes@frsystem.com.pe', '987654321', ''),
(2, 'Juan', 'Perez', '48039851', 'oswaldoelflori@gmail.com', '987654321', '987456321'),
(5, 'Marcelina', 'Rivera', '', '', '987654321', ''),
(6, 'Roberto', 'Guerra Barrionuevo', '', '', '', ''),
(7, 'David', 'Atencio', '987654321', '', '987654321', '987654321'),
(8, 'MCKENNETH ELMER OSWALDO', 'FLORES RIVERA', '48039852', '', '', ''),
(9, 'RICARDO ANTONIO', 'ALDAZABAL GIL', '48039851', '', '', ''),
(10, 'RICARDO ANTONIO', 'ALDAZABAL GIL', '48039851', '', '', ''),
(11, 'STEFAN', '', '', '', '', ''),
(12, 'Fierolla', 'Parra', '', '', '', ''),
(13, 'ewrewew', 'wefewfewfwe', '', '', '', ''),
(15, 'Fierolla', 'Parraw', '', '', '', ''),
(16, 'Fierolla', 'Parra8', '', '', '', ''),
(17, 'Fierolla', 'Parra88', '', '', '', ''),
(18, 'Fierolla', 'Parra7', '', '', '', ''),
(19, 'Fiorella', 'Parra', '', '', '', ''),
(20, 'kenneth', 'dsdfsdfsdf sdfsdfs', '', 'oswaldoelflori@gmail.com', '', ''),
(21, 'DIONISIO', 'ROMERO', '', '', '', ''),
(22, 'Williams Antoni Uzco Llacuachaqui', '', '', '', '', ''),
(23, 'Williams Antoni', 'Uzco Llacuachaqui', '', '', '', ''),
(24, 'Jose', 'Pardo', '48039833', '', '', ''),
(25, 'yuri', '', '', '', '', ''),
(26, 'JUAN 007', 'PEREZ', '', '', '', ''),
(27, 'Junior', 'Oro Rosas', '', '', '', ''),
(28, 'Luciano', 'Marketing', '', '', '', ''),
(29, 'Alexander', 'Tocasca', '', '', '', ''),
(30, 'HANS', '', '', '', '', ''),
(31, 'JUNIOR', 'Ramos', '', '', '', ''),
(32, 'Antenor', 'Valverde', '', '', '956174463', ''),
(33, 'Fernando', 'Tamara', '', '', '', ''),
(34, 'Jaime Diaz', '', '904078910', '', '', ''),
(35, 'Jaime', 'Diaz', '904078910', '', '', ''),
(36, 'Wilian', 'Lopez', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serie_comprobante` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_comprobante` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `igv` decimal(11,2) NOT NULL,
  `total_cotizacion` decimal(11,2) NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipomoneda` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idcontacto` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`) USING BTREE,
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cotizacion`
--

INSERT INTO `cotizacion` (`idcotizacion`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `subtotal`, `igv`, `total_cotizacion`, `estado`, `tipomoneda`, `idcontacto`) VALUES
(17, 62, 14, 'COTIZACION', '23', '23', '2022-04-02 00:00:00', '18.00', '0.00', '0.00', '118.00', 'Aceptado', 'SOLES', 11),
(18, 68, 14, 'COTIZACION', '345', '65', '2022-04-02 00:00:00', '18.00', '0.00', '0.00', '61006.00', 'Aceptado', 'SOLES', 1),
(19, 62, 14, 'COTIZACION', '23', '34', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '22.42', 'Aceptado', 'SOLES', 1),
(20, 62, 14, 'COTIZACION', '0001', '00020', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '22.42', 'Aceptado', 'SOLES', 2),
(21, 62, 14, 'COTIZACION', '1', '00021', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 1),
(22, 62, 14, 'COTIZACION', '1', '00022', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '44.84', 'Aceptado', 'SOLES', 2),
(23, 62, 14, 'COTIZACION', '1', '00023', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '80.24', 'Aceptado', 'SOLES', 2),
(24, 62, 14, 'COTIZACION', '8', '00024', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 3),
(25, 62, 14, 'COTIZACION', '0', '00025', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '29.50', 'Aceptado', 'SOLES', 1),
(26, 67, 14, 'COTIZACION', '0', '00026', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 1),
(27, 65, 14, 'COTIZACION', '0', '00027', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '80.24', 'Aceptado', 'SOLES', 1),
(28, 65, 14, 'COTIZACION', '0', '00028', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '1144.60', 'Aceptado', 'SOLES', 2),
(29, 62, 14, '', '0', '00029', '2022-04-13 00:00:00', '0.00', '0.00', '0.00', '59.00', 'Aceptado', 'SOLES', 2),
(30, 62, 14, '', '0', '00030', '2022-04-13 00:00:00', '0.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 3),
(31, 65, 14, '', '0', '00031', '2022-04-13 00:00:00', '0.00', '0.00', '0.00', '1.18', 'Aceptado', 'SOLES', 6),
(33, 65, 14, 'COTIZACION', '0', '00033', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '1.18', 'Aceptado', 'SOLES', 5),
(34, 62, 14, 'COTIZACION', '0', '00034', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '1771.18', 'Aceptado', 'SOLES', 3),
(35, 65, 14, 'COTIZACION', '0', '00035', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '22.42', 'Aceptado', 'SOLES', 3),
(36, 68, 14, 'COTIZACION', '0', '00036', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 2),
(37, 65, 14, '', '0', '00037', '2022-04-13 00:00:00', '0.00', '0.00', '0.00', '233.64', 'Aceptado', 'SOLES', 7),
(38, 67, 14, 'COTIZACION', '0', '00038', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '1791.24', 'Aceptado', 'SOLES', 6),
(39, 65, 14, 'COTIZACION', '0', '00039', '2022-04-13 00:00:00', '18.00', '0.00', '0.00', '668.00', 'Aceptado', 'SOLES', 2),
(40, 65, 14, '', '0', '00040', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 1),
(41, 65, 14, 'COTIZACION', '0', '00041', '2022-04-18 00:00:00', '18.00', '0.00', '0.00', '21.24', 'Aceptado', 'SOLES', 2),
(42, 62, 14, 'COTIZACION', '0', '00042', '2022-04-18 00:00:00', '18.00', '0.00', '0.00', '22.42', 'Aceptado', 'SOLES', 2),
(43, 65, 14, '', '0', '00043', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '22.42', 'Aceptado', 'SOLES', 1),
(44, 62, 14, '', '0', '00044', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '1085.60', 'Aceptado', 'SOLES', 5),
(45, 65, 14, '', '0', '00045', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '425.98', 'Aceptado', 'SOLES', 21),
(46, 68, 14, '', '0', '00046', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '29.50', 'Aceptado', 'SOLES', 21),
(47, 65, 14, '', '0', '00047', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '179.36', 'Aceptado', 'SOLES', 3),
(48, 65, 14, 'COTIZACION', '0', '00048', '2022-04-18 00:00:00', '18.00', '0.00', '0.00', '165.20', 'Aceptado', 'SOLES', 3),
(49, 65, 14, 'COTIZACION', '0', '00049', '2022-04-18 00:00:00', '18.00', '0.00', '0.00', '44.84', 'Aceptado', 'SOLES', 2),
(50, 67, 14, '', '0', '00050', '2022-04-18 00:00:00', '0.00', '0.00', '0.00', '1337.06', 'Aceptado', 'SOLES', 5),
(51, 67, 14, 'COTIZACION', '0', '00051', '2022-04-18 00:00:00', '18.00', '1377.16', '247.89', '1625.05', 'Aceptado', 'SOLES', 6),
(53, 65, 14, 'COTIZACION', '0', '0', '2022-04-18 00:00:00', '18.00', '650.00', '117.00', '767.00', 'Aceptado', 'SOLES', 2),
(54, 67, 14, 'COTIZACION', '0', '00054', '2022-04-18 00:00:00', '18.00', '796.40', '143.35', '939.75', 'Aceptado', 'SOLES', 2),
(55, 65, 14, 'COTIZACION', '0', '00055', '2022-04-18 00:00:00', '18.00', '804.18', '144.75', '948.93', 'Aceptado', 'SOLES', 7),
(56, 68, 14, 'COTIZACION', '0', '00056', '2022-04-18 00:00:00', '18.00', '563.40', '101.41', '664.81', 'Aceptado', 'SOLES', 5),
(57, 68, 14, 'COTIZACION', '0', '00057', '2022-04-18 00:00:00', '18.00', '2100.00', '378.00', '2478.00', 'Aceptado', 'SOLES', 2),
(58, 67, 14, '', '0', '00058', '2022-04-18 00:00:00', '0.00', '400.00', '72.00', '472.00', 'Aceptado', 'SOLES', 2),
(59, 68, 14, 'COTIZACION', '0', '00059', '2022-04-18 00:00:00', '18.00', '872.84', '157.11', '1029.95', 'Aceptado', 'SOLES', 5),
(60, 68, 14, 'COTIZACION', '0', '00060', '2022-04-18 00:00:00', '18.00', '1000.00', '180.00', '1180.00', 'Aceptado', 'SOLES', 5),
(61, 67, 14, 'COTIZACION', '0', '00061', '2022-04-23 00:00:00', '18.00', '940.00', '169.20', '1109.20', 'Aceptado', 'SOLES', 1),
(62, 67, 14, 'COTIZACION', '0', '00062', '2022-04-25 00:00:00', '18.00', '5000.00', '900.00', '5900.00', 'Aceptado', 'DOLARES', 2),
(63, 67, 14, '', '0', '00063', '2022-05-02 00:00:00', '0.00', '73.00', '13.14', '86.14', 'Aceptado', 'SOLES', 1),
(64, 73, 14, 'COTIZACION', '0', '00064', '2022-05-11 00:00:00', '18.00', '890.00', '160.20', '1050.20', 'Aceptado', 'SOLES', 23),
(65, 74, 14, '', '0', '00065', '2022-05-12 00:00:00', '0.00', '8.50', '1.53', '10.03', 'Aceptado', 'SOLES', 1),
(66, 73, 14, '', '0', '00066', '2022-06-02 00:00:00', '0.00', '25.00', '4.50', '29.50', 'Aceptado', 'SOLES', 2),
(67, 65, 14, 'COTIZACION', '0', '00067', '2022-07-07 00:00:00', '18.00', '86.50', '15.57', '102.07', 'Aceptado', 'SOLES', 25),
(68, 62, 14, 'COTIZACION', '0', '00068', '2022-07-07 00:00:00', '18.00', '100.00', '18.00', '118.00', 'Aceptado', 'DOLARES', 26),
(69, 62, 14, 'COTIZACION', '0', '00069', '2022-08-15 00:00:00', '18.00', '23.00', '4.14', '27.14', 'Aceptado', 'DOLARES', 1),
(70, 62, 14, 'COTIZACION', '0', '00070', '2022-08-18 00:00:00', '18.00', '52.50', '9.45', '61.95', 'Aceptado', 'SOLES', 2),
(71, 62, 14, 'COTIZACION', '0', '00071', '2022-08-19 00:00:00', '18.00', '254.24', '45.76', '300.00', 'Aceptado', 'SOLES', 2),
(72, 62, 14, '', '0', '00072', '2023-01-12 00:00:00', '0.00', '19.50', '3.51', '23.01', 'Aceptado', 'SOLES', 1),
(73, 62, 14, 'COTIZACION', '0', '00073', '2023-02-08 00:00:00', '18.00', '1686.44', '303.56', '1990.00', 'Aceptado', 'SOLES', 27),
(74, 76, 14, 'COTIZACION', '0', '00074', '2023-02-13 00:00:00', '18.00', '2288.14', '411.86', '2700.00', 'Aceptado', 'SOLES', 29),
(75, 77, 14, 'COTIZACION', '0', '00075', '2023-02-15 00:00:00', '18.00', '1347.46', '242.54', '1590.00', 'Aceptado', 'SOLES', 30),
(76, 62, 14, 'COTIZACION', '0', '00076', '2023-02-15 00:00:00', '18.00', '60000.00', '10800.00', '70800.00', 'Aceptado', 'SOLES', 24),
(77, 78, 14, 'COTIZACION', '0', '00077', '2023-02-16 00:00:00', '18.00', '2590.00', '466.20', '3056.20', 'Aceptado', 'SOLES', 31),
(78, 76, 14, 'COTIZACION', '0', '00078', '2023-02-16 00:00:00', '18.00', '4879.00', '878.22', '5757.22', 'Aceptado', 'SOLES', 29),
(79, 79, 14, 'COTIZACION', '0', '00079', '2023-02-20 00:00:00', '18.00', '847.46', '152.54', '1000.00', 'Aceptado', 'SOLES', 32),
(80, 79, 14, 'COTIZACION', '0', '00080', '2023-02-20 00:00:00', '18.00', '1271.19', '228.81', '1500.00', 'Aceptado', 'SOLES', 32),
(81, 79, 14, 'COTIZACION', '0', '00081', '2023-02-20 00:00:00', '18.00', '1686.44', '303.56', '1990.00', 'Aceptado', 'SOLES', 32),
(82, 62, 14, 'COTIZACION', '0', '00082', '2023-02-23 00:00:00', '18.00', '627.12', '112.88', '740.00', 'Aceptado', 'SOLES', 33),
(83, 62, 14, 'COTIZACION', '0', '00083', '2023-02-24 00:00:00', '18.00', '2500.00', '450.00', '2950.00', 'Aceptado', 'SOLES', 35),
(84, 62, 14, 'COTIZACION', '0', '00084', '2023-02-27 00:00:00', '18.00', '1400.00', '252.00', '1652.00', 'Aceptado', 'SOLES', 2),
(85, 62, 14, 'COTIZACION', '0', '00085', '2023-02-27 00:00:00', '18.00', '3760.00', '676.80', '4436.80', 'Aceptado', 'SOLES', 36);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_cotizacion`
--

DROP TABLE IF EXISTS `detalle_cotizacion`;
CREATE TABLE IF NOT EXISTS `detalle_cotizacion` (
  `iddetalle_cotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idcotizacion` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `unidadmedida` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_cotizacion` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_cotizacion`) USING BTREE,
  KEY `fk_detalle_cotizacion_cotizacion_idx` (`idcotizacion`) USING BTREE,
  KEY `fk_detalle_cotizacion_articulo_idx` (`idarticulo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle_cotizacion`
--

INSERT INTO `detalle_cotizacion` (`iddetalle_cotizacion`, `idcotizacion`, `idarticulo`, `unidadmedida`, `cantidad`, `precio_cotizacion`, `descuento`) VALUES
(40, 17, 1, '', 1, '100.00', '0.00'),
(41, 18, 1, '', 1, '1700.00', '0.00'),
(42, 18, 12, '', 1, '50000.00', '0.00'),
(43, 19, 1, '', 1, '1.00', '0.00'),
(44, 19, 12, '', 1, '18.00', '0.00'),
(45, 20, 1, '', 1, '1.00', '0.00'),
(46, 20, 12, '', 1, '18.00', '0.00'),
(47, 21, 12, '', 1, '18.00', '0.00'),
(48, 22, 12, '', 1, '18.00', '0.00'),
(49, 22, 1, '', 1, '20.00', '0.00'),
(50, 23, 12, '', 1, '18.00', '0.00'),
(51, 23, 1, '', 1, '50.00', '0.00'),
(52, 24, 12, '', 1, '18.00', '0.00'),
(53, 25, 12, '', 1, '25.00', '0.00'),
(54, 26, 12, '', 1, '18.00', '0.00'),
(55, 27, 1, '', 1, '50.00', '0.00'),
(56, 27, 12, '', 1, '18.00', '0.00'),
(57, 28, 12, '', 50, '18.00', '0.00'),
(58, 28, 1, '', 70, '1.00', '0.00'),
(59, 29, 12, '', 1, '50.00', '0.00'),
(60, 30, 12, '', 1, '18.00', '0.00'),
(61, 31, 1, '', 1, '1.00', '0.00'),
(64, 33, 1, '', 1, '1.00', '0.00'),
(68, 34, 1, '', 1, '1.00', '0.00'),
(69, 34, 12, '', 1, '1500.00', '0.00'),
(70, 35, 12, '', 1, '18.00', '0.00'),
(71, 35, 1, '', 1, '1.00', '0.00'),
(72, 36, 12, '', 1, '18.00', '0.00'),
(74, 37, 1, '', 1, '180.00', '0.00'),
(75, 37, 12, '', 1, '18.00', '0.00'),
(76, 38, 1, '', 1, '1500.00', '0.00'),
(77, 38, 12, '', 1, '18.00', '0.00'),
(79, 39, 1, '', 1, '650.00', '0.00'),
(80, 39, 12, '', 1, '18.00', '0.00'),
(84, 40, 12, '', 1, '18.00', '0.00'),
(85, 41, 12, '', 1, '18.00', '0.00'),
(86, 42, 12, '', 1, '18.00', '0.00'),
(87, 42, 1, '', 1, '1.00', '0.00'),
(88, 43, 12, '', 1, '18.00', '0.00'),
(89, 43, 1, '', 1, '1.00', '0.00'),
(90, 44, 12, '', 50, '18.00', '0.00'),
(91, 44, 1, '', 20, '1.00', '0.00'),
(92, 45, 12, '', 20, '18.00', '0.00'),
(93, 45, 1, '', 1, '1.00', '0.00'),
(94, 46, 1, '', 1, '25.00', '0.00'),
(95, 47, 13, '', 1, '102.00', '0.00'),
(96, 47, 14, '', 1, '50.00', '0.00'),
(97, 48, 13, '', 1, '122.00', '0.00'),
(98, 48, 12, '', 1, '18.00', '0.00'),
(99, 49, 12, '', 1, '18.00', '0.00'),
(100, 49, 13, '', 1, '20.00', '0.00'),
(101, 50, 13, '', 5, '25.50', '0.00'),
(102, 50, 12, '', 7, '35.80', '0.00'),
(103, 50, 14, '', 10, '75.50', '0.00'),
(124, 51, 13, '', 8, '85.00', '0.00'),
(125, 51, 14, '', 10, '40.50', '0.00'),
(126, 51, 12, '', 8, '36.52', '0.00'),
(136, 54, 14, '', 7, '40.00', '0.00'),
(137, 54, 13, '', 5, '20.00', '0.00'),
(138, 54, 12, '', 12, '34.70', '0.00'),
(139, 55, 13, '', 7, '10.54', '0.00'),
(140, 55, 14, '', 8, '40.00', '0.00'),
(141, 55, 12, '', 12, '34.20', '0.00'),
(160, 56, 14, '', 7, '25.20', '0.00'),
(161, 56, 13, '', 5, '34.20', '0.00'),
(162, 56, 12, '', 12, '18.00', '0.00'),
(163, 57, 14, '', 10, '50.00', '0.00'),
(164, 57, 13, '', 20, '80.00', '0.00'),
(165, 58, 14, 'MTS', 8, '50.00', '0.00'),
(166, 59, 14, 'MTS', 7, '80.20', '0.00'),
(167, 59, 13, 'GLN', 4, '40.36', '0.00'),
(168, 59, 12, 'CILINDRO', 12, '12.50', '0.00'),
(169, 60, 17, 'GLN', 20, '50.00', '0.00'),
(170, 61, 1, 'CILINDRO', 1, '100.00', '0.00'),
(171, 61, 15, 'MTS', 7, '50.00', '0.00'),
(172, 61, 16, 'GLN', 7, '70.00', '0.00'),
(173, 62, 18, 'MTS', 50, '100.00', '0.00'),
(174, 63, 19, 'KIT', 1, '60.00', '0.00'),
(175, 63, 20, 'MTS', 2, '6.50', '0.00'),
(176, 64, 22, 'UNID', 1, '450.00', '0.00'),
(177, 64, 21, 'UNID', 1, '440.00', '0.00'),
(178, 65, 20, 'MTS', 1, '6.50', '0.00'),
(179, 65, 21, 'UNID', 1, '1.00', '0.00'),
(180, 65, 22, 'UNID', 1, '1.00', '0.00'),
(181, 66, 21, 'UNID', 5, '5.00', '0.00'),
(182, 67, 15, 'MTS', 1, '100.00', '20.00'),
(183, 67, 20, 'MTS', 1, '6.50', '0.00'),
(184, 69, 20, 'MTS', 2, '6.50', '0.00'),
(185, 69, 21, 'UNID', 10, '1.00', '0.00'),
(186, 70, 20, 'MTS', 5, '6.50', '0.00'),
(187, 70, 15, 'MTS', 2, '10.00', '0.00'),
(188, 71, 24, 'UNID', 3, '100.00', '0.00'),
(189, 72, 20, 'MTS', 3, '6.50', '0.00'),
(190, 73, 26, 'UNID', 1, '1990.00', '0.00'),
(191, 0, 27, 'UNID', 1, '2800.00', '0.00'),
(192, 0, 27, 'UNID', 1, '2800.00', '0.00'),
(193, 0, 27, 'UNID', 1, '2800.00', '0.00'),
(194, 74, 28, 'UNID', 1, '1000.00', '0.00'),
(195, 74, 29, 'UNID', 1, '1000.00', '0.00'),
(196, 74, 30, 'UNID', 1, '200.00', '0.00'),
(197, 74, 31, 'UNID', 1, '500.00', '0.00'),
(198, 75, 32, 'UNID', 1, '1590.00', '0.00'),
(199, 76, 33, 'UNID', 1, '60000.00', '0.00'),
(200, 77, 28, 'UNID', 1, '1000.00', '0.00'),
(201, 77, 34, 'UNID', 1, '1590.00', '0.00'),
(202, 78, 38, 'UNID', 1, '199.00', '0.00'),
(203, 78, 37, 'UNID', 1, '1990.00', '0.00'),
(204, 78, 36, 'UNID', 1, '1490.00', '0.00'),
(205, 78, 35, 'UNID', 1, '1000.00', '0.00'),
(206, 78, 30, 'UNID', 1, '200.00', '0.00'),
(207, 79, 30, 'UNID', 1, '0.00', '0.00'),
(208, 79, 35, 'UNID', 1, '1000.00', '0.00'),
(209, 79, 38, 'UNID', 1, '0.00', '0.00'),
(210, 80, 38, 'UNID', 1, '200.00', '0.00'),
(211, 80, 36, 'UNID', 1, '1100.00', '0.00'),
(212, 80, 30, 'UNID', 1, '200.00', '0.00'),
(213, 81, 38, 'UNID', 1, '0.00', '0.00'),
(214, 81, 37, 'UNID', 1, '1990.00', '0.00'),
(215, 81, 30, 'UNID', 1, '0.00', '0.00'),
(216, 82, 30, 'UNID', 1, '40.00', '0.00'),
(217, 82, 35, 'UNID', 1, '700.00', '0.00'),
(218, 83, 39, 'UNID', 1, '2500.00', '0.00'),
(219, 0, 29, 'UNID', 2, '1000.00', '0.00'),
(220, 0, 28, 'UNID', 2, '1000.00', '0.00'),
(221, 0, 27, 'UNID', 2, '2800.00', '0.00'),
(222, 84, 31, 'UNID', 2, '500.00', '0.00'),
(223, 84, 30, 'UNID', 2, '200.00', '0.00'),
(224, 85, 36, 'UNID', 1, '1000.00', '0.00'),
(225, 85, 37, 'UNID', 1, '1990.00', '0.00'),
(226, 85, 35, 'UNID', 1, '590.00', '0.00'),
(227, 85, 30, 'UNID', 1, '180.00', '0.00');

--
-- Triggers `detalle_cotizacion`
--
DROP TRIGGER IF EXISTS `tr_updStockVenta_copy1`;
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta_copy1` AFTER INSERT ON `detalle_cotizacion` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad 
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
CREATE TABLE IF NOT EXISTS `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_ingreso_idx` (`idingreso`),
  KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(9, 4, 1, 10, '1500.00', '1700.00'),
(10, 5, 12, 1000, '20.00', '35.00'),
(11, 6, 1, 10, '500.00', '1.00'),
(12, 6, 12, 20, '850.00', '1.00'),
(13, 7, 12, 5, '15.00', '18.00'),
(14, 8, 18, 500, '50.00', '100.00'),
(15, 9, 19, 100, '40.00', '60.00'),
(16, 10, 20, 100, '5.00', '6.50'),
(17, 11, 22, 1, '460.00', '1.00'),
(18, 11, 21, 1, '440.00', '1.00'),
(19, 12, 23, 1000, '70.00', '100.00'),
(20, 13, 25, 1, '1.20', '2.00'),
(21, 14, 26, 100, '1000.00', '1990.00'),
(22, 15, 27, 10, '2000.00', '2800.00'),
(23, 16, 30, 100, '200.00', '200.00'),
(24, 16, 29, 100, '1000.00', '1000.00'),
(25, 16, 28, 100, '1000.00', '1000.00'),
(26, 16, 31, 100, '500.00', '500.00'),
(27, 17, 32, 10, '1500.00', '1590.00'),
(28, 18, 33, 1, '60000.00', '60000.00'),
(29, 19, 34, 12, '1000.00', '1590.00'),
(30, 20, 38, 1, '0.00', '0.00'),
(31, 20, 37, 1, '1990.00', '1.00'),
(32, 20, 36, 1, '1500.00', '1.00'),
(33, 20, 35, 1, '1000.00', '1.00');

--
-- Triggers `detalle_ingreso`
--
DROP TRIGGER IF EXISTS `tr_updStockIngreso`;
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(2, 2, 1, '80.00', '1700.00', '0.00'),
(3, 3, 18, '20.00', '100.00', '0.00'),
(4, 4, 20, '1.00', '6.50', '0.00'),
(5, 4, 19, '1.00', '60.00', '0.00'),
(6, 5, 19, '1.00', '60.00', '0.00'),
(7, 5, 20, '2.00', '6.50', '0.00'),
(8, 6, 20, '23.00', '6.50', '0.00'),
(9, 6, 19, '1.00', '60.00', '0.00'),
(10, 0, 23, '1.00', '100.00', '0.00'),
(11, 7, 32, '1.00', '1590.00', '0.00');

--
-- Triggers `detalle_venta`
--
DROP TRIGGER IF EXISTS `tr_updStockVenta`;
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad 
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
CREATE TABLE IF NOT EXISTS `ingreso` (
  `idingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serie_comprobante` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_comprobante` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_ingreso_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(4, 69, 14, 'Factura', '155', '456', '2022-04-01 00:00:00', '18.00', '15000.00', 'Aceptado'),
(5, 69, 14, 'Factura', '123', '456', '2022-04-02 00:00:00', '18.00', '20000.00', 'Aceptado'),
(6, 70, 14, 'Factura', '456', '234', '2022-04-02 00:00:00', '18.00', '22000.00', 'Aceptado'),
(7, 69, 14, 'Factura', '345', '235', '2022-04-02 00:00:00', '18.00', '75.00', 'Aceptado'),
(8, 72, 14, 'Factura', '34', '32', '2022-04-25 00:00:00', '18.00', '25000.00', 'Aceptado'),
(9, 69, 14, 'Factura', 'SDF', 'DSF', '2022-04-29 00:00:00', '18.00', '4000.00', 'Aceptado'),
(10, 70, 14, 'Boleta', '23', '23', '2022-04-29 00:00:00', '18.00', '5.00', 'Aceptado'),
(11, 69, 14, 'Factura', '123', '456', '2022-05-11 00:00:00', '18.00', '870.00', 'Aceptado'),
(12, 75, 14, 'Factura', '233', '232', '2022-07-07 00:00:00', '18.00', '70000.00', 'Aceptado'),
(13, 75, 14, 'Factura', '12', '12', '2023-01-12 00:00:00', '18.00', '1.20', 'Aceptado'),
(14, 69, 14, 'Factura', '123', '123', '2023-02-08 00:00:00', '18.00', '100000.00', 'Aceptado'),
(15, 69, 542, 'Factura', '1212', '1212', '2023-02-08 00:00:00', '18.00', '20000.00', 'Aceptado'),
(16, 69, 14, 'Factura', '123', '123124', '2023-02-13 00:00:00', '18.00', '270000.00', 'Aceptado'),
(17, 70, 14, 'Factura', '123', '456', '2023-02-15 00:00:00', '18.00', '1500.00', 'Aceptado'),
(18, 69, 14, 'Boleta', '41', '141', '2023-02-15 00:00:00', '18.00', '60000.00', 'Aceptado'),
(19, 69, 14, 'Boleta', '12', '12', '2023-02-16 00:00:00', '18.00', '1000.00', 'Aceptado'),
(20, 69, 14, 'Boleta', '112', '124', '2023-02-16 00:00:00', '18.00', '4490.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas'),
(8, 'Backup'),
(9, 'Reportes'),
(10, 'Consulta Ventas por producto'),
(11, 'Cotización');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_documento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(62, 'Cliente', 'CLIENTES / VARIOS', 'RUC', '-', 'Lima', '938222552', 'oswaldoelflori@gmail.com'),
(65, 'Cliente', 'INDUSTRY SOLUTIONS N &amp; M S.A.C. - INSONM S.A.C.', 'DNI', '20601009201', '----LOS CEDROS MZA. A LOTE. 01 ASC.  SAN MARCOS-SAN MIGUEL-LIMA', '', ''),
(67, 'Cliente', 'FR SYSTEM S.A.C.', 'DNI', '20601579317', 'AV. INCA GARCILASO DE LA VEGA NRO. 1260 INT. 6 URB.  LIMA CERCADO-LIMA-LIMA', '', ''),
(68, 'Cliente', 'TIGRE PERU - TUBOS Y CONEXIONES S.A.', 'DNI', '20100145902', '----CA.2 MZA. A LOTE. 01 LOTIZ.INDUST.EL LUCUMO (PTE.ARICA KM41 IZQ.ANT.PANAM.SUR) LIMA - LIMA - LURIN-LURIN-LIMA', '', ''),
(69, 'Proveedor', 'INTCOMEX PERU S.A.C', 'DNI', '20254507874', 'CAL.LOS NEGOCIOS NRO. 448 URB. LIMATAMBO (ALT. CDRA 39 DE REPUBLICA DE PANAMA) LIMA - LIMA - SURQUILLO-SURQUILLO-LIMA', '', ''),
(70, 'Proveedor', 'GRUPO DELTRON S.A.', 'DNI', '20212331377', 'CAL.RAUL REBAGLIATI NRO. 170 URB. SANTA CATALINA LIMA - LIMA - LA VICTORIA-LA VICTORIA-LIMA', '', ''),
(71, 'Cliente', 'INMOBIDEAS S.A.C.', 'DNI', '20492093042', 'AV. 1RO DE MAYO URB. FUNDO PUENTE 441-EL AGUSTINO-LIMA', '', ''),
(72, 'Proveedor', 'NYLON FLEX SA', 'DNI', '124345344345', 'LIMA', '', ''),
(73, 'Cliente', 'FERRETERIA STANLEY', 'DNI', '20154456451', 'PICHANAQUI', '', ''),
(74, 'Cliente', 'ZAPATA ROMERO LIDEN ALAN', 'DNI', '10435691256', '--undefined-undefined', '', ''),
(75, 'Proveedor', 'CORPORACION VEGA', 'RUC', '20501425623', 'LIMA', '', ''),
(76, 'Cliente', 'GLASSES OPTICAL &amp; CO. S.A.C', 'RUC', '20606381159', 'AV. ARIOSTO MATELLINI NRO. 440 INT. 2 URB. PASEO DE LA REPUBLICA - LIM', '', ''),
(77, 'Cliente', 'LUZ PARA TU SALUD', 'RUC', '12345678', 'LIMA', '', ''),
(78, 'Cliente', 'COMPANY GENERAL BMENT S.A.C.', 'RUC', '20609789485', 'JR. CUZCO LT. 12 MZ. B RES. AEROPUERTO - CALLAO PROV. CONST. DEL CALLA', '', ''),
(79, 'Cliente', 'INGENIERIA DE CONSTRUCCIONES METALICAS EN GENERAL E.I.R.L.', 'RUC', 'AV. CARABAYLLO LT. 1', 'AV. CARABAYLLO LT. 15 MZ. S - LIMA LIMA COMAS', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS `unidadmedida`;
CREATE TABLE IF NOT EXISTS `unidadmedida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indice` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `valor` varchar(150) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'unidadmedida',
  `condicion` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `unidadmedida`
--

INSERT INTO `unidadmedida` (`id`, `indice`, `valor`, `condicion`) VALUES
(1, 'MTS', 'unidadmedida', 1),
(2, 'GLN', 'unidadmedida', 1),
(3, 'CILINDRO', 'unidadmedida', 1),
(4, 'KIT', 'unidadmedida', 1),
(5, 'PZA', 'unidadmedida', 1),
(6, 'JGO', 'unidadmedida', 1),
(7, 'UNID', 'unidadmedida', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `num_documento` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(55) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `login` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `condicion` tinyint(4) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(6, 'Jose Mallqui', 'DNI', '45722300', 'San Juan de Lurigancho', '940173393', 'josemalqui@gmail.com', 'JEFE-ADMINISTRADOR', 'jmallqui', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1533404954.jpg', 0),
(8, 'Juan', 'RUC', '7894456', 'Lima', '78945615', '', '', 'admin', '998ed4d621742d0c2d85ed84173db569afa194d4597686cae947324aa58ab4bb', '1533071213.png', 0),
(9, 'Ana', 'DNI', '48251398', '', '78945615', 'anita27@hotmail.com', 'VENTAS', 'ana', 'b3a8e0e1f9ab1bfe3a36f231f676f78bb30a519d2b21e6c530c0eee8ebb4a5d0', '1539212649.jpg', 0),
(10, 'YAZMIN KHATERINE HZ', 'DNI', '72197929', 'Av. Brasil S/N', '915108511', 'yazmin15hz@gmail.com', 'ADMINISTRADORA', 'yazmin', '4cd9a14d1e4f32dfa52fe74ab10aa11037e9bdbf594ae20e590a2ec2e7f2449b', '1628532451.jpg', 0),
(11, 'Miguel', 'DNI', '12345678', 'Lima', '987654321', 'miguel@gmail.com', 'USUARIO', 'miguel', '5ef68465886fa04d3e0bbe86b59d964dd98e5775e95717df978d8bedee6ff16c', '1546906383.png', 0),
(12, 'INSTITUTO NACIONAL DE SALUD DEL NIÑO - SAN BORJA', 'RUC', '20552196725', 'AV. Agustin de la Rosa 1399 - uRB. Jacaranda II - San Borja', '012300600 Anexo 3087', 'aascarza@insnsb.gob.pe', 'SALUD', 'NIÑO', '304b92780769163b383657b882e8926cfe8adde946a51a8600e3a1031573b329', '1547055701.jpeg', 0),
(14, 'Koseth Cornejo', 'DNI', '12345678', 'lima', '940173393', '', 'GERENTE', 'aldo', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1533071213.png', 1),
(15, 'jose', 'DNI', '12345678', 'lima', '78456123', 'jose@gmail.com', 'vendedor', 'jose2023', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`idusuario`),
  KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(9, 14, 1),
(10, 14, 2),
(11, 14, 3),
(12, 14, 4),
(13, 14, 5),
(14, 14, 6),
(15, 14, 7),
(16, 14, 8),
(17, 14, 9),
(18, 14, 10),
(19, 14, 11),
(20, 15, 4);

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serie_comprobante` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `num_comprobante` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_venta` decimal(11,3) NOT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(2, 65, 14, 'Factura', '414', '414', '2022-04-02 00:00:00', '18.00', '136000.000', 'Aceptado'),
(3, 67, 14, 'Factura', '434', '345', '2022-04-25 00:00:00', '18.00', '2000.000', 'Aceptado'),
(4, 62, 14, 'Factura', '232', '2323', '2022-04-29 00:00:00', '18.00', '66.500', 'Aceptado'),
(5, 62, 14, 'Ticket', '45', '454', '2022-04-29 00:00:00', '0.00', '73.000', 'Aceptado'),
(6, 62, 14, 'Factura', '34', '34', '2022-04-29 00:00:00', '18.00', '209.500', 'Aceptado'),
(7, 77, 14, 'Factura', '123', '564', '2023-02-15 00:00:00', '18.00', '1590.000', 'Aceptado');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
