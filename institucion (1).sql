-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2022 a las 02:18:31
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `institucion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `idAlumno` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fechaNac` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `nombre`, `apellido`, `fechaNac`, `activo`) VALUES
(2, 'Jose', 'Gomez', '1983-04-25', 1),
(4, 'Fernandez', 'Miguel', '1989-08-17', 1),
(6, 'Borrello', 'Hector', '1945-09-03', 1),
(7, 'Borrello', 'Hector', '1945-09-03', 1),
(8, 'Fariolli', 'Santiago', '1987-07-13', 1),
(9, 'Fariolli', 'Santiago', '1987-07-13', 1),
(10, 'Fariolli', 'Santiago', '1987-07-13', 1),
(11, 'Fariolli', 'Santiago', '1987-07-13', 1),
(12, 'Fariolli', 'Santiago', '1987-07-13', 1),
(13, 'Fariolli', 'Santiago', '1987-07-13', 1),
(14, 'Fariolli', 'Santiago', '1987-07-13', 1),
(15, 'Fariolli', 'Santiago', '1987-07-13', 1),
(16, 'Fariolli', 'Santiago', '1987-07-13', 1),
(17, 'Fariolli', 'Santiago', '1987-07-13', 1),
(18, 'Fariolli', 'Santiago', '1987-07-13', 1),
(19, 'Fariolli', 'Santiago', '1987-07-13', 1),
(20, 'Fariolli', 'Santiago', '1987-07-13', 1),
(21, 'Fariolli', 'Santiago', '1987-07-13', 1),
(22, 'Fariolli', 'Santiago', '1987-07-13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idInscripcion` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `nota` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idInscripcion`, `idAlumno`, `idMateria`, `nota`, `activo`) VALUES
(1, 16, 8, 5, 0),
(2, 17, 9, 5, 0),
(3, 18, 10, 5, 0),
(4, 19, 11, 5, 0),
(5, 20, 12, 5, 0),
(6, 21, 13, 5, 0),
(7, 22, 14, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `anioMateria` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idMateria`, `nombre`, `anioMateria`, `activo`) VALUES
(1, 'Web', 3, 1),
(2, 'Web', 3, 1),
(3, 'Web', 3, 1),
(4, 'Web', 3, 1),
(5, 'Web', 3, 1),
(6, 'Web', 3, 1),
(7, 'Web', 3, 1),
(8, 'Web', 3, 1),
(9, 'Web', 3, 1),
(10, 'Web', 3, 1),
(11, 'Web', 3, 1),
(12, 'Web', 3, 1),
(13, 'Web', 3, 1),
(14, 'Web', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`idInscripcion`),
  ADD KEY `idMateria` (`idMateria`),
  ADD KEY `idAlumno` (`idAlumno`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
