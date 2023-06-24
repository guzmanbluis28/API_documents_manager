-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-06-2023 a las 20:54:56
-- Versión del servidor: 8.0.33-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `innclod`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DOC_DOCUMENTO`
--

CREATE TABLE `DOC_DOCUMENTO` (
  `DOC_ID` int NOT NULL,
  `DOC_NOMBRE` varchar(60) DEFAULT NULL,
  `DOC_CODIGO` varchar(20) DEFAULT NULL,
  `DOC_CONTENIDO` varchar(4000) DEFAULT NULL,
  `DOC_ID_TIPO` int DEFAULT NULL,
  `DOC_ID_PROCESO` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `DOC_DOCUMENTO`
--

INSERT INTO `DOC_DOCUMENTO` (`DOC_ID`, `DOC_NOMBRE`, `DOC_CODIGO`, `DOC_CONTENIDO`, `DOC_ID_TIPO`, `DOC_ID_PROCESO`, `created_at`, `updated_at`) VALUES
(7, 'AQUI OTRO DOC', 'FOR-FIN-2', 'Y MAS TEXTO PARA LA PRUEBA', 3, 3, '2023-06-23 10:36:35', '2023-06-23 10:36:35'),
(8, 'DOC OTRA VEZ NUEVO', 'FOR-LOG-2', 'oTRO DOC NUEVO', 3, 5, '2023-06-23 23:33:43', '2023-06-23 23:33:43'),
(9, 'formulario', 'FOR-FIN-3', 'otro doc de finanzas', 3, 3, '2023-06-23 23:34:30', '2023-06-23 23:34:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_21_185635_add_timestamps_to_doc_documento', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 2, 'user_token', 'd3e6e17a81a75de259db1c5c904f5a396762c5aeb7ae650ea62460bdeae203d9', '[\"*\"]', NULL, NULL, '2023-06-22 03:23:21', '2023-06-22 03:23:21'),
(4, 'App\\Models\\User', 2, 'user_token', '18f9b08542cbac967b4198ff10817eeb9e2f05d514b9c471062c8daa6ba9d279', '[\"*\"]', NULL, NULL, '2023-06-22 22:57:32', '2023-06-22 22:57:32'),
(5, 'App\\Models\\User', 2, 'user_token', '818549910598c3c0f7760069f613e19c95146757492aa621f7cb390866dd1341', '[\"*\"]', NULL, NULL, '2023-06-22 22:58:13', '2023-06-22 22:58:13'),
(6, 'App\\Models\\User', 2, 'user_token', '579d04a8e601968f4bba779d889ef2448b9e3b63c0baafdca11829f593cb409f', '[\"*\"]', NULL, NULL, '2023-06-23 03:05:01', '2023-06-23 03:05:01'),
(7, 'App\\Models\\User', 2, 'user_token', 'd4dec0584a41e042dfa0765d255a6cb15e3262c417be030062336b11b3532ee8', '[\"*\"]', NULL, NULL, '2023-06-23 03:07:16', '2023-06-23 03:07:16'),
(8, 'App\\Models\\User', 2, 'user_token', 'e8761ce5e9f467afa90633505f9570e4d1f501a627f423cc4e3296477ace0382', '[\"*\"]', NULL, NULL, '2023-06-23 05:10:30', '2023-06-23 05:10:30'),
(9, 'App\\Models\\User', 2, 'user_token', 'dc9068ddb07855925d57afd3bce8c95c9fb27aea3b51b4fe7100a63a2cb12ad2', '[\"*\"]', NULL, NULL, '2023-06-23 05:17:02', '2023-06-23 05:17:02'),
(10, 'App\\Models\\User', 2, 'user_token', '2142d07a14a9453c61cbaabdc8fa52f82aef8a6916f1eb344e812d370be4f183', '[\"*\"]', NULL, NULL, '2023-06-23 05:18:33', '2023-06-23 05:18:33'),
(11, 'App\\Models\\User', 2, 'user_token', '7e9abee0a670d63b94bfd8be352b1ac4a3b093779166c6e8c2632c6b248f1158', '[\"*\"]', NULL, NULL, '2023-06-23 05:59:37', '2023-06-23 05:59:37'),
(12, 'App\\Models\\User', 2, 'user_token', '2ad8ea104998f95e92adb189a3a7b12d3e5c7d2dc878501938aed33a44ed6d90', '[\"*\"]', NULL, NULL, '2023-06-23 06:06:08', '2023-06-23 06:06:08'),
(13, 'App\\Models\\User', 2, 'user_token', '9b418ffe1ff3e0e45278711ee958d0f7948a40880a9412b2af6c0201dfad44eb', '[\"*\"]', NULL, NULL, '2023-06-23 06:13:03', '2023-06-23 06:13:03'),
(14, 'App\\Models\\User', 2, 'user_token', '1c5d1eaa3f0ec92f0b513e396b0f9189b9dd64ef1f035d036fd3df3306657a93', '[\"*\"]', NULL, NULL, '2023-06-23 06:24:54', '2023-06-23 06:24:54'),
(15, 'App\\Models\\User', 2, 'user_token', 'b1a6e19f778db4660848e3a7c8e9dad004647af0995568ee7992741259dcebb5', '[\"*\"]', NULL, NULL, '2023-06-23 06:30:32', '2023-06-23 06:30:32'),
(16, 'App\\Models\\User', 2, 'user_token', 'df0b06d96775422ccc72a67ff18d100a77636d3122410488f9b41c1f04f82c27', '[\"*\"]', NULL, NULL, '2023-06-23 06:57:33', '2023-06-23 06:57:33'),
(17, 'App\\Models\\User', 2, 'user_token', '5c2d29f036bf1397ecb4da953cc9559ef175e87cd437615da62e6a91d4a08dfe', '[\"*\"]', NULL, NULL, '2023-06-23 06:58:55', '2023-06-23 06:58:55'),
(18, 'App\\Models\\User', 2, 'user_token', 'fcfc3e0b2263fd61a99485eaf0b5c30f73c9141f77ab67bc0863d4faa851208d', '[\"*\"]', NULL, NULL, '2023-06-23 07:05:10', '2023-06-23 07:05:10'),
(19, 'App\\Models\\User', 2, 'user_token', '6d01beb94a5dbd406e8622d222105e4a891d706f846cf3a2ccceb5348cc26a62', '[\"*\"]', NULL, NULL, '2023-06-23 07:14:49', '2023-06-23 07:14:49'),
(20, 'App\\Models\\User', 2, 'user_token', 'fa1c05f393d1f385767cd87a76ce695d25e0cd0bc208c811cd1c41e417c25d61', '[\"*\"]', NULL, NULL, '2023-06-23 07:17:48', '2023-06-23 07:17:48'),
(21, 'App\\Models\\User', 2, 'user_token', 'acc7c448a4b5dbf7c8b0eaf82715dcebfa55a4ce0bf22cb824bf4a0617e85a52', '[\"*\"]', NULL, NULL, '2023-06-23 10:34:38', '2023-06-23 10:34:38'),
(22, 'App\\Models\\User', 2, 'user_token', '2f79069b754639e493fe99514c34e6281c006b7fdb273bb665c45bfe10df366c', '[\"*\"]', NULL, NULL, '2023-06-23 23:29:00', '2023-06-23 23:29:00'),
(23, 'App\\Models\\User', 2, 'user_token', 'a2e33a83b391ca1494df4619b9d2f3a225f394f97c829805bc4510364ab6c901', '[\"*\"]', NULL, NULL, '2023-06-23 23:40:57', '2023-06-23 23:40:57'),
(24, 'App\\Models\\User', 2, 'user_token', '36ff8784ae8461c1ce38b3e2e40d3e3476b371e97466da444e0bba528ac86dd8', '[\"*\"]', NULL, NULL, '2023-06-23 23:43:16', '2023-06-23 23:43:16'),
(25, 'App\\Models\\User', 2, 'user_token', 'e408d6cf28c2ffb6839ecfd093326bac7670d7627da6ca4a8abd64ff33ee6ec1', '[\"*\"]', NULL, NULL, '2023-06-24 01:14:01', '2023-06-24 01:14:01'),
(26, 'App\\Models\\User', 2, 'user_token', 'b74dd06b845ffb3c29adfa597088170aa05754b853efbb77c24737bb04080b41', '[\"*\"]', NULL, NULL, '2023-06-24 01:14:15', '2023-06-24 01:14:15'),
(27, 'App\\Models\\User', 2, 'user_token', 'f3b92c26b4fce31e253d0e0086aa34c0516a605f9e80affd55ce7a4d66810638', '[\"*\"]', NULL, NULL, '2023-06-24 01:20:33', '2023-06-24 01:20:33'),
(28, 'App\\Models\\User', 2, 'user_token', 'ae9134515724e034bbc6115d89f85e3e1e7ca6e1151860a0b879eea2b8ad533c', '[\"*\"]', NULL, NULL, '2023-06-24 04:18:54', '2023-06-24 04:18:54'),
(29, 'App\\Models\\User', 2, 'user_token', '46b06bbdbd3df2be1733de632890e745e7051c9741d67431d238b21a6ea99868', '[\"*\"]', NULL, NULL, '2023-06-24 04:41:10', '2023-06-24 04:41:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRO_PROCESO`
--

