-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 15 sep 2025 om 11:45
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hollowmountain`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `attractie`
--

CREATE TABLE `attractie` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(100) NOT NULL,
  `Locatie` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Specificaties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderhoudschema`
--

CREATE TABLE `onderhoudschema` (
  `ID` int(11) NOT NULL,
  `AttractieID` int(11) DEFAULT NULL,
  `TaakID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderhoudstaak`
--

CREATE TABLE `onderhoudstaak` (
  `ID` int(11) NOT NULL,
  `AttractieID` int(11) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Opmerkingen` text DEFAULT NULL,
  `PersoneelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personeel`
--

CREATE TABLE `personeel` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(100) NOT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Gebruikersnaam` varchar(50) DEFAULT NULL,
  `Wachtwoord` varchar(255) DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `attractie`
--
ALTER TABLE `attractie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `onderhoudschema`
--
ALTER TABLE `onderhoudschema`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AttractieID` (`AttractieID`),
  ADD KEY `TaakID` (`TaakID`);

--
-- Indexen voor tabel `onderhoudstaak`
--
ALTER TABLE `onderhoudstaak`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AttractieID` (`AttractieID`),
  ADD KEY `PersoneelID` (`PersoneelID`);

--
-- Indexen voor tabel `personeel`
--
ALTER TABLE `personeel`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Gebruikersnaam` (`Gebruikersnaam`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `attractie`
--
ALTER TABLE `attractie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `onderhoudschema`
--
ALTER TABLE `onderhoudschema`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `onderhoudstaak`
--
ALTER TABLE `onderhoudstaak`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `personeel`
--
ALTER TABLE `personeel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `onderhoudschema`
--
ALTER TABLE `onderhoudschema`
  ADD CONSTRAINT `onderhoudschema_ibfk_1` FOREIGN KEY (`AttractieID`) REFERENCES `attractie` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `onderhoudschema_ibfk_2` FOREIGN KEY (`TaakID`) REFERENCES `onderhoudstaak` (`ID`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `onderhoudstaak`
--
ALTER TABLE `onderhoudstaak`
  ADD CONSTRAINT `onderhoudstaak_ibfk_1` FOREIGN KEY (`AttractieID`) REFERENCES `attractie` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `onderhoudstaak_ibfk_2` FOREIGN KEY (`PersoneelID`) REFERENCES `personeel` (`ID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
