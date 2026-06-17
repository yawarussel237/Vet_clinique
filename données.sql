INSERT INTO animaux (nom, date_de_naissance, tentatives_evasion, castre, poids_kg,especes)
VALUES
('Agumon', '2020-02-03', 0, VRAI, 10.23),
('Gabumon', '2018-11-15', 2, VRAI, 8.00),
("Pikachu", '2021-01-07', 1, FAUX, 15.04),
("Dévimon", '2017-05-12', 5, VRAI, 11.00);
('Salamèche', '2020-02-08', 0, FALSE, -11.00),
('Plantmon', '2021-11-15', 2, TRUE, -5.70),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45.00),
('Boarmon', '2005-06-07', 7, TRUE, 20.40),
('Blossom', '1998-10-13', 3, TRUE, 17.00),
('Idem', '2022-05-14', 4, TRUE, 22.00);
SELECT * FROM animaux;
BEGIN;

UPDATE animaux
SET especes = 'unspecified';

SELECT nom, especes
FROM animaux;

ROLLBACK;

SELECT nom, especes
FROM animaux;
BEGIN;

-- Supprimer tous les animaux nés après le 1er janvier 2022
DELETE FROM animaux
WHERE date_de_naissance > '2022-01-01';

-- Créer un point de sauvegarde
SAVEPOINT suppression_effectuee;

-- Multiplier tous les poids par -1
UPDATE animaux
SET poids_kg = poids_kg * -1;

-- Revenir au point de sauvegarde
ROLLBACK TO SAVEPOINT suppression_effectuee;

-- Corriger uniquement les poids négatifs
UPDATE animaux
SET poids_kg = poids_kg * -1
WHERE poids_kg < 0;

-- Valider la transaction
COMMIT;
SELECT COUNT(*) AS nombre_animaux
FROM animaux;
SELECT COUNT(*) AS animaux_sans_evasion
FROM animaux
WHERE tentatives_evasion = 0;
SELECT AVG(poids_kg) AS poids_moyen
FROM animaux;
SELECT castre,
       AVG(tentatives_evasion) AS moyenne_evasions
FROM animaux
GROUP BY castre;
SELECT castre,
       SUM(tentatives_evasion) AS total_evasions
FROM animaux
GROUP BY castre;
SELECT especes,
       MIN(poids_kg) AS poids_min,
       MAX(poids_kg) AS poids_max
FROM animaux
GROUP BY especes;
SELECT especes,
       AVG(tentatives_evasion) AS moyenne_tentatives
FROM animaux
WHERE date_de_naissance BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY especes;
INSERT INTO proprietaires (nom_complet, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
INSERT INTO especes (nom)
VALUES
('Pokemon'),
('Digimon');
-- Les animaux dont le nom se termine par "mon" sont des Digimon
UPDATE animaux
SET espece_id = 2
WHERE nom LIKE '%mon';

-- Tous les autres sont des Pokemon
UPDATE animaux
SET espece_id = 1
WHERE espece_id IS NULL;
-- Sam Smith possède Agumon
UPDATE animaux
SET proprietaire_id = 1
WHERE nom = 'Agumon';

-- Jennifer Orwell possède Gabumon et Pikachu
UPDATE animaux
SET proprietaire_id = 2
WHERE nom IN ('Gabumon', 'Pikachu');

-- Bob possède Devimon et Plantmon
UPDATE animaux
SET proprietaire_id = 3
WHERE nom IN ('Devimon', 'Plantmon');

-- Melody Pond possède Salamèche (Charmander), Squirtle et Blossom
UPDATE animaux
SET proprietaire_id = 4
WHERE nom IN ('Salamèche', 'Squirtle', 'Blossom');

-- Dean Winchester possède Angemon et Boarmon
UPDATE animaux
SET proprietaire_id = 5
WHERE nom IN ('Angemon', 'Boarmon');
WHERE nom = 'Salamèche'
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
       COUNT(a.id) AS nombre_animaux
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
       COUNT(a.id) AS nombre_animaux
FROM proprietaires p
JOIN animaux a
ON p.id = a.proprietaire_id
GROUP BY p.id, p.nom_complet
ORDER BY nombre_animaux DESC
LIMIT 1;