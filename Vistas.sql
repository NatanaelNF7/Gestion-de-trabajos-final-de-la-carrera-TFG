-- Vistas

CREATE VIEW Vista_Alumnos_TFG AS
SELECT a.CodAlumno, a.Nombre, t.Tema, t.FechaComienzo
FROM Alumno a
JOIN TFG t ON a.CodAlumno = t.CodAlumno;

CREATE VIEW Vista_Profesores_Tribunal AS
SELECT p.Nombre AS Profesor, t.NumTribunal, t.LugarExamen
FROM Profesor p
JOIN Profesor_Tribunal pt ON p.DNIProfesor = pt.DNIProfesor
JOIN Tribunal t ON pt.NumTribunal = t.NumTribunal;
