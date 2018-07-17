-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-07-2018 a las 06:49:34
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `evaluator`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idArea` varchar(6) NOT NULL,
  `Nombre_area` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idArea`, `Nombre_area`) VALUES
('BSD', 'BASES DE DATOS'),
('COM', 'COMUNICACION'),
('DAT', 'DATA CENTER'),
('DES', 'DESARROLLO'),
('NO ENT', 'SOP'),
('PEP', 'PROYECTOS '),
('RER', 'EEEE'),
('SIS', 'SISTEMAS'),
('SOP', 'SOPORTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_etiquetas`
--

CREATE TABLE `area_etiquetas` (
  `id` int(11) NOT NULL,
  `Area_idArea` varchar(6) NOT NULL,
  `Etiquetas_idEtiquetas` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area_etiquetas`
--

INSERT INTO `area_etiquetas` (`id`, `Area_idArea`, `Etiquetas_idEtiquetas`) VALUES
(5, 'DAT', 'BD2'),
(7, 'DAT', 'LNX'),
(8, 'DAT', 'CSS'),
(9, 'SOP', 'HTM'),
(10, 'SIS', 'HTM'),
(11, 'COM', 'LNX'),
(13, 'DAT', 'BD2'),
(15, 'BSD', 'BD2'),
(16, 'NO ENT', 'PHP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_etiquetas_aspirante`
--

CREATE TABLE `area_etiquetas_aspirante` (
  `idDatos` int(11) NOT NULL,
  `user_aspirante_idUser_Aspirante` varchar(10) NOT NULL,
  `user_aspirante_tipo_idTipo` varchar(3) NOT NULL,
  `area_etiquetas_Area_idArea` varchar(6) NOT NULL,
  `area_etiquetas_id` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area_etiquetas_aspirante`
--

INSERT INTO `area_etiquetas_aspirante` (`idDatos`, `user_aspirante_idUser_Aspirante`, `user_aspirante_tipo_idTipo`, `area_etiquetas_Area_idArea`, `area_etiquetas_id`, `valor`) VALUES
(1, 'RFC1234567', 'PRA', 'DAT', 5, 0),
(6, 'RFC234', 'VAC', 'DAT', 8, 4),
(15, 'RFC1234567', 'PRA', 'DAT', 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistasp_evento`
--

CREATE TABLE `asistasp_evento` (
  `evento_idEvento` int(11) NOT NULL,
  `User_Aspirante` varchar(10) NOT NULL,
  `tipo_idTipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistasp_evento`
--

INSERT INTO `asistasp_evento` (`evento_idEvento`, `User_Aspirante`, `tipo_idTipo`) VALUES
(1, 'RFC1234567', 'PRA'),
(2, 'RFC1234567', 'PRA'),
(2, 'RFC234', 'VAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistrec_evento`
--

CREATE TABLE `asistrec_evento` (
  `Evento_idEvento` int(11) NOT NULL,
  `user_reclutador` int(11) NOT NULL,
  `Reclutador_Area_idArea` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistrec_evento`
--

INSERT INTO `asistrec_evento` (`Evento_idEvento`, `user_reclutador`, `Reclutador_Area_idArea`) VALUES
(1, 123654789, 'DAT'),
(2, 987654123, 'SOP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checklist`
--

CREATE TABLE `checklist` (
  `idCheckList` varchar(15) NOT NULL,
  `Rec_idUser_Reclutador` int(11) NOT NULL,
  `Rec_Area_idArea` varchar(6) NOT NULL,
  `idEtiquetas` varchar(3) NOT NULL,
  `Valor` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `checklist`
--

INSERT INTO `checklist` (`idCheckList`, `Rec_idUser_Reclutador`, `Rec_Area_idArea`, `idEtiquetas`, `Valor`) VALUES
('LISTA DE PEDRO', 123456789, 'COM', 'LNX', 1),
('lista juanfga', 123456789, 'COM', 'PHP', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `Idreclutador` int(11) NOT NULL,
  `AreaReclutador` varchar(6) NOT NULL,
  `aspirante_idUser_Aspirante` varchar(10) NOT NULL,
  `aspirante_tipo_idTipo` varchar(3) NOT NULL,
  `Fecha` date NOT NULL,
  `Comentarios` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`idEncuesta`, `Idreclutador`, `AreaReclutador`, `aspirante_idUser_Aspirante`, `aspirante_tipo_idTipo`, `Fecha`, `Comentarios`) VALUES
(1, 123456789, 'COM', 'RFC1234567', 'PRA', '2018-04-10', 'Buena idea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `idEtiquetas` varchar(3) NOT NULL,
  `Nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `etiquetas`
--

INSERT INTO `etiquetas` (`idEtiquetas`, `Nombre`) VALUES
('BD2', 'MYSQL SERVER'),
('CSP', 'C SHARP'),
('CSS', 'CSS'),
('CTM', 'INOMBRABLE'),
('HTM', 'HTML'),
('JAV', 'JAVA'),
('LNX', 'LINUX'),
('OPR', 'OPERA'),
('PHP', 'PHP'),
('SAP', 'SAP'),
('TES', 'TERMINAL SERVER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Descripcion` varchar(180) NOT NULL,
  `Fecha` date NOT NULL,
  `Locacion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `Nombre`, `Descripcion`, `Fecha`, `Locacion`) VALUES
(1, 'Presentacion', 'Presentación de proyectos en la universidad.', '2018-07-20', 'Arco Norte'),
(2, 'TECH GARAGE CUMBRES 2018', 'Búsqueda de trabajadores en el tech garage de cumbres', '2018-04-30', 'TECH GARAGE CUMBRES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `idGal` int(5) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `aspirante_idUser_Aspirante` varchar(10) NOT NULL,
  `aspirante_tipo_idTipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`idGal`, `Direccion`, `aspirante_idUser_Aspirante`, `aspirante_tipo_idTipo`) VALUES
(1, 'PATH://C:users:essto es fake', 'RFC234', 'VAC'),
(4, 'UNA imagen de gato', 'RFC1234567', 'PRA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefe_departamento`
--

CREATE TABLE `jefe_departamento` (
  `idtable` varchar(50) NOT NULL,
  `User` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `area_idArea` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jefe_departamento`
--

INSERT INTO `jefe_departamento` (`idtable`, `User`, `Contrasena`, `Nombre`, `Apellidos`, `area_idArea`) VALUES
('00000000001', 'ADMINI', 'kk', 'Camas', 'Chencho', 'SIS'),
('1234569874', 'ADMINISTRADOR', '123456789', 'MURDOCK ', 'MATT', 'DES'),
('1234569875', 'JHONNY', '654654645', 'CHICO', 'PEPE', 'SOP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalidad`
--

CREATE TABLE `personalidad` (
  `idPersonalidad` varchar(3) NOT NULL,
  `Nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personalidad`
--

INSERT INTO `personalidad` (`idPersonalidad`, `Nombre`) VALUES
('ADA', 'ADAPTABLENO'),
('EMP', 'EMPATIA'),
('HON', 'HONESTIDAD'),
('INQ', 'INQUIETO'),
('LEA', 'LEALTAD'),
('LID', 'LIDERAZGO'),
('POS', 'POSITIVO'),
('PRO', 'PROACTIVO'),
('SEG', 'SEGURIDAD'),
('SER', 'SERIEDAD'),
('TEQ', 'TRABAJO EN EQUIPO'),
('TRA', 'TRANQUILO'),
('VER', 'VERSATIL'),
('WEB', 'FLOJO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalidad_aspirante`
--

CREATE TABLE `personalidad_aspirante` (
  `Id_PersAsp` int(5) NOT NULL,
  `idPersonalidad` varchar(3) NOT NULL,
  `aspirante_idUser_Aspirante` varchar(10) NOT NULL,
  `user_aspirante_tipo_idTipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personalidad_aspirante`
--

INSERT INTO `personalidad_aspirante` (`Id_PersAsp`, `idPersonalidad`, `aspirante_idUser_Aspirante`, `user_aspirante_tipo_idTipo`) VALUES
(2, 'HON', 'RFC1234567', 'PRA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pproyectos`
--

CREATE TABLE `pproyectos` (
  `idProyecto` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Enlace` varchar(150) NOT NULL,
  `aspirante_idUser_Aspirante` varchar(10) NOT NULL,
  `aspirante_tipo_idTipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='	';

--
-- Volcado de datos para la tabla `pproyectos`
--

INSERT INTO `pproyectos` (`idProyecto`, `Nombre`, `Descripcion`, `Enlace`, `aspirante_idUser_Aspirante`, `aspirante_tipo_idTipo`) VALUES
(2, 'WALABI', 'Proyecto en conjunto con la compañia walabi', 'www.walabi.com', 'RFC789654', 'VIS'),
(4, 'EFI CALL', 'proyecto de limpieza de escuelas', 'www.eficall.com', 'RFC234', 'VAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` varchar(3) NOT NULL,
  `Nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `Nombre`) VALUES
('PRA', 'PRACTICANTE'),
('VAC', 'VACANTE'),
('VIS', 'VISITANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_aspirante`
--

CREATE TABLE `user_aspirante` (
  `idUser_Aspirante` varchar(10) NOT NULL,
  `Contrasena` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido_pat` varchar(45) NOT NULL,
  `Apellido_mat` varchar(45) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `tipo_idTipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_aspirante`
--

INSERT INTO `user_aspirante` (`idUser_Aspirante`, `Contrasena`, `Nombre`, `Apellido_pat`, `Apellido_mat`, `Descripcion`, `tipo_idTipo`) VALUES
('RFC11516', '', 'jazmin', 'AGUILAR', 'POOL PECH', 'Extrovertida', 'VAC'),
('RFC1234567', '65464654654', 'MARIO', 'GOMEZ', 'SUAREZ', 'Aspirante de la UPQROO de 5to cuatrimestre. Ing en Software', 'PRA'),
('RFC234', 'HOLA', 'JORGE', 'PEREZ', 'CUÑAO', 'Malo en php', 'VAC'),
('RFC789654', '5555', 'DIANA', 'RAMIREZ', 'CONTRERAS', 'visitante de pemex', 'VIS'),
('undefined', '', 'Blanca', 'AGUILAR', 'POOL PECH', 'Extrovertida', 'VAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_reclutador`
--

CREATE TABLE `user_reclutador` (
  `idUser_Reclutador` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contrasena` varchar(20) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido_pat` varchar(15) NOT NULL,
  `Apellido_mat` varchar(15) NOT NULL,
  `Area_idArea` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_reclutador`
--

INSERT INTO `user_reclutador` (`idUser_Reclutador`, `Usuario`, `Contrasena`, `Nombre`, `Apellido_pat`, `Apellido_mat`, `Area_idArea`) VALUES
(123456789, 'JOHN WICK', '1234', 'JOHN', 'WIDWICKY', 'PEREZ', 'COM'),
(123654789, 'TELLOS', '7894', 'ALAN', 'SAMOS', 'TELLO', 'DAT'),
(987654123, 'SCOUTSPARK', '1111', 'JUAN', 'OCTAVIANO', 'LARA', 'SOP'),
(2147483647, 'USUARIO', '', 'GUSTAVO', 'PEREZ', 'GOMEZ', 'SIS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `area_etiquetas`
--
ALTER TABLE `area_etiquetas`
  ADD PRIMARY KEY (`id`,`Area_idArea`,`Etiquetas_idEtiquetas`),
  ADD KEY `fk_Area_has_Etiquetas_Etiquetas1_idx` (`Etiquetas_idEtiquetas`),
  ADD KEY `fk_Area_has_Etiquetas_Area1_idx` (`Area_idArea`);

--
-- Indices de la tabla `area_etiquetas_aspirante`
--
ALTER TABLE `area_etiquetas_aspirante`
  ADD PRIMARY KEY (`idDatos`,`user_aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`,`area_etiquetas_Area_idArea`,`area_etiquetas_id`),
  ADD KEY `fk_area_etiquetas_has_user_aspirante_user_aspirante1_idx` (`user_aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`),
  ADD KEY `fk_area_etiquetas_has_user_aspirante_area_etiquetas1_idx` (`area_etiquetas_id`,`area_etiquetas_Area_idArea`);

--
-- Indices de la tabla `asistasp_evento`
--
ALTER TABLE `asistasp_evento`
  ADD PRIMARY KEY (`evento_idEvento`,`User_Aspirante`,`tipo_idTipo`),
  ADD KEY `fk_user_aspirante_has_evento_evento1_idx` (`evento_idEvento`),
  ADD KEY `fk_user_aspirante_has_evento_user_aspirante1_idx` (`User_Aspirante`,`tipo_idTipo`);

--
-- Indices de la tabla `asistrec_evento`
--
ALTER TABLE `asistrec_evento`
  ADD PRIMARY KEY (`Evento_idEvento`,`Reclutador_Area_idArea`,`user_reclutador`),
  ADD KEY `fk_User_Reclutador_has_Evento_Evento1_idx` (`Evento_idEvento`),
  ADD KEY `fk_User_Reclutador_has_Evento_User_Reclutador1_idx` (`user_reclutador`,`Reclutador_Area_idArea`);

--
-- Indices de la tabla `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`idCheckList`,`Rec_idUser_Reclutador`,`Rec_Area_idArea`,`idEtiquetas`),
  ADD KEY `fk_CheckList_User_Reclutador1_idx` (`Rec_idUser_Reclutador`,`Rec_Area_idArea`),
  ADD KEY `fk_CheckList_Etiquetas1_idx` (`idEtiquetas`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`,`Idreclutador`,`AreaReclutador`,`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`),
  ADD KEY `fk_encuesta_user_aspirante1_idx` (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`),
  ADD KEY `fk_Encuesta_User_Reclutador1` (`Idreclutador`,`AreaReclutador`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`idEtiquetas`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`idGal`,`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`),
  ADD KEY `fk_galeria_user_aspirante1_idx` (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`);

--
-- Indices de la tabla `jefe_departamento`
--
ALTER TABLE `jefe_departamento`
  ADD PRIMARY KEY (`idtable`,`area_idArea`),
  ADD KEY `fk_Jefe_Departamento_area1_idx` (`area_idArea`);

--
-- Indices de la tabla `personalidad`
--
ALTER TABLE `personalidad`
  ADD PRIMARY KEY (`idPersonalidad`);

--
-- Indices de la tabla `personalidad_aspirante`
--
ALTER TABLE `personalidad_aspirante`
  ADD PRIMARY KEY (`Id_PersAsp`,`idPersonalidad`,`aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`),
  ADD KEY `fk_Personalidad_has_User_Aspirante_Personalidad1_idx` (`idPersonalidad`),
  ADD KEY `fk_personalidad_aspirante_user_aspirante1_idx` (`aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`);

--
-- Indices de la tabla `pproyectos`
--
ALTER TABLE `pproyectos`
  ADD PRIMARY KEY (`idProyecto`,`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`),
  ADD KEY `fk_pproyectos_user_aspirante1_idx` (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `user_aspirante`
--
ALTER TABLE `user_aspirante`
  ADD PRIMARY KEY (`idUser_Aspirante`,`tipo_idTipo`),
  ADD KEY `fk_user_aspirante_tipo1_idx` (`tipo_idTipo`);

--
-- Indices de la tabla `user_reclutador`
--
ALTER TABLE `user_reclutador`
  ADD PRIMARY KEY (`idUser_Reclutador`,`Area_idArea`),
  ADD KEY `fk_User_Reclutador_Area_idx` (`Area_idArea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_etiquetas`
--
ALTER TABLE `area_etiquetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `area_etiquetas_aspirante`
--
ALTER TABLE `area_etiquetas_aspirante`
  MODIFY `idDatos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `idEncuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
  MODIFY `idGal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `personalidad_aspirante`
--
ALTER TABLE `personalidad_aspirante`
  MODIFY `Id_PersAsp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pproyectos`
--
ALTER TABLE `pproyectos`
  MODIFY `idProyecto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area_etiquetas`
--
ALTER TABLE `area_etiquetas`
  ADD CONSTRAINT `fk_Area_has_Etiquetas_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Area_has_Etiquetas_Etiquetas1` FOREIGN KEY (`Etiquetas_idEtiquetas`) REFERENCES `etiquetas` (`idEtiquetas`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `area_etiquetas_aspirante`
--
ALTER TABLE `area_etiquetas_aspirante`
  ADD CONSTRAINT `fk_area_etiquetas_has_user_aspirante_area_etiquetas1` FOREIGN KEY (`area_etiquetas_id`,`area_etiquetas_Area_idArea`) REFERENCES `area_etiquetas` (`id`, `Area_idArea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_area_etiquetas_has_user_aspirante_user_aspirante1` FOREIGN KEY (`user_aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistasp_evento`
--
ALTER TABLE `asistasp_evento`
  ADD CONSTRAINT `fk_user_aspirante_has_evento_evento1` FOREIGN KEY (`evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_aspirante_has_evento_user_aspirante1` FOREIGN KEY (`User_Aspirante`,`tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistrec_evento`
--
ALTER TABLE `asistrec_evento`
  ADD CONSTRAINT `fk_User_Reclutador_has_Evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_Reclutador_has_Evento_User_Reclutador1` FOREIGN KEY (`user_reclutador`,`Reclutador_Area_idArea`) REFERENCES `user_reclutador` (`idUser_Reclutador`, `Area_idArea`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `checklist`
--
ALTER TABLE `checklist`
  ADD CONSTRAINT `fk_CheckList_Etiquetas1` FOREIGN KEY (`idEtiquetas`) REFERENCES `etiquetas` (`idEtiquetas`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CheckList_User_Reclutador1` FOREIGN KEY (`Rec_idUser_Reclutador`,`Rec_Area_idArea`) REFERENCES `user_reclutador` (`idUser_Reclutador`, `Area_idArea`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `fk_Encuesta_User_Reclutador1` FOREIGN KEY (`Idreclutador`,`AreaReclutador`) REFERENCES `user_reclutador` (`idUser_Reclutador`, `Area_idArea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encuesta_user_aspirante1` FOREIGN KEY (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD CONSTRAINT `fk_galeria_user_aspirante1` FOREIGN KEY (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `jefe_departamento`
--
ALTER TABLE `jefe_departamento`
  ADD CONSTRAINT `fk_Jefe_Departamento_area1` FOREIGN KEY (`area_idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personalidad_aspirante`
--
ALTER TABLE `personalidad_aspirante`
  ADD CONSTRAINT `fk_Personalidad_has_User_Aspirante_Personalidad1` FOREIGN KEY (`idPersonalidad`) REFERENCES `personalidad` (`idPersonalidad`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personalidad_aspirante_user_aspirante1` FOREIGN KEY (`aspirante_idUser_Aspirante`,`user_aspirante_tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pproyectos`
--
ALTER TABLE `pproyectos`
  ADD CONSTRAINT `fk_pproyectos_user_aspirante1` FOREIGN KEY (`aspirante_idUser_Aspirante`,`aspirante_tipo_idTipo`) REFERENCES `user_aspirante` (`idUser_Aspirante`, `tipo_idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_aspirante`
--
ALTER TABLE `user_aspirante`
  ADD CONSTRAINT `fk_user_aspirante_tipo1` FOREIGN KEY (`tipo_idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_reclutador`
--
ALTER TABLE `user_reclutador`
  ADD CONSTRAINT `fk_User_Reclutador_Area` FOREIGN KEY (`Area_idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
