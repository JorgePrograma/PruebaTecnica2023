-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-03-2023 a las 17:32:52
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COUNTRY`
--

CREATE TABLE `COUNTRY` (
  `CountryId` int(11) NOT NULL,
  `CountryName` varchar(100) NOT NULL,
  `Continent` varchar(100) NOT NULL,
  `Currency` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `COUNTRY`
--

INSERT INTO `COUNTRY` (`CountryId`, `CountryName`, `Continent`, `Currency`) VALUES
(1, 'California', 'USA', ''),
(2, 'London', 'UK', ''),
(3, 'Germany', 'EUROPE', ''),
(4, 'India', 'ASIA', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DEPARTMENT`
--

CREATE TABLE `DEPARTMENT` (
  `DepartmentId` int(11) NOT NULL,
  `DepName` varchar(100) NOT NULL,
  `CountryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`DepartmentId`, `DepName`, `CountryId`) VALUES
(1, 'Product', 1),
(2, 'R&D', 2),
(3, 'HR', 3),
(4, 'Finance', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `EmpID` int(11) NOT NULL,
  `EmpName` varchar(100) NOT NULL,
  `DeptId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EmpID`, `EmpName`, `DeptId`) VALUES
(1, 'Zuckenberg', 1),
(2, 'Musk', 2),
(3, 'Jobs', 3),
(4, 'Tesla', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FOLDER`
--

CREATE TABLE `FOLDER` (
  `FolderId` int(11) NOT NULL,
  `EmpId` int(11) NOT NULL,
  `AccessType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `FOLDER`
--

INSERT INTO `FOLDER` (`FolderId`, `EmpId`, `AccessType`) VALUES
(1, 1, 'Read'),
(1, 1, 'Write'),
(1, 2, 'Read'),
(1, 3, 'Read'),
(2, 2, 'Read'),
(2, 4, 'Write'),
(2, 2, 'Read');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `COUNTRY`
--
ALTER TABLE `COUNTRY`
  ADD PRIMARY KEY (`CountryId`);

--
-- Indices de la tabla `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD PRIMARY KEY (`DepartmentId`),
  ADD KEY `CountryId` (`CountryId`);

--
-- Indices de la tabla `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EmpID`),
  ADD KEY `DeptId` (`DeptId`);

--
-- Indices de la tabla `FOLDER`
--
ALTER TABLE `FOLDER`
  ADD KEY `EmpId` (`EmpId`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`CountryId`) REFERENCES `COUNTRY` (`CountryId`);

--
-- Filtros para la tabla `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`DeptId`) REFERENCES `DEPARTMENT` (`DepartmentId`);

--
-- Filtros para la tabla `FOLDER`
--
ALTER TABLE `FOLDER`
  ADD CONSTRAINT `FOLDER_ibfk_1` FOREIGN KEY (`EmpId`) REFERENCES `EMPLOYEE` (`EmpID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
