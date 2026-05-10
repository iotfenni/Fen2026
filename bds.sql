-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 09 mai 2026 à 10:37
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bds`
--

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `idDoc` varchar(5) NOT NULL,
  `nomDoc` varchar(50) DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`idDoc`, `nomDoc`, `dateCreation`) VALUES
('DOC01', 'Rapport Annuel 2023', '2023-12-01 10:00:00'),
('DOC02', 'Cahier des Charges', '2024-01-15 14:30:00'),
('DOC03', 'Notes de Réunion', '2024-02-10 09:15:00');

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE `droit` (
  `idDoc` varchar(5) NOT NULL,
  `idUtil` varchar(4) NOT NULL,
  `ecriture` char(1) NOT NULL CHECK (`ecriture` in ('O','N')),
  `lecture` char(1) NOT NULL CHECK (`lecture` in ('O','N')),
  `impression` char(1) NOT NULL CHECK (`impression` in ('O','N'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `droit`
--

INSERT INTO `droit` (`idDoc`, `idUtil`, `ecriture`, `lecture`, `impression`) VALUES
('DOC01', 'U001', 'O', 'O', 'O'),
('DOC01', 'U002', 'N', 'O', 'N'),
('DOC02', 'U002', 'O', 'O', 'N'),
('DOC03', 'U003', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtil` varchar(4) NOT NULL,
  `nomPrenom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtil`, `nomPrenom`) VALUES
('U001', 'Alice Martin'),
('U002', 'Bob Durand'),
('U003', 'Charlie Lemoine');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`idDoc`);

--
-- Index pour la table `droit`
--
ALTER TABLE `droit`
  ADD PRIMARY KEY (`idDoc`,`idUtil`),
  ADD KEY `idUtil` (`idUtil`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtil`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `droit`
--
ALTER TABLE `droit`
  ADD CONSTRAINT `droit_ibfk_1` FOREIGN KEY (`idDoc`) REFERENCES `document` (`idDoc`),
  ADD CONSTRAINT `droit_ibfk_2` FOREIGN KEY (`idUtil`) REFERENCES `utilisateur` (`idUtil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
