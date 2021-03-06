-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2019 a las 22:01:15
-- Versión del servidor: 5.7.24-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprados`
--

CREATE TABLE `comprados` (
  `id` int(11) UNSIGNED NOT NULL,
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `idObjeto` int(11) UNSIGNED NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumibles`
--

CREATE TABLE `consumibles` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `categoria` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fuerza` int(11) UNSIGNED NOT NULL,
  `habilidad` int(11) UNSIGNED NOT NULL,
  `vida` int(11) UNSIGNED NOT NULL,
  `precio` int(11) UNSIGNED NOT NULL,
  `rutaImagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `w` int(10) DEFAULT NULL,
  `h` int(10) DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enemigo`
--

CREATE TABLE `enemigo` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fuerza` int(11) UNSIGNED NOT NULL,
  `habilidad` int(11) UNSIGNED NOT NULL,
  `vida` int(11) UNSIGNED NOT NULL,
  `precio` int(11) UNSIGNED NOT NULL,
  `rutaImagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `w` int(10) DEFAULT NULL,
  `h` int(10) DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) UNSIGNED NOT NULL,
  `idPartida` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariocontiene`
--

CREATE TABLE `inventariocontiene` (
  `idInventario` int(11) UNSIGNED NOT NULL,
  `idConsumible` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariopartida`
--

CREATE TABLE `inventariopartida` (
  `id` int(11) UNSIGNED NOT NULL,
  `IdObjeto` int(11) UNSIGNED NOT NULL,
  `categoria` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usado-superado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapacontiene`
--

CREATE TABLE `mapacontiene` (
  `idMapa` int(11) UNSIGNED NOT NULL,
  `idMazmorra` int(11) UNSIGNED NOT NULL,
  `mazmorraNorte` int(11) UNSIGNED DEFAULT NULL,
  `mazmorraEste` int(11) UNSIGNED DEFAULT NULL,
  `mazmorraSur` int(11) UNSIGNED DEFAULT NULL,
  `mazmorraOeste` int(11) UNSIGNED DEFAULT NULL,
  `mazmorraInicial` tinyint(1) NOT NULL,
  `mazmorraFinal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapas`
--

CREATE TABLE `mapas` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dificultad` int(11) NOT NULL,
  `precio` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `numMazmorras` int(11) NOT NULL DEFAULT '0',
  `recompensa` int(11) NOT NULL DEFAULT '0',
  `propietario` int(11) UNSIGNED NOT NULL,
  `rutaImagen` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `valoracion` float NOT NULL DEFAULT '0',
  `numJugado` int(11) NOT NULL DEFAULT '0',
  `terminadoCreado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mazmorraconsumibles`
--

CREATE TABLE `mazmorraconsumibles` (
  `idMazmorra` int(11) UNSIGNED NOT NULL,
  `idConsumible` int(11) UNSIGNED NOT NULL,
  `x` int(2) UNSIGNED NOT NULL,
  `y` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mazmorraenemigo`
--

CREATE TABLE `mazmorraenemigo` (
  `idMazmorra` int(11) UNSIGNED NOT NULL,
  `idEnemigo` int(11) UNSIGNED NOT NULL,
  `x` int(2) UNSIGNED NOT NULL,
  `y` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mazmorras`
--

CREATE TABLE `mazmorras` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `numSalidas` int(11) UNSIGNED NOT NULL,
  `numEnemigos` int(11) UNSIGNED NOT NULL,
  `recompensa` int(11) UNSIGNED NOT NULL,
  `rutaImagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `historia` varchar(1000) COLLATE utf8mb4_spanish_ci NOT NULL,
  `x` int(10) NOT NULL,
  `y` int(10) NOT NULL,
  `w` int(10) NOT NULL,
  `h` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mazmorrassuperadas`
--

CREATE TABLE `mazmorrassuperadas` (
  `idMapa` int(11) UNSIGNED NOT NULL,
  `idMazmorra` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) UNSIGNED NOT NULL,
  `mensaje` varchar(140) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idMensajePadre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetosusados`
--

CREATE TABLE `objetosusados` (
  `id` int(11) UNSIGNED NOT NULL,
  `idPartida` int(11) UNSIGNED NOT NULL,
  `idMapa` int(11) UNSIGNED NOT NULL,
  `idMazmorra` int(11) UNSIGNED NOT NULL,
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `idObjeto` int(11) UNSIGNED NOT NULL,
  `tipoObjeto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `idPersonaje` int(11) UNSIGNED NOT NULL,
  `vidaAct` int(11) UNSIGNED NOT NULL,
  `vidaMax` int(11) UNSIGNED NOT NULL,
  `fuerza` int(11) UNSIGNED NOT NULL,
  `trasparencia` int(11) UNSIGNED NOT NULL,
  `habilidad` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `idPartida` int(11) UNSIGNED NOT NULL,
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `idMapa` int(11) UNSIGNED NOT NULL,
  `nombreMapa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idPersonaje` int(11) UNSIGNED NOT NULL,
  `nombrePj` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaComienzo` date DEFAULT NULL,
  `fechaUltimoAcceso` date DEFAULT NULL,
  `posX` int(10) DEFAULT NULL,
  `posY` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fuerza` int(11) UNSIGNED NOT NULL,
  `habilidad` int(11) UNSIGNED NOT NULL,
  `vida` int(11) UNSIGNED NOT NULL,
  `precio` int(11) UNSIGNED NOT NULL,
  `rutaImagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `w` int(10) DEFAULT NULL,
  `h` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesusuario`
--

CREATE TABLE `rolesusuario` (
  `usuario` int(11) UNSIGNED NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contraseña` varchar(70) COLLATE utf8mb4_spanish_ci NOT NULL,
  `monedas` int(11) NOT NULL DEFAULT '100',
  `puntos` int(11) NOT NULL DEFAULT '0',
  `rutaImagen` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `bloqueado` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comprados`
--
ALTER TABLE `comprados`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `comprados_ibfk_5` (`idObjeto`),
  ADD KEY `comprados_ibfk_1` (`idUsuario`);

--
-- Indices de la tabla `consumibles`
--
ALTER TABLE `consumibles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`,`categoria`);

--
-- Indices de la tabla `enemigo`
--
ALTER TABLE `enemigo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPartida` (`idPartida`);

--
-- Indices de la tabla `inventariocontiene`
--
ALTER TABLE `inventariocontiene`
  ADD PRIMARY KEY (`idInventario`,`idConsumible`),
  ADD KEY `objetos` (`idConsumible`);

--
-- Indices de la tabla `inventariopartida`
--
ALTER TABLE `inventariopartida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdObjeto` (`IdObjeto`);

--
-- Indices de la tabla `mapacontiene`
--
ALTER TABLE `mapacontiene`
  ADD PRIMARY KEY (`idMapa`,`idMazmorra`),
  ADD KEY `idMapa` (`idMapa`),
  ADD KEY `idMazmorra` (`idMazmorra`),
  ADD KEY `mazmorraEste` (`mazmorraEste`),
  ADD KEY `mazmorraSur` (`mazmorraSur`),
  ADD KEY `mazmorraOeste` (`mazmorraOeste`),
  ADD KEY `mazmorraNorte` (`mazmorraNorte`);

--
-- Indices de la tabla `mapas`
--
ALTER TABLE `mapas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propietario` (`propietario`);
ALTER TABLE `mapas` ADD FULLTEXT KEY `nombre` (`nombre`);

--
-- Indices de la tabla `mazmorraconsumibles`
--
ALTER TABLE `mazmorraconsumibles`
  ADD PRIMARY KEY (`idMazmorra`,`idConsumible`),
  ADD KEY `idMazmorra` (`idMazmorra`),
  ADD KEY `idConsumible` (`idConsumible`);

--
-- Indices de la tabla `mazmorraenemigo`
--
ALTER TABLE `mazmorraenemigo`
  ADD PRIMARY KEY (`idMazmorra`,`idEnemigo`),
  ADD KEY `enemigo` (`idEnemigo`);

--
-- Indices de la tabla `mazmorras`
--
ALTER TABLE `mazmorras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mazmorrassuperadas`
--
ALTER TABLE `mazmorrassuperadas`
  ADD PRIMARY KEY (`idMapa`,`idMazmorra`),
  ADD KEY `idenMazmorras` (`idMazmorra`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `idMensajePadre` (`idMensajePadre`);

--
-- Indices de la tabla `objetosusados`
--
ALTER TABLE `objetosusados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idMapa` (`idMapa`),
  ADD KEY `idPartida` (`idPartida`),
  ADD KEY `idMazmorra` (`idMazmorra`),
  ADD KEY `idObjeto` (`idObjeto`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`idPartida`),
  ADD KEY `idMapa` (`idMapa`),
  ADD KEY `idPersonaje` (`idPersonaje`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `rolesusuario`
--
ALTER TABLE `rolesusuario`
  ADD PRIMARY KEY (`usuario`,`rol`),
  ADD KEY `rol` (`rol`),
  ADD KEY `usuario_3` (`usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `nombre` (`nombre`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprados`
--
ALTER TABLE `comprados`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consumibles`
--
ALTER TABLE `consumibles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enemigo`
--
ALTER TABLE `enemigo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventariopartida`
--
ALTER TABLE `inventariopartida`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mapas`
--
ALTER TABLE `mapas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mazmorras`
--
ALTER TABLE `mazmorras`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objetosusados`
--
ALTER TABLE `objetosusados`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `idPartida` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprados`
--
ALTER TABLE `comprados`
  ADD CONSTRAINT `comprados_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idPartida`) REFERENCES `partida` (`idPartida`);

--
-- Filtros para la tabla `inventariocontiene`
--
ALTER TABLE `inventariocontiene`
  ADD CONSTRAINT `inventario` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `objetos` FOREIGN KEY (`idConsumible`) REFERENCES `consumibles` (`id`);

--
-- Filtros para la tabla `inventariopartida`
--
ALTER TABLE `inventariopartida`
  ADD CONSTRAINT `inventariopartida_ibfk_1` FOREIGN KEY (`IdObjeto`) REFERENCES `consumibles` (`id`);

--
-- Filtros para la tabla `mapacontiene`
--
ALTER TABLE `mapacontiene`
  ADD CONSTRAINT `idMazmorra` FOREIGN KEY (`idMazmorra`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `mapacontiene_ibfk_1` FOREIGN KEY (`idMapa`) REFERENCES `mapas` (`id`),
  ADD CONSTRAINT `mapacontiene_ibfk_2` FOREIGN KEY (`mazmorraNorte`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `mapacontiene_ibfk_3` FOREIGN KEY (`mazmorraEste`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `mapacontiene_ibfk_4` FOREIGN KEY (`mazmorraSur`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `mapacontiene_ibfk_5` FOREIGN KEY (`mazmorraOeste`) REFERENCES `mazmorras` (`id`);

--
-- Filtros para la tabla `mapas`
--
ALTER TABLE `mapas`
  ADD CONSTRAINT `propietario` FOREIGN KEY (`propietario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `mazmorraconsumibles`
--
ALTER TABLE `mazmorraconsumibles`
  ADD CONSTRAINT `mazmorraconsumibles_ibfk_1` FOREIGN KEY (`idMazmorra`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `mazmorraconsumibles_ibfk_2` FOREIGN KEY (`idConsumible`) REFERENCES `consumibles` (`id`);

--
-- Filtros para la tabla `mazmorraenemigo`
--
ALTER TABLE `mazmorraenemigo`
  ADD CONSTRAINT `enemigo` FOREIGN KEY (`idEnemigo`) REFERENCES `enemigo` (`id`),
  ADD CONSTRAINT `mazmorra` FOREIGN KEY (`idMazmorra`) REFERENCES `mazmorras` (`id`);

--
-- Filtros para la tabla `mazmorrassuperadas`
--
ALTER TABLE `mazmorrassuperadas`
  ADD CONSTRAINT `idenMazmorras` FOREIGN KEY (`idMazmorra`) REFERENCES `mazmorras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mazmorrassuperadas_ibfk_1` FOREIGN KEY (`idMapa`) REFERENCES `mapas` (`id`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `Mensajes_mensaje` FOREIGN KEY (`idMensajePadre`) REFERENCES `mensajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Mensajes_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `objetosusados`
--
ALTER TABLE `objetosusados`
  ADD CONSTRAINT `objetosusados_ibfk_2` FOREIGN KEY (`idMapa`) REFERENCES `mapas` (`id`),
  ADD CONSTRAINT `objetosusados_ibfk_3` FOREIGN KEY (`idMazmorra`) REFERENCES `mazmorras` (`id`),
  ADD CONSTRAINT `objetosusados_ibfk_4` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `objetosusados_ibfk_5` FOREIGN KEY (`idObjeto`) REFERENCES `consumibles` (`id`),
  ADD CONSTRAINT `objetosusados_ibfk_6` FOREIGN KEY (`idPartida`) REFERENCES `partida` (`idPartida`);

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partida_ibfk_2` FOREIGN KEY (`idMapa`) REFERENCES `mapas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partida_ibfk_3` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rolesusuario`
--
ALTER TABLE `rolesusuario`
  ADD CONSTRAINT `rolesusuario_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `rolesusuario_ibfk_2` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
