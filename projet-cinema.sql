-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 15 mars 2024 à 03:35
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
-- Base de données : `projet-cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `cinéma`
--

CREATE TABLE `cinéma` (
  `idCinema` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nombreSalles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cinéma`
--

INSERT INTO `cinéma` (`idCinema`, `nom`, `adresse`, `nombreSalles`) VALUES
(1, 'Cinéville', '123 rue de Paris', 5),
(2, 'GrandScreen', '45 Avenue de l’Écran, Cité', 8);

-- --------------------------------------------------------

--
-- Structure de la table `cinémautilisateur`
--

CREATE TABLE `cinémautilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `nomUtilisateur` varchar(255) DEFAULT NULL,
  `motDePasse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `prenom`, `email`, `telephone`) VALUES
(0, 'S????7??~??', NULL, '?pȒf???g@<?__???????}Ln0', '74ߌ92?????q??'),
(1, 'Doe', 'John', 'john.doe@example.com', '0123456789');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `idFilm` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `durée` int(11) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `réalisateur` varchar(255) DEFAULT NULL,
  `dateSortie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idFilm`, `titre`, `durée`, `genre`, `réalisateur`, `dateSortie`) VALUES
(1, 'Le grand voyage', 120, 'Aventure', 'Jean Dupont', '2023-01-01'),
(2, 'La Comédie de Paris', 110, 'Comédie', 'Marie Dubois', '2023-11-20');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idPaiement` int(11) NOT NULL,
  `idReservation` int(11) DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `datePaiement` date DEFAULT NULL,
  `methode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`idPaiement`, `idReservation`, `montant`, `datePaiement`, `methode`) VALUES
(1, 1, 18.4, '2023-03-15', 'Carte');

-- --------------------------------------------------------

--
-- Structure de la table `réservation`
--

CREATE TABLE `réservation` (
  `idReservation` int(11) NOT NULL,
  `idSeance` int(11) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `idTarif` int(11) DEFAULT NULL,
  `nombrePlaces` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `réservation`
--

INSERT INTO `réservation` (`idReservation`, `idSeance`, `idClient`, `idTarif`, `nombrePlaces`) VALUES
(1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `idSalle` int(11) NOT NULL,
  `capacite` int(11) DEFAULT NULL,
  `equipements` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`idSalle`, `capacite`, `equipements`) VALUES
(1, 200, 'Son Dolby'),
(2, 200, '4K'),
(3, 120, 'IMAX');

-- --------------------------------------------------------

--
-- Structure de la table `scéance`
--

CREATE TABLE `scéance` (
  `idSeance` int(11) NOT NULL,
  `idCinema` int(11) DEFAULT NULL,
  `heure` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `idFilm` int(11) DEFAULT NULL,
  `idSalle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `scéance`
--

INSERT INTO `scéance` (`idSeance`, `idCinema`, `heure`, `date`, `idFilm`, `idSalle`) VALUES
(1, 1, '19:00:00', '2023-03-15', 1, 1),
(2, 2, '20:00:00', '2024-03-20', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `idTarif` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `montant` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`idTarif`, `description`, `montant`) VALUES
(1, 'Plein tarif', 9.2),
(2, 'Plein tarif', 9.2),
(3, 'Étudiant', 7.6),
(4, 'Moins de 14 ans', 5.9);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cinéma`
--
ALTER TABLE `cinéma`
  ADD PRIMARY KEY (`idCinema`);

--
-- Index pour la table `cinémautilisateur`
--
ALTER TABLE `cinémautilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idFilm`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPaiement`),
  ADD KEY `idReservation` (`idReservation`);

--
-- Index pour la table `réservation`
--
ALTER TABLE `réservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idSeance` (`idSeance`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idTarif` (`idTarif`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`idSalle`);

--
-- Index pour la table `scéance`
--
ALTER TABLE `scéance`
  ADD PRIMARY KEY (`idSeance`),
  ADD KEY `idCinema` (`idCinema`),
  ADD KEY `idFilm` (`idFilm`),
  ADD KEY `idSalle` (`idSalle`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`idTarif`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `réservation` (`idReservation`);

--
-- Contraintes pour la table `réservation`
--
ALTER TABLE `réservation`
  ADD CONSTRAINT `réservation_ibfk_1` FOREIGN KEY (`idSeance`) REFERENCES `scéance` (`idSeance`),
  ADD CONSTRAINT `réservation_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `réservation_ibfk_3` FOREIGN KEY (`idTarif`) REFERENCES `tarif` (`idTarif`);

--
-- Contraintes pour la table `scéance`
--
ALTER TABLE `scéance`
  ADD CONSTRAINT `scéance_ibfk_1` FOREIGN KEY (`idCinema`) REFERENCES `cinéma` (`idCinema`),
  ADD CONSTRAINT `scéance_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  ADD CONSTRAINT `scéance_ibfk_3` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
