CREATE TABLE animaux (
    identifiant        INTEGER,
    nom                VARCHAR(100),
    date_de_naissance  DATE,
    "tentatives_d'évasion" INTEGER,
    castré             BOOLEAN,
    poids_kg           DECIMAL
);
-- Créer la base de données
CREATE DATABASE clinique_vet;

-- Se connecter à la base de données
\c clinique_vet

-- Créer la table animaux
CREATE TABLE animaux (
    identifiant        INTEGER,
    nom                VARCHAR(100),
    date_de_naissance  DATE,
    "tentatives_d'évasion" INTEGER,
    castré             BOOLEAN,
    poids_kg           DECIMAL,
    "espèces"          VARCHAR(100)
);
-- Créer la base de données
CREATE DATABASE clinique_vet;

-- Se connecter à la base de données
\c clinique_vet

-- Créer la table animaux
CREATE TABLE animaux (
    identifiant             INTEGER,
    nom                     VARCHAR(100),
    date_de_naissance       DATE,
    "tentatives_d'évasion"  INTEGER,
    castré                  BOOLEAN,
    poids_kg                DECIMAL,
    "espèces"               VARCHAR(100)
);

-- Créer la table propriétaires
CREATE TABLE "propriétaires" (
    identifiant     SERIAL PRIMARY KEY,
    "nom et prénom" VARCHAR(100),
    "âge"           INTEGER
);
-- Créer la base de données
CREATE DATABASE clinique_vet;

-- Se connecter à la base de données
\c clinique_vet

-- Créer la table animaux
CREATE TABLE animaux (
    identifiant             INTEGER,
    nom                     VARCHAR(100),
    date_de_naissance       DATE,
    "tentatives_d'évasion"  INTEGER,
    castré                  BOOLEAN,
    poids_kg                DECIMAL,
    "espèces"               VARCHAR(100)
);

-- Créer la table propriétaires
CREATE TABLE "propriétaires" (
    identifiant     SERIAL PRIMARY KEY,
    "nom et prénom" VARCHAR(100),
    "âge"           INTEGER
);
-- =========================================
--        CLINIQUE VÉTÉRINAIRE
--              schema.sql
-- =========================================

-- Créer la base de données
CREATE DATABASE clinique_vet;

-- Se connecter à la base de données
\c clinique_vet

-- =========================================
-- TABLE : espèces
-- (créée avant animaux car référencée)
-- =========================================
CREATE TABLE "espèces" (
    identifiant  SERIAL PRIMARY KEY,
    nom          VARCHAR(100)
);

-- =========================================
-- TABLE : propriétaires
-- (créée avant animaux car référencée)
-- =========================================
CREATE TABLE "propriétaires" (
    identifiant      SERIAL PRIMARY KEY,
    "nom et prénom"  VARCHAR(100),
    "âge"            INTEGER
);

-- =========================================
-- TABLE : animaux
-- =========================================
CREATE TABLE animaux (
    identifiant             SERIAL PRIMARY KEY,
    nom                     VARCHAR(100),
    date_de_naissance       DATE,
    "tentatives_d'évasion"  INTEGER,
    castré                  BOOLEAN,
    poids_kg                DECIMAL,
    "espèce_id"             INTEGER REFERENCES "espèces"(identifiant),
    "id_propriétaire"       INTEGER REFERENCES "propriétaires"(identifiant)
);