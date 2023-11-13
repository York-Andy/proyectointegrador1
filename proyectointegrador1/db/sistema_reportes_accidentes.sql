-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 21:24:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_reportes_accidentes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionsiniestro`
--

CREATE TABLE `asignacionsiniestro` (
  `IdAsignacion` int(11) NOT NULL,
  `IdTecnico` int(11) NOT NULL,
  `IdSiniestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignacionsiniestro`
--

INSERT INTO `asignacionsiniestro` (`IdAsignacion`, `IdTecnico`, `IdSiniestro`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `RazonSocial` varchar(80) NOT NULL,
  `Cuit_Cliente` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`RazonSocial`, `Cuit_Cliente`, `IdCliente`, `estado`) VALUES
('', 0, 0, NULL),
('Juan Pérez', 1111111111, 1, 1),
('María Gómez', 2147483647, 2, 1),
('Carlos Rodríguez', 333333333, 3, 0),
('Ana García', 2147483647, 4, 1),
('Luisa Martínez', 555555555, 5, 0),
('Pedro Sánchez', 6677766, 6, 1),
('Laura Fernández', 77777777, 7, 0),
('Martín López', 8888888, 8, 1),
('Valeria Torres', 99999999, 9, 0),
('Santiago Díaz', 1234567890, 10, 1),
('Silvia Ramírez', 11223344, 11, 0),
('Javier Castro', 223344556, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colchonhorasestimadas`
--

CREATE TABLE `colchonhorasestimadas` (
  `IdHorasEstimadas` int(11) NOT NULL,
  `IdSiniestros` int(11) NOT NULL,
  `HorasEstimadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colchonhorasestimadas`
--

INSERT INTO `colchonhorasestimadas` (`IdHorasEstimadas`, `IdSiniestros`, `HorasEstimadas`) VALUES
(1, 1, 3),
(2, 2, 5),
(3, 3, 8),
(4, 4, 10),
(5, 5, 4),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratodeservivio`
--

CREATE TABLE `contratodeservivio` (
  `Idcontrato` int(11) NOT NULL,
  `Cuit_Cliente` int(11) NOT NULL,
  `IdServicio` int(11) NOT NULL,
  `FechaContrato` date NOT NULL,
  `FechaFinContrato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratodeservivio`
--

INSERT INTO `contratodeservivio` (`Idcontrato`, `Cuit_Cliente`, `IdServicio`, `FechaContrato`, `FechaFinContrato`) VALUES
(1, 4, 1, '2023-02-06', '2023-11-24'),
(2, 8, 6, '2023-10-22', '2024-10-22'),
(3, 3, 3, '2023-10-01', '0000-00-00'),
(4, 3, 3, '2023-10-01', '2024-10-01'),
(5, 1, 10, '2023-09-11', '2023-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `IdNotificacion` int(11) NOT NULL,
  `medioPreferido` varchar(80) NOT NULL,
  `IdTecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`IdNotificacion`, `medioPreferido`, `IdTecnico`) VALUES
