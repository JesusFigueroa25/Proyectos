 
CREATE DATABASE Base_de_datos_TB3;
 
 USE Base_de_datos_TB3;

-- tables
-- Table: Asesoria
go
CREATE TABLE Asesoria (
    id_asesoria int  NOT NULL,
    Hora time  NOT NULL,
    Fecha date  NOT NULL,
    Monto int  NOT NULL,
    Usuario_UPC_id int  NOT NULL,
    Curso_id int  NOT NULL,
    CONSTRAINT Asesoria_pk PRIMARY KEY  (id_asesoria)
);

-- Table: Calificacion
CREATE TABLE Calificacion (
    Nota int  NOT NULL,
    Usuario_UPC_id int  NOT NULL,
    Asesoria_id int  NOT NULL
);

-- Table: Curso
CREATE TABLE Curso (
    id_curso int  NOT NULL,
    Nombre Varchar(250)  NOT NULL,
    Tema Varchar(250)  NOT NULL,
    CONSTRAINT Curso_pk PRIMARY KEY  (id_curso)
);

-- Table: Grado
CREATE TABLE Grado (
    id_grado int  NOT NULL,
    Nombre Varchar(250)  NOT NULL,
    Curso_id int  NOT NULL,
    CONSTRAINT Grado_pk PRIMARY KEY  (id_grado)
);

-- Table: Inscripcion_Asesoria
CREATE TABLE Inscripcion_Asesoria (
    Usuario_UPC_id int  NOT NULL,
    Asesoria_id int  NOT NULL,
    CONSTRAINT Inscripcion_Asesoria_pk PRIMARY KEY  (Usuario_UPC_id,Asesoria_id)
);

-- Table: Resenias
CREATE TABLE Resenias (
    id_resenias int  NOT NULL,
    Comentario varchar(500)  NOT NULL,
    Puntacion int  NOT NULL,
    Usuario_UPC_id int  NOT NULL,
    Asesoria_id int  NOT NULL,
    CONSTRAINT Resenias_pk PRIMARY KEY  (id_resenias)
);

-- Table: Usuario_UPC
CREATE TABLE Usuario_UPC (
    id_usuario int  NOT NULL ,
    Nombre Varchar(250)  NOT NULL,
    Apellido Varchar(250)  NOT NULL,
    Usuario Varchar(250)  NOT NULL,
    Contrasenia Varchar(250)  NOT NULL,
    Grado_id int  NOT NULL,
    CONSTRAINT Usuario_UPC_pk PRIMARY KEY  (id_usuario)
);

-- foreign keys
-- Reference: Asesoria_Curso (table: Asesoria)
ALTER TABLE Asesoria ADD CONSTRAINT Asesoria_Curso
    FOREIGN KEY (Curso_id)
    REFERENCES Curso (id_curso);

-- Reference: Asesoria_Usuario_UPC (table: Asesoria)
ALTER TABLE Asesoria ADD CONSTRAINT Asesoria_Usuario_UPC
    FOREIGN KEY (Usuario_UPC_id)
    REFERENCES Usuario_UPC (id_usuario);

-- Reference: Calificacion_Asesoria (table: Calificacion)
ALTER TABLE Calificacion ADD CONSTRAINT Calificacion_Asesoria
    FOREIGN KEY (Asesoria_id)
    REFERENCES Asesoria (id_asesoria);

-- Reference: Calificacion_Usuario_UPC (table: Calificacion)
ALTER TABLE Calificacion ADD CONSTRAINT Calificacion_Usuario_UPC
    FOREIGN KEY (Usuario_UPC_id)
    REFERENCES Usuario_UPC (id_usuario);

-- Reference: Grado_Curso (table: Grado)
ALTER TABLE Grado ADD CONSTRAINT Grado_Curso
    FOREIGN KEY (Curso_id)
    REFERENCES Curso (id_curso);

-- Reference: Inscripcion_Asesoria_Asesoria (table: Inscripcion_Asesoria)
ALTER TABLE Inscripcion_Asesoria ADD CONSTRAINT Inscripcion_Asesoria_Asesoria
    FOREIGN KEY (Asesoria_id)
    REFERENCES Asesoria (id_asesoria);

-- Reference: Inscripcion_Asesoria_Usuario_UPC (table: Inscripcion_Asesoria)
ALTER TABLE Inscripcion_Asesoria ADD CONSTRAINT Inscripcion_Asesoria_Usuario_UPC
    FOREIGN KEY (Usuario_UPC_id)
    REFERENCES Usuario_UPC (id_usuario);

-- Reference: Resenias_Asesoria (table: Resenias)
ALTER TABLE Resenias ADD CONSTRAINT Resenias_Asesoria
    FOREIGN KEY (Asesoria_id)
    REFERENCES Asesoria (id_asesoria);

