-- Procedimiento 1: Insertar alumno

DELIMITER //
CREATE PROCEDURE InsertarAlumno (
    IN pDNI VARCHAR(15),
    IN pNombre VARCHAR(50)
)
BEGIN
    INSERT INTO Alumno (DNI, Nombre)
    VALUES (pDNI, pNombre);
END //
DELIMITER ;

-- Procedimiento 2: Listar TFG por alumno
DELIMITER //
CREATE PROCEDURE ListarTFGPorAlumno (
    IN pCodAlumno INT
)
BEGIN
    SELECT a.Nombre, t.Tema, t.FechaComienzo
    FROM Alumno a
    JOIN TFG t ON a.CodAlumno = t.CodAlumno
    WHERE a.CodAlumno = pCodAlumno;
END //
DELIMITER ;
