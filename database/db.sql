-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2020 a las 23:08:54
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `geo-extension`
--
CREATE DATABASE IF NOT EXISTS `geo-extension` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `geo-extension`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `unidad_academica` varchar(200) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_proyecto`
--

CREATE TABLE `autor_proyecto` (
  `id_proyecto` varchar(20) NOT NULL,
  `id_autor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convocatoria`
--

CREATE TABLE `convocatoria` (
  `id` int(11) NOT NULL,
  `titulo_convocatoria` varchar(1000) NOT NULL,
  `fuente` varchar(1000) NOT NULL,
  `dirigido_a` text NOT NULL,
  `beneficios` text NOT NULL,
  `enlace_externo` varchar(1500) NOT NULL,
  `fecha_de_cierre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `georreferencia`
--

CREATE TABLE `georreferencia` (
  `id` int(11) NOT NULL,
  `codigo_proyecto` varchar(20) NOT NULL,
  `latitud` varchar(50) NOT NULL,
  `longitud` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `georreferencia`
--

INSERT INTO `georreferencia` (`id`, `codigo_proyecto`, `latitud`, `longitud`, `descripcion`) VALUES
(4, '2', '7.899053', '-72.490706', ''),
(5, '3', '7.893855', '-72.498758', ''),
(7, '5', '7.896247', '-72.495626', ''),
(8, '5', '7.906816', '-72.495590', ''),
(19, '4', '7.900402274131236', '-72.49701976776124', 'La castellana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion_aliada`
--

CREATE TABLE `institucion_aliada` (
  `id` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `institucion_aliada`
--

INSERT INTO `institucion_aliada` (`id`, `nombre`, `descripcion`) VALUES
(11, 'ufps', '<p>holaaaaaaaaa</p>\r\n'),
(12, 'colija', '<p>es una instituci&oacute;n</p>\r\n'),
(13, 'col', '<p>kmaskdmkdmwsdkSKSKSKSKSANFK</p>\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion_proyecto`
--

CREATE TABLE `institucion_proyecto` (
  `id_proyecto` varchar(20) NOT NULL,
  `id_institucion` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `institucion_proyecto`
--

INSERT INTO `institucion_proyecto` (`id_proyecto`, `id_institucion`) VALUES
('4', 12),
('1', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_extension`
--

CREATE TABLE `proyecto_extension` (
  `codigo_proyecto` varchar(20) NOT NULL,
  `nombre_proyecto` varchar(500) NOT NULL,
  `programa_academico` varchar(200) NOT NULL,
  `num_convenio` varchar(20) NOT NULL,
  `grupo_investigacion` varchar(200) NOT NULL,
  `meses_duracion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `descripcion` text NOT NULL,
  `poblacion` varchar(300) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `correo_contacto` varchar(100) NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyecto_extension`
--

INSERT INTO `proyecto_extension` (`codigo_proyecto`, `nombre_proyecto`, `programa_academico`, `num_convenio`, `grupo_investigacion`, `meses_duracion`, `fecha_inicio`, `descripcion`, `poblacion`, `estado`, `correo_contacto`, `fecha_fin`) VALUES
('1', 'PROYECTO ALIANZA PARA LA EDUCACIÓN SUPERIOR RURAL DEL CATATUMBO', 'Ingeniería Civil', 'kskskssksk', '--', 12, '2019-03-12', '<p>Se crea a partir de una iniciativa generada por el Gobernador del Departamento, el Ingeniero William Villamizar Laguado, en donde logra articular a las Instituciones de Educaci&oacute;n Superior P&uacute;blicas del Departamento: La Universidad Francisco de Paula Santander Sede C&uacute;cuta y Oca&ntilde;a, Instituto Superior de Educaci&oacute;n Rural, Escuela Superior de Administraci&oacute;n P&uacute;blica y la Universidad de Pamplona. Del cual se definieron los municipios objeto del proyecto: <strong>Tib&uacute;, Teorama, Sardinata, San Calixto, Hacar&iacute;, El Tarra, El Carmen y Convenci&oacute;n.</strong></p>\r\n\r\n<p><strong>El Objetivo del proyecto</strong> implementar estrategias de educaci&oacute;n superior en el marco del posacuerdo que promuevan el desarrollo rural en el programa de desarrollo con enfoque territorial (PDET) en la regi&oacute;n del Catatumbo con la Universidad Francisco de Paula Santander <strong>(Convenio 1367 del 2017).</strong></p>\r\n\r\n<p>En el marco de la alianza se han ejecutado los siguientes procesos:</p>\r\n\r\n<p><img src=\"https://lh3.googleusercontent.com/v_kbfa7Zagw3J6pAiPzG88hXyBKTYZlIaxzrNVUCOBh4_LDcpKd7rp9a351Eru0LAsLdfSKmHZvG36bdZMFEWqircUB67tl2dLn4wvpuCce97hCY8GDBFBt_WVwZIU4oMOvMX6dcost5N-G8t7vSwPU\" style=\"height:425px; width:495px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Convenios firmados con las Alcald&iacute;as de los municipios de: San Calixto, Convenci&oacute;n, El Carmen, Sardinata, Teorama, El Tarra, Hacar&iacute; y Tib&uacute;.</li>\r\n	<li>Cursos y/o diplomados de certificaci&oacute;n por competencias para el reconocimiento de saberes previos desarrollados en cada uno de los municipios objeto del proyecto por cada una de las Instituciones de Educaci&oacute;n Superior; para un total de 462 personas certificadas.</li>\r\n	<li>Construcci&oacute;n de un documento-Libro &ldquo;<strong>Estudio de pertinencia&rdquo;</strong> para definir la oferta acad&eacute;mica de Educaci&oacute;n Superior Rural de los 8 Municipios de la Regi&oacute;n del Catatumbo.</li>\r\n	<li>Desarrollo de un curso de nivelaci&oacute;n de competencias para educaci&oacute;n superior, como prueba piloto en el Colegio Nuestra Se&ntilde;ora de las Mercedes del municipio de Sardinata dirigido a estudiantes de grados 10&ordm; y 11&ordm;, mediante un aplicativo digital.</li>\r\n	<li>Proyecto de <strong>Fortalecimiento productivo </strong>en la l&iacute;nea de transformaci&oacute;n&nbsp;productiva denominado ``<strong>Gira empresarial agroindustrial</strong>`` como apoyo a los cl&uacute;ster y cadenas productivas de la regi&oacute;n del Catatumbo, instruyendo y certificando a <strong>104</strong> personas en los 8 municipios objeto del proyecto.</li>\r\n	<li>Proyecto &ldquo;<strong>Fase 1 de Talleres de Fortalecimiento en la l&iacute;nea de Asociatividad Sostenible</strong> con &eacute;nfasis en Cl&uacute;ster y cadenas productivas para la regi&oacute;n del Catatumbo en los municipios objeto (El Tarra, Convenci&oacute;n, Hacar&iacute;, El Carmen, San Calixto y Teorama)&rdquo;, instruyendo y certificando a <strong>168</strong> personas en los municipios objeto del proyecto.</li>\r\n	<li>Gira Artesanal, Agroindustrial y Empresarial en donde se convocar&aacute;n a las asociaciones atendidas y orientadas en el marco de los procesos de asociatividad llevado a cabo mediante los cursos y/o diplomados, as&iacute; como los proyectos de fortalecimiento productivo.</li>\r\n	<li>La Universidad Francisco de Paula Santander Seccional C&uacute;cuta est&aacute; ejecutando su entrega final de los Proyectos de Fortalecimiento de los sistemas de producci&oacute;n agr&iacute;cola y agroindustrial en la Regi&oacute;n del Catatumbo para los cultivos de yuca dulce, lim&oacute;n pajarito y pl&aacute;tano, identificando la viabilidad en la producci&oacute;n del aceite de ricino y los sistemas de producci&oacute;n de cacao con potencial de grano fino de aroma para la comercializaci&oacute;n.</li>\r\n</ul>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>No se encontraron entradas de tabla de contenido.</p>\r\n\r\n<p>Es producto del valioso ejercicio de articulaci&oacute;n de los observatorios miembros del Nodo Norte de Santander, mismo que gracias a la asistencia t&eacute;cnica de la Consejer&iacute;a Presidencial para los Derechos Humanos, el Ministerio del Interior, la Unidad para la Atenci&oacute;n y Reparaci&oacute;n Integral a las V&iacute;ctimas y la Oficina del Alto Comisionado para los Derechos Humanos, ha podido consolidar un proceso de fortalecimiento y trabajo conjunto a favor de los ejercicios de observaci&oacute;n realizado a la situaci&oacute;n de los derechos humanos en el departamento.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>El Nodo de Observatorios de Norte de Santander, es una instancia encargada de monitorear, analizar, registrar y construir informaci&oacute;n, de manera sistem&aacute;tica, contable, oportuna y veraz sobre la violaci&oacute;n a los Derechos Humanos e infracciones al Derecho Internacional Humanitario, para la toma de decisiones, construcci&oacute;n de Pol&iacute;ticas P&uacute;blicas Regionales y el dise&ntilde;o de programas y estrategias orientadas al goce efectivo de derechos encaminadas al desarrollo y la construcci&oacute;n colectiva de la paz en el territorio.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Observatorio de Orden P&uacute;blico, Social y Pol&iacute;tico -OSPNS Gobernaci&oacute;n de Norte de Santander.</li>\r\n	<li>Observatorio Universidad Francisco de Paula Santander para la paz, el conflicto y el desarrollo social &ndash; UFPS</li>\r\n	<li>Observatorio Socio-econ&oacute;mico Regional de la Frontera &ndash; Universidad de Pamplona</li>\r\n	<li>Observatorio del Agua de la Universidad Francisco de Paula Santander &ndash; UFPS</li>\r\n	<li>Observatorio Integral de Paz y DD HH para la regi&oacute;n del Catatumbo &ndash; Asopersoneros</li>\r\n	<li>Observatorio en Comercio Internacional y Fronteras de la Universidad Francisco de Paula Santander &ndash; UFPS</li>\r\n	<li>Observatorio Econ&oacute;mico de la C&aacute;mara de Comercio de C&uacute;cuta.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para el presente a&ntilde;o se relaciona a continuaci&oacute;n la tabla de participaci&oacute;n de cada uno de los observatorios que integran el Nodo Norte de Santander</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" style=\"border-collapse:collapse; width:665px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p><strong>Nombre Observatorio</strong></p>\r\n			</td>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">\r\n			<p><strong>Entidad o</strong></p>\r\n\r\n			<p><strong>Instituci&oacute;n</strong></p>\r\n			</td>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">\r\n			<p><strong>Nombre del</strong></p>\r\n\r\n			<p><strong>Representante</strong></p>\r\n			</td>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p><strong>Miembros</strong></p>\r\n\r\n			<p><strong>del Nodo</strong></p>\r\n			</td>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">\r\n			<p><strong>% de</strong></p>\r\n\r\n			<p><strong>Participaci&oacute;n</strong></p>\r\n			</td>\r\n			<td style=\"background-color:#943734; border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">\r\n			<p><strong>Recursos</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio del Orden P&uacute;blico, Social y Pol&iacute;tico del Norte de</p>\r\n\r\n			<p>Santander</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">&nbsp;\r\n			<p>Gobernaci&oacute;n del norte de Santander</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Fabi&aacute;n Josu&eacute; Meridiano</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>L&iacute;der Nodo N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>28%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">\r\n			<p>Especie y &nbsp; Apoyo</p>\r\n\r\n			<p>T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio en Comercio Internacional y de</p>\r\n\r\n			<p>Frontera</p>\r\n			</td>\r\n			<td rowspan=\"3\" style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">&nbsp;\r\n			<p>Universidad Francisco de Paula Santander</p>\r\n\r\n			<p>C&uacute;cuta</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Nathalie Claire Raynaud</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Secretar&iacute;a Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>25%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">\r\n			<p>Especie y &nbsp; Apoyo</p>\r\n\r\n			<p>T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio H&iacute;drico de Norte de</p>\r\n\r\n			<p>Santander</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">\r\n			<p>Wilhelm Camargo J&aacute;uregui</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">&nbsp;\r\n			<p>6%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio para la paz el conflicto y el</p>\r\n\r\n			<p>desarrollo social</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">\r\n			<p>Kelly Johana Villamizar</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">&nbsp;\r\n			<p>5%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">&nbsp;\r\n			<p>Observatorio Laboral y Econ&oacute;mico</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">\r\n			<p>Universidad Francisco de Paula Santander</p>\r\n\r\n			<p>Oca&ntilde;a</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Carlos Alberto Pacheco</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>3%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">&nbsp;\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio integral de paz y derechos humanos de la regi&oacute;n</p>\r\n\r\n			<p>del Catatumbo</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">\r\n			<p>Asociaci&oacute;n de personeros del Catatumbo</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Alba Luz Trigoz</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>13%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">&nbsp;\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio Socioecon&oacute;mico Regional de la</p>\r\n\r\n			<p>Frontera</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">&nbsp;\r\n			<p>Universidad de Pamplona</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Ebran Angarita Garz&oacute;n</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>10%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">&nbsp;\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio del Delito del &Aacute;rea Metropolitana de</p>\r\n\r\n			<p>C&uacute;cuta</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">&nbsp;\r\n			<p>Polic&iacute;a Nacional</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">&nbsp;\r\n			<p>Jos&eacute; Leonardo Vega Carrascal</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>5%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">&nbsp;\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:136px\">\r\n			<p>Observatorio del</p>\r\n\r\n			<p>Delito de Norte de Santander</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:121px\">&nbsp;\r\n			<p>Polic&iacute;a Nacional</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:130px\">\r\n			<p>Linda Mayerli Ch&iacute;a Bot&iacute;a</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:87px\">\r\n			<p>Participante Nodo</p>\r\n\r\n			<p>N de S</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:101px\">&nbsp;\r\n			<p>5%</p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; vertical-align:top; width:90px\">\r\n			<p>Apoyo T&eacute;cnico</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Tabla 1. Tabla de &iacute;ndices de participaci&oacute;n de los observatorios del Nodo Norte de Santander</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-03-12'),
('2', 'Observatorio Universidad Francisco de Paula Santander para la paz, el conflicto y el desarrollo social – UFPS', '--', '--', '--', 12, '2019-01-01', '<p>Es una unidad de investigaci&oacute;n acad&eacute;mica que monitorea, analiza, registra y construye informaci&oacute;n con el fin de generar conocimiento de insumo para la toma de decisiones en materia social, sobre el conflicto, el posconflicto y la generaci&oacute;n de una cultura de paz, configur&aacute;ndose como una plataforma de divulgaci&oacute;n dela producci&oacute;n acad&eacute;mica de las l&iacute;neas de investigaci&oacute;n, as&iacute; como un espacio para la configuraci&oacute;n de procesos de formaci&oacute;n y desarrollo de experiencias por la paz.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Secretaria T&eacute;cnica del Nodo</strong></p>\r\n\r\n<p><strong>Observatorio del Agua de la Universidad Francisco de Paula Santander &ndash; UFPS</strong></p>\r\n\r\n<p>Es una herramienta tecnol&oacute;gica dise&ntilde;ada con el fin de posibilitar la consulta de informaci&oacute;n y datos, v&iacute;a Internet, referentes a la gesti&oacute;n del recurso h&iacute;drico en los 40 municipios del departamento, facilitando de esta forma la toma de decisiones a corto mediano y largo plazo en lo referente al recurso h&iacute;drico en Norte de Santander.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Observatorio en Comercio Internacional y Fronteras de la Universidad Francisco de Paula Santander &ndash; UFPS</strong></p>\r\n\r\n<p>Se especializa en analizar y realizar investigaciones significativas para la ciudad de C&uacute;cuta y la regi&oacute;n de Norte de Santander, enfocadas en el &aacute;rea de Comercio</p>\r\n\r\n<p>Internacional y econom&iacute;a, difundiendo informaci&oacute;n para el apoyo del sector acad&eacute;mico, empresarial y p&uacute;blico general, creando estrategias que permitan el desarrollo</p>\r\n\r\n<p>positivo del comercio internacional de la regi&oacute;n, integrando de este modo la relaci&oacute;n de academia empresa.</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-03-11'),
('3', 'PROYECTO DE COOPERACIÓN PARA EL FORTALECIMIENTO DE POBLACIÓN PROFESIONAL DENTRO DEL PROGRAMA “MI PRIMER EMPLEO', '---', '1075 DEL 2019', '--', 12, '2019-01-01', '<p><strong>Objetivo del proyecto </strong>Generar oportunidad de empleo en los reci&eacute;n graduados de las Instituciones de Educaci&oacute;n Superior de la Regi&oacute;n con el fin de fortalecer el desarrollo social, ambiental, econ&oacute;mico e institucional del municipio de San Jos&eacute; de C&uacute;cuta. (<strong>Convenio 1075 del 2019).</strong></p>\r\n\r\n<p>El municipio de San Jos&eacute; de C&uacute;cuta en miras a avanzar en sus planes, proyectos y pol&iacute;ticas acorde a los lineamientos del gobierno nacional en el marco de su Plan de Desarrollo para el cuatrienio (2016-2019) &ldquo;SI SE PUEDE PROGRESAR&rdquo;, bajo el cual ha establecido programas para el desarrollo social, econ&oacute;mico, ambiental e institucional del municipio mediante la generaci&oacute;n de escenarios con desarrollo sostenible en el tiempo mejorando la competitividad y la disminuci&oacute;n de brechas sociales que han afectado a la ciudad fronteriza. En ese sentido, la Alcald&iacute;a Municipal, aunando esfuerzos interinstitucionales con la Academia en pro del desarrollo y asistencia hacia las comunidades vulnerables, decide crear el fondo para dar la primera oportunidad de empleo a los reci&eacute;n egresados de las Instituciones de Educaci&oacute;n Superior de la Regi&oacute;n, en donde se identifique al profesional graduado de la regi&oacute;n como part&iacute;cipe del progreso del municipio y de sus habitantes relacionado a las din&aacute;micas y dimensiones previamente establecidas en el Plan de Desarrollo Municipal.</p>\r\n\r\n<ul>\r\n	<li>Crear oportunidades de trabajo orientado a la poblaci&oacute;n profesional reci&eacute;n egresada en el marco de un proceso de convocatoria de oferta laboral que permita la selecci&oacute;n del mismo acorde a las necesidades del proyecto y las dimensiones de impacto establecidas.</li>\r\n	<li>Generar un entorno laboral propicio para el desarrollo personal y profesional del joven acorde a sus l&iacute;neas de trabajo y el direccionamiento proyectado para cada una de las fases.</li>\r\n	<li>Participar en los procesos de acompa&ntilde;amiento y monitoreo en la zona urbana y rural del municipio de San Jos&eacute; de C&uacute;cuta identificando necesidades en las diferentes tem&aacute;ticas sociales, ambientales, econ&oacute;micas y estructurando propuestas de infraestructura y emprendimiento en las zonas de impacto de la Ciudad.</li>\r\n</ul>\r\n\r\n<p>El proyecto se orient&oacute; a la generaci&oacute;n de empleo de los graduados profesionales que siguiendo una serie de requisitos previos no presentaran una experiencia profesional respecto a su &aacute;rea y perfil laboral, por ello el proyecto incentiv&oacute; la postulaci&oacute;n mediante una plataforma online a la cual accedieron 1.530 personas y de las cuales se escogieron 60.</p>\r\n\r\n<p>A la fecha, los 60 profesionales est&aacute;n laborando en distintas &aacute;reas de la alcald&iacute;a y en grupos de investigaci&oacute;n de la instituci&oacute;n promoviendo el desarrollo de planes, programas y proyectos que est&aacute;n enmarcados en el Plan de Desarrollo Municipal 2016-2019 &ldquo;S&Iacute; SE PUEDE PROGRESAR&rdquo;, as&iacute; mismo, evaluando necesidades y proyectando mecanismos de acci&oacute;n en diversos campos y &aacute;reas de la ciudad.</p>\r\n\r\n<p><strong>Ejes establecidos</strong>:</p>\r\n\r\n<ul>\r\n	<li>Infraestructura e ingenier&iacute;as</li>\r\n	<li>Desarrollo y promoci&oacute;n social</li>\r\n	<li>Medio Ambiente&nbsp;</li>\r\n	<li>Emprendimiento</li>\r\n</ul>\r\n\r\n<p>As&iacute; mismo se realizar&aacute; la entrega de un informe final consolidado del trabajo ejecutado en cada una de las dimensiones asociado a su vez al desarrollo en tiempo de los objetivos planteados y los resultados esperados en el marco del convenio, evidenciando el impacto obtenido y su proyecci&oacute;n en tiempo.</p>\r\n\r\n<ol>\r\n	<li><strong>Rol de la Universidad</strong></li>\r\n</ol>\r\n\r\n<p>La Universidad Francisco de Paula Santander mediante la Vicerrector&iacute;a Asistente de Investigaci&oacute;n y Extensi&oacute;n asume el papel de coordinador del presente proyecto como parte fundamental de los ejes misionales de la Instituci&oacute;n y direccionado mediante los ejes estrat&eacute;gicos de la misma en busca de la proyecci&oacute;n social de las comunidades a trav&eacute;s del enfoque Academia-Comunidad-Gobierno.</p>\r\n\r\n<ol>\r\n	<li><strong>Impacto generado</strong></li>\r\n</ol>\r\n\r\n<p>El proyecto impulsa la generaci&oacute;n del primer empleo profesional, en ese sentido busca afrontar desde un primer plano la problem&aacute;tica de desempleo en la Ciudad, al tiempo que asume un papel retador e involucra a los nuevos profesionales en diversas &aacute;reas con el fin de apostar al desarrollo de la Ciudad en proyectos urbanos y rurales (de extensi&oacute;n e investigaci&oacute;n) en el marco del Plan de Desarrollo Municipal 2016-2019.</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-03-11'),
('4', 'PROYECTO PLAN DE ENERGIZACIÓN RURAL SOSTENIBLE NORTE DE SANTANDER “PERS NS” ', '--', '--', '--', 12, '2019-01-01', '<p>El Plan de Energizaci&oacute;n Rural Sostenible fundamentalmente busca identificar, formular, estructurar lineamientos y estrategias de desarrollo energ&eacute;tico rural, as&iacute; como un banco inicial de proyectos integrales y sostenibles de suministro y aprovechamiento de energ&iacute;a para las zonas no interconectadas del departamento.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>El&nbsp; PERS N de S ha sido estructurado a partir de una caracterizaci&oacute;n socioecon&oacute;mica y energ&eacute;tica regional, que incluye aspectos relevantes en relaci&oacute;n con la productividad potencial que la energizaci&oacute;n rural permitir&aacute; desarrollar; formulando una pol&iacute;tica p&uacute;blica en donde se definen lineamientos y estrategias de desarrollo, y la identificaci&oacute;n de un banco inicial de proyectos de energizaci&oacute;n sostenibles para un per&iacute;odo de 15 a&ntilde;os, donde no solamente el fin sea llegar con servicio de energ&iacute;a el&eacute;ctrica a las zonas aisladas, sino tambi&eacute;n apoyo al crecimiento y el desarrollo de las comunidades rurales.</p>\r\n\r\n<p>Los planes de energizaci&oacute;n rural sostenible son iniciativas que buscan identificar, formular y estructurar proyectos, lineamientos y estrategias de desarrollo energ&eacute;tico para comunidades rurales, como estrategia para dinamizar el desarrollo social, econ&oacute;mico y ambiental de las regiones, partiendo del an&aacute;lisis de los elementos regionales relevantes en materia de emprendimiento y productividad.</p>\r\n\r\n<p>Formular el Plan de Energizaci&oacute;n Rural Sostenible para el Departamento Norte de Santander, es la oportunidad de identificar: 1) La forma como atendemos nuestras necesidades de energ&iacute;a el&eacute;ctrica como servicio p&uacute;blico domiciliario esencial, 2) Cu&aacute;l es la cobertura del mismo a nivel urbano y rural, y 3) Con base en la demanda actual y teniendo como objetivo de alcanzar una cobertura del 100%, proyectar la demanda de energ&iacute;a y dise&ntilde;ar una hoja de ruta que permita proponer estrategias articulables en materia de pol&iacute;tica p&uacute;blica, planes, programas y proyectos de sustento energ&eacute;tico que relacionen la productividad, el desarrollo empresarial y la calidad de vida de las comunidades de la Regi&oacute;n, especialmente aquellas ubicadas en zonas rurales dispersas.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La ley 1715 de 2014 tiene por objeto promover el desarrollo y la utilizaci&oacute;n de las fuentes no convencionales de energ&iacute;a, principalmente aquellas de car&aacute;cter renovable en el sistema energ&eacute;tico nacional, mediante su integraci&oacute;n al mercado el&eacute;ctrico, su participaci&oacute;n en las zonas no interconectadas y en otros usos energ&eacute;ticos como medio necesario para el desarrollo econ&oacute;mico sostenible, la reducci&oacute;n de emisiones de gases de efecto invernadero y la seguridad del abastecimiento energ&eacute;tico.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><strong>Objetivos del PERS&nbsp;</strong></li>\r\n</ol>\r\n\r\n<p><strong>Objetivo general</strong></p>\r\n\r\n<p>Determinar la oferta energ&eacute;tica actual y futura para el departamento Norte de Santander, de acuerdo con la informaci&oacute;n secundaria de consumos de los recursos utilizados por el usuario final y los resultados del PERS N DE S.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><strong>Objetivos espec&iacute;ficos</strong></li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Caracterizar la oferta energ&eacute;tica del Departamento Norte de Santander, a partir del recurso h&iacute;drico.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Determinar la oferta energ&eacute;tica e&oacute;lica del Departamento Norte de Santander.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Estimar para el Departamento Norte de Santander el potencial energ&eacute;tico a partir de biomasa.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Calcular el potencial energ&eacute;tico solar fotovoltaico para el Departamento Norte de Santander.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Definir la oferta de energ&iacute;a el&eacute;ctrica del Departamento Norte de Santander.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li><strong>Resultados y an&aacute;lisis de resultados</strong></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Teniendo en cuenta los reportes de las diferentes fuentes secundarias consultadas, con respecto al &aacute;rea de cultivo establecida y la cantidad de producto en toneladas/a&ntilde;o, se seleccionaron seis (6) cultivos: pl&aacute;tano, ca&ntilde;a panelera, palma de aceite, arroz, caf&eacute;, y cacao (este &uacute;ltimo, incluido debido a su participaci&oacute;n en los programas de sustituci&oacute;n de cultivos il&iacute;citos), y una actividad pecuaria (producci&oacute;n de ganado bovino), como las principales fuentes de biomasa residual en Norte de Santander. Con base en la informaci&oacute;n de las fuentes de producci&oacute;n de biomasa residual seleccionadas, se estimaron los valores de los par&aacute;metros de caracterizaci&oacute;n fisicoqu&iacute;mica de cada subproducto.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La caracterizaci&oacute;n fisicoqu&iacute;mica de la biomasa aport&oacute; los datos necesarios para la aplicaci&oacute;n de los modelos matem&aacute;ticos que permitieron calcular el potencial energ&eacute;tico por municipio, en Terajulios (TJ)/a&ntilde;o (como unidad de medida energ&eacute;tica est&aacute;ndar, de acuerdo con las fuentes bibliogr&aacute;ficas consultadas). As&iacute; mismo, se determin&oacute; la densidad de potencial energ&eacute;tico en Terajulios/hect&aacute;rea (TJ/ha), teniendo en cuenta el &aacute;rea de producci&oacute;n establecida para cada actividad seleccionada. Como resultado de este an&aacute;lisis se generaron los mapas departamentales de oferta de densidad de potencial energ&eacute;tico para cada actividad seleccionada.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La caracterizaci&oacute;n fisicoqu&iacute;mica de la biomasa tambi&eacute;n permiti&oacute; clasificar los subproductos de acuerdo con su contenido de humedad. Sabiendo que el poder calor&iacute;fico inferior de los materiales var&iacute;a con el contenido de humedad, esta constituye uno de los par&aacute;metros m&aacute;s representativos de la calidad de la biomasa (Romero, 2010). Teniendo en cuenta lo anterior, se cuantific&oacute; la oferta energ&eacute;tica en Kilovatios hora (KWh)/a&ntilde;o, mediante la aplicaci&oacute;n de modelos matem&aacute;ticos que describen la conversi&oacute;n energ&eacute;tica de la biomasa v&iacute;a gasificaci&oacute;n (bajo contenido de humedad) y v&iacute;a digesti&oacute;n anaerobia (alto contenido de humedad).</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-03-12'),
('5', 'PROYECTO: CÚCUTA EMPRENDE 2019 ', '--', '--', '--', 12, '2019-01-02', '<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong><img src=\"https://lh5.googleusercontent.com/tSKUeEw9bGOleN_XxnfOV8FTkLETeJkMmv_PlkvOdoPI9mSDExfBapYiM6fIXQ3ZGcSA0UwvJPjLgBBIj_uE_Qr-KsIUXrdxi9SwJJMg__9SD_oEpiV1Nft7P5CxymeMMj7ZQmOv_tODRFgYkCUEKQg\" style=\"height:200px; width:356px\" /></strong></p>\r\n\r\n<p>Imagen 1. Capacitaci&oacute;n Modulo de emprendimiento</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Este proyecto tuvo como objeto Formar emprendedores integrales y capacitar microempresarios con el fin de capitalizarlos para fomentar la productividad en el Municipio de San Jos&eacute; de C&uacute;cuta.</p>\r\n\r\n<p>La Alcald&iacute;a&nbsp; Municipal de San Jos&eacute; de C&uacute;cuta en su&nbsp; plan de desarrollo municipal 2016-2019, &ldquo;SI SE PUEDE PROGRESAR&rdquo; para el MUNICIPIO en el que se estableci&oacute; como visi&oacute;n, &ldquo;el dise&ntilde;o, estructuraci&oacute;n y ejecuci&oacute;n de proyectos que generen en la ciudad la generaci&oacute;n de empleo, desarrollo social, calidad de vida y sostenibilidad, (&hellip;)&rdquo;, la administraci&oacute;n municipal liderará a trav&eacute;s de la participaci&oacute;n ciudadana y la inversi&oacute;n p&uacute;blica, el cumplimiento de derechos y deberes de los habitantes de la ciudad con &eacute;nfasis en lo social, la competitividad y la generaci&oacute;n de condiciones para el desarrollo econ&oacute;mico y social de la regi&oacute;n y en la descripci&oacute;n de las dimensiones se establecen como objetivos del desarrollo sostenible econ&oacute;mico abarcar estrategias encaminadas a emprender oportunidades de empleo digno, mejorando la productividad y competitividad, involucrando otros sectores y como una meta del Plan de Desarrollo, disminuir la tasa de desempleo de mujeres entre 18 y 60 a&ntilde;os en la zona urbana y rural del municipio, a su vez, fomentar el emprendimiento en j&oacute;venes para la creaci&oacute;n de su propia empresa y fortaleciendo Microempresas de la Poblaci&oacute;n Desplazada y V&iacute;ctimas de la Violencia, de la misma manera, facilitar el empoderamiento de la mujer en los distintos niveles del poder local y empresarial, de igual manera apoyando al sector empresarial en el logro de los objetivos de emprendimiento y sostenibilidad de los proyectos, que en la dimensi&oacute;n econ&oacute;mica, en su sector de promoci&oacute;n del desarrollo, empleo y turismo, se establece que, se requiere gestionar l&iacute;neas de cr&eacute;dito para la creaci&oacute;n y fortalecimiento de nuevos emprendimientos, que garanticen e incentiven a la poblaci&oacute;n econ&oacute;micamente activa a la generaci&oacute;n de nuevas empresas en la Ciudad a trav&eacute;s del Banco del Progreso del Municipio de San Jos&eacute; de C&uacute;cuta y La Universidad Francisco de Paula Santander en su radio de acci&oacute;n buscara en constituirse en un factor determinante en el desarrollo regional y nacional mediante su integraci&oacute;n con el sector productivo, trabajar por la creaci&oacute;n, el desarrollo y la transmisi&oacute;n del conocimiento en todas sus formas y expresiones y promover su utilizaci&oacute;n en todos los campos para solucionar las necesidades regionales y del pa&iacute;s, prestar a la comunidad un servicio con calidad, el cual hace referencia a los resultados acad&eacute;micos, a los medios y procesos empleados, a la infraestructura institucional, a las dimensiones cualitativas y cuantitativas del mismo y a las condiciones en que se desarrolla la instituci&oacute;n y propiciar la integraci&oacute;n de la Universidad Francisco de Paula Santander con otros sectores e instituciones, en los campos econ&oacute;mico, social y cultural a nivel regional, nacional e internacional y realizar actividades de extensi&oacute;n, cient&iacute;ficas y culturales y de servicio a la comunidad, para el cumplimiento de su misi&oacute;n social por tal motivo la universidad tiene la disponibilidad de recursos humanos, f&iacute;sicos y tecnol&oacute;gicos pertinentes para llevar a cabo la capacitaci&oacute;n de aproximadamente 2500 personas que se beneficiaran con el programa, cuenta con un espacio suficiente para albergar a m&aacute;s de dos mil personas para llevar a cabo la inscripci&oacute;n masiva de la convocatoria y de la misma manera cuenta con los docentes y&nbsp; la infraestructura f&iacute;sica necesaria para realizar las capacitaciones de m&aacute;s de 2500 personas en auditorios y salones con los respetivos elementos did&aacute;cticos y pupitres individuales tipo escolar con la respectiva superficie para apoyar las gu&iacute;as de aprendizaje actividades que se realizaran a trav&eacute;s de la Vicerrector&iacute;a Asistente de Investigaci&oacute;n y Extensi&oacute;n</p>\r\n\r\n<ol>\r\n	<li><strong>Rol de la Universidad</strong></li>\r\n</ol>\r\n\r\n<p>La Universidad es el operador del convenio, encargada de toda la contrataci&oacute;n de personal requerido, de papeler&iacute;a, cartillas y refrigerios, de suministrar los espacios f&iacute;sicos adecuados para desarrollar las diferentes actividades acad&eacute;micas que se programen y de realizar la adquisici&oacute;n de los activos que se van a entregar a los emprendedores seleccionados por medio de procesos de licitaci&oacute;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><strong>Impacto</strong></li>\r\n</ol>\r\n\r\n<p>El impacto ha sido muy positivo hasta el momento, personas sin ning&uacute;n apoyo para empezar con su idea de negocio, todos ellos con el conocimiento necesario pero sin los medios econ&oacute;micos y otras personas que necesitan de una ayuda para fortalecer su peque&ntilde;a unidad productiva fueron seleccionados para recibir una ayuda de capitalizaci&oacute;n en activos fijos dependiendo de su idea de negocio y adem&aacute;s recibir una capacitaci&oacute;n te&oacute;rica &ndash; practica que los ayude a mejorar sus habilidades administrativas,&nbsp; muchas de estas personas conocieron la universidad por primera vez, recibieron su capacitaci&oacute;n te&oacute;rico - pr&aacute;ctica para el correcto manejo de su idea de emprendimiento o fortalecimiento de su unidad productiva con el fin que con el apoyo que van a recibir su negocio se mantenga y se fortalezca con el tiempo para ayudar a disminuir los &iacute;ndices de desempleo y pobreza en la ciudad.</p>\r\n\r\n<ol>\r\n	<li><strong>Entidades participantes</strong></li>\r\n</ol>\r\n\r\n<p>la Alcald&iacute;a Municipal de San Jos&eacute; de C&uacute;cuta a trav&eacute;s de la Secretaria del Banco del Progreso y la Universidad Francisco de Paula Santander a trav&eacute;s de la Vicerrector&iacute;a Asistente de Investigaci&oacute;n y Extensi&oacute;n.</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-01-31'),
('6', 'CONVENIO INTERADMINISTRATIVO ENTRE LA UNIVERSIDAD FRANCISCO DE PAULA SANTANDER UFPS Y LA CORPORACIÓN AUTONOMA REGIONAL DE LA FRONTERA NORORIENTAL – CORPONOR', '--', '--', '--', 12, '2019-02-03', '<p>El presente convenio el cual inicia el 28 de marzo del 2019 y tiene fecha de terminaci&oacute;n del 28 de noviembre del 2019 tiene como objeto aunar esfuerzos para la elaboraci&oacute;n de los estudios y dise&ntilde;os obras para la construcci&oacute;n del sistema de tratamiento (INTERCEPTOR &ndash; EMISARIO &ndash; PLANTA DE TRATAMIENTO DE AGUAS RESIDUALES &ndash; PTAR).</p>\r\n\r\n<p>Mediante la ejecuci&oacute;n del presente convenio se pretende priorizar de entre los municipios ubicados en la cuenca del r&iacute;o Zulia, para la elaboraci&oacute;n de los estudios y dise&ntilde;os necesarios para la construcci&oacute;n de los sistemas de tratamiento de sus aguas residuales.</p>\r\n\r\n<ol>\r\n	<li><strong>Rol de la Universidad</strong></li>\r\n</ol>\r\n\r\n<p>La UFPS es la encargada de la coordinaci&oacute;n y ejecuci&oacute;n del proyecto, aportando toda su capacidad t&eacute;cnico-cient&iacute;fica para en conjunto con la Corporaci&oacute;n Aut&oacute;noma de la frontera Nororiental &ndash; CORPONOR, ofrecer los estudios y dise&ntilde;os que permitan solucionar las problem&aacute;ticas de saneamiento b&aacute;sico y las presiones generadas sobre el R&iacute;o Zulia.</p>\r\n\r\n<ol>\r\n	<li><strong>Impacto que genera este proyecto</strong></li>\r\n</ol>\r\n\r\n<p>Son varios los impactos derivados de este proyecto, dentro de los cuales se destacan:&nbsp;</p>\r\n\r\n<p>1)&nbsp;&nbsp;&nbsp; Soluciones de saneamiento para el(los) municipio(s) priorizado(s)</p>\r\n\r\n<p>2)&nbsp;&nbsp;&nbsp; Aporte en la disminuci&oacute;n de cargas contaminantes sobre las fuentes h&iacute;dricas dentro de la cuenca del R&iacute;o Zulia</p>\r\n\r\n<p>3)&nbsp;&nbsp;&nbsp; Generaci&oacute;n de l&iacute;nea base y hoja de ruta para los dem&aacute;s municipios (no priorizados) con el objetivo de posteriormente replicar este tipo de proyectos.</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-11-28'),
('7', 'DESARROLLO DE CAPACIDADES DE LA UFPS PARA LA CONSTRUCCIÓN Y COMUNICACIÓN DE LA MEMORIA HISTÓRICA A TRAVÉS DE LAS TIC CON JÓVENES Y PARA JÓVENES EN TIBÚ, EL ZULIA Y PUERTO SANTANDER.', '--', '--', '--', 0, '2018-10-12', '<p>El presente proyecto que inici&oacute; el 1 de octubre del 2018 y con fecha de terminaci&oacute;n del 30 de septiembre del 2019, tiene como objetivo fortalecer las capacidades de la UFPS para implementaci&oacute;n de herramientas de investigaci&oacute;n y de comunicaci&oacute;n de la memoria hist&oacute;rica del Departamento a trav&eacute;s de las TIC que contribuyan a la estructuraci&oacute;n de un modelo de abordaje desde la academia con y para los j&oacute;venes.&nbsp;&nbsp;</p>\r\n\r\n<p><strong>1.1 Objetivos espec&iacute;ficos</strong></p>\r\n\r\n<p>1.&nbsp;&nbsp;&nbsp; Desarrollar capacidades para reconstruir y comunicar la memoria hist&oacute;rica, individual y colectiva, con un enfoque interdisciplinar.&nbsp;</p>\r\n\r\n<p>2.&nbsp;&nbsp;&nbsp; Dise&ntilde;ar y apropiar metodolog&iacute;as para la reconstrucci&oacute;n y comunicaci&oacute;n de memoria hist&oacute;rica en Norte de Santander.&nbsp;</p>\r\n\r\n<p>3.&nbsp;&nbsp;&nbsp; Contar con insumos documentales y audiovisuales que den cuenta del proceso de reconstrucci&oacute;n que se ha realizado.&nbsp;</p>\r\n\r\n<p>4.&nbsp;&nbsp;&nbsp; Generar espacios de reflexi&oacute;n y aprendizaje a partir de las experiencias de reconstrucci&oacute;n de memoria hist&oacute;rica sobre metodolog&iacute;as y herramientas utilizadas por las diferentes entidades involucradas en el proyecto.</p>\r\n\r\n<p>Esta proyecto tiene tres l&iacute;neas de trabajo: primera, la recuperaci&oacute;n de la memoria hist&oacute;rica en Puerto Santander, Tib&uacute; y El Zulia; la segunda l&iacute;nea es la reducci&oacute;n de la brecha digital con el uso y apropiaci&oacute;n de los puntos Vive Digital que hay instalados en los municipios y que se constituyen en espacios claves para el desarrollo de habilidades tecnol&oacute;gicas de los j&oacute;venes que necesitan insertarse en un mundo globalizado; la tercera l&iacute;nea de acci&oacute;n es la comunicaci&oacute;n de esta memoria hist&oacute;rica a partir de las TIC, que comprende tambi&eacute;n el acompa&ntilde;amiento t&eacute;cnico a la Mesa de Memoria Hist&oacute;rica del Departamento, para fortalecer el uso y apropiaci&oacute;n desde lo local de la Plataforma Virtual del CIP, como un espacio de encuentro e intercambio de experiencias y experticias en memoria hist&oacute;rica que cuenta con este anal de comunicaci&oacute;n.</p>\r\n\r\n<p><strong>1.2 Rol de la Universidad</strong></p>\r\n\r\n<p>La UFPS ejecuta administrativa y t&eacute;cnicamente el proyecto, a trav&eacute;s del FRIE y del Grupo de Investigaci&oacute;n en Comunicaci&oacute;n y Medios, GICOM. La coordinaci&oacute;n est&aacute; a cargo de la docente investigadora Gladys Adriana Espinel, y en su ejecuci&oacute;n participaron, adem&aacute;s, dos docentes de c&aacute;tedra de la Universidad, dos graduadas del programa de Comunicaci&oacute;n Social, dos practicantes de Trabajo Social y una de Ingenier&iacute;a de Sistemas, as&iacute; como tres funcionarios en cargos acad&eacute;micos- administrativos.</p>\r\n\r\n<p><strong>1.3 Impacto que genera el proyecto</strong></p>\r\n\r\n<p>1.&nbsp;&nbsp;&nbsp; Construcci&oacute;n de una cultura de paz para la verdad y la no repetici&oacute;n en los municipios.&nbsp;</p>\r\n\r\n<p>2.&nbsp;&nbsp;&nbsp; Dise&ntilde;o y validaci&oacute;n de una metodolog&iacute;a regional para la construcci&oacute;n de memoria hist&oacute;rica con y para j&oacute;venes a trav&eacute;s de las TIC.&nbsp;</p>\r\n\r\n<p>3.&nbsp;&nbsp;&nbsp; Formaci&oacute;n en construcci&oacute;n y comunicaci&oacute;n de la memoria a 60 adolescentes y j&oacute;venes de Tib&uacute;, El Zulia y Puerto Santander.&nbsp;</p>\r\n\r\n<p>4.&nbsp;&nbsp;&nbsp; Desarrollo de la plataforma web del CIP (Centro de Inspiraci&oacute;n para la paz).&nbsp;</p>\r\n\r\n<p>5.&nbsp;&nbsp;&nbsp; Realizaci&oacute;n de 9 cortos documentales sobre memoria hist&oacute;rica del conflicto armado en los tres municipios con temas in&eacute;ditos.</p>\r\n\r\n<p><strong>1.4 Entidades participantes</strong></p>\r\n\r\n<p>La GIZ y su programa PROPAZ como co financiadores a trav&eacute;s de un contrato de subsidio local, la Secretar&iacute;a de V&iacute;ctimas y Posconflicto del Departamento, la Secretar&iacute;a de las TIC del Departamento, Tres colegios y sus puntos Vive Digital y la Mesa Departamental de Memoria Hist&oacute;rica</p>\r\n', '--', 'en_ejecucion', 'universidad_ufps@ufps.edu.co', '2019-09-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('-XdlhD0D0Y8Br8iBmvNlRd8Icvid3GAJ', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('1G83L5s1xa3Wmmvy8Jc6H_zruW2Qlwhz', 1583596169, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('1oxOe6XAE_iUwTbvyhXHi2fjrXUk_oWL', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('271i9qvNjds7JPTXiv6RBZNSVRomGNiE', 1583596230, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('2Sgecqzz5g62HZ_rkNjCSC65DRAi-MDs', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('6G1LQf2m3hU8hl62WaqmMY4fraI98m_W', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('6uZLkT7c0QnQHvPD9rQaQyXxepGpkRFy', 1583596231, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('8ihX096dMDibdU5nK_W4Y-1ZhfUucagO', 1583424654, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('AEIO3oEtFuck3M0tj3cpboucbmS-WJQE', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('BbX10bMQTaeDOG3XdcC832jYn0UygDXB', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('ByBukkxesXXVjWMkxlWqjiRc8qDBoysA', 1583450873, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('EChZwz5yFa6vd0LuzfNxjSTIUIlM296k', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('Eo8WssH8XUv8uW5bEA9eNegEilYY1phX', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('EyJHe_eySwPAiX8j1zJlIGkMcjyDUzlz', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('FtxPI3Rmhf_d2TOdUJtxfj-kjhFRcTDL', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('HONcxv-sRPOoPfEnhwsCJr0kcyXygmoD', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('IXmzX-CLg-NifX6_TJlGcnCTiEQg3AaP', 1583596231, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('Ix5grQODW9mw9Zt3HY7m4y-xS_wl4Ah-', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('Le16CuItSwRWbNMHWKIPMC21pIUSvWyd', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('LylLajMGWYiYaKb-449QwYscHyUQ_Q5b', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('R8Udo0Aqrjn2YBKRryaUm89tHY-RiFn3', 1583596230, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('RrCFQYU9XtlEudqVfjdYYhf50P9OH0_J', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('SxPkbII1l5JGEnjZEIavUdoIrxTlJedH', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('TOOlDbEIDkmPtpSiK9nyPZiuemcr0aYc', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('WF5gHf29kYjm1WFBlMuTswYm490wAH_O', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('WfxkDYjj388b3mkA5R4USpI7B8WHpxjh', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('XG9UEmWUItaC2Fw--lq7JKVvCBge24AU', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('_wjL1ulH5spolvfYX5SntQwRTbTY_kQM', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('bFYCi_bWBMFn1LWGwdPNB8T_XcIoBmuE', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('bMEpjVlO-24OHwzb6HuyPj-nl0dupKbv', 1583450870, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bO47vkVSd6VSl1HcKg6-l3CN228R_Ewo', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('bu2uwKo-vKLodWo3B2rdBI3L6R4DgqL-', 1583450817, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"authenticate\":\"yes\",\"passport\":{\"user\":\"oficina_extension\"}}'),
('jq4JT8qUa3xqOmFTXSDZ5GAkI_XPGGxt', 1583450873, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('k538L8ZsfABLcn9dPFW7sowkKe0HCoQy', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('l7E6C3uC0YPLLIusUeDI179eGc5GlAyv', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('mU-VRNAsC6w4H-SrbfHNs7hHrIpFa6Vb', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('nkQ0ZwdsYCC59KVTe-3YxoGQ2PcJjVsc', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('o8qtxbSVYrPuM4eF6bcnRTjj5iTh7ciE', 1583424656, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('pRncMnlvmNKT4vwVMyBxCgnKyzdEZtEO', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('q3-3G-OFrp2si1aI0MzJkr36ZEx4xBW4', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('to10PkOWgiCvgpJsxkH0Z2DBVztydmu6', 1583450873, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('twrHaBjHhv3IxmjfrFIXO71DReSg_w4F', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('v8MJXoHymGJv1mCrPd-EV5hnGg3qs34k', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('wBlp695Zv2MUHq6RW0TjoPuRwjMMlGSZ', 1583596229, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('xQtsKDRSAYgK_NFdm_LKFttXaseIGASo', 1583450872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('zDcLC7RrwkMiS4-aO-jSpW6DFbMgeeS5', 1583424655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_admin`
--

CREATE TABLE `usuario_admin` (
  `id` varchar(20) NOT NULL,
  `nombre_admin` varchar(150) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasenia` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_admin`
--

INSERT INTO `usuario_admin` (`id`, `nombre_admin`, `correo`, `contrasenia`) VALUES
('01', 'oficina_extension', 'extension_ufps@ufps.edu.co', '$2y$10$GkYXy2mr3DQ4AmHzXmNqeuVSIjjJNigZj9PN2bB29GULgjclj8qry');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `autor_proyecto`
--
ALTER TABLE `autor_proyecto`
  ADD PRIMARY KEY (`id_proyecto`,`id_autor`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Indices de la tabla `convocatoria`
--
ALTER TABLE `convocatoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `georreferencia`
--
ALTER TABLE `georreferencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_proyecto` (`codigo_proyecto`);

--
-- Indices de la tabla `institucion_aliada`
--
ALTER TABLE `institucion_aliada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `institucion_proyecto`
--
ALTER TABLE `institucion_proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `institucion_proyecto_ibfk_3` (`id_institucion`);

--
-- Indices de la tabla `proyecto_extension`
--
ALTER TABLE `proyecto_extension`
  ADD PRIMARY KEY (`codigo_proyecto`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuario_admin`
--
ALTER TABLE `usuario_admin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `convocatoria`
--
ALTER TABLE `convocatoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `georreferencia`
--
ALTER TABLE `georreferencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `institucion_aliada`
--
ALTER TABLE `institucion_aliada`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor_proyecto`
--
ALTER TABLE `autor_proyecto`
  ADD CONSTRAINT `autor_proyecto_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto_extension` (`codigo_proyecto`),
  ADD CONSTRAINT `autor_proyecto_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`);

--
-- Filtros para la tabla `georreferencia`
--
ALTER TABLE `georreferencia`
  ADD CONSTRAINT `georreferencia_ibfk_1` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyecto_extension` (`codigo_proyecto`);

--
-- Filtros para la tabla `institucion_proyecto`
--
ALTER TABLE `institucion_proyecto`
  ADD CONSTRAINT `institucion_proyecto_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto_extension` (`codigo_proyecto`),
  ADD CONSTRAINT `institucion_proyecto_ibfk_3` FOREIGN KEY (`id_institucion`) REFERENCES `institucion_aliada` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
