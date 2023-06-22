-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 jun 2023 om 15:17
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `endtoets`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dier`
--

CREATE TABLE `dier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dier`
--

INSERT INTO `dier` (`id`, `user_id`, `name`, `description`) VALUES
(1, 3, 'Olifant', 'de olifant is een groot grijs dier'),
(2, 4, 'Giraf ', 'Giraf is erg lang'),
(3, 5, 'Krokodil', 'een groen dier');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230622085717', '2023-06-22 10:57:31', 91),
('DoctrineMigrations\\Version20230622100344', '2023-06-22 12:04:40', 78),
('DoctrineMigrations\\Version20230622122828', '2023-06-22 14:28:36', 145);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `logginname` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `logginname`, `roles`, `password`, `fname`, `part`) VALUES
(2, 'ahmad', '[\"ROLE_ADMIN\"]', '$2y$13$GfMzD78tZdSzW.2A0oKwC.DWfPEpjigh3PJzfXX1sGPta21b9InxC', 'Ahmad', NULL),
(3, 'pleun', '[\"ROLE_ADMIN\"]', '$2y$13$GfMzD78tZdSzW.2A0oKwC.DWfPEpjigh3PJzfXX1sGPta21b9InxC', 'pleun', 'PleunDieren'),
(4, 'Harun', '[\"ROLE_ADMIN\"]', '$2y$13$GfMzD78tZdSzW.2A0oKwC.DWfPEpjigh3PJzfXX1sGPta21b9InxC', 'Harun', 'Het deel va Harun'),
(5, 'Sanne', '[\"ROLE_ADMIN\"]', '$2y$13$GfMzD78tZdSzW.2A0oKwC.DWfPEpjigh3PJzfXX1sGPta21b9InxC', 'Sanne', 'Sannetje'),
(6, 'Alex', '[\"ROLE_MEMBER\"]', '$2y$13$GfMzD78tZdSzW.2A0oKwC.DWfPEpjigh3PJzfXX1sGPta21b9InxC', 'Alex', '');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `dier`
--
ALTER TABLE `dier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7487C015A76ED395` (`user_id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649492A2F90` (`logginname`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `dier`
--
ALTER TABLE `dier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `dier`
--
ALTER TABLE `dier`
  ADD CONSTRAINT `FK_7487C015A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
