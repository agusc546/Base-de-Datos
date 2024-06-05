INSERT INTO Peliculas (
    id_pelicula, 
    titulo_español, 
    idioma_original, 
    calificacion, 
    duracion, 
    titulo_original, 
    url, 
    fecha_estreno, 
    genero, 
    resumen, 
    titulo_dist, 
    año_prod
) VALUES 
(1, 'La Vida es Bella', 'Italiano', 'Apta todo público', 116, 'La Vita è Bella', 'http://www.lavidaesbella.com', '1997-12-20', 'Comedia/Drama', 'Un padre protege a su hijo en un campo de concentración.', 'Distribución Internacional', 1997), 
(2, 'El Gran Pez', 'Inglés', 'Apta todo público', 125, 'Big Fish', 'http://www.elgranpez.com', '2003-12-25', 'Aventura/Drama', 'Un hijo explora la vida de su padre moribundo.', 'Distribución Universal', 2003), 
(3, 'Ciudad de Dios', 'Portugués', '+18 años', 130, 'Cidade de Deus', 'http://www.ciudaddedios.com', '2002-02-05', 'Crimen/Drama', 'La vida en una favela brasileña.', 'Distribución Latinoamericana', 2002), 
(4, 'Amélie', 'Francés', 'Apta todo público', 122, 'Le Fabuleux Destin d’Amélie Poulain', 'http://www.amelie.com', '2001-04-25', 'Comedia/Romántico', 'La vida de una joven camarera en París.', 'Distribución Europea', 2001), 
(5, 'El Laberinto del Fauno', 'Español', '+15 años', 118, 'El Laberinto del Fauno', 'http://www.laberintodelfauno.com', '2006-10-11', 'Fantasía/Drama', 'Una niña descubre un mundo mágico en la España franquista.', 'Distribución Internacional', 2006), 
(6, 'Oldboy', 'Coreano', '+18 años', 120, 'Oldeuboi', 'http://www.oldboy.com', '2003-11-21', 'Misterio/Thriller', 'Un hombre busca venganza tras años de secuestro.', 'Distribución Asiática', 2003), 
(7, 'El Secreto de sus Ojos', 'Español', '+15 años', 129, 'El Secreto de sus Ojos', 'http://www.elsecretodesusojos.com', '2009-08-13', 'Crimen/Drama', 'Un agente judicial reabre un caso sin resolver.', 'Distribución Latinoamericana', 2009), 
(8, 'La Princesa Mononoke', 'Japonés', 'Apta todo público', 134, 'Mononoke Hime', 'http://www.princesamononoke.com', '1997-07-12', 'Animación/Aventura', 'Un príncipe intenta detener la guerra entre los humanos y los dioses del bosque.', 'Distribución Internacional', 1997), 
(9, 'Parásitos', 'Coreano', '+15 años', 132, 'Gisaengchung', 'http://www.parasitos.com', '2019-05-30', 'Comedia/Drama', 'Una familia pobre se infiltra en la vida de una familia rica.', 'Distribución Internacional', 2019), 
(10, 'La La Land', 'Inglés', 'Apta todo público', 128, 'La La Land', 'http://www.lalaland.com', '2016-12-09', 'Musical/Romántico', 'Un músico y una actriz persiguen sus sueños en Los Ángeles.', 'Distribución Universal', 2016), 
(11, 'Intocable', 'Francés', 'Apta todo público', 112, 'Intouchables', 'http://www.intocable.com', '2011-11-02', 'Comedia/Drama', 'Un aristócrata tetrapléjico y su cuidador forjan una amistad improbable.', 'Distribución Europea', 2011);

