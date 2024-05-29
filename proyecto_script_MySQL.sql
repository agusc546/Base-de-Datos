CREATE DATABASE IF NOT EXISTS ProyectoBD;
USE ProyectoBD; 

CREATE TABLE Peliculas (
id_pelicula INT NOT NULL, 
titulo_español VARCHAR(45), 
idioma_original VARCHAR(45) NOT NULL, 
calificacion ENUM("Apta todo público", "+13 años", "+15 años", "+18 años") NOT NULL,
duracion INT NOT NULL, 
titulo_original VARCHAR(45) NOT NULL, 
url VARCHAR(45) NOT NULL,
fecha_estreno DATE, 
genero VARCHAR(45) NOT NULL,
resumen VARCHAR(100), 
titulo_dist VARCHAR(45) NOT NULL, 
año_prod int, 
CONSTRAINT pkpeliculas PRIMARY KEY(id_pelicula),
CHECK(id_pelicula > 0) -- los id de peliculas deben ser positivos
);

CREATE TABLE mPaises (
id_pelicula INT NOT NULL,
pais_origen VARCHAR(45) NOT NULL, 
CHECK(id_pelicula > 0),
CONSTRAINT pkpaises PRIMARY KEY (id_pelicula,pais_origen), 
CONSTRAINT fkpaises FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
	ON DELETE CASCADE
);

CREATE TABLE Persona ( 
nombre VARCHAR(45) NOT NULL, 
apellido VARCHAR(45) NOT NULL, 
nacionalidad VARCHAR(45),
cant_peliculas INT DEFAULT 0,
CONSTRAINT pkpersona PRIMARY KEY (nombre)
);

CREATE TABLE Cine (
nombre_cine VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL, 
telefono VARCHAR(45) NOT NULL, -- duda de si lo tomamos como varchar o int
CONSTRAINT pkcine PRIMARY KEY (nombre_cine)
);

CREATE TABLE Sala (
nro_sala INT NOT NULL, 
cant_butacas INT NOT NULL,
nombre_cine VARCHAR(45) NOT NULL,
check(nro_sala > 0),
CONSTRAINT pksala PRIMARY KEY (nro_sala),
CONSTRAINT fksala FOREIGN KEY (nombre_cine) REFERENCES Cine(nombre_cine)
);

CREATE TABLE Funcion (
cod_funcion INT NOT NULL, 
fecha DATE NOT NULL, 
hora_inicio varchar(100) NOT NULL,
id_pelicula INT NOT NULL, 
nro_sala INT NOT NULL,
nombre_cine VARCHAR(45) NOT NULL,
CONSTRAINT pkfuncion PRIMARY KEY (cod_funcion),
CONSTRAINT fk_pelicula FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
	ON DELETE CASCADE,
CONSTRAINT fk_sala FOREIGN KEY (nro_sala) REFERENCES Sala(nro_sala),
CHECK(cod_funcion > 0)
);

CREATE TABLE Directores (
id_pelicula INT NOT NULL, 
nombre VARCHAR(45) NOT NULL,
CHECK(id_pelicula > 0),
CONSTRAINT pkdirectores PRIMARY KEY (id_pelicula,nombre),
CONSTRAINT fkdirectores1 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
	ON DELETE RESTRICT,
CONSTRAINT fkdirectores2 FOREIGN KEY (nombre) REFERENCES Persona(nombre) 
	ON DELETE CASCADE
);

CREATE TABLE Actores_r (
id_pelicula INT NOT NULL, 
nombre varchar(45) NOT NULL, 
CHECK(id_pelicula > 0),
CONSTRAINT pkactoresR  PRIMARY KEY (id_pelicula,nombre),
CONSTRAINT fkactoresR1 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
	ON DELETE RESTRICT,
CONSTRAINT fkactoresR2 FOREIGN KEY (nombre) REFERENCES Persona(nombre) 
	ON DELETE CASCADE
);

CREATE TABLE Actores_p ( 
id_pelicula INT NOT NULL, 
nombre VARCHAR(45) NOT NULL, 
CHECK(id_pelicula > 0),
CONSTRAINT pkactoresp PRIMARY KEY (id_pelicula,nombre),
CONSTRAINT fkactoresp1 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
	ON DELETE RESTRICT,
CONSTRAINT fkactoresp2 FOREIGN KEY (nombre) REFERENCES Persona(nombre)
	ON DELETE CASCADE
);

CREATE TABLE Auditoria(
    id_pelicula INT NOT NULL,
    fecha_Estreno_Ori DATE NOT NULL,	
    fecha_Estreno_Nuev DATE NOT NULL,
    fechaAct DATETIME DEFAULT CURRENT_TIMESTAMP,
	usuario VARCHAR(45),
    CONSTRAINT pkauditoria PRIMARY KEY(id_pelicula, fechaAct)
);

DELIMITER $$
CREATE TRIGGER titulo_mayuscula
    BEFORE INSERT ON Peliculas
    FOR EACH ROW  
	BEGIN 
        SET NEW.titulo_original = UPPER(NEW.titulo_original);   
	END $$
DELIMITER ;

DELIMITER $$ 
CREATE TRIGGER Auditoria 
    AFTER UPDATE ON Peliculas 
    FOR EACH ROW 
    BEGIN
        IF OLD.fecha_estreno < NEW.fecha_estreno THEN
            INSERT INTO Auditoria (id_pelicula, fecha_Estreno_Ori, fecha_Estreno_Nuev, fechaAct, usuario) 
            VALUES (OLD.id_pelicula, OLD.fecha_estreno, NEW.fecha_estreno, NOW(), current_user()); 
        END IF;
    END$$
DELIMITER ;


DELIMITER $$ 
CREATE TRIGGER Cant_actores_principal
	AFTER INSERT ON Actores_p
    FOR EACH ROW 
    BEGIN 
		UPDATE Persona
		SET cant_peliculas = cant_peliculas + 1
		WHERE nombre = NEW.nombre;
    END $$
DELIMITER;

DELIMITER $$ 
CREATE TRIGGER Cant_actores_reparto
	AFTER INSERT ON Actores_r
    FOR EACH ROW 
    BEGIN 
		UPDATE Persona 
		SET cant_peliculas = cant_peliculas + 1
		WHERE nombre = NEW.nombre;
    END $$
DELIMITER;

DELIMITER $$ 
CREATE TRIGGER Cant_directores
	AFTER INSERT ON Directores
    FOR EACH ROW 
    BEGIN 
		UPDATE Persona
		SET cant_peliculas = cant_peliculas + 1
		WHERE nombre = NEW.nombre;
    END $$

    



