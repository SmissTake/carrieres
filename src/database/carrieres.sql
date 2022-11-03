-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 03 nov. 2022 à 18:36
-- Version du serveur : 10.6.7-MariaDB-2ubuntu1.1
-- Version de PHP : 8.1.2-1ubuntu2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `carrieres`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `street` varchar(39) DEFAULT NULL,
  `complement` varchar(39) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `town` varchar(39) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `complement`, `zipcode`, `town`) VALUES
(1, 'Rue de Paris', NULL, '35000', 'Rennes'),
(2, 'Route de Pont-l\'Abbé', NULL, '29000', 'Quimper');

-- --------------------------------------------------------

--
-- Structure de la table `concessions`
--

CREATE TABLE `concessions` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `siret` char(12) NOT NULL,
  `license` varchar(512) NOT NULL,
  `phone` char(10) DEFAULT NULL,
  `adressesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `concessions`
--

INSERT INTO `concessions` (`id`, `name`, `siret`, `license`, `phone`, `adressesId`) VALUES
(1, 'Concession 1', '123568941000', 'Licence 1 exemple', '0211245121', 1),
(2, 'Concession 2', '223568941000', 'Licence 2 exemple', '0239493829', 2);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `lastname` varchar(39) NOT NULL,
  `firstname` varchar(39) DEFAULT NULL,
  `mail` varchar(150) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `concessionsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `lastname`, `firstname`, `mail`, `phone`, `concessionsId`) VALUES
(1, 'Bernard', 'Jean', 'jean.bernard@mail.com', '0211245121', 1),
(2, 'Arthur', 'Michel', 'michel.arthur@mail.com', '0239493829', 2),
(3, 'Baboub', 'Bibab', 'bibabbaboub@boub.com', '0211245121', 1);

-- --------------------------------------------------------

--
-- Structure de la table `equipments`
--

CREATE TABLE `equipments` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `width` decimal(5,3) DEFAULT NULL,
  `length` decimal(5,3) DEFAULT NULL,
  `height` decimal(5,3) DEFAULT NULL,
  `using_for` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `equipments_mines`
--

CREATE TABLE `equipments_mines` (
  `minesId` int(11) NOT NULL,
  `equipmentsId` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `firings`
--

CREATE TABLE `firings` (
  `id` int(11) NOT NULL,
  `horodatage` datetime NOT NULL,
  `explosive` varchar(50) DEFAULT NULL,
  `tnt_power` smallint(6) NOT NULL,
  `sound` smallint(6) NOT NULL,
  `longitude` decimal(15,12) NOT NULL,
  `latitude` decimal(15,12) NOT NULL,
  `altitude` decimal(5,3) NOT NULL,
  `minesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `impacts`
--

CREATE TABLE `impacts` (
  `id` int(11) NOT NULL,
  `ecosystem` enum('faune','flore','eau') NOT NULL,
  `horodatage` date NOT NULL,
  `quality` int(11) NOT NULL,
  `minesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `mines`
--

CREATE TABLE `mines` (
  `id` int(11) NOT NULL,
  `name` varchar(39) NOT NULL,
  `longitude` decimal(15,12) NOT NULL,
  `latitude` decimal(15,12) NOT NULL,
  `concessionsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mines`
--

INSERT INTO `mines` (`id`, `name`, `longitude`, `latitude`, `concessionsId`) VALUES
(1, 'Mine 1', '43.000000000000', '21.000000000000', 1),
(2, 'Mine 2', '52.000000000000', '32.000000000000', 2),
(5, 'Mine 122', '29.000000000000', '39.000000000000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `role`) VALUES
(1, 'Editeur'),
(2, 'Administrateur'),
(3, 'Membre');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(39) DEFAULT NULL,
  `mail` varchar(150) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `idPermissions` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `lastname`, `firstname`, `mail`, `password`, `idPermissions`) VALUES
(1, 'Tanguy', 'Gwion', 'gwion.tanguy@my-digital-school.org', 'admin', 2),
(2, 'tanguydeux', 'gwiondeux', 'gwion.tanguy+2@my-digital-school.org', '$2b$14$3icfJw6WiA7nQhwM9r6AGuXSVr0FQeSAvlAkubV4J9brmxgQW4yjC', 3),
(3, 'Tanguy', 'gwiondeux', 'gwiontanguy+2@mail.com', '$2b$14$dcasBcmChMwp2Q3hXwsS9e7AUrOunRDfYMYbgm.4qixyM0Cz.JAxu', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `concessions`
--
ALTER TABLE `concessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adressesId` (`adressesId`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `concessionsId` (`concessionsId`);

--
-- Index pour la table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `equipments_mines`
--
ALTER TABLE `equipments_mines`
  ADD PRIMARY KEY (`minesId`,`equipmentsId`),
  ADD KEY `equipmentsId` (`equipmentsId`);

--
-- Index pour la table `firings`
--
ALTER TABLE `firings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `minesId` (`minesId`);

--
-- Index pour la table `impacts`
--
ALTER TABLE `impacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `minesId` (`minesId`);

--
-- Index pour la table `mines`
--
ALTER TABLE `mines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `concessionsId` (`concessionsId`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `idPermissions` (`idPermissions`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `concessions`
--
ALTER TABLE `concessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `firings`
--
ALTER TABLE `firings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `impacts`
--
ALTER TABLE `impacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mines`
--
ALTER TABLE `mines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `concessions`
--
ALTER TABLE `concessions`
  ADD CONSTRAINT `concessions_ibfk_1` FOREIGN KEY (`adressesId`) REFERENCES `addresses` (`id`);

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`concessionsId`) REFERENCES `concessions` (`id`);

--
-- Contraintes pour la table `equipments_mines`
--
ALTER TABLE `equipments_mines`
  ADD CONSTRAINT `equipments_mines_ibfk_1` FOREIGN KEY (`minesId`) REFERENCES `mines` (`id`),
  ADD CONSTRAINT `equipments_mines_ibfk_2` FOREIGN KEY (`equipmentsId`) REFERENCES `equipments` (`id`);

--
-- Contraintes pour la table `firings`
--
ALTER TABLE `firings`
  ADD CONSTRAINT `firings_ibfk_1` FOREIGN KEY (`minesId`) REFERENCES `mines` (`id`);

--
-- Contraintes pour la table `impacts`
--
ALTER TABLE `impacts`
  ADD CONSTRAINT `impacts_ibfk_1` FOREIGN KEY (`minesId`) REFERENCES `mines` (`id`);

--
-- Contraintes pour la table `mines`
--
ALTER TABLE `mines`
  ADD CONSTRAINT `mines_ibfk_1` FOREIGN KEY (`concessionsId`) REFERENCES `concessions` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idPermissions`) REFERENCES `permissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
