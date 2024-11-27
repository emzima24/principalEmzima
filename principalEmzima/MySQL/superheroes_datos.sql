DROP DATABASE IF EXISTS superheroes;
CREATE DATABASE superheroes CHARACTER SET utf8mb4;
USE superheroes;

CREATE TABLE creador (
id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personajes (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
  );
  
INSERT INTO creador (nombre) VALUES 
('Marvel'),
('DC Comics');

INSERT INTO personajes (nombre_real,personaje,inteligencia,fuerza,velocidad,poder, aparicion,ocupacion,id_creador) VALUES 
('Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Físico Nuclear', 1),
('Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial', 1),
('Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard', 1),
('Wanda Maximoff', 'Bruja Escarlata', 170, '100 mil', 90, 345, 1964, 'Bruja', 1),
('Carol Danvers', 'Capitana Marvel', 157, '250mil', 85, 128, 1968, 'Oficial de inteligencia', 1),
('Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la muerte', 1),
('Peter Parker', 'Spiderman', 165, '25 mil', 80, 74, 1962, 'Fotógrafo', 1),
('Steve Rogers', 'Capitan America', 145, '600', 45, 60, 1941, 'Oficial Federal', 1),
('Bobby Drake', 'Ice Man', 140, '2 mil', 64, 122, 1963, 'Contador', 1),
('Barry Allen', 'Flash', 160, '10 mil', 120, 168, 1956, 'Científico forense', 2),
('Bruce Wayne', 'Batman', 170, '500', 32, 47, 1939, 'Hombre de negocios', 2),
('Clarck Kent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero', 2),
('Diana Prince', 'Mujer Maravilla', 160, 'infinita', 95, 127, 1949, 'Princesa guerrera', 2);


-- tabla de datos  en formato HHCC para diseñar los insert into https://docs.google.com/spreadsheets/d/1V6-ExZ3uF4wUscQlymv2l5HOtnJXfmbI/edit?usp=sharing&ouid=105543369856522853140&rtpof=true&sd=true







