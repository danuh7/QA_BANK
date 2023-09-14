-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2023 a las 07:48:45
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
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id_operacion` smallint(10) NOT NULL,
  `fecha` date DEFAULT curdate(),
  `hora` time DEFAULT curtime(),
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

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id_operacion` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

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
