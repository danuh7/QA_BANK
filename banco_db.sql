-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2023 a las 20:04:37
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco_db`
--
DROP DATABASE IF EXISTS `banco_db`;
CREATE DATABASE `banco_db`;
USE `banco_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id_banco` smallint(10) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id_banco`, `nombre`) VALUES
(1, 'BBVA Bancomer'),
(2, 'Santander'),
(3, 'Banamex'),
(4, 'Banorte'),
(5, 'HSBC'),
(6, 'Scotiabank'),
(7, 'Inbursa'),
(8, 'Interacciones'),
(9, 'Banco del Bajío'),
(10, 'Azteca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` smallint(5) NOT NULL,
  `primer_nombre` varchar(15) NOT NULL,
  `segundo_nombre` varchar(15) NOT NULL,
  `apellido_paterno` varchar(15) NOT NULL,
  `apellido_materno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `primer_nombre`, `segundo_nombre`, `apellido_paterno`, `apellido_materno`) VALUES
(1, 'Juan', 'Carlos', 'González', 'Hernández'),
(2, 'Andrzej', 'Krzysztof', 'Nowak', 'Kowalski'),
(3, 'Hans', 'Günther', 'Schmidt', 'Müller'),
(4, 'Emily', 'Elizabeth', 'Smith', 'Johnson'),
(5, 'María', 'Fernanda', 'Martínez', 'López'),
(6, 'Alicja', 'Katarzyna', 'Kowalczyk', 'Wójcik'),
(7, 'Lukas', 'Michael', 'Schneider', 'Bauer'),
(8, 'William', 'James', 'Brown', 'Davis'),
(9, 'Javier', 'Alejandro', 'Pérez', 'García'),
(10, 'Ewa', 'Anna', 'Lewandowska', 'Zielińska');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` smallint(10) NOT NULL,
  `numero_cuenta` varchar(10) NOT NULL,
  `monto` double NOT NULL,
  `id_banco` smallint(6) DEFAULT NULL,
  `id_tipo_cuenta` smallint(6) DEFAULT NULL,
  `id_cliente` smallint(6) DEFAULT NULL,
  `NIP` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `numero_cuenta`, `monto`, `id_banco`, `id_tipo_cuenta`, `id_cliente`, `NIP`) VALUES
(1, '1234567890', 5000, 1, 1, 1, '1234'),
(2, '2345678901', 3000, 2, 2, 2, '5678'),
(3, '3456789012', 7000, 3, 1, 3, '9876'),
(4, '4567890123', 4000, 4, 2, 4, '4321'),
(5, '5678901234', 6000, 5, 1, 5, '8765'),
(6, '6789012345', 8000, 1, 2, 6, '2345'),
(7, '7890123456', 3500, 2, 1, 7, '6789'),
(8, '8901234567', 4500, 3, 2, 8, '5432'),
(9, '9012345678', 5500, 4, 1, 9, '3456'),
(10, '0123456789', 6500, 5, 2, 10, '7890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_forma` smallint(10) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_forma`, `nombre`) VALUES
(1, 'EFECTIVO'),
(2, 'TARJETA'),
(3, 'CHEQUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id_operacion` smallint(10) NOT NULL,
  `fecha` date DEFAULT (curdate()),
  `hora` time DEFAULT (curtime()),
  `monto` double NOT NULL,
  `id_tipo_operacion` smallint(6) DEFAULT NULL,
  `id_destino` smallint(6) DEFAULT NULL,
  `id_forma` smallint(6) DEFAULT NULL,
  `id_origen` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`id_operacion`, `fecha`, `hora`, `monto`, `id_tipo_operacion`, `id_destino`, `id_forma`, `id_origen`) VALUES
(22, '2023-09-13', '23:47:25', 100.5, 1, 2, 3, 4),
(23, '2023-09-13', '23:47:25', 200.75, 2, 3, 1, 5),
(24, '2023-09-13', '23:47:25', 300.25, 1, 2, 3, 4),
(25, '2023-09-13', '23:47:25', 150.3, 2, 3, 1, 5),
(26, '2023-09-13', '23:47:25', 75.2, 1, 2, 3, 4),
(27, '2023-09-13', '23:47:25', 250.9, 2, 3, 2, 5),
(28, '2023-09-13', '23:47:25', 350.6, 1, 2, 3, 4),
(29, '2023-09-13', '23:47:25', 125.45, 2, 3, 1, 5),
(30, '2023-09-13', '23:47:25', 50.75, 1, 2, 2, 4),
(31, '2023-09-13', '23:47:25', 275.35, 2, 3, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta`
--

CREATE TABLE `tipo_cuenta` (
  `id_tipo_cuenta` smallint(6) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cuenta`
--

INSERT INTO `tipo_cuenta` (`id_tipo_cuenta`, `nombre`) VALUES
(1, 'TAREJTA DE CRÉDITO'),
(2, 'TARJETA DE DEBITO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_operacion`
--

CREATE TABLE `tipo_operacion` (
  `id_tipo` smallint(10) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_operacion`
--

INSERT INTO `tipo_operacion` (`id_tipo`, `nombre`) VALUES
(1, 'PAGO DE TARJETA'),
(2, 'TRANSFERENCIA BANCARIA'),
(3, 'DEPÓSITO'),
(4, 'CONSULTA DE SALDO'),
(5, 'CONSULTA DE MOVIMIENTOS'),
(6, 'PAGO DE LUZ'),
(7, 'PAGO DE TELÉFONO'),
(8, 'PAGO DE CABLE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `fk_tipo` (`id_banco`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_tipo_cuenta` (`id_tipo_cuenta`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_forma`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id_operacion`),
  ADD KEY `fk_tipo_operacion` (`id_tipo_operacion`),
  ADD KEY `fk_origen` (`id_origen`),
  ADD KEY `fk_destino` (`id_destino`),
  ADD KEY `fk_forma_pago` (`id_forma`);

--
-- Indices de la tabla `tipo_cuenta`
--
ALTER TABLE `tipo_cuenta`
  ADD PRIMARY KEY (`id_tipo_cuenta`);

--
-- Indices de la tabla `tipo_operacion`
--
ALTER TABLE `tipo_operacion`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id_banco` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9223372036854775807;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id_operacion` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tipo_cuenta`
--
ALTER TABLE `tipo_cuenta`
  MODIFY `id_tipo_cuenta` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_operacion`
--
ALTER TABLE `tipo_operacion`
  MODIFY `id_tipo` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `fk_tipo_cuenta` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipo_cuenta` (`id_tipo_cuenta`);

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `fk_destino` FOREIGN KEY (`id_destino`) REFERENCES `cuenta` (`id_cuenta`),
  ADD CONSTRAINT `fk_forma_pago` FOREIGN KEY (`id_forma`) REFERENCES `forma_pago` (`id_forma`),
  ADD CONSTRAINT `fk_origen` FOREIGN KEY (`id_origen`) REFERENCES `cuenta` (`id_cuenta`),
  ADD CONSTRAINT `fk_tipo_operacion` FOREIGN KEY (`id_tipo_operacion`) REFERENCES `tipo_operacion` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
