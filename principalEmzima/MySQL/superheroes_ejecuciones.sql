-- Cambia en la tabla personajes, el año de aparición del personaje Superman a 1938.

UPDATE personajes 
SET aparicion = 1938 
WHERE personaje = 'Superman';

-- Elimina el registro que contiene al personaje Flash

DELETE 
FROM personajes
WHERE personaje = 'Flash';

-- Cambia en la tabla creador, el nombre del id 1 a “Marvel Inc.”

UPDATE creador 
SET nombre = 'Marvel Inc.' 
WHERE id_creador = 1;