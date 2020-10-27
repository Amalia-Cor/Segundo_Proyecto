-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2020 a las 01:35:18
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregaRegistro` (OUT `msj` VARCHAR(60), IN `nombre` VARCHAR(20), IN `apellido` VARCHAR(20), IN `correo` VARCHAR(100), IN `telefono` VARCHAR(9), IN `codigoEsp` INT(2), IN `FechaFin` DATE, IN `codigoAten` INT(2))  BEGIN

DECLARE exit handler for sqlexception
  BEGIN
    -- ERROR
    SET msj = 'ERROR AL AGREGAR';
    ROLLBACK;
END;

START TRANSACTION;
  	INSERT INTO registro VALUES(null, nombre,apellido,correo,telefono,codigoEsp,fechaFin,codigoAten);
		

COMMIT;
SET msj = 'SE REGISTRO SATISFACTORIAMENTE';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

CREATE TABLE `atencion` (
  `id_atencion` int(2) NOT NULL,
  `hora` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `atencion`
--

INSERT INTO `atencion` (`id_atencion`, `hora`) VALUES
(1, '09:00'),
(2, '10:00'),
(3, '11:00'),
(4, '12:00'),
(5, '14:00'),
(6, '15:00'),
(7, '16:00'),
(8, '17:00'),
(9, '18:00'),
(10, '19:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(2) NOT NULL,
  `especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `especialidad`) VALUES
(1, 'Cosmetología dental'),
(2, 'Ortopedia maxilar'),
(3, 'Estética dental'),
(4, 'Endodoncia'),
(5, 'Ortodoncia'),
(6, 'Periodoncia'),
(7, 'Odontopediatría'),
(8, 'Rehabilitación oral'),
(9, 'Implantes'),
(10, 'Odontología integral'),
(11, 'Cirugía oral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Id_usuario` int(1) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  `correo` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Id_usuario`, `username`, `password`, `correo`) VALUES
(1, 'AmaliaCor', '47658904', 'amaliacor12@gmail.com'),
(2, 'NicolBe', '80186241', 'nicolbel67@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id_cliente` int(1) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `id_especialidad` int(2) NOT NULL,
  `fecha` date NOT NULL,
  `id_atencion` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id_cliente`, `nombre`, `apellidos`, `correo`, `telefono`, `id_especialidad`, `fecha`, `id_atencion`) VALUES
(1, 'Juan ', 'Chavez', 'JuanChavez23@gamil.com', '956267854', 2, '2020-10-28', 7),
(2, 'Marco', 'Farfan', 'Marcofarfan234@gmail.com', '953789897', 2, '2017-10-17', 3),
(13, 'Juan', 'Copara', 'juancopara345@gmail.com', '956267414', 6, '2020-12-26', 8),
(14, 'Pablo Fernando', 'Cornejo Hidalgo', 'phidalgo76@gmail.com', '954458977', 10, '2020-10-30', 5),
(15, 'Isabel Sofia', 'Gutierrez', 'isabelS89@hotmail.com', '978654523', 10, '2020-12-04', 8),
(19, 'Marina Teresa', 'Squerciati', 'marinaSquerciate34@gmail.com', '996754365', 9, '2020-12-22', 7),
(20, 'Giada Pamela', 'De Laurentis', 'gpameladLau@hotmail.com', '967546545', 6, '2020-12-16', 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`id_atencion`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `test1` (`id_especialidad`),
  ADD KEY `test2` (`id_atencion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atencion`
--
ALTER TABLE `atencion`
  MODIFY `id_atencion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `Id_usuario` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id_cliente` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `test1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `test2` FOREIGN KEY (`id_atencion`) REFERENCES `atencion` (`id_atencion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