(1, 'Email', 1),
(2, 'WhatsApp', 2),
(3, 'Email', 3),
(4, 'WhatsApp', 4),
(5, 'Email', 5),
(6, 'WhatsApp', 6),
(7, 'Email', 7),
(8, 'WhatsApp', 8),
(9, 'Email', 9),
(10, 'WhatsApp', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema`
--

CREATE TABLE `problema` (
  `IdProblema` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problematecnicos`
--

CREATE TABLE `problematecnicos` (
  `IdTecnicoProblema` int(11) NOT NULL,
  `IdTecnico` int(11) NOT NULL,
  `IdProblema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `IdServicio` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`IdServicio`, `Descripcion`) VALUES
(1, 'Soporte SAP'),
(2, 'Soporte Tango'),
(3, 'Mantenimiento Windows'),
(4, 'Mantenimiento MacOS'),
(5, 'Mantenimiento Linux Ubuntu'),
(6, 'Instalación de Software'),
(7, 'Configuración de Red'),
(8, 'Soporte Técnico General'),
(9, 'Virtualización'),
(10, 'Seguridad Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siniestro`
--

CREATE TABLE `siniestro` (
  `IdSiniestro` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `FechaDeSiniestro` date NOT NULL,
  `FechaDeResoluccion` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `Cuit_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `siniestro`
--

INSERT INTO `siniestro` (`IdSiniestro`, `Descripcion`, `FechaDeSiniestro`, `FechaDeResoluccion`, `estado`, `Cuit_Cliente`) VALUES
(1, 'Problema con el sistema SAP', '2023-11-01', '2023-11-05', 0, 2147483647),
(2, 'Error en el sistema operativo Windows', '2023-11-02', '2023-11-06', 0, 2147483647),
(3, 'Incidente con la aplicación Tango', '2023-11-03', '2023-11-07', 0, 2147483647),
(4, 'Problema de red en Linux Ubuntu', '2023-11-04', '2023-11-08', 0, 2147483647),
(5, 'Falla en el sistema MacOS', '2023-11-05', '2023-11-09', 0, 2147483647),
(6, 'Error crítico en SAP', '2023-11-06', '2023-11-10', 0, 2147483647),
(7, 'Problema de seguridad en Windows', '2023-11-07', '2023-11-11', 0, 2147483647),
(8, 'Incidente con la aplicación Tango', '2023-11-08', '2023-11-12', 0, 2147483647),
(9, 'Falla en la virtualización', '2023-11-09', '2023-11-13', 0, 2147483647),
(10, 'Problema de red en Linux Ubuntu', '2023-11-10', '2023-11-14', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `IdTecnico` int(11) NOT NULL,
  `nombreYapellido` varchar(255) NOT NULL,
  `especialidad` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`IdTecnico`, `nombreYapellido`, `especialidad`) VALUES
(1, 'Técnico 1', 'Redes'),
(2, 'Técnico 2', 'Base de Datos'),
(3, 'Técnico 3', 'Seguridad'),
(4, 'Técnico 4', 'Desarrollo'),
(5, 'Técnico 5', 'Soporte Técnico'),
(6, 'Técnico 6', 'SAP'),
(7, 'Técnico 7', 'Linux Ubuntu'),
(8, 'Técnico 8', 'Windows'),
(9, 'Técnico 9', 'MacOS'),
(10, 'Técnico 10', 'Virtualización');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacionsiniestro`
--
ALTER TABLE `asignacionsiniestro`
  ADD PRIMARY KEY (`IdAsignacion`),
  ADD KEY `IdSiniestro` (`IdSiniestro`),
  ADD KEY `IdTecnico` (`IdTecnico`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`) USING BTREE;

--
-- Indices de la tabla `colchonhorasestimadas`
--
ALTER TABLE `colchonhorasestimadas`
  ADD PRIMARY KEY (`IdHorasEstimadas`),
  ADD KEY `IdSiniestros` (`IdSiniestros`);

--
-- Indices de la tabla `contratodeservivio`
--
ALTER TABLE `contratodeservivio`
  ADD PRIMARY KEY (`Idcontrato`),
  ADD KEY `Cuit_Cliente` (`Cuit_Cliente`),
  ADD KEY `IdServicio` (`IdServicio`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`IdNotificacion`),
  ADD KEY `IdTecnico` (`IdTecnico`);

--
-- Indices de la tabla `problema`
--
ALTER TABLE `problema`
  ADD PRIMARY KEY (`IdProblema`);

--
-- Indices de la tabla `problematecnicos`
--
ALTER TABLE `problematecnicos`
  ADD PRIMARY KEY (`IdTecnicoProblema`),
  ADD KEY `IdTecnico` (`IdTecnico`),
  ADD KEY `IdProblema` (`IdProblema`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`IdServicio`);

--
-- Indices de la tabla `siniestro`
--
ALTER TABLE `siniestro`
  ADD PRIMARY KEY (`IdSiniestro`),
  ADD KEY `Cuit_Cliente` (`Cuit_Cliente`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`IdTecnico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacionsiniestro`
--
ALTER TABLE `asignacionsiniestro`
  MODIFY `IdAsignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `colchonhorasestimadas`
--
ALTER TABLE `colchonhorasestimadas`
  MODIFY `IdHorasEstimadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `contratodeservivio`
--
ALTER TABLE `contratodeservivio`
  MODIFY `Idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `IdNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `problema`
--
ALTER TABLE `problema`
  MODIFY `IdProblema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problematecnicos`
--
ALTER TABLE `problematecnicos`
  MODIFY `IdTecnicoProblema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `IdServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `siniestro`
--
ALTER TABLE `siniestro`
  MODIFY `IdSiniestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `IdTecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionsiniestro`
--
ALTER TABLE `asignacionsiniestro`
  ADD CONSTRAINT `asignacionsiniestro_ibfk_1` FOREIGN KEY (`IdSiniestro`) REFERENCES `siniestro` (`IdSiniestro`),
  ADD CONSTRAINT `asignacionsiniestro_ibfk_2` FOREIGN KEY (`IdTecnico`) REFERENCES `tecnico` (`IdTecnico`);

--
-- Filtros para la tabla `colchonhorasestimadas`
--
ALTER TABLE `colchonhorasestimadas`
  ADD CONSTRAINT `colchonhorasestimadas_ibfk_1` FOREIGN KEY (`IdSiniestros`) REFERENCES `siniestro` (`IdSiniestro`);

--
-- Filtros para la tabla `contratodeservivio`
--
ALTER TABLE `contratodeservivio`
  ADD CONSTRAINT `contratodeservivio_ibfk_1` FOREIGN KEY (`Cuit_Cliente`) REFERENCES `clientes` (`IdCliente`),
  ADD CONSTRAINT `contratodeservivio_ibfk_2` FOREIGN KEY (`IdServicio`) REFERENCES `servicios` (`IdServicio`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`IdTecnico`) REFERENCES `tecnico` (`IdTecnico`);

--
-- Filtros para la tabla `problematecnicos`
--
ALTER TABLE `problematecnicos`
  ADD CONSTRAINT `problematecnicos_ibfk_1` FOREIGN KEY (`IdTecnico`) REFERENCES `tecnico` (`IdTecnico`),
  ADD CONSTRAINT `problematecnicos_ibfk_2` FOREIGN KEY (`IdProblema`) REFERENCES `problema` (`IdProblema`);

--
-- Filtros para la tabla `siniestro`
--
ALTER TABLE `siniestro`
  ADD CONSTRAINT `siniestro_ibfk_1` FOREIGN KEY (`Cuit_Cliente`) REFERENCES `clientes` (`Cuit_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
