/*data coleccion1*/
db.Colecctions_Asesoria.insertMany([
    {
        "id": 1, "Fecha": ISODate("2022-04-08"), "Hora": ISODate("2022-04-08T15:00:00Z"), "Monto": 20, "id_Asesor_Usuario": 5,
        "Curso": {"Nombre": "Calculo", "Tema": "integrales"},
        "Calificacion": [{ "Nota": 16 }]
    },
    {
        "id": 2, "Fecha": ISODate("2021-05-20"), "Hora": ISODate("2021-05-20T13:30:00Z"), "Monto": 30, "id_Asesor_Usuario": 8,
        "Curso": {"Nombre": "Programación", "Tema": "algoritmos"},
        "Calificacion": [{ "Nota": 12 }]
    },
    {
        "id": 3, "Fecha": ISODate("2022-09-12"), "Hora": ISODate("2022-09-12T20:00:00Z"), "Monto": 40, "id_Asesor_Usuario": 10,
        "Curso": {"Nombre": "Inglés", "Tema": "gramática"},
        "Calificacion": [{ "Nota": 17 }]
    },
    {
        "id": 4, "Fecha": ISODate("2022-03-29"), "Hora": ISODate("2022-03-29T08:30:00Z"), "Monto": 10, "id_Asesor_Usuario": 15,
        "Curso": {"Nombre": "Historia", "Tema": "guerras mundiales"},
        "Calificacion": [{ "Nota": 18 }]
    },
    {
        "id": 5, "Fecha": ISODate("2020-10-02"), "Hora": ISODate("2020-10-02T23:00:00Z"), "Monto": 50, "id_Asesor_Usuario": 11,
        "Curso": {"Nombre": "Química", "Tema": "reacciones químicas"},
        "Calificacion": [{ "Nota": 11 }]
    },
    {
        "id": 6, "Fecha": ISODate("2023-01-15"), "Hora": ISODate("2023-01-15T09:45:00Z"), "Monto": 25, "id_Asesor_Usuario": 9,
        "Curso": {"Nombre": "Literatura", "Tema": "novelas clásicas"},
        "Calificacion": [{ "Nota": 15 }]
    },
    {
        "id": 7, "Fecha": ISODate("2022-07-07"), "Hora": ISODate("2022-07-07T16:30:00Z"), "Monto": 35, "id_Asesor_Usuario": 7,
        "Curso": {"Nombre": "Física", "Tema": "mecánica cuántica"},
        "Calificacion": [{ "Nota": 10 }]
    },
    {
        "id": 8, "Fecha": ISODate("2022-06-18"), "Hora": ISODate("2022-06-18T11:15:00Z"), "Monto": 15, "id_Asesor_Usuario": 4,
        "Curso": {"Nombre": "Economía", "Tema": "macroeconomía"},
        "Calificacion": [{ "Nota": 19 }]
    },
    {
        "id": 9, "Fecha": ISODate("2021-11-30"), "Hora": ISODate("2021-11-30T14:20:00Z"), "Monto": 40, "id_Asesor_Usuario": 6,
        "Curso": {"Nombre": "Biología", "Tema": "genética"},
        "Calificacion": [{ "Nota": 19 }]
    },
    {
        "id": 10, "Fecha": ISODate("2022-02-14"), "Hora": ISODate("2022-02-14T17:45:00Z"), "Monto": 30, "id_Asesor_Usuario": 12,
        "Curso": {"Nombre": "Arte", "Tema": "pintura"},
        "Calificacion": [{ "Nota": 20 }]
    }
]);


