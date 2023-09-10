-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2023 a las 07:29:26
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
(21, 'BBVA Bancomer'),
(22, 'Santander'),
(23, 'Banamex'),
(24, 'Banorte'),
(25, 'HSBC'),
(26, 'Scotiabank'),
(27, 'Inbursa'),
(28, 'Interacciones'),
(29, 'Banco del Bajío'),
(30, 'Azteca');

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
  `monto` double NOT NULL,
  `fk_banco` smallint(10) NOT NULL,
  `fk_tipo_cuenta` smallint(10) NOT NULL,
  `fk_cliente` smallint(10) NOT NULL,
  `NIP` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `monto`, `fk_banco`, `fk_tipo_cuenta`, `fk_cliente`, `NIP`) VALUES
(1, 5000, 1, 1, 1, '1234'),
(2, 3000, 2, 2, 2, '5678'),
(3, 7000, 3, 1, 3, '9876'),
(4, 4000, 4, 2, 4, '4321'),
(5, 6000, 5, 1, 5, '8765'),
(6, 8000, 1, 2, 6, '2345'),
(7, 3500, 2, 1, 7, '6789'),
(8, 4500, 3, 2, 8, '5432'),
(9, 5500, 4, 1, 9, '3456'),
(10, 6500, 5, 2, 10, '7890');

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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `hora` time(6) NOT NULL,
  `monto` double NOT NULL,
  `fk_tipo_operacion` smallint(6) NOT NULL,
  `fk_destino` smallint(6) NOT NULL,
  `fk_forma` smallint(6) NOT NULL,
  `fk_origen` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `operacion`
--

INSERT INTO `operacion` (`id_operacion`, `fecha`, `hora`, `monto`, `fk_tipo_operacion`, `fk_destino`, `fk_forma`, `fk_origen`) VALUES
(1, '2023-09-10 05:28:46', '12:00:00.000000', 1000, 1, 1, 2, 3),
(2, '2023-09-10 05:28:46', '13:30:00.000000', 2000, 2, 2, 1, 4),
(3, '2023-09-10 05:28:46', '14:45:00.000000', 1500, 1, 3, 3, 5),
(4, '2023-09-10 05:28:46', '15:15:00.000000', 800, 3, 4, 2, 6),
(5, '2023-09-10 05:28:46', '16:30:00.000000', 1200, 2, 5, 1, 7),
(6, '2023-09-10 05:28:46', '17:45:00.000000', 2500, 1, 6, 3, 8),
(7, '2023-09-10 05:28:46', '18:15:00.000000', 1800, 3, 7, 2, 9),
(8, '2023-09-10 05:28:46', '19:30:00.000000', 3000, 2, 8, 1, 10),
(9, '2023-09-10 05:28:46', '20:45:00.000000', 900, 1, 9, 3, 1),
(10, '2023-09-10 05:28:46', '21:00:00.000000', 600, 3, 10, 2, 2);

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
(1, '0'),
(2, '0'),
(3, 'TARJETA DE CRÉDITO'),
(4, 'TARJETA DE DÉBITO');

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
  ADD KEY `fk_tipo` (`fk_banco`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_tipo_cuenta` (`fk_tipo_cuenta`);

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
  ADD KEY `fk_tipo_operacion` (`fk_tipo_operacion`),
  ADD KEY `fk_origen` (`fk_origen`),
  ADD KEY `fk_destino` (`fk_destino`),
  ADD KEY `fk_forma_pago` (`fk_forma`);

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
  MODIFY `id_cuenta` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id_operacion` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `fk_tipo_cuenta` FOREIGN KEY (`fk_tipo_cuenta`) REFERENCES `tipo_cuenta` (`id_tipo_cuenta`);

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `fk_destino` FOREIGN KEY (`fk_destino`) REFERENCES `cuenta` (`id_cuenta`),
  ADD CONSTRAINT `fk_forma_pago` FOREIGN KEY (`fk_forma`) REFERENCES `forma_pago` (`id_forma`),
  ADD CONSTRAINT `fk_origen` FOREIGN KEY (`fk_origen`) REFERENCES `cuenta` (`id_cuenta`),
  ADD CONSTRAINT `fk_tipo_operacion` FOREIGN KEY (`fk_tipo_operacion`) REFERENCES `tipo_operacion` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
