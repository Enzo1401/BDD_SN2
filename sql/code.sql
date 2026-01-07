-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 19 nov. 2024 à 14:15
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetDylan`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

CREATE TABLE `absences` (
  `id_absences` int(11) NOT NULL,
  `duree_absence` int(11) DEFAULT NULL,
  `justificatif` tinyint(1) DEFAULT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_instance_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`id_absences`, `duree_absence`, `justificatif`, `id_eleve`, `id_instance_cours`) VALUES
(7, 6, 1, 1, 1),
(8, 15, 0, 2, 2),
(9, 45, 1, 3, 3),
(10, 21, 0, 4, 4),
(11, 31, 1, 5, 5),
(12, 3, 0, 6, 6),
(13, 12, 1, 1, 1),
(14, 34, 0, 2, 2),
(15, 3, 1, 3, 3),
(16, 34, 0, 4, 4),
(17, 11, 1, 5, 5),
(18, 54, 0, 6, 6),
(19, 20, 0, 1, 2),
(20, 3, 1, 2, 3),
(21, 2, 0, 3, 4),
(22, 5, 1, 4, 1),
(23, 4, 0, 5, 6),
(24, 6, 1, 6, 5),
(25, 12, 1, 1, 1),
(26, 34, 0, 2, 2),
(27, 3, 1, 3, 3),
(28, 34, 0, 4, 4),
(29, 11, 1, 5, 5),
(30, 54, 0, 6, 6),
(31, 20, 0, 1, 2),
(32, 3, 1, 2, 3),
(33, 2, 0, 3, 4),
(34, 5, 1, 4, 1),
(35, 4, 0, 5, 6),
(36, 6, 1, 6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id_cours` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `nom`, `niveau`) VALUES
(1, 'Programmation en C', 1),
(2, 'Algèbre Linéaire', 2),
(3, 'Mécanique Quantique', 3),
(4, 'Analyse Chimique', 2),
(5, 'Poésie Française', 1),
(6, 'Génétique Avancée', 4);

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

