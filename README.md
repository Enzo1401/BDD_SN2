# 🎓 Système de Gestion Universitaire - BDD_SN2

## 📋 Présentation du Projet
Ce projet consiste en la conception et la réalisation d'une base de données relationnelle complète pour la gestion d'une université. 
L'objectif est de centraliser les informations relatives aux élèves, enseignants, cours, notes et absences au sein d'une structure SQL cohérente, bien nommée et optimisée.

## 🛠️ Spécifications Techniques
Le système repose sur une architecture MySQL respectant les contraintes d'intégrité et de relations complexes:
* **Modélisation Relationnelle** : Gestion des relations de type Un-à-Plusieurs (ex: Promotion → Élève ) et Plusieurs-à-Plusieurs (ex: Élève ↔ Cours).
* **Gestion du CRUD** : Implémentation complète des opérations de Lecture (SELECT), d'Ajout (INSERT), de Modification (UPDATE) et de Suppression (DELETE).
* **Statistiques Avancées** : Calcul automatique des moyennes de notes par cours et suivi précis des durées d'absences avec ou sans justificatifs.

## 🏗️ Schéma de la Base de Données
La base est organisée autour des entités majeures suivantes :
* **Élèves & Dossiers** : Stockage du nom, mail, âge et suivi du dossier disciplinaire (avertissements de travail ou de comportement).
* **Pédagogie** : Gestion des spécialités (Développement, Cyber, etc), des promotions annuelles et catalogue des cours par niveau.
* **Corps Enseignant** : Fiches des professeurs et affectations aux différentes instances de cours.
* **Évaluations & Assiduité** : Système de notation par matière et registre détaillé des absences avec durée en minutes.

## 📁 Contenu du Dépôt
* **/sql** : Scripts de création de la base et export complet des données au format SQL.
* **/queries** : Fichier contenant l'ensemble des requêtes demandées (listes d'élèves, calculs de moyennes).
* **/docs** : Schéma relationnel de la base de données et captures d'écran de la structure des tables.