INSERT INTO Persona (nombre, apellido, nacionalidad) VALUES
('Roberto', 'Benigni', 'Italiana'),
('Nicoletta', 'Braschi', 'Italiana'),
('Tim', 'Burton', 'Estadounidense'),
('Ewan', 'McGregor', 'Británica'),
('Albert', 'Finney', 'Británica'),
('Fernando', 'Meirelles', 'Brasileña'),
('Alexandre', 'Rodrigues', 'Brasileña'),
('Leandro', 'Firmino', 'Brasileña'),
('Jean-Pierre', 'Jeunet', 'Francesa'),
('Audrey', 'Tautou', 'Francesa'),
('Mathieu', 'Kassovitz', 'Francesa'),
('Guillermo', 'del Toro', 'Mexicana'),
('Ivana', 'Baquero', 'Española'),
('Sergi', 'López', 'Española'),
('Park', 'Chan-wook', 'Coreana'),
('Choi', 'Min-sik', 'Coreana'),
('Yoo', 'Ji-tae', 'Coreana'),
('Juan José', 'Campanella', 'Argentina'),
('Ricardo', 'Darín', 'Argentina'),
('Soledad', 'Villamil', 'Argentina'),
('Hayao', 'Miyazaki', 'Japonesa'),
('Yôji', 'Matsuda', 'Japonesa'),
('Yuriko', 'Ishida', 'Japonesa'),
('Bong', 'Joon-ho', 'Coreana'),
('Song', 'Kang-ho', 'Coreana'),
('Lee', 'Sun-kyun', 'Coreana'),
('Damien', 'Chazelle', 'Estadounidense'),
('Ryan', 'Gosling', 'Canadiense'),
('Emma', 'Stone', 'Estadounidense'),
('Olivier', 'Nakache', 'Francesa'),
('François', 'Cluzet', 'Francesa'),
('Omar', 'Sy', 'Francesa');

INSERT INTO Directores (id_pelicula, nombre) VALUES
(1, 'Roberto'),
(2, 'Tim'),
(3, 'Fernando'),
(4, 'Jean-Pierre'),
(5, 'Guillermo'),
(6, 'Park'),
(7, 'Juan José'),
(8, 'Hayao'),
(9, 'Bong'),
(10, 'Damien'),
(11, 'Olivier');

INSERT INTO Actores_r (id_pelicula, nombre) VALUES
(1, 'Roberto'),
(2, 'Ewan'),
(3, 'Alexandre'),
(4, 'Audrey'),
(5, 'Ivana'),
(6, 'Choi'),
(7, 'Ricardo'),
(8, 'Yôji'),
(9, 'Song'),
(10, 'Ryan'),
(11, 'François'),
(11, 'Roberto');

INSERT INTO Actores_p (id_pelicula, nombre) VALUES
(1, 'Nicoletta'),
(2, 'Albert'),
(3, 'Leandro'),
(4, 'Mathieu'),
(5, 'Sergi'),
(6, 'Yoo'),
(7, 'Soledad'),
(8, 'Yuriko'),
(9, 'Lee'),
(10, 'Emma'),
(11, 'Omar');

INSERT INTO mPaises (id_pelicula, pais_origen) VALUES
(1, 'Italia'),
(1, 'España'),
(1, 'Inglaterra'),
(2, 'Estados Unidos'),
(3, 'Brasil'),
(4, 'Francia'),
(5, 'México'),
(6, 'Corea del Sur'),
(7, 'Argentina'),
(8, 'Japón'),
(9, 'Corea del Sur'),
(10, 'Estados Unidos'),
(11, 'Francia');

INSERT INTO Cine (nombre_cine, direccion, telefono) VALUES
	('Cines del Paseo', 'Hipolito Yrigoyen 235', '3584621235'),
    ('Cinemacenter', 'Paunero 550', '3585120196'),
    ('Cine Cultural', 'Sebastian Vera 175', '3584303555');

INSERT INTO Sala (nro_sala, cant_butacas, nombre_cine) VALUES
-- Salas para Cines del Paseo
(1, 150, 'Cines del Paseo'),
(2, 150, 'Cines del Paseo'),
(3, 150, 'Cines del Paseo'),

-- Salas para Cinemacenter
(4, 100, 'Cinemacenter'),
(5, 100, 'Cinemacenter'),
(6, 100, 'Cinemacenter'),
(7, 100, 'Cinemacenter'),
(8, 100, 'Cinemacenter'),