-- Reference: Resenias_Usuario_UPC (table: Resenias)
ALTER TABLE Resenias ADD CONSTRAINT Resenias_Usuario_UPC
    FOREIGN KEY (Usuario_UPC_id)
    REFERENCES Usuario_UPC (id_usuario);

-- Reference: Usuario_UPC_Grado (table: Usuario_UPC)
ALTER TABLE Usuario_UPC ADD CONSTRAINT Usuario_UPC_Grado
    FOREIGN KEY (Grado_id)
    REFERENCES Grado (id_grado);

-- End of file.

 INSERT INTO Curso (id_curso, Nombre, Tema)

VALUES 
    (1, 'Calculo', 'integrales'),
    (2, 'Programación', 'algoritmos'),
    (3, 'Inglés', 'gramática'),
    (4, 'Historia', 'guerras mundiales'),
    (5, 'Química', 'reacciones químicas'),
    (6, 'Literatura', 'novelas clásicas'),
    (7, 'Física', 'mecánica cuántica'),
    (8, 'Economía', 'macroeconomía'),
    (9, 'Biología', 'genética'),
    (10, 'Arte', 'pintura'),
    (11, 'Matemáticas', 'álgebra lineal'),
    (12, 'Informática', 'bases de datos'),
    (13, 'Psicología', 'conductismo'),
    (14, 'Música', 'teoría musical'),
    (15, 'Geografía', 'continentes'),
    (16, 'Dibujo', 'perspectiva'),
    (17, 'Filosofía', 'ética'),
    (18, 'Educación Física', 'deportes'),
    (19, 'Sociología', 'estructura social'),
    (20, 'Derecho', 'derecho penal'),
    (21, 'Marketing', 'estrategias de ventas'),
    (22, 'Medicina', 'anatomía humana'),
    (23, 'Ciencias Políticas', 'sistemas de gobierno'),
    (24, 'Arquitectura', 'diseño urbano'),
    (25, 'Idiomas', 'aprendizaje de idiomas'),
    (26, 'Gastronomía', 'cocina internacional'),
    (27, 'Antropología', 'culturas indígenas'),
    (28, 'Estadística', 'análisis de datos'),
    (29, 'Religión', 'teología'),
    (30, 'Medios de Comunicación', 'periodismo');


 INSERT INTO Grado (id_grado, Nombre, Curso_id)
VALUES 
    (1, 'Primer Grado', 2),
    (2, 'Tercer Grado', 5),
    (3, 'Decimo Grado', 7),
    (4, 'Segundo Grado', 3),
    (5, 'Quinto Grado', 8),
    (6, 'Noveno Grado', 1),
    (7, 'Sexto Grado', 4),
    (8, 'Octavo Grado', 9),
    (9, 'Undécimo Grado', 6),
    (10, 'Cuarto Grado', 10),
    (11, 'Doceavo Grado', 15),
    (12, 'Séptimo Grado', 12),
    (13, 'Segundo Grado', 13),
    (14, 'Quinto Grado', 11),
    (15, 'Noveno Grado', 16),
    (16, 'Octavo Grado', 19),
    (17, 'Undécimo Grado', 17),
    (18, 'Cuarto Grado', 14),
    (19, 'Sexto Grado', 18),
    (20, 'Doceavo Grado', 20);

     INSERT INTO Usuario_UPC (id_usuario, Nombre, Apellido, Usuario, Contrasenia, Grado_id)
VALUES 
    (1, 'Pedro', 'Alvarez', 'u201130439', '#_123Pedri', 3),
    (2, 'Lucas', 'López', 'u217830869', '#LuLo869_asd', 5),
    (3, 'Alejandro', 'Rodríguez', 'u221578365', 'Ale_Rodri_22#msn', 9),
    (4, 'María', 'García', 'u209743651', 'MaGar_91#pass', 1),
    (5, 'Ana', 'Martínez', 'u204937186', 'AnaMtz!21', 7),
    (6, 'Carlos', 'Hernández', 'u212394865', 'CHernan_12#', 4),
    (7, 'Laura', 'Gómez', 'u216743950', 'LauGom_34$', 8),
    (8, 'David', 'Torres', 'u205481973', 'DavTor_08#pw', 2),
    (9, 'Isabel', 'Pérez', 'u218564907', 'IsaPerez_99#', 6),
    (10, 'Roberto', 'Sanchez', 'u206234897', 'RobSan_76#pwd', 10),
    (11, 'Sara', 'Luna', 'u219874365', 'SaraLuna_44#', 15),
    (12, 'Juan', 'Díaz', 'u211476538', 'JuaDiaz!32', 12),
    (13, 'Fernanda', 'Ramírez', 'u215093468', 'FerRam_21#pw', 13),
    (14, 'Manuel', 'Vargas', 'u203975482', 'ManVar_87#', 11),
    (15, 'Daniela', 'Cruz', 'u209584736', 'DaniCruz!43', 16);

  INSERT INTO Asesoria (id_asesoria, Hora, Fecha, Monto, Usuario_UPC_id, Curso_id)
