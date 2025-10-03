-- Trigger

DELIMITER //
CREATE TRIGGER VerificarAlumnoGrupo
BEFORE INSERT ON Alumno_Grupo
FOR EACH ROW
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM Alumno_Grupo
    WHERE CodAlumno = NEW.CodAlumno;

    IF existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Un alumno no puede pertenecer a más de un grupo de investigación';
    END IF;
END //
DELIMITER ;
