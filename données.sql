CREATE DATABASE ecole;

USE ecole;

CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    age INT
);

INSERT INTO eleves (nom, age)
VALUES ('Paul', 15);

SELECT * FROM eleves;