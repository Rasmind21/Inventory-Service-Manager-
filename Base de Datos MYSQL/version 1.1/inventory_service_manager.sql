-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2021 a las 03:17:00
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventory_service_manager`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ingresar_activo` (IN `descripcion` VARCHAR(45), IN `marca` VARCHAR(45), IN `modelo` VARCHAR(45), IN `serial` VARCHAR(45), IN `Color` VARCHAR(45), IN `valor` VARCHAR(45), IN `plaqueta` INT(20), IN `id_colaborador` INT(11))  BEGIN
insert into activos
(descripcion, marca, modelo, serial, Color, valor, plaqueta, id_colaborador)
values(descripcion, marca, modelo, serial, Color, valor, plaqueta, id_colaborador);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ingresar_colaborador` (IN `Nombre` VARCHAR(60), IN `Apellido` VARCHAR(30), IN `Documento_identidad` VARCHAR(30), IN `Zona_colaborador` VARCHAR(30), IN `Direccion` VARCHAR(30), IN `Correo` VARCHAR(30), IN `Telefono` VARCHAR(30))  BEGIN
insert into colaborador
(Nombre, Apellido, Documento_identidad, Zona_colaborador, Direccion, Correo, Telefono)
values(nombre,Apellido,Documento_identidad,Zona_colaborador,Direccion,Correo,Telefono);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id_activo` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `serial` varchar(45) NOT NULL,
  `Color` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `plaqueta` int(20) NOT NULL,
  `id_colaborador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `activos`
--

INSERT INTO `activos` (`id_activo`, `descripcion`, `marca`, `modelo`, `serial`, `Color`, `valor`, `plaqueta`, `id_colaborador`) VALUES
(1, 'Pulidora', 'Pretul', '21355', 'P12342', 'Amarrillo', '100000', 0, 2),
(2, 'Taladro', 'Dewalt', '28273', 'T2382', 'Verde', '150000', 0, 1),
(3, 'Sierra', 'Truper', '16143', 'S3267428', 'Gris', '1100000', 0, 3),
(4, 'Torno', 'Toolcraft', '21234', 'Tc5418', 'Azul', '2500000', 0, 5),
(5, 'Atornillador Inalambrico', 'Black And Decker', '009063', 'JPL256N', 'Naranja', '103900', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento_identidad` varchar(30) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `Nombre`, `Apellido`, `Documento_identidad`, `Direccion`, `Correo`, `Telefono`) VALUES
(1, 'PORKI', 'DUQUE', '101245642', 'CALLE12', 'PORKI@GMAIL.COM', '3225684352');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cantidad_pedidos_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cantidad_pedidos_cliente` (
`id_cliente` int(11)
,`id_N_pedido` int(11)
,`Fecha_pedido` varchar(50)
,`id_estado` int(11)
,`Nombre` varchar(60)
,`Apellido` varchar(30)
,`Dcto_identidad` varchar(30)
,`Cantidad` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `linea_negocio` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descripcion`, `linea_negocio`, `id_producto`) VALUES
(1, 'escaleras', 0, 7),
(2, 'cocina integral', 0, 2),
(3, 'closeth', 0, 1),
(4, 'muebles varios', 0, 6),
(5, 'puertas', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Dcto_identidad` varchar(30) NOT NULL,
  `Ciudad` varchar(30) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `Nombre`, `Apellido`, `Dcto_identidad`, `Ciudad`, `Direccion`, `Correo`, `Telefono`) VALUES
(1, 'CAMILO', 'CASAS ', '103056179', 'CUNDINAMARCA', 'CALLE 123', 'CAMILO1897@GMAIL.COM', '654321'),
(2, 'SEBASTIAN', 'JIMENEZ', '103066092', 'BOGOTA', 'CARRERA 97', 'JIMENEZ-SEBAS@GMAIL.COM', '756262'),
(3, 'CRISTIAN ', 'SIERRA', '1012233248', 'MEDELLIN', 'CALLE 12', 'CRISTIAN.SIERRA@GMAIL.COM', '3124586712'),
(4, 'CAROLINA', 'GUTIERREZ', '1029237172', 'BOGOTA', 'DIAGONAL 17', 'GUTIERREZ873@GMAIL.COM', '3227685361'),
(5, 'MARIA', 'ROJAS', '1056934657', 'MEDELLIN', 'DIAGONAL 36', 'MARIAR@HOTMAIL.COM', '311489617'),
(6, 'JOSUE', 'MARTINEZ', '105834613', 'MEDELLIN', 'CARRERA 20', 'MARTINEZJOSUE@HOTMAIL.COM', '388762541'),
(7, 'TATIANA', 'PEREZ', '102973862', 'CUNDINAMARCA', 'CALLE 892', 'PTAR585522@GMAIL.COM', '36698715'),
(8, 'SANTIAGO', 'LEON ', '1083976521', 'BOGOTA', 'DIAGONAL 56', 'SANTLE@GMAIL.COM', '314596687'),
(9, 'LUSIA', 'ARMIENTO', '1697358241', 'BOGOTA', 'CARRERA 65', 'JHFY@HOTMAIL.COM', '345944662');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaborador`
--

CREATE TABLE `colaborador` (
  `id_colaborador` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento_identidad` varchar(30) DEFAULT NULL,
  `Zona_colaborador` varchar(30) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `colaborador`
--

INSERT INTO `colaborador` (`id_colaborador`, `Nombre`, `Apellido`, `Documento_identidad`, `Zona_colaborador`, `Direccion`, `Correo`, `Telefono`) VALUES
(1, 'PEPITO', 'PEREZ', '2145454561451', 'ARMADO', 'CALLE 6 5-12', 'PPEREZ@HOTMAIL.COM', '6665685626'),
(2, 'PEPA', 'RONDON', '154564151', 'LIJADO', 'TRANSV 58 32-52', 'PERON@GMAIL.COM', '6569656'),
(3, 'ARMANDO', 'NAVARRO', '124454', 'CORTE', 'CARRERA 55 23-00', 'ARMANDO@HOTMAIL.COM', '59455481'),
(4, 'JUAN ', 'REYES', '2144662', 'PINTURA', 'CALLE 54C 52-87', 'REYESREYES@HOTMAIL.COM', '1552487'),
(5, 'ANDREA', 'RIOS', '5156454', 'CARPINTERO', 'TANRSV 85E 65F-02', 'ANDR@GMAIL.COM', '45548'),
(6, 'LISA', 'MURILLO', '5441515', 'SECRETARIA', 'CALLE 13 5J-08', 'LISAMUR@GMAIL.COM', '54877'),
(7, 'JENNY', 'TORRES', '56664545', 'PULIDOR', 'TRANSV 25 23F-15', 'JENNY_52@GMAIL.COM', '124121'),
(8, 'SARAY', 'SALAMANCA', '545454544798', 'EBANISTA', 'TRANSV 31 23-23', 'SARAYSALA@HOTMAIL.COM', '1121536'),
(9, 'MARIO', 'GIMENEZ', '874548', 'PERFILADOR', 'CARRERA 74 54F', 'GIMMAR@HOTMAIL.COM', '632563'),
(10, 'JULIETA', 'ROA', '454545453', 'VENDEDOR', 'TRANSV 59A', 'FHSGSKGH@GMAIL.COM', '3636985'),
(11, 'ELSA', 'CAPUNTAS', '1024338776', 'VENDEDOR', 'CRA 70J 15-12', 'ELSACAPUNTAS@GMAIL.COM', '3203153165');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_producto` varchar(60) NOT NULL,
  `valor_producto` varchar(30) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`id_cotizacion`, `id_producto`, `cantidad_producto`, `valor_producto`, `id_cliente`) VALUES
(19, 1, '32', '650000', 1),
(20, 2, '4', '1400000', 2),
(21, 3, '12', '1200000', 3),
(22, 4, '54', '700000', 4),
(23, 5, '23', '650000', 5),
(24, 6, '45', '1350000', 6),
(25, 7, '7', '1800000', 7),
(26, 8, '14', '1300000', 8),
(27, 9, '22', '900000', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `Estado`) VALUES
(1, 'PENDIENTE'),
(2, 'ENTREGADO'),
(3, 'DEVOLUCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `Tipo_material` varchar(50) DEFAULT NULL,
  `Cantidad_producto` varchar(30) DEFAULT NULL,
  `valor_unitario` varchar(40) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `id_administrador` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `Tipo_material`, `Cantidad_producto`, `valor_unitario`, `id_colaborador`, `id_administrador`, `id_producto`) VALUES
(1, 'Madera', '60 pies', '200000', 1, 1, 1),
(2, 'Puntillas', '8 cajas de pulgada', '12000', 3, 1, 2),
(3, 'Tornillos', '15 cajas de tornillos', '15000', 8, 1, 2),
(4, 'Colbon', '5 galones de colbon', '30000', 1, 1, 3),
(5, 'Lijas', '20 hojas', '5000', 2, 1, 4),
(6, 'Lacas', '7 cuartos', '80000', 5, 1, 6),
(7, 'Tiner', '8 galones', '100000', 9, 1, 3),
(8, 'Pinturas', '20 canecas ', '130000', 4, 1, 8),
(9, 'Manijas', '20 cajas de 20 unidades', '40000', 5, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_N_pedido` int(11) NOT NULL,
  `Fecha_pedido` varchar(50) NOT NULL,
  `Codigo_dane` varchar(30) NOT NULL,
  `Fecha_entrega` varchar(50) NOT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_N_pedido`, `Fecha_pedido`, `Codigo_dane`, `Fecha_entrega`, `id_cotizacion`, `id_cliente`, `id_estado`) VALUES
(1, '24/01/2021', '11001', '04/05/2021', 1, 1, 1),
(2, '03/12/2020', '11001', '22/01/2021', 2, 2, 2),
(3, '01/02/2021', '11001', '27/01/2021', 3, 3, 3),
(4, '12/01/2021', '11001', '08/02/2021', 4, 4, 2),
(5, '05/06/2020', '11001', '03/03/2021', 5, 5, 3),
(6, '02/01/2021', '11001', '06/05/2021', 6, 6, 1),
(7, '08/12/2020', '11001', '24/03/2021', 7, 7, 3),
(8, '06/07/2020', '11001', '08/02/2021', 8, 8, 2),
(9, '01/02/2021', '11001', '27/03/2021', 9, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `Tipo_producto` varchar(50) DEFAULT NULL,
  `Valor_producto` varchar(30) DEFAULT NULL,
  `Color_producto` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `id_administrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `Tipo_producto`, `Valor_producto`, `Color_producto`, `Cantidad`, `id_administrador`) VALUES
(1, 'CLOSETS', '650000', 'CAFÉ', 1, 1),
(2, 'COCINA INTEGRAL', '1400000', 'GRIS', 1, 1),
(3, 'PUERTAS', '1200000', 'GRIS', 1, 1),
(4, 'CUNAS', '700000', 'BLANCA', 1, 1),
(5, 'ARMARIOS', '650000', 'BLANCA', 1, 1),
(6, 'MUEBLES VARIOS', '1350000', 'CAFÉ', 1, 1),
(7, 'ESCALERAS', '1800000', 'GRIS', 1, 1),
(8, 'CAMAS', '1300000', 'GRIS', 1, 1),
(9, 'ATRILES', '900000', 'BLANCA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `responsables_activos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `responsables_activos` (
`id_colaborador` int(11)
,`id_activo` int(11)
,`descripcion` varchar(45)
,`marca` varchar(45)
,`valor` varchar(45)
,`plaqueta` int(20)
,`Nombre` varchar(60)
,`Apellido` varchar(30)
,`Documento_identidad` varchar(30)
,`Zona_colaborador` varchar(30)
,`Correo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `cantidad_pedidos_cliente`
--
DROP TABLE IF EXISTS `cantidad_pedidos_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidad_pedidos_cliente`  AS  select `pedido`.`id_cliente` AS `id_cliente`,`pedido`.`id_N_pedido` AS `id_N_pedido`,`pedido`.`Fecha_pedido` AS `Fecha_pedido`,`pedido`.`id_estado` AS `id_estado`,`cliente`.`Nombre` AS `Nombre`,`cliente`.`Apellido` AS `Apellido`,`cliente`.`Dcto_identidad` AS `Dcto_identidad`,count(1) AS `Cantidad` from (`pedido` join `cliente` on(`pedido`.`id_cliente` = `cliente`.`id_cliente`)) group by `pedido`.`id_cliente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `responsables_activos`
--
DROP TABLE IF EXISTS `responsables_activos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `responsables_activos`  AS  select `activos`.`id_colaborador` AS `id_colaborador`,`activos`.`id_activo` AS `id_activo`,`activos`.`descripcion` AS `descripcion`,`activos`.`marca` AS `marca`,`activos`.`valor` AS `valor`,`activos`.`plaqueta` AS `plaqueta`,`colaborador`.`Nombre` AS `Nombre`,`colaborador`.`Apellido` AS `Apellido`,`colaborador`.`Documento_identidad` AS `Documento_identidad`,`colaborador`.`Zona_colaborador` AS `Zona_colaborador`,`colaborador`.`Correo` AS `Correo` from (`activos` join `colaborador` on(`activos`.`id_colaborador` = `colaborador`.`id_colaborador`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id_activo`),
  ADD KEY `fk_activo_colaborador` (`id_colaborador`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `fk_categoria_producto` (`id_producto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`id_colaborador`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `fk_cotizacion_cliente` (`id_cliente`),
  ADD KEY `fk_cotizacion_producto` (`id_producto`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_inventario_colaborador` (`id_colaborador`),
  ADD KEY `fk_inventario_administrador` (`id_administrador`),
  ADD KEY `fk_inventario_producto` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_N_pedido`),
  ADD KEY `fk_pedido_cliente` (`id_cliente`),
  ADD KEY `fk_pedido_estado` (`id_estado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_administrador` (`id_administrador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `id_activo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `colaborador`
--
ALTER TABLE `colaborador`
  MODIFY `id_colaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_N_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `fk_activo_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `fk_cotizacion_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_cotizacion_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`),
  ADD CONSTRAINT `fk_inventario_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`),
  ADD CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_pedido_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