VALUES 
    (1, '15:00:00', '2022-04-08', 20, 5, 13),
    (2, '13:30:00', '2021-05-20', 30, 8, 10),
    (3, '20:00:00', '2022-09-12', 40, 10, 3),
    (4, '08:30:00', '2022-03-29', 10, 15, 1),
    (5, '23:00:00', '2020-10-02', 50, 11, 4),
    (6, '09:45:00', '2023-01-15', 25, 9, 5),
    (7, '16:30:00', '2022-07-07', 35, 7, 2),
    (8, '11:15:00', '2022-06-18', 15, 4, 8),
    (9, '14:20:00', '2021-11-30', 40, 6, 12),
    (10, '17:45:00', '2022-02-14', 30, 12,30),
    (11, '10:00:00', '2022-08-23', 20, 3, 6),
    (12, '19:30:00', '2021-09-10', 25, 2, 7),
    (13, '12:45:00', '2022-05-05', 35, 1, 11),
    (14, '18:15:00', '2023-03-22', 15, 10, 15),
    (15, '07:30:00', '2023-04-30', 50, 8, 14),
    (16, '21:00:00', '2022-11-16', 30, 7, 16),
    (17, '09:15:00', '2022-01-05', 20, 6, 18),
    (18, '14:45:00', '2022-12-12', 25, 9, 17),
    (19, '16:00:00', '2023-02-28', 40, 5, 19),
    (20, '11:30:00', '2022-10-09', 30, 11, 20);


INSERT INTO Calificacion (Usuario_UPC_id, Asesoria_id, Nota)
VALUES 
    (5,1, 16),
    (8,2, 12),
    (10,3,  17),
    (15,4,  18),
    (11,5,  11),
    (9,6,  15),
    (7,7,  10),
    (4,8,  19), 
    (6,9,  19), 
    (12,10,  20),
    (3,11,  16),
    (2,12,  20),
    (1,13,  15),
    (10,14,  18),
    (8,15,  19),
    (7,16,  13),
    (6,17,  15),
    (9,18,  17),
    (5,19,  14),
    (11,20,  17);

 
INSERT INTO Inscripcion_Asesoria (Usuario_UPC_id, Asesoria_id)
VALUES 
    (5,1),
    (8,2),
    (10,3),
    (15,4),
    (11,5),
    (9,6),
    (7,7),
    (4,8),
    (6,9),
    (12,10),
    (3,11),
    (2,12),
    (1,13),
    (10,14),
    (8,15),
    (7,16),
    (6,17),
    (9,18),
    (5,19),
    (11,20);

INSERT INTO Resenias(id_resenias,Comentario,Puntacion, Usuario_UPC_id, Asesoria_id)
 
VALUES 
  (1,'Me gusto mucho la asesoria, duro poco',4,5,1),
  (2,'El profesor no enseña tan bien, pero bueno al menos aprendi algo',3,8,2),
  (3, 'Estuvo bueno la asesoria, pero el asesor llego tarde, pero bueno...',4,10,3),
  (4, 'Excelente asesoria, el asesor fue muy claro y útil',5,15,4),
  (5, 'El profesor no enseña tan bien, pero bueno al menos aprendi algo',2,11,5),
  (6, 'Muy buena asesoria, me ayudó a resolver todas mis dudas',4,9,6),
  (7, 'No recomiendo esta asesoria, el asesor no estaba preparado',2,7,7),
  (8, 'Muy buena asesoria, me ayudó a resolver todas mis dudas',5,4,8), 
  (9, 'Recomiendo esta asesoria, el asesor fue muy paciente y explicó muy bien',5,6,9), 
  (10,'La asesoria fue genial, el asesor mostró muchos ejemplos prácticos',5,12,10),
  (11,'Agradezco la asesoria, me ayudó a entender un tema complicado',4,3,11),
  (12,'Buena asesoria, pero la duración fue insuficiente',5,2,12),
  (13,'Muy buen servicio de asesoria, resolvieron todas mis dudas',4,1,13),
  (14,'Excelente asesoria, la recomendaría a otros estudiantes',5,10,14),
  (15,'Excelente asesoria, el asesor brindó explicaciones claras y concisas',5,8,15),
  (16,'No me gustó la forma de enseñar del asesor, muy aburrido',3,7,16),
  (17,'No aprendí mucho en esta asesoria, me sentí desorientado',3,6,17),
  (18,'El contenido de la asesoria fue bastante útil, me ayudó a comprender mejor el tema',4,9,18),
  (19,'La asesoria fue mediocre, el asesor no tenía claridad en sus explicaciones',3,5,19),
  (20,'La asesoria superó mis expectativas, el asesor fue muy amable y conocedor del tema',5,11,20);
