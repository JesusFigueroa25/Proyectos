db.createCollection(
    "Colecctions_Asesoria",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                description: "Documento",
                required: ["id", "Fecha","Hora", "Monto", "id_Asesor_Usuario"],
                properties: {
                    "id": {
                        bsonType: "int",
                        description: "El id debe ser un int y es obligatorio"
                    },
                    "Fecha": {
                        bsonType: "date",
                        description: "La Fecha debe ser date y es obligatorio"
                    },
                    "Hora": {
                        bsonType: "date",
                        description: "La Hora debe ser date y es obligatorio"
                    },
                    "Monto": {
                        bsonType: "int",
                        description: "El monto debe ser una int y es obligatorio"
                    },
                    "id_Asesor_Usuario": {
                        bsonType: "int",
                        description: "El id_Asesor debe ser un int y es obligatorio"
                    },
                    "Curso": {
                        bsonType: "object",
                        description: "El campo es un objeto y es obligatorio",
                        required: ["Nombre","Tema"],
                    },
                    "Calificacion": {
                        bsonType: "array",
                        description: "El campo es un arreglo y es obligatorio",
                        items : {
                            bsonType: "object",
                            required: ["Nota"]
                        }
                    }
                }
            }
        }
    }
);
 
/*Collection 2*/
db.createCollection(
    "Colecctions_Grado",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                description: "Documento",
                required: ["id", "Nombre"],
                properties:
                {
                    "id": {
                        bsonType: "int",
                        description: "El id debe ser un int y es obligatorio"
                    },
                    "Nombre": {
                        bsonType: "string",
                        description: "El nombre debe ser una cadena y es obligatorio"
                    },
                    "Curso": {
                        bsonType: "array",
                        description: "El campo es un arreglo y es obligatorio",
                        items : {
                            bsonType: "object",
                            required: ["Nombre","Tema"]
                        }
                    }
                }
            }
        }
    }
);
/*Collection 3 */
db.createCollection(
    "Colecctions_Usuario_UPC",
    {
        validator:
        {
            $jsonSchema: {
                bsonType: "object",
                required: ["id", "Nombre", "Apellido"],
                properties: {
                    "id": {
                        bsonType: "int",
                        description: "El id debe ser un int y es obligatorio"
                    },
                    "Nombre": {
                        bsonType: "string",
                        description: "El nombre debe ser una cadena y es obligatorio"
                    },
                    "Apellido": {
                        bsonType: "string",
                        description: "El apellido debe ser una cadena y es obligatorio"
                    },
                    
                    "inscripciones_Asesoria": {
                        bsonType: "array",
                        description: "El campo es un arreglo y es obligatorio",
                        items : {
                            bsonType: "int",
                        }
                    },
                    "Resenias": {
                        bsonType: "array",
                        description: "El campo es un arreglo y es obligatorio",
                        items : {
                            bsonType: "object",
                            required: ["Comentario","Puntuacion"]
                        }
                    }
                }
            }
        }
    }
);
