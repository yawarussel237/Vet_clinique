-- 1. Animaux dont le nom se termine par "mon"
SELECT * FROM animaux
WHERE nom LIKE '%mon';

-- 2. Animaux nés entre 2016 et 2019
SELECT nom FROM animaux
WHERE EXTRACT(YEAR FROM date_de_naissance) BETWEEN 2016 AND 2019;

-- 3. Animaux stérilisés avec moins de 3 tentatives d'évasion
SELECT nom FROM animaux
WHERE castré = TRUE
AND "tentatives_d'évasion" < 3;

-- 4. Date de naissance des animaux nommés "Agumon" ou "Pikachu"
SELECT date_de_naissance FROM animaux
WHERE nom IN ('Agumon', 'Pikachu');

-- 5. Nom et tentatives d'évasion des animaux pesant plus de 10,5 kg
SELECT nom, "tentatives_d'évasion" FROM animaux
WHERE poids_kg > 10.5;

-- 6. Tous les animaux stérilisés
SELECT * FROM animaux
WHERE castré = TRUE;

-- 7. Tous les animaux non nommés Gabumon
SELECT * FROM animaux
WHERE nom != 'Gabumon';

-- 8. Animaux pesant entre 10,4 kg et 17,3 kg (inclus)
SELECT * FROM animaux
WHERE poids_kg BETWEEN 10.4 AND 17.3;
-- 1. Vérification AVANT la transaction
SELECT identifiant, nom, date_de_naissance, poids_kg FROM animaux;

-- 2. Début de la transaction
BEGIN;

-- 3. Suppression des animaux nés après le 1er janvier 2022
DELETE FROM animaux
WHERE date_de_naissance > '2022-01-01';

-- 4. Vérification après suppression
SELECT identifiant, nom, date_de_naissance, poids_kg FROM animaux;

-- 5. Création du point de sauvegarde
SAVEPOINT avant_inversion_poids;

-- 6. Multiplier le poids de TOUS les animaux par -1
UPDATE animaux
SET poids_kg = poids_kg * -1;

-- 7. Vérification après inversion totale
SELECT identifiant, nom, poids_kg FROM animaux;

-- 8. Retour au point de sauvegarde (annule l'UPDATE précédent)
ROLLBACK TO SAVEPOINT avant_inversion_poids;

-- 9. Vérification après retour au savepoint
SELECT identifiant, nom, poids_kg FROM animaux;

-- 10. Multiplier par -1 uniquement les poids NÉGATIFS
UPDATE animaux
SET poids_kg = poids_kg * -1
WHERE poids_kg < 0;

-- 11. Vérification finale avant commit
SELECT identifiant, nom, poids_kg FROM animaux;

-- 12. Validation de la transaction
COMMIT;

-- 13. Vérification APRÈS le COMMIT
SELECT identifiant, nom, poids_kg FROM animaux;
-- 1. Combien y a-t-il d'animaux ?
SELECT COUNT(*) AS nombre_animaux
FROM animaux;

-- 2. Combien d'animaux n'ont jamais tenté de s'échapper ?
SELECT COUNT(*) AS jamais_evade
FROM animaux
WHERE "tentatives_d'évasion" = 0;

-- 3. Quel est le poids moyen des animaux ?
SELECT ROUND(AVG(poids_kg), 2) AS poids_moyen
FROM animaux;

-- 4. Qui échappe le plus, les animaux castrés ou non ?
SELECT 
    castré,
    SUM("tentatives_d'évasion") AS total_tentatives,
    ROUND(AVG("tentatives_d'évasion"), 2) AS moyenne_tentatives
FROM animaux
GROUP BY castré
ORDER BY moyenne_tentatives DESC;

-- 5. Quel est le poids minimum et maximum de chaque type d'animal ?
SELECT 
    "espèces",
    MIN(poids_kg) AS poids_minimum,
    MAX(poids_kg) AS poids_maximum
FROM animaux
GROUP BY "espèces";

-- 6. Nombre moyen de tentatives d'évasion par type d'animal né entre 1990 et 2000 ?
SELECT 
    "espèces",
    ROUND(AVG("tentatives_d'évasion"), 2) AS moyenne_tentatives
FROM animaux
WHERE EXTRACT(YEAR FROM date_de_naissance) BETWEEN 1990 AND 2000
GROUP BY "espèces";
SELECT a.nom
FROM animaux a
JOIN proprietaires p
ON a.proprietaire_id = p.id
WHERE p.nom_complet = 'Melody Pond';
SELECT a.nom
FROM animaux a
JOIN especes e
ON a.espece_id = e.id
WHERE e.nom = 'Pokemon';
SELECT p.nom_complet, a.nom AS animal
FROM proprietaires p
LEFT JOIN animaux a
ON p.id = a.proprietaire_id
ORDER BY p.nom_complet;
SELECT e.nom AS espece,
       COUNT(a.identifiant) AS nombre_animaux
FROM especes e
LEFT JOIN animaux a
ON e.id = a.espece_id
GROUP BY e.nom;
SELECT a.nom
FROM animaux a
JOIN proprietaires p
ON a.proprietaire_id = p.id
JOIN especes e
ON a.espece_id = e.id
WHERE p.nom_complet = 'Jennifer Orwell'
AND e.nom = 'Digimon';
SELECT a.nom
FROM animaux a
JOIN proprietaires p
ON a.proprietaire_id = p.id
WHERE p.nom_complet = 'Dean Winchester'
AND a.tentatives_evasion = 0;
SELECT p.nom_complet,
       COUNT(a.identifiant) AS nombre_animaux
FROM proprietaires p
JOIN animaux a
ON p.id = a.proprietaire_id
GROUP BY p.id, p.nom_complet
ORDER BY nombre_animaux DESC
LIMIT 1;