/*data coleccion2*/
db.Colecctions_Grado.insertMany([
    {"id": 1, "Nombre": "Primer Grado", "Curso": [{"Nombre": "Programación", "Tema": "algoritmos"}]},
    {"id": 2, "Nombre": "Tercer Grado", "Curso": [{"Nombre": "Química", "Tema": "reacciones químicas"}]},
    {"id": 3, "Nombre": "Decimo Grado", "Curso": [{"Nombre": "Física", "Tema": "mecánica cuántica"}]},
    {"id": 4, "Nombre": "Segundo Grado", "Curso": [{"Nombre": "Inglés", "Tema": "gramática"}]},
    {"id": 5, "Nombre": "Quinto Grado", "Curso": [{"Nombre": "Economía", "Tema": "macroeconomía"}]},
    {"id": 6, "Nombre": "Noveno Grado", "Curso": [{"Nombre": "Calculo", "Tema": "integrales"}]},
    {"id": 7, "Nombre": "Sexto Grado", "Curso": [{"Nombre": "Historia", "Tema": "guerras mundiales"}]},
    {"id": 8, "Nombre": "Octavo Grado", "Curso": [{"Nombre": "Biología", "Tema": "genética"}]},
    {"id": 9, "Nombre": "Undécimo Grado", "Curso": [{"Nombre": "Literatura", "Tema": "novelas clásicas"}]},
    {"id": 10, "Nombre": "Cuarto Grado", "Curso": [{"Nombre": "Arte", "Tema": "pintura"}]},
    {"id": 11, "Nombre": "Doceavo Grado", "Curso": [{"Nombre": "Geografía", "Tema": "continentes"}]},
    {"id": 12, "Nombre": "Séptimo Grado", "Curso": [{"Nombre": "Informática", "Tema": "bases de datos"}]},
    {"id": 13, "Nombre": "Segundo Grado", "Curso": [{"Nombre": "Psicología", "Tema": "conductismo"}]},
    {"id": 14, "Nombre": "Quinto Grado", "Curso": [{"Nombre": "Matemáticas", "Tema": "álgebra lineal"}]},
    {"id": 15, "Nombre": "Noveno Grado", "Curso": [{"Nombre": "Dibujo", "Tema": "perspectiva"}]},
    {"id": 16, "Nombre": "Octavo Grado", "Curso": [{"Nombre": "Sociología", "Tema": "estructura social"}]},
    {"id": 17, "Nombre": "Undécimo Grado", "Curso": [{"Nombre": "Filosofía", "Tema": "ética"}]},
    {"id": 18, "Nombre": "Cuarto Grado", "Curso": [{"Nombre": "Educación Física", "Tema": "deportes"}]},
    {"id": 19, "Nombre": "Sexto Grado", "Curso": [{"Nombre": "Sociología", "Tema": "estructura social"}]},
    {"id": 20, "Nombre": "Doceavo Grado", "Curso": [{"Nombre": "Derecho", "Tema": "derecho penal"}]}
]);


/*--------------------------------------------------------------------------------------------------------------------------*/
/*data coleccion3*/
db.Colecctions_Usuario_UPC.insertMany([
    {"id": 1, "Nombre": "Javier", "Apellido": "Fernández", "inscripciones_Asesoria": [5, 6, 7], "Resenias": [{"Comentario": "Me gustó la asesoría, pero hubiera preferido más ejercicios prácticos", "Puntuacion": 4}]},
    {"id": 2, "Nombre": "María", "Apellido": "López", "inscripciones_Asesoria": [2, 9, 10], "Resenias": [{"Comentario": "Buen servicio, el asesor fue amable", "Puntuacion": 4}]},
    {"id": 3, "Nombre": "Andrés", "Apellido": "González", "inscripciones_Asesoria": [3, 8, 11], "Resenias": [{"Comentario": "Excelente asesoría, resolvió todas mis dudas", "Puntuacion": 5}]},
    {"id": 4, "Nombre": "Paula", "Apellido": "Martínez", "inscripciones_Asesoria": [4, 12, 13], "Resenias": [{"Comentario": "Buena asesoría, pero faltó profundizar en algunos temas", "Puntuacion": 3}]},
    {"id": 5, "Nombre": "Luis", "Apellido": "Sánchez", "inscripciones_Asesoria": [1, 7, 14], "Resenias": [{"Comentario": "La asesoría estuvo bien, pero faltó más material de apoyo", "Puntuacion": 4}]},
    {"id": 6, "Nombre": "Laura", "Apellido": "Hernández", "inscripciones_Asesoria": [6, 15, 16], "Resenias": [{"Comentario": "Me encantó la asesoría, el asesor explicó de manera clara", "Puntuacion": 5}]},
    {"id": 7, "Nombre": "Juan", "Apellido": "Gómez", "inscripciones_Asesoria": [7, 17, 18], "Resenias": [{"Comentario": "No quedé satisfecho con la asesoría, esperaba más contenido práctico", "Puntuacion": 3}]},
    {"id": 8, "Nombre": "Carolina", "Apellido": "Torres", "inscripciones_Asesoria": [8, 19, 20], "Resenias": [{"Comentario": "Recomiendo ampliamente esta asesoría, el asesor fue muy amable y paciente", "Puntuacion": 5}]},
    {"id": 9, "Nombre": "Roberto", "Apellido": "Pérez", "inscripciones_Asesoria": [9, 21, 22], "Resenias": [{"Comentario": "La asesoría superó mis expectativas, el asesor respondió todas mis preguntas", "Puntuacion": 5}]},
    {"id": 10, "Nombre": "Marta", "Apellido": "Rodríguez", "inscripciones_Asesoria": [10, 23, 24],"Resenias": [{"Comentario": "La asesoría estuvo genial", "Puntuacion": 4}]}
]);

/*----------------------------------------------------------------------------------------------------------------------------------*/
