-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 01:57:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_cjge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('111', 'Cálculo Integral', 6, 127),
('112', 'Inglés V', 6, 127),
('113', 'Física II', 6, 110),
('114', 'Ciencia, Tecnología, Sociedad ', 6, 100),
('142', 'Construye DB', 6, 127),
('143', 'Desarrolla Aplicaciones Web ', 6, 127);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Matutino', NULL),
('Logística', 'Vespertino', NULL),
('Mecánica', 'Matutino', NULL),
('Programación', 'Mixto', 'Ricardo Méndez Rojas'),
('Recursos Humanos', 'Mixto', NULL),
('Soporte', 'Mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domcilio` varchar(20) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domcilio`, `telefono`, `grupo`) VALUES
('20305003587199', 'Jóse Francisco', 'Godinez Torres', 18, 'Fraccionamiento Gto:', '4181867153', '5PV'),
('20305060464296', 'Mariana Lizbeth', 'García Mendoza', 17, 'Pipila: Allende No. ', '4181356274', '5PV'),
('20305062186026', 'Omar Antonio', 'Avalos Aguillón', 17, 'Padre Hidalgo: Guerr', '4185630891', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(15) NOT NULL,
  `asignatura` varchar(6) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`) VALUES
('20305003587199', '142', '2022-10-18', 5, 10),
('20305003587199', '143', '2022-10-18', 5, 10),
('20305060464296', '142', '2022-10-18', 5, 10),
('20305060464296', '143', '2022-10-18', 5, 10),
('20305062186026', '142', '2022-10-18', 5, 10),
('20305062186026', '143', '2022-10-18', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `representante` varchar(60) DEFAULT NULL,
  `tutor` varchar(60) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CM', 'Matutino', NULL, NULL, 'Contabilidad'),
('5CV', 'Vespertino', NULL, NULL, 'Contabilidad'),
('5EM', 'Matutino', NULL, NULL, 'Electricidad'),
('5LV', 'Vespertino', NULL, NULL, 'Logística'),
('5MM', 'Matutino', NULL, NULL, 'Mecánica'),
('5PM', 'Matutino', 'Gael Quintana Romero', 'Ricardo Méndez Rojas', 'Programación'),
('5PV', 'Vespertino', 'Dulce Alejandra Nuñez Soria', 'Silvia Cecilia Carrillo Mastache', 'Programación'),
('5RM', 'Matutino', NULL, NULL, 'Recursos Humanos'),
('5RV', 'Vespertino', NULL, NULL, 'Recursos Humanos'),
('5SM', 'Matutino', NULL, NULL, 'Soporte'),
('5SV', 'Vespertino', NULL, NULL, 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `grupo_escuela` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
