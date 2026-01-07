🎓 Système de Gestion Universitaire - MySQL
📋 Présentation du Projet
Ce projet consiste en la conception et la réalisation d'une base de données relationnelle complète pour la gestion d'une université. L'objectif est de centraliser les informations relatives aux élèves, enseignants, cours, notes et absences au sein d'une structure SQL cohérente et optimisée.


🛠️ Spécifications Techniques
Le système repose sur une architecture MySQL respectant les contraintes d'intégrité et de nommage:



Modélisation Relationnelle : Gestion des relations de type Un-à-Plusieurs (ex: Promotion → Élève) et Plusieurs-à-Plusieurs (ex: Élève ↔ Cours).




Gestion du CRUD : Implémentation complète des requêtes de Lecture, Ajout, Modification et Suppression.






Statistiques Avancées : Calcul des moyennes de notes par cours et suivi des absences (moyennes et sommes par élève).


🏗️ Schéma de la Base de Données
La base est organisée autour des entités majeures suivantes :


Élèves & Dossiers : Informations personnelles (nom, mail, âge) et suivi disciplinaire incluant les avertissements de travail ou de comportement.





Pédagogie : Spécialités (Développement, Cyber, etc.), Promotions annuelles et catalogue de cours par niveau.





Corps Enseignant : Fiches professeurs et affectations aux différentes instances de cours.




Évaluations & Assiduité : Registre des notes et suivi des absences avec durée et justificatifs.



🚀 Fonctionnalité Supplémentaire
Dans le cadre de ce projet, j'ai choisi d'implémenter la gestion des [CHOISIS : Clubs de sport / Associations / Paye des profs] pour répondre aux besoins spécifiques de l'université.



📁 Contenu du Dépôt

/sql : Scripts de création de la base et export complet des tables.



/queries : Fichier SQL regroupant toutes les requêtes de lecture et de manipulation demandées.


/docs : Schéma relationnel (MCD/MLD) et captures d'écran de la structure