CREATE TABLE `PRO_PROCESO` (
  `PRO_ID` int NOT NULL,
  `PRO_PREFIJO` varchar(20) DEFAULT NULL,
  `PRO_NOMBRE` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PRO_PROCESO`
--

INSERT INTO `PRO_PROCESO` (`PRO_ID`, `PRO_PREFIJO`, `PRO_NOMBRE`) VALUES
(1, 'ING', 'Ingeniería'),
(2, 'ADM', 'Administración'),
(3, 'FIN', 'Finanzas'),
(4, 'VEN', 'Ventas'),
(5, 'LOG', 'Logística'),
(6, 'MARK', 'Marketing'),
(7, 'PROD', 'Producción'),
(8, 'RRHH', 'Recursos Humanos'),
(9, 'CAL', 'Calidad'),
(10, 'COM', 'Compras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIP_TIPO_DOC`
--

CREATE TABLE `TIP_TIPO_DOC` (
  `TIP_ID` int NOT NULL,
  `TIP_NOMBRE` varchar(60) DEFAULT NULL,
  `TIP_PREFIJO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `TIP_TIPO_DOC`
--

INSERT INTO `TIP_TIPO_DOC` (`TIP_ID`, `TIP_NOMBRE`, `TIP_PREFIJO`) VALUES
(1, 'Instructivo', 'INS'),
(2, 'Reporte', 'REP'),
(3, 'Formulario', 'FOR'),
(4, 'Contrato', 'CON'),
(5, 'Memorando', 'MEM'),
(6, 'Circular', 'CIR'),
(7, 'Presentación', 'PRE'),
(8, 'Plan', 'PLA'),
(9, 'Informe', 'INF'),
(10, 'Memoria', 'MEMO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Luis', 'guzmanbluis', 'guzmanbluis@gmail.com', NULL, '$2y$10$gsiP2OLtCRIzsmEvtqtbYewQ/9hAurk3XrXF6hMwu0De0/zWEJ4om', 1, NULL, '2023-06-22 03:17:23', '2023-06-22 03:17:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `DOC_DOCUMENTO`
--
ALTER TABLE `DOC_DOCUMENTO`
  ADD PRIMARY KEY (`DOC_ID`),
  ADD KEY `DOC_ID_TIPO` (`DOC_ID_TIPO`),
  ADD KEY `DOC_ID_PROCESO` (`DOC_ID_PROCESO`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `PRO_PROCESO`
--
ALTER TABLE `PRO_PROCESO`
  ADD PRIMARY KEY (`PRO_ID`);

--
-- Indices de la tabla `TIP_TIPO_DOC`
--
ALTER TABLE `TIP_TIPO_DOC`
  ADD PRIMARY KEY (`TIP_ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `DOC_DOCUMENTO`
--
ALTER TABLE `DOC_DOCUMENTO`
  MODIFY `DOC_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `PRO_PROCESO`
--
ALTER TABLE `PRO_PROCESO`
  MODIFY `PRO_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `TIP_TIPO_DOC`
--
ALTER TABLE `TIP_TIPO_DOC`
  MODIFY `TIP_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
