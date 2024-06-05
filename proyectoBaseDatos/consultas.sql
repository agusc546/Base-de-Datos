-- a) Devolver actores que solo figuran en una sola película. 
-- select * from (select nombre ,count(id_pelicula) as cant_peliculas from (select * from Actores_r union select * from Actores_p) as sub_consulta group by nombre) as sub_consult where cant_peliculas = 1

-- b) Listar las personas que han sido actores y directores.
-- select * from  Directores natural join (select * from Actores_r union select * from Actores_p) as sub_consulta

-- c) Listar los cines con la cantidad total de butacas totales. 
-- select nombre_cine, sum(cant_butacas) as butacas_totales from cine natural join sala group by nombre_cine

-- d) Definir consultas propias (no menos de tres), donde por lo menos una utilice subconsultas.

-- consultas propias
-- cantidad de salas de cada cine
-- select nombre_cine, count(nro_sala) as cant_salas from cine natural join sala group by nombre_cine 

-- cantidad de funciones por cine 
-- select nombre_cine, count(nombre_cine) from funcion group by nombre_cine

-- listar las peliculas con la cantidad de funciones de cada una
-- select * from (select titulo_español,count(id_pelicula) as cant_funciones from peliculas natural join funcion group by titulo_español ) as sub_consulta
