-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2019 a las 22:00:10
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

--
-- Volcado de datos para la tabla `comprados`
--

INSERT INTO `comprados` (`id`, `idUsuario`, `idObjeto`, `tipo`, `precio`) VALUES
(1, 11, 2, 'personaje', 0),
(2, 1, 2, 'personaje', 0),
(3, 2, 2, 'personaje', 0),
(4, 11, 1, 'mapas', 20),
(5, 1, 1, 'consumibles', 10),
(6, 2, 1, 'mapas', 20),
(7, 12, 2, 'personaje', 0),
(8, 1, 1, 'mapas', 20),
(9, 2, 7, 'enemigo', 80),
(10, 1, 4, 'enemigo', 60),
(11, 1, 3, 'enemigo', 50),
(12, 13, 2, 'personaje', 0),
(13, 14, 2, 'personaje', 0);

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

--
-- Volcado de datos para la tabla `consumibles`
--

INSERT INTO `consumibles` (`id`, `nombre`, `categoria`, `fuerza`, `habilidad`, `vida`, `precio`, `rutaImagen`, `w`, `h`, `tipo`) VALUES
(1, 'Poción 1', 'salud', 20, 10, 0, 10, 'img/pngZork/pocion1.png', 80, 120, 'consumible'),
(2, 'Poción 2', 'salud', 20, 10, 15, 15, 'img/pngZork/pocion2.png', 80, 120, 'consumible'),
(3, 'Escudo azul', 'defensa', 20, 40, 70, 50, 'img/pngZork/Recurso2.png', 80, 120, 'consumible'),
(4, 'Escudo rojo', 'defensa', 40, 30, 50, 60, 'img/pngZork/Recurso4.png', 80, 120, 'consumible'),
(5, 'Hacha', 'ataque', 80, 20, 10, 40, 'img/pngZork/Recurso3.png', 80, 120, 'consumible'),
(6, 'Espada Oro', 'ataque', 50, 40, 20, 50, 'img/pngZork/Recurso5.png', 80, 120, 'consumible'),
(7, 'Espada Plata', 'ataque', 40, 30, 30, 60, 'img/pngZork/Recurso6.png', 80, 120, 'consumible'),
(8, 'Lllave', 'key', 0, 0, 0, 0, 'img/pngZork/LlavePlata1.png', 70, 70, 'consumible');

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

--
-- Volcado de datos para la tabla `enemigo`
--

