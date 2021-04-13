-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2021 a las 22:24:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blockbuster`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compradas`
--

CREATE TABLE `compradas` (
  `id` int(11) NOT NULL,
  `pelicula` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compradas`
--

INSERT INTO `compradas` (`id`, `pelicula`, `usuario`, `fecha`) VALUES
(1, 1, 'ivan00', '2021-02-21 20:43:03');

--
-- Disparadores `compradas`
--
DELIMITER $$
CREATE TRIGGER `compra_pelicula` AFTER INSERT ON `compradas` FOR EACH ROW UPDATE peliculas SET stock = stock - 1 WHERE id = NEW.pelicula
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `director` varchar(60) NOT NULL,
  `fecha` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `genero` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `director`, `fecha`, `precio`, `stock`, `sinopsis`, `genero`) VALUES
(1, 'Mr Nobody', 'Jaco Van Dormael', 2009, '199.00', 9, 'La historia se centra en la vida de Nemo Nobody, quien, en el año 2092, y a la avanzada edad de 118 años, es el último mortal en la Tierra, una vez que la raza humana ha alcanzado ya la cuasiinmortalidad. Nemo, entre los jirones de su envejecida memoria, evoca la separación de sus padres, el recuerdo de sus tres amores principales y las dificultades posteriores que sufrió en sendos instantes cruciales de su vida, sucedidos a la edad de nueve, de quince y de treinta y cuatro años. ', 'Ciencia ficción'),
(2, 'El efecto mariposa', 'Eric Bress\r ', 2004, '120.00', 9, 'Evan Treborn, un joven que se está esforzando por superar unos dolorosos recuerdos de su infancia, descubre una técnica que le permite viajar atrás en el tiempo y ocupar su cuerpo de niño para poder cambiar el curso de su dolorosa historia. Sin embargo también descubre que cualquier mínimo cambio en el pasado altera enormemente su futuro. ', 'Ciencia ficción'),
(3, 'Joker', 'Todd Phillips', 2019, '299.00', 10, 'Arthur Fleck (Phoenix) vive en Gotham con su madre, y su única motivación en la vida es hacer reír a la gente. Actúa haciendo de payaso en pequeños trabajos, pero tiene problemas mentales que hacen que la gente le vea como un bicho raro. Su gran sueño es actuar como cómico delante del público, pero una serie de trágicos acontecimientos le hará ir incrementando su ira contra una sociedad que le ignora.', 'Drama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rentadas`
--

CREATE TABLE `rentadas` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pelicula` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `entregada` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rentadas`
--

INSERT INTO `rentadas` (`id`, `fecha`, `pelicula`, `usuario`, `entregada`) VALUES
(1, '2021-02-21 18:31:36', 2, 'ivan00', '2021-02-21 19:46:19'),
(2, '2021-02-21 18:42:11', 2, 'ivan00', '2021-02-21 19:13:54');

--
-- Disparadores `rentadas`
--
DELIMITER $$
CREATE TRIGGER `regreso_pelicula` AFTER UPDATE ON `rentadas` FOR EACH ROW UPDATE peliculas SET stock = stock + 1 WHERE id = NEW.pelicula
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `renta_pelicula` AFTER INSERT ON `rentadas` FOR EACH ROW UPDATE peliculas SET stock = stock - 1 WHERE id = NEW.pelicula
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `usuario` varchar(30) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`usuario`, `fecha`) VALUES
('ivan00', '2021-02-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `username` varchar(30) NOT NULL,
  `tipo` enum('admin','user','','') NOT NULL DEFAULT 'user',
  `password` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`username`, `tipo`, `password`, `nombre`, `apellidos`, `correo`) VALUES
('ivan00', 'user', 'ivan00', 'Ivan', 'Lopez', 'ivan@mail.com'),
('johann', 'admin', '1234', 'Johann', 'Correa', 'johann123@123.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compradas`
--
ALTER TABLE `compradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelicula` (`pelicula`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rentadas`
--
ALTER TABLE `rentadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelicula` (`pelicula`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compradas`
--
ALTER TABLE `compradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rentadas`
--
ALTER TABLE `rentadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compradas`
--
ALTER TABLE `compradas`
  ADD CONSTRAINT `compradas_ibfk_1` FOREIGN KEY (`pelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compradas_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rentadas`
--
ALTER TABLE `rentadas`
  ADD CONSTRAINT `rentadas_ibfk_1` FOREIGN KEY (`pelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rentadas_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