-- Salas para Cine Cultural
(9, 80, 'Cine Cultural'),
(10, 90, 'Cine Cultural'),
(11, 90, 'Cine Cultural'),
(12, 90, 'Cine Cultural');
                                                                                  
INSERT INTO Funcion (cod_funcion, fecha, hora_inicio, id_pelicula, nro_sala, nombre_cine) VALUES
-- Funciones para "La Vida es Bella" (Película 1)
(1, '2024-05-01', '15:00:00', 1, 1, 'Cines del Paseo'),
(2, '2024-05-02', '17:30:00', 1, 2, 'Cines del Paseo'),
(3, '2024-05-03', '20:00:00', 1, 3, 'Cines del Paseo'),

-- Funciones para "El Gran Pez" (Película 2)
(4, '2024-05-04', '14:00:00', 2, 1, 'Cines del Paseo'),
(5, '2024-05-05', '16:30:00', 2, 2, 'Cine Cultural'),
(6, '2024-05-06', '19:00:00', 2, 3, 'Cine Cultural'),

-- Funciones para "Ciudad de Dios" (Película 3)
(7, '2024-05-07', '15:30:00', 3, 1, 'Cine Cultural'),
(8, '2024-05-08', '18:00:00', 3, 2, 'Cine Cultural'),
(9, '2024-05-09', '20:30:00', 3, 3, 'Cine Cultural'),

-- Funciones para "Amélie" (Película 4)
(10, '2024-05-10', '14:00:00', 4, 1, 'Cinemacenter'),
(11, '2024-05-11', '17:00:00', 4, 2, 'Cinemacenter'),
(12, '2024-05-12', '19:30:00', 4, 3, 'Cinemacenter'),

-- Funciones para "El Laberinto del Fauno" (Película 5)
(13, '2024-05-13', '13:00:00', 5, 1, 'Cinemacenter'),
(14, '2024-05-14', '16:30:00', 5, 2, 'Cine Cultural'),
(15, '2024-05-15', '19:00:00', 5, 3, 'Cines del Paseo'),

-- Funciones para "Oldboy" (Película 6)
(16, '2024-05-16', '14:30:00', 6, 1, 'Cinemacenter'),
(17, '2024-05-17', '17:30:00', 6, 2, 'Cine Cultural'),
(18, '2024-05-18', '20:00:00', 6, 3, 'Cine Cultural'),

-- Funciones para "El Secreto de sus Ojos" (Película 7)
(19, '2024-05-19', '16:30:00', 7, 1, 'Cinemacenter'),
(20, '2024-05-20', '19:00:00', 7, 2, 'Cine Cultural'),
(21, '2024-05-21', '21:30:00', 7, 3, 'Cine Cultural'),

-- Funciones para "La Princesa Mononoke" (Película 8)
(22, '2024-05-22', '15:30:00', 8, 1, 'Cines del Paseo'),
(23, '2024-05-23', '18:30:00', 8, 2, 'Cine Cultural'),
(24, '2024-05-24', '21:00:00', 8, 3, 'Cine Cultural'),

-- Funciones para "Parásitos" (Película 9)
(25, '2024-05-25', '15:00:00', 9, 1, 'Cinemacenter'),
(26, '2024-05-26', '18:00:00', 9, 2, 'Cine Cultural'),
(27, '2024-05-27', '20:30:00', 9, 3, 'Cine Cultural'),

-- Funciones para "La La Land" (Película 10)
(28, '2024-05-28', '14:00:00', 10, 1, 'Cines del Paseo'),
(29, '2024-05-29', '17:30:00', 10, 2, 'Cine Cultural'),
(30, '2024-05-30', '20:00:00', 10, 3, 'Cine Cultural'),

-- Funciones para "Intocable" (Película 11)
(31, '2024-05-31', '13:30:00', 11, 1, 'Cinemacenter'),
(32, '2024-06-01', '16:00:00', 11, 2, 'Cine Cultural'),
(33, '2024-06-02', '18:30:00', 11, 3, 'Cine Cultural');


