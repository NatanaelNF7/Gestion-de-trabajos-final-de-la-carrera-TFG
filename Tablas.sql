create database Alumnos;

-- TABLAS
-- =====================================================

-- Tabla de alumnos
CREATE TABLE Alumno (
    CodAlumno INT AUTO_INCREMENT PRIMARY KEY,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL
);

-- Tabla de profesores
CREATE TABLE Profesor (
    DNIProfesor VARCHAR(15) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Domicilio VARCHAR(100)
);

-- Tabla de TFG (Trabajo Final de Grado)
CREATE TABLE TFG (
    NumOrden INT AUTO_INCREMENT PRIMARY KEY,
    Tema VARCHAR(100) NOT NULL,
    FechaComienzo DATE NOT NULL,
    CodAlumno INT NOT NULL UNIQUE,
    FOREIGN KEY (CodAlumno) REFERENCES Alumno(CodAlumno)
);

-- Tabla de tribunales
CREATE TABLE Tribunal (
    NumTribunal INT AUTO_INCREMENT PRIMARY KEY,
    LugarExamen VARCHAR(100) NOT NULL,
    NumComponentes INT NOT NULL
);

-- Relación Profesor - Tribunal (N a N)
CREATE TABLE Profesor_Tribunal (
    DNIProfesor VARCHAR(15) NOT NULL,
    NumTribunal INT NOT NULL,
    PRIMARY KEY (DNIProfesor, NumTribunal),
    FOREIGN KEY (DNIProfesor) REFERENCES Profesor(DNIProfesor),
    FOREIGN KEY (NumTribunal) REFERENCES Tribunal(NumTribunal)
);

-- Relación Alumno - Tribunal - TFG (presentaciones)
CREATE TABLE Alumno_Tribunal (
    CodAlumno INT NOT NULL,
    NumTribunal INT NOT NULL,
    NumOrden INT NOT NULL,
    FechaPresentacion DATE NOT NULL,
    PRIMARY KEY (CodAlumno, NumTribunal, NumOrden),
    FOREIGN KEY (CodAlumno) REFERENCES Alumno(CodAlumno),
    FOREIGN KEY (NumTribunal) REFERENCES Tribunal(NumTribunal),
    FOREIGN KEY (NumOrden) REFERENCES TFG(NumOrden)
);

-- Tabla de grupos de investigación
CREATE TABLE GrupoInvestigacion (
    NumGrupo INT AUTO_INCREMENT PRIMARY KEY,
    NombreGrupo VARCHAR(100) NOT NULL,
    NumComponentes INT NOT NULL
);

-- Relación Alumno - Grupo (1 a 1)
CREATE TABLE Alumno_Grupo (
    CodAlumno INT PRIMARY KEY,
    NumGrupo INT NOT NULL,
    FechaIngreso DATE NOT NULL,
    FOREIGN KEY (CodAlumno) REFERENCES Alumno(CodAlumno),
    FOREIGN KEY (NumGrupo) REFERENCES GrupoInvestigacion(NumGrupo)
);

-- Tabla de colaboraciones (Profesor ayuda a Alumno)
CREATE TABLE Colaboracion (
    CodColaboracion INT AUTO_INCREMENT PRIMARY KEY,
    DNIProfesor VARCHAR(15) NOT NULL,
    CodAlumno INT NOT NULL,
    FOREIGN KEY (DNIProfesor) REFERENCES Profesor(DNIProfesor),
    FOREIGN KEY (CodAlumno) REFERENCES Alumno(CodAlumno)
);