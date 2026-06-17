-- Trouver tous les animaux dont le nom se termine par "mon"
SELECT *
FROM animaux
WHERE nom LIKE '%mon';

-- Nom des animaux nés entre 2016 et 2019
SELECT nom
FROM animaux
WHERE date_de_naissance BETWEEN '2016-01-01' AND '2019-12-31';

-- Nom des animaux stérilisés ayant fait moins de 3 tentatives d'évasion
SELECT nom
FROM animaux
WHERE castre = TRUE
  AND tentatives_evasion < 3;

-- Date de naissance des animaux Agumon ou Pikachu
SELECT date_de_naissance
FROM animaux
WHERE nom IN ('Agumon', 'Pikachu');

-- Nom et tentatives d'évasion des animaux pesant plus de 10,5 kg
SELECT nom, tentatives_evasion
FROM animaux
WHERE poids_kg > 10.5;

-- Tous les animaux stérilisés
SELECT *
FROM animaux
WHERE castre = TRUE;

-- Tous les animaux sauf Gabumon
SELECT *
FROM animaux
WHERE nom <> 'Gabumon';

-- Animaux pesant entre 10,4 kg et 17,3 kg
SELECT *
FROM animaux
WHERE poids_kg BETWEEN 10.4 AND 17.3;