# BDD_SN2

# 🎓 Système de Gestion Universitaire - MySQL

## 📋 Présentation du Projet
Ce projet consiste en la conception et la réalisation d'une base de données relationnelle complète pour la gestion d'une université. [cite_start]L'objectif est de centraliser les informations relatives aux élèves, enseignants, cours, notes et absences au sein d'une structure SQL cohérente et optimisée[cite: 3, 4, 7].

## 🛠️ Spécifications Techniques
[cite_start]Le système repose sur une architecture MySQL respectant les contraintes d'intégrité et de relations complexes[cite: 4, 8]:
* [cite_start]**Modélisation Relationnelle** : Gestion des relations de type Un-à-Plusieurs (ex: Promotion → Élève) et Plusieurs-à-Plusieurs (ex: Élève ↔ Cours)[cite: 136, 143].
* [cite_start]**Gestion du CRUD** : Implémentation complète des opérations de Lecture, Ajout, Modification et Suppression[cite: 9, 12, 14, 16, 18].
* [cite_start]**Statistiques Avancées** : Calcul automatique des moyennes de notes et suivi précis des durées d'absences avec justificatifs[cite: 172, 178, 179].

## 🏗️ Schéma de la Base de Données
La base est organisée autour des entités majeures suivantes :
* [cite_start]**Élèves & Dossiers** : Informations personnelles, coordonnées et suivi disciplinaire (avertissements)[cite: 105, 110, 115].
* [cite_start]**Pédagogie** : Spécialités (Développement, Cyber, etc.), Promotions et liste des cours par niveau[cite: 67, 71, 76, 80].
* [cite_start]**Corps Enseignant** : Gestion des professeurs et de leurs affectations aux cours[cite: 86, 94].
* [cite_start]**Évaluations & Assiduité** : Système de notation par matière et registre des absences détaillé[cite: 123, 129].



## 🚀 Fonctionnalité Supplémentaire
[cite_start]Dans le cadre de ce projet, j'ai implémenté une fonctionnalité de **[AJOUTE ICI TA FONCTIONNALITÉ, ex: Gestion des clubs de sport ou Engagement associatif]** pour enrichir la vie étudiante sur le campus[cite: 209, 213, 215].

## 📁 Contenu du Dépôt
* `/sql` : Scripts de création de la base et export des données.
* `/queries` : Liste des requêtes SQL préparées (moyennes, listes d'élèves, etc.).
* `/docs` : Schéma relationnel (MCD/MLD) et documentation technique.