CREATE TABLE `dossier` (
  `id_dossier` int(11) NOT NULL,
  `info_eleve` text,
  `avrt_travail` tinyint(1) DEFAULT NULL,
  `avrt_comportement` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dossier`
--

INSERT INTO `dossier` (`id_dossier`, `info_eleve`, `avrt_travail`, `avrt_comportement`) VALUES
(1, 'Travail irrégulier', 1, 0),
(2, 'Excellent comportement', 0, 0),
(3, 'Avertissement disciplinaire', 1, 1),
(4, 'Absentéisme fréquent', 1, 1),
(5, 'Participation active', 0, 0),
(6, 'Bons résultats académiques', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `anneeEtude` int(11) DEFAULT NULL,
  `id_dossier` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `nom`, `prenom`, `email`, `age`, `anneeEtude`, `id_dossier`, `id_promo`) VALUES
(1, 'Martin', 'Alice', 'alice.martin@example.com', 19, 1, 1, 1),
(2, 'Bernard', 'Louis', 'louis.bernard@example.com', 20, 2, 2, 2),
(3, 'Dupuis', 'Sarah', 'sarah.dupuis@example.com', 22, 3, 3, 3),
(4, 'Petit', 'Mathieu', 'mathieu.petit@example.com', 18, 1, 4, 1),
(5, 'Lemoine', 'Clara', 'clara.lemoine@example.com', 21, 4, 5, 4),
(6, 'Dumont', 'Lucas', 'lucas.dumont@example.com', 23, 5, 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `grades`
--

CREATE TABLE `grades` (
  `id_grade` int(11) NOT NULL,
  `taux_horaire` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `grades`
--

INSERT INTO `grades` (`id_grade`, `taux_horaire`) VALUES
(1, '20.00'),
(2, '30.00'),
(3, '40.00'),
(4, '100.00');

-- --------------------------------------------------------

--
-- Structure de la table `instance_cours`
--

CREATE TABLE `instance_cours` (
  `id_instance_cours` int(11) NOT NULL,
  `id_profs` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL,
  `date_cours` datetime DEFAULT NULL,
  `duree` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `instance_cours`
--

INSERT INTO `instance_cours` (`id_instance_cours`, `id_profs`, `id_cours`, `date_cours`, `duree`) VALUES
(1, 1, 1, '2024-03-15 09:00:00', 90),
(2, 2, 2, '2024-03-16 11:00:00', 120),
(3, 3, 3, '2024-03-17 14:00:00', 180),
(4, 4, 4, '2024-03-18 10:30:00', 60),
(5, 5, 5, '2024-03-19 13:00:00', 45),
(6, 6, 6, '2024-03-20 15:00:00', 150);

-- --------------------------------------------------------

--
-- Structure de la table `lien_cours_eleve`
--

CREATE TABLE `lien_cours_eleve` (
  `id_eleve` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lien_cours_eleve`
--

INSERT INTO `lien_cours_eleve` (`id_eleve`, `id_cours`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `lien_cours_profs`
--

CREATE TABLE `lien_cours_profs` (
  `id_cours` int(11) NOT NULL,
  `id_profs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lien_cours_profs`
--

INSERT INTO `lien_cours_profs` (`id_cours`, `id_profs`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `lien_instance_cours_eleves`
--

CREATE TABLE `lien_instance_cours_eleves` (
  `id_eleve` int(11) NOT NULL,
  `id_instance_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lien_instance_cours_eleves`
--

INSERT INTO `lien_instance_cours_eleves` (`id_eleve`, `id_instance_cours`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `notation_cours`
--

CREATE TABLE `notation_cours` (
  `id_note_cours` int(11) NOT NULL,
  `note_cours` int(11) DEFAULT NULL,
  `commentaire` varchar(100) DEFAULT NULL,
  `id_instance_cours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notation_cours`
--

INSERT INTO `notation_cours` (`id_note_cours`, `note_cours`, `commentaire`, `id_instance_cours`) VALUES
(1, 15, 'Bon travail', 1),
(2, 12, 'Peut mieux faire', 2),
(3, 18, 'Excellent', 3),
(4, 10, 'Passable', 4),
(5, 8, 'Besoin d amélioration', 5),
(6, 14, 'Assez bien', 6);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id_notes` int(11) NOT NULL,
  `note` decimal(15,2) DEFAULT NULL,
  `id_profs` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id_notes`, `note`, `id_profs`, `id_eleve`, `id_cours`) VALUES
(1, '15.50', 1, 1, 1),
(2, '12.00', 2, 2, 2),
(3, '9.00', 3, 3, 3),
(4, '18.00', 4, 4, 4),
(5, '7.50', 5, 5, 5),
(6, '10.00', 6, 6, 6),
(7, '15.50', 1, 1, 1),
(8, '12.00', 2, 2, 2),
(9, '9.00', 3, 3, 3),
(10, '18.00', 4, 4, 4),
(11, '7.50', 5, 5, 5),
(12, '10.00', 6, 6, 6),
(13, '13.00', 2, 1, 2),
(14, '10.50', 1, 2, 1),
(15, '16.00', 5, 3, 5),
(16, '14.00', 4, 4, 3),
(17, '9.50', 3, 5, 6),
(18, '18.00', 6, 6, 4),
(19, '15.50', 1, 1, 1),
(20, '12.00', 2, 2, 2),
(21, '9.00', 3, 3, 3),
(22, '18.00', 4, 4, 4),
(23, '7.50', 5, 5, 5),
(24, '10.00', 6, 6, 6),
(25, '13.00', 2, 1, 2),
(26, '10.50', 1, 2, 1),
(27, '16.00', 5, 3, 5),
(28, '14.00', 4, 4, 3),
(29, '9.50', 3, 5, 6),
(30, '18.00', 6, 6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `profs`
--

CREATE TABLE `profs` (
  `id_profs` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `idGrade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `profs`
--

INSERT INTO `profs` (`id_profs`, `nom`, `mail`, `age`, `idGrade`) VALUES
(1, 'Jean Dupont', 'j.dupont@example.com', 45, 1),
(2, 'Marie Curie', 'm.curie@example.com', 38, 4),
(3, 'Albert Einstein', 'a.einstein@example.com', 55, 2),
(4, 'Paul Verlaine', 'p.verlaine@example.com', 41, 1),
(5, 'Isaac Newton', 'i.newton@example.com', 60, 3),
(6, 'Sophie Germain', 's.germain@example.com', 35, 2);

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

CREATE TABLE `promo` (
  `id_promo` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `nb_eleves` int(11) DEFAULT NULL,
  `id_specialite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`id_promo`, `nom`, `nb_eleves`, `id_specialite`) VALUES
(1, 'Promo 2023', 30, 1),
(2, 'Promo 2024', 25, 2),
(3, 'Promo 2025', 35, 3),
(4, 'Promo 2026', 40, 4),
(5, 'Promo 2027', 20, 5),
(6, 'Promo 2028', 28, 6);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id_specialite` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `nom`) VALUES
(1, 'Informatique'),
(2, 'Mathématiques'),
(3, 'Physique'),
(4, 'Chimie'),
(5, 'Littérature'),
(6, 'Biologie');

-- --------------------------------------------------------

--
-- Structure de la table `spe_cours`
--

CREATE TABLE `spe_cours` (
  `id_specialite` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `spe_cours`
--

INSERT INTO `spe_cours` (`id_specialite`, `id_cours`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id_absences`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_instance_cours` (`id_instance_cours`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Index pour la table `dossier`
--
ALTER TABLE `dossier`
  ADD PRIMARY KEY (`id_dossier`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`),
  ADD UNIQUE KEY `id_dossier` (`id_dossier`),
  ADD KEY `id_promo` (`id_promo`);

--
-- Index pour la table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id_grade`);

--
-- Index pour la table `instance_cours`
--
ALTER TABLE `instance_cours`
  ADD PRIMARY KEY (`id_instance_cours`),
  ADD KEY `id_profs` (`id_profs`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Index pour la table `lien_cours_eleve`
--
ALTER TABLE `lien_cours_eleve`
  ADD PRIMARY KEY (`id_eleve`,`id_cours`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Index pour la table `lien_cours_profs`
--
ALTER TABLE `lien_cours_profs`
  ADD PRIMARY KEY (`id_cours`,`id_profs`),
  ADD KEY `id_profs` (`id_profs`);

--
-- Index pour la table `lien_instance_cours_eleves`
--
ALTER TABLE `lien_instance_cours_eleves`
  ADD PRIMARY KEY (`id_eleve`,`id_instance_cours`),
  ADD KEY `id_instance_cours` (`id_instance_cours`);

--
-- Index pour la table `notation_cours`
--
ALTER TABLE `notation_cours`
  ADD PRIMARY KEY (`id_note_cours`),
  ADD KEY `id_instance_cours` (`id_instance_cours`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id_notes`),
  ADD KEY `id_profs` (`id_profs`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_cours` (`id_cours`);

--
-- Index pour la table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`id_profs`),
  ADD KEY `fk_grade` (`idGrade`);

--
-- Index pour la table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id_promo`),
  ADD KEY `id_specialite` (`id_specialite`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id_specialite`);

--
-- Index pour la table `spe_cours`
--
ALTER TABLE `spe_cours`
  ADD PRIMARY KEY (`id_specialite`,`id_cours`),
  ADD KEY `id_cours` (`id_cours`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id_absences` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `dossier`
--
ALTER TABLE `dossier`
  MODIFY `id_dossier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `grades`
--
ALTER TABLE `grades`
  MODIFY `id_grade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `instance_cours`
--
ALTER TABLE `instance_cours`
  MODIFY `id_instance_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `notation_cours`
--
ALTER TABLE `notation_cours`
  MODIFY `id_note_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id_notes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `profs`
--
ALTER TABLE `profs`
  MODIFY `id_profs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `promo`
--
ALTER TABLE `promo`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id_specialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `absences_ibfk_2` FOREIGN KEY (`id_instance_cours`) REFERENCES `instance_cours` (`id_instance_cours`);

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`id_dossier`) REFERENCES `dossier` (`id_dossier`),
  ADD CONSTRAINT `eleve_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`);

--
-- Contraintes pour la table `instance_cours`
--
ALTER TABLE `instance_cours`
  ADD CONSTRAINT `instance_cours_ibfk_1` FOREIGN KEY (`id_profs`) REFERENCES `profs` (`id_profs`),
  ADD CONSTRAINT `instance_cours_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `lien_cours_eleve`
--
ALTER TABLE `lien_cours_eleve`
  ADD CONSTRAINT `lien_cours_eleve_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `lien_cours_eleve_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `lien_cours_profs`
--
ALTER TABLE `lien_cours_profs`
  ADD CONSTRAINT `lien_cours_profs_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  ADD CONSTRAINT `lien_cours_profs_ibfk_2` FOREIGN KEY (`id_profs`) REFERENCES `profs` (`id_profs`);

--
-- Contraintes pour la table `lien_instance_cours_eleves`
--
ALTER TABLE `lien_instance_cours_eleves`
  ADD CONSTRAINT `lien_instance_cours_eleves_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `lien_instance_cours_eleves_ibfk_2` FOREIGN KEY (`id_instance_cours`) REFERENCES `instance_cours` (`id_instance_cours`);

--
-- Contraintes pour la table `notation_cours`
--
ALTER TABLE `notation_cours`
  ADD CONSTRAINT `notation_cours_ibfk_1` FOREIGN KEY (`id_instance_cours`) REFERENCES `instance_cours` (`id_instance_cours`);

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`id_profs`) REFERENCES `profs` (`id_profs`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `notes_ibfk_3` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `profs`
--
ALTER TABLE `profs`
  ADD CONSTRAINT `fk_grade` FOREIGN KEY (`idGrade`) REFERENCES `grades` (`id_grade`);

--
-- Contraintes pour la table `promo`
--
ALTER TABLE `promo`
  ADD CONSTRAINT `promo_ibfk_1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`);

--
-- Contraintes pour la table `spe_cours`
--
ALTER TABLE `spe_cours`
  ADD CONSTRAINT `spe_cours_ibfk_1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`),
  ADD CONSTRAINT `spe_cours_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
