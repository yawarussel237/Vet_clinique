INSERT INTO animaux (identifiant, nom, date_de_naissance, "tentatives_d'évasion", castré, poids_kg)
VALUES
    (1, 'Agumon',  '2020-02-03', 0, TRUE,  10.23),
    (2, 'Gabumon', '2018-11-15', 2, TRUE,   8.00),
    (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
    (4, 'Devimon', '2017-05-12', 5, TRUE,  11.00);
    INSERT INTO animaux (identifiant, nom, date_de_naissance, "tentatives_d'évasion", castré, poids_kg)
VALUES
    -- Premiers animaux
    (1,  'Agumon',     '2020-02-03',  0, TRUE,   10.23),
    (2,  'Gabumon',    '2018-11-15',  2, TRUE,    8.00),
    (3,  'Pikachu',    '2021-01-07',  1, FALSE,  15.04),
    (4,  'Devimon',    '2017-05-12',  5, TRUE,   11.00),

    -- Nouveaux animaux
    (5,  'Salamèche',  '2020-02-08',  0, FALSE, -11.00),
    (6,  'Plantmon',   '2021-11-15',  2, TRUE,   -5.70),
    (7,  'Squirtle',   '1993-04-02',  3, FALSE, -12.13),
    (8,  'Angemon',    '2005-06-12',  1, TRUE,  -45.00),
    (9,  'Boarmon',    '2005-06-07',  7, TRUE,   20.40),
    (10, 'Blossom',    '1998-10-13',  3, TRUE,   17.00),
    (11, 'Idem',       '2022-05-14',  4, TRUE,   22.00);
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

-- Melody Pond possède Charmander (ou Salamèche), Squirtle et Blossom
UPDATE animaux
SET proprietaire_id = 4
WHERE nom IN ('Salamèche', 'Squirtle', 'Blossom');

-- Dean Winchester possède Angemon et Boarmon
UPDATE animaux
SET proprietaire_id = 5
WHERE nom IN ('Angemon', 'Boarmon');