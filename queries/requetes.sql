
-- Liste de tous les élèves (nom et âge)
SELECT nom, age FROM eleve;


-- Liste de tous les élèves (nom et âge) de plus de 18 ans
SELECT nom, age FROM eleve WHERE age > 18;


-- Liste des notes d’un cours précis (id) inférieur à 10
SELECT notes.note FROM notes WHERE id_cours = 3 AND notes.note < 10;


-- Liste des élèves (nom) avec leur dossier (infos et avertissements)
SELECT 
    eleve.nom AS nom_eleve,
    dossier.info_eleve,
    dossier.avrt_travail,
    dossier.avrt_comportement
FROM 
    eleve
LEFT JOIN 
    dossier ON eleve.id_dossier = dossier.id_dossier;




-- Liste de toutes les absences (durée et justificatif) avec l’élève (nom) et le cours (nom)
SELECT
    absences.duree_absence,
    absences.justificatif,
    eleve.nom AS nom_eleve, 
    cours.nom AS nom_cours
FROM
    absences
LEFT JOIN
    eleve ON absences.id_eleve = eleve.id_eleve
LEFT JOIN 
    instance_cours ON absences.id_instance_cours = instance_cours.id_instance_cours
LEFT JOIN 
    cours ON instance_cours.id_cours = cours.id_cours;



-- Liste des notes d’un seul élève (condition sur le nom) avec le cours (nom du cours) et le prof (nom du prof) correspondant
SELECT 
    notes.note,
    cours.nom AS nom_cours,
    profs.nom AS nom_prof,
    eleve.nom as nom_eleve
FROM 
    notes
LEFT JOIN 
    eleve ON notes.id_eleve = eleve.id_eleve
LEFT JOIN 
    cours ON notes.id_cours = cours.id_cours
LEFT JOIN 
    profs ON notes.id_profs = profs.id_profs
WHERE 
    eleve.nom = 'nom';



-- Durée moyenne des absences
SELECT AVG(duree_absence) AS moyenne_absence
FROM absences;



-- Durée moyenne des absences avec et sans justificatif
SELECT 
    AVG(CASE WHEN justificatif = 1 THEN duree_absence END) AS moyenne_absence_justifiee,
    AVG(CASE WHEN justificatif = 0 THEN duree_absence END) AS moyenne_absence_non_justifiee
FROM absences;



-- Somme des absences (durée) d’un élève (nom) triées dans l’ordre croissant
SELECT 
    eleve.nom AS eleve_nom, 
    SUM(absences.duree_absence) AS total_duree_absence
FROM 
    eleve
LEFT JOIN 
    absences ON eleve.id_eleve = absences.id_eleve
GROUP BY 
    eleve.nom
ORDER BY 
    total_duree_absence ASC;



-- Moyenne des notes de chaque cours (nom), NULL si pas de note
SELECT AVG(notes.note) AS moyenne_note, cours.nom 
FROM cours
RIGHT JOIN notes ON cours.id_cours = notes.id_cours
GROUP BY cours.nom;



-- Liste des moyennes de chaque élève (nom), dans chaque cours (nom)
SELECT 
    eleve.nom AS nom_eleve,
    cours.nom AS nom_cours,
    AVG(notes.note) AS moyenne
FROM 
    eleve
LEFT JOIN 
    notes ON eleve.id_eleve = notes.id_eleve
LEFT JOIN 
    cours ON notes.id_cours = cours.id_cours
GROUP BY 
    eleve.nom, cours.nom
ORDER BY 
    eleve.nom, cours.nom;



-- Liste des moyennes supérieures à 10 de chaque élève (nom), dans chaque cours (nom) dans l’ordre décroissant (bonus)
SELECT 
    eleve.nom AS nom_eleve,
    cours.nom AS nom_cours,
    AVG(notes.note) AS moyenne
FROM 
    eleve
LEFT JOIN 
    notes ON eleve.id_eleve = notes.id_eleve
LEFT JOIN 
    cours ON notes.id_cours = cours.id_cours
GROUP BY 
    eleve.nom, cours.nom
HAVING 
    AVG(notes.note) > 10
ORDER BY 
    moyenne DESC, eleve.nom, cours.nom;



-- Faire un calcul pour combien gagne un prof ezn fonction de son grade pour 3h
SELECT 
    p.nom,
    g.id_grade,
    g.taux_horaire,
    (3 * g.taux_horaire) AS salaire_pour_3h
FROM 
    profs p
INNER JOIN 
    grades g
ON 
    p.idGrade = g.id_grade
WHERE p.id_profs = 2;



-- Salaire sur un an d'un professeur selon son grade et le nombre de cours effectué

SELECT 
    p.nom,
    g.id_grade,
    SUM(ic.duree) AS total_heures,
    g.taux_horaire,
    (SUM(ic.duree) * g.taux_horaire) AS salaire_total
FROM 
    profs p
INNER JOIN 
    grades g ON p.idGrade = g.id_grade
INNER JOIN 
    instance_cours ic ON p.id_profs = ic.id_profs
WHERE 
    ic.date_cours BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    p.id_profs, g.id_grade, g.taux_horaire;


-- Moyenne des notes qu'un prof a reçu sur l'ensemble de ses cours

SELECT p.nom, AVG(n.note_cours) AS moyenne_notes
FROM instance_cours AS i
INNER JOIN notation_cours AS n ON n.id_instance_cours = i.id_instance_cours
INNER JOIN profs AS p ON i.id_profs = p.id_profs 
GROUP BY p.id_profs;