-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ux
CREATE DATABASE IF NOT EXISTS `ux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ux`;

-- Volcando estructura para tabla ux.catalogo
CREATE TABLE IF NOT EXISTS `catalogo` (
  `id_ca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ux.catalogo: ~4 rows (aproximadamente)
INSERT INTO `catalogo` (`id_ca`, `nombre`) VALUES
	(1, 'Dark Souls'),
	(2, 'Dark Souls 2'),
	(3, 'Dark Souls 3'),
	(4, 'Elden Ring');

-- Volcando estructura para tabla ux.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_coment` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_com` varchar(500) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_pub` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_coment`),
  KEY `User` (`id_user`),
  KEY `publi` (`id_pub`),
  CONSTRAINT `User` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `publi` FOREIGN KEY (`id_pub`) REFERENCES `publicaciones` (`id_publi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ux.comentario: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ux.publicaciones
CREATE TABLE IF NOT EXISTS `publicaciones` (
  `id_publi` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(500) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_publi`),
  KEY `Usuario` (`id_user`),
  KEY `catalogo` (`id_cat`),
  CONSTRAINT `Usuario` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `catalogo` FOREIGN KEY (`id_cat`) REFERENCES `catalogo` (`id_ca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ux.publicaciones: ~11 rows (aproximadamente)
INSERT INTO `publicaciones` (`id_publi`, `contenido`, `id_user`, `id_cat`) VALUES
	(1, 'Hola', 1, 1),
	(2, 'Ya me quiero ir a dormir son las 4:25 ', 1, 1),
	(3, 'Listo ya esta funcionando todo', 1, 1),
	(6, '60% de avance', 1, 1),
	(7, 'Prueba 1 ds 2', 1, 2),
	(8, 'Prueba 2 ds 2', 1, 2),
	(9, 'Todo funcionando ', 1, 3),
	(11, 'Prueba ER', 1, 4),
	(12, 'Publicacion', 1, 1),
	(13, '3', 1, 2),
	(14, 'Holaaaa', 1, 4),
	(15, 'Quejas o sugerencia ', 1, 3),
	(16, 'Publicaciones ', 1, 4);

-- Volcando estructura para tabla ux.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ux.usuario: ~0 rows (aproximadamente)
INSERT INTO `usuario` (`id_user`, `usuario`, `contraseña`) VALUES
	(1, 'bry_617', 'bry_617');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
