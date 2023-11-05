-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2023 a las 19:46:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `socialcircle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `identificacion` varchar(15) NOT NULL,
  `primer_nombre` varchar(15) DEFAULT NULL,
  `segundo_nombre` varchar(15) DEFAULT NULL,
  `primer_apellido` varchar(15) DEFAULT NULL,
  `segundo_apellido` varchar(15) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `provincia` varchar(25) DEFAULT NULL,
  `canton` varchar(25) DEFAULT NULL,
  `distrito` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`identificacion`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `nacimiento`, `edad`, `pais`, `provincia`, `canton`, `distrito`) VALUES
('0001', 'Mauricio', 'Isaac', 'Hernadez', 'Reyes', 'Mauricio@gmail.com', '2000-10-25', 23, 'El salvador', 'Zona Oriental', 'Zapotillo', 'Usulutan'),
('0002', 'Fabian', 'Andres', 'Lopez', 'Morataya', 'fabianlopez@gmail.com', '2002-09-29', 22, 'El Salvador', 'Zona Oriental', 'Jocotillo', 'Usulutan'),
('0003', 'Reina', 'Isabel', 'Mendez', 'Reyes', 'isamendez@gmail.com', '2005-10-30', 18, 'China', 'Fujian', 'Guangdong', 'Shunhe Hui'),
('0004', 'Daniela', 'Roxana', 'Melgar', 'Luna', 'daniela@gmail.com', '1999-01-01', 24, 'España', 'Madrid', 'Indefinido', 'CHAMARTIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gustos`
--

CREATE TABLE `gustos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gustos`
--

INSERT INTO `gustos` (`id`, `nombre`) VALUES
(1, 'Carreras'),
(2, 'Peliculas'),
(3, 'Musica'),
(4, 'Comida'),
(5, 'Juegos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gustosxamigos`
--

CREATE TABLE `gustosxamigos` (
  `id` int(11) NOT NULL,
  `identificacion` varchar(15) DEFAULT NULL,
  `id_gusto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gustosxamigos`
--

INSERT INTO `gustosxamigos` (`id`, `identificacion`, `id_gusto`) VALUES
(1, '0001', 5),
(2, '0002', 2),
(3, '0003', 1),
(4, '0004', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `identificacion` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `tipo`, `nombre`, `identificacion`) VALUES
(1, 'Perro', 'Canela', '0001'),
(2, 'Conejo', 'Bola de nieve', '0002'),
(3, 'Gato', 'Tomas', '0003'),
(4, 'Perico', 'michi', '0004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `numero` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id`, `tipo`, `numero`) VALUES
(1, 'Casa', '2629 1201'),
(2, 'Celular', '7875 1245'),
(3, 'Casa', '2629 8741'),
(4, 'Celular', '7574 0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonosxamigos`
--

CREATE TABLE `telefonosxamigos` (
  `id` int(11) NOT NULL,
  `identificacion` varchar(15) DEFAULT NULL,
  `id_telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonosxamigos`
--

INSERT INTO `telefonosxamigos` (`id`, `identificacion`, `id_telefono`) VALUES
(1, '0001', 1),
(2, '0002', 2),
(3, '0003', 3),
(4, '0004', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `gustos`
--
ALTER TABLE `gustos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gustosxamigos`
--
ALTER TABLE `gustosxamigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gustosxamigos_ibfk_1` (`id_gusto`),
  ADD KEY `gustosxamigos_ibfk_2` (`identificacion`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_ibfk_1` (`identificacion`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefonosxamigos`
--
ALTER TABLE `telefonosxamigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `telefonosxamigos_ibfk_1` (`id_telefono`),
  ADD KEY `identificacion` (`identificacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gustosxamigos`
--
ALTER TABLE `gustosxamigos`
  ADD CONSTRAINT `gustosxamigos_ibfk_1` FOREIGN KEY (`id_gusto`) REFERENCES `gustos` (`id`),
  ADD CONSTRAINT `gustosxamigos_ibfk_2` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificacion`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificacion`);

--
-- Filtros para la tabla `telefonosxamigos`
--
ALTER TABLE `telefonosxamigos`
  ADD CONSTRAINT `telefonosxamigos_ibfk_1` FOREIGN KEY (`id_telefono`) REFERENCES `telefonos` (`id`),
  ADD CONSTRAINT `telefonosxamigos_ibfk_2` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