INSERT INTO `enemigo` (`id`, `nombre`, `fuerza`, `habilidad`, `vida`, `precio`, `rutaImagen`, `w`, `h`, `tipo`) VALUES
(1, 'Esqueleto', 20, 30, 100, 30, 'img/pngZork/cala.png', 123, 220, 'enemigo'),
(2, 'Dragón', 100, 70, 100, 60, 'img/pngZork/dragon.png', 123, 220, 'enemigo'),
(3, 'Fantasma', 10, 60, 100, 50, 'img/pngZork/fantasma.png', 123, 220, 'enemigo'),
(4, 'Zombie', 40, 20, 100, 60, 'img/pngZork/fran.png', 123, 220, 'enemigo'),
(5, 'Momia', 40, 30, 100, 40, 'img/pngZork/momia.png', 123, 220, 'enemigo'),
(6, 'Muerte', 80, 60, 100, 80, 'img/pngZork/muerte.png', 123, 220, 'enemigo'),
(7, 'Vampiro', 80, 70, 100, 80, 'img/pngZork/vamp.png', 123, 220, 'enemigo'),
(8, 'Anciana', 0, 0, 100, 20, 'img/pngZork/anciana.png', 123, 220, 'ayuda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) UNSIGNED NOT NULL,
  `idPartida` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `idPartida`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariocontiene`
--

CREATE TABLE `inventariocontiene` (
  `idInventario` int(11) UNSIGNED NOT NULL,
  `idConsumible` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `inventariocontiene`
--

INSERT INTO `inventariocontiene` (`idInventario`, `idConsumible`) VALUES
(14, 1),
(15, 1),
(1, 5),
(5, 5),
(10, 5),
(11, 5),
(14, 5),
(15, 5),
(1, 8),
(10, 8),
(11, 8),
(14, 8),
(15, 8);

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

--
-- Volcado de datos para la tabla `mapacontiene`
--

INSERT INTO `mapacontiene` (`idMapa`, `idMazmorra`, `mazmorraNorte`, `mazmorraEste`, `mazmorraSur`, `mazmorraOeste`, `mazmorraInicial`, `mazmorraFinal`) VALUES
(1, 1, 2, NULL, NULL, 5, 1, 0),
(1, 2, 3, 4, 1, NULL, 0, 0),
(1, 3, NULL, NULL, 2, NULL, 0, 0),
(1, 4, NULL, NULL, NULL, 2, 0, 0),
(1, 5, NULL, 1, NULL, 6, 0, 0),
(1, 6, NULL, 5, NULL, NULL, 0, 1);

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

--
-- Volcado de datos para la tabla `mapas`
--

INSERT INTO `mapas` (`id`, `nombre`, `dificultad`, `precio`, `numMazmorras`, `recompensa`, `propietario`, `rutaImagen`, `descripcion`, `valoracion`, `numJugado`, `terminadoCreado`) VALUES
(1, 'Calabozo', 3, 20, 6, 20, 1, 'img/calabozo.png', 'Muy guay', 0, 0, 1),
(2, 'ManoloElFiera', 1, 0, 2, 100, 1, NULL, 'buenas', 0, 0, 0),
(3, 'Arrbol', 2, 0, 7, 100, 1, NULL, 'marinero', 0, 0, 0),
(4, 'ManoloElFiera', 1, 0, 2, 1, 1, NULL, 'buenas', 0, 0, 0),
(5, 'user', 1, 0, 2, 1, 1, NULL, 'buenas', 0, 0, 0),
(6, 'pepe', 1, 0, 2, 3, 1, NULL, 'mundo lleno de fuego', 0, 0, 0),
(7, 'pepe', 1, 0, 2, 3, 1, NULL, 'mundo lleno de fuego', 0, 0, 0),
(8, 'ManoloElFiera', 1, 0, 2, 1, 2, NULL, 'buenas', 0, 0, 0),
(9, 'ManoloElFiera', 1, 0, 2, 1, 1, NULL, 'buenas', 0, 0, 0),
(10, 'Bosque maldito', 3, 0, 3, 300, 1, NULL, 'Va a ser muy dificil', 0, 0, 0),
(11, 'nuevo', 1, 0, 2, 1, 1, NULL, 'dificil', 0, 0, 0),
(12, 'Bosque maldito', 3, 0, 3, 300, 1, NULL, 'Va a ser muy dificil', 0, 0, 0);

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

--
-- Volcado de datos para la tabla `mazmorraconsumibles`
--

INSERT INTO `mazmorraconsumibles` (`idMazmorra`, `idConsumible`, `x`, `y`) VALUES
(1, 5, 350, 250),
(3, 1, 350, 250),
(5, 8, 250, 250);

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

--
-- Volcado de datos para la tabla `mazmorraenemigo`
--

INSERT INTO `mazmorraenemigo` (`idMazmorra`, `idEnemigo`, `x`, `y`) VALUES
(2, 1, 440, 150),
(3, 8, 440, 150),
(4, 4, 440, 150),
(6, 6, 440, 150);

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

--
-- Volcado de datos para la tabla `mazmorras`
--

INSERT INTO `mazmorras` (`id`, `nombre`, `numSalidas`, `numEnemigos`, `recompensa`, `rutaImagen`, `historia`, `x`, `y`, `w`, `h`) VALUES
(1, 'inicio', 2, 0, 2, 'img/mazmorras/calabozo.png', 'Esta oscuro, hace frio y ves una luz al <b>norte</b> se oye el sonido del agua al <b>oeste</b>', 0, 0, 720, 410),
(2, 'room1', 3, 0, 3, 'img/mazmorras/lab.png', 'Estas en una habitacion con mas luz, ves una gran sala al <b>norte</b> y un extrano olor proviene del <b>este</b>', 0, 0, 720, 410),
(3, 'gransala', 2, 0, 2, 'img/mazmorras/sala.png', 'Estas en una gran sala, al fondo una anciana abre una puerta . Que haces?', 0, 0, 720, 410),
(4, 'trolls', 1, 2, 3, 'img/mazmorras/comedor.png', 'Llegas a otra habitacion, algunos trolls estan asando comida, no te han visto todavia, Que haces?', 0, 0, 720, 410),
(5, 'room2', 2, 0, 2, 'img/mazmorras/pasilloArmadura.png', 'Por la ventana al <b>oeste</b> se ve un puente que parece que da a la salida de esto.', 0, 0, 720, 410),
(6, 'room3', 1, 1, 5, 'img/mazmorras/salaDestruida.png', 'Al intentar cruzar la habitacion, la muerte salta y te ataca, Que haces?', 0, 0, 720, 410);

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

--
-- Volcado de datos para la tabla `objetosusados`
--

INSERT INTO `objetosusados` (`id`, `idPartida`, `idMapa`, `idMazmorra`, `idUsuario`, `idObjeto`, `tipoObjeto`, `idPersonaje`, `vidaAct`, `vidaMax`, `fuerza`, `trasparencia`, `habilidad`) VALUES
(1, 1, 1, 1, 1, 5, 'consumible', 2, 100, 110, 160, 1, 20),
(2, 1, 1, 3, 1, 1, 'consumible', 2, 100, 110, 160, 1, 20),
(3, 1, 1, 1, 1, 5, 'consumible', 2, 20, 110, 180, 0, 30),
(4, 1, 1, 3, 1, 1, 'consumible', 2, 20, 110, 180, 0, 30),
(5, 1, 1, 5, 1, 8, 'consumible', 2, 20, 110, 180, 0, 30),
(6, 1, 1, 6, 1, 6, 'enemigo', 2, 20, 110, 180, 0, 30),
(7, 5, 1, 1, 1, 5, 'consumible', 2, 80, 110, 160, 1, 20),
(8, 5, 1, 2, 1, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(9, 10, 1, 1, 2, 5, 'consumible', 2, 80, 110, 160, 1, 20),
(10, 10, 1, 2, 2, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(11, 10, 1, 3, 2, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(12, 10, 1, 3, 2, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(13, 10, 1, 5, 2, 8, 'consumible', 2, 80, 110, 160, 1, 20),
(14, 11, 1, 1, 1, 5, 'consumible', 2, 100, 110, 160, 1, 20),
(15, 11, 1, 3, 1, 1, 'consumible', 2, 100, 110, 160, 1, 20),
(16, 11, 1, 5, 1, 8, 'consumible', 2, 100, 110, 180, 1, 30),
(17, 14, 1, 1, 1, 5, 'consumible', 2, 80, 110, 160, 1, 20),
(18, 14, 1, 2, 1, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(19, 14, 1, 3, 1, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(20, 14, 1, 1, 1, 5, 'consumible', 2, 80, 110, 160, 1, 20),
(21, 14, 1, 2, 1, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(22, 14, 1, 3, 1, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(23, 14, 1, 5, 1, 8, 'consumible', 2, 80, 110, 160, 1, 20),
(24, 15, 1, 1, 13, 5, 'consumible', 2, 100, 110, 160, 1, 20),
(25, 15, 1, 2, 13, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(26, 15, 1, 2, 13, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(27, 15, 1, 3, 13, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(28, 15, 1, 2, 13, 1, 'enemigo', 2, 80, 110, 160, 1, 20),
(29, 15, 1, 3, 13, 1, 'consumible', 2, 80, 110, 160, 1, 20),
(30, 15, 1, 5, 13, 8, 'consumible', 2, 80, 110, 160, 1, 20);

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

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`idPartida`, `idUsuario`, `idMapa`, `nombreMapa`, `idPersonaje`, `nombrePj`, `fechaComienzo`, `fechaUltimoAcceso`, `posX`, `posY`) VALUES
(1, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(2, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(3, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(4, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(5, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(6, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(7, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(8, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(9, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(10, 2, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(11, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(12, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(13, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(14, 1, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(15, 13, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL),
(16, 14, 1, 'Calabozo', 2, 'Caballero', NULL, NULL, NULL, NULL);

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

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`id`, `nombre`, `fuerza`, `habilidad`, `vida`, `precio`, `rutaImagen`, `w`, `h`) VALUES
(1, 'Anciana', 70, 50, 50, 60, 'img/pngZork/anciana.png', NULL, NULL),
(2, 'Caballero', 80, 70, 100, 60, 'img/pngZork/personaje1.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesusuario`
--

CREATE TABLE `rolesusuario` (
  `usuario` int(11) UNSIGNED NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rolesusuario`
--

INSERT INTO `rolesusuario` (`usuario`, `rol`) VALUES
(1, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(2, 2);

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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contraseña`, `monedas`, `puntos`, `rutaImagen`, `bloqueado`) VALUES
(1, 'user', 'user@example.org', '$2y$10$0eR.KhfTH5ybn/jlB86hwe/1nQeCKXk2RcLEjBscJbpUaF504kSOi', 12890, 100, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', b'0'),
(2, 'admin', 'admin@example.org', '$2y$10$0eR.KhfTH5ybn/jlB86hwe/1nQeCKXk2RcLEjBscJbpUaF504kSOi', 40, 200, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', b'0'),
(11, 'Alberto', 'alberc01@ucm.es', '$2y$10$HdDmyR1rsLhuZ.YmhO1JgO3a1I2VRJ.jyXcOWnvqGjPig5hCQ7yLm', 80, 50, NULL, b'0'),
(12, 'albert', 'albert@ucm.es', '$2y$10$XzjBGBVoJYc6wCBEOzknWuyrqaSn9f3H6FwMpcYouVWOQV./p10eC', 100, 0, NULL, b'0'),
(13, 'albertu', 'alb@ucm.es', '$2y$10$yrPbJqNGeYz328eegCXlYOcPihUTT.XcSQOpcAjhI4no9IOBhy5TS', 100, 0, NULL, b'0'),
(14, 'georgi', 'georgi@example.org', '$2y$10$9FSY815YcF4wrxX36bcBKObBsXZ3O6JbgUSFdHryKX2x527fXR5YC', 100, 0, NULL, b'0');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `consumibles`
--
ALTER TABLE `consumibles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `enemigo`
--
ALTER TABLE `enemigo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `inventariopartida`
--
ALTER TABLE `inventariopartida`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mapas`
--
ALTER TABLE `mapas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mazmorras`
--
ALTER TABLE `mazmorras`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `objetosusados`
--
ALTER TABLE `objetosusados`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `idPartida` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
