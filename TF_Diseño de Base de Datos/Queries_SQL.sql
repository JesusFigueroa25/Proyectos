--Nemberk
go
create procedure dbo.Insertar_usuario_UPC
(
@usuario_ID int,
@nombre varchar(250),
@apellido_usuario varchar(250),
@Usuario varchar(250),
@contrasenia varchar(250),
@Grado_id int
)
as
begin
insert into Usuario_UPC
(id_usuario, Nombre, Apellido, Usuario, Contrasenia, Grado_id)
Values(@usuario_ID,@nombre,@apellido_usuario,@Usuario,@contrasenia,@Grado_id)
End
go
Execute dbo.Insertar_usuario_UPC 16, 'Jesus', 'Torres', 'u212021208','123jesus@torres',11
Select * from Usuario_UPC
------------------------------------------------------------------------------------------
Use Base_de_datos_TB3
go
create procedure dbo.Insertar_Curso_UPC
(
@id int,
@nombre varchar(250),
@tema varchar(250)
)
as
begin
insert into Curso
(id_curso,Nombre,Tema)
Values(@id,@nombre,@tema)
End
go
Execute dbo.Insertar_Curso_UPC 32, 'Base de datos', 'SQL'
Select * from Curso
----------------------------------------------------------
go
create procedure dbo.Usuario_mayor_Asesorias
as
begin
SELECT *
FROM (select Usuario_UPC_id, count(Asesoria_id) Cantidad from Inscripcion_Asesoria I
group by Usuario_UPC_id) A 
where Cantidad = (select max(Cantidad)
from (select Usuario_UPC_id, count(Asesoria_id) Cantidad
from Inscripcion_Asesoria I
group by Usuario_UPC_id) A  );
End
go
Execute dbo.Usuario_mayor_Asesorias

--------------------------------------------------------------------
insert into Inscripcion_Asesoria
(Usuario_UPC_id,Asesoria_id)
Values(5,21)
Select * from Inscripcion_Asesoria
-----------------------------------------------------------------------
go
create procedure dbo.Insertar_registro_Asesoria
(@id_asesoria int,
@hora time,
@fecha date,
@monto int,
@usuario_id int,
@curso_id int)
as
begin
insert into Asesoria
(id_asesoria,Hora,Fecha,Monto,Usuario_UPC_id,Curso_id)
Values(@id_asesoria,@hora,@fecha,@monto,@usuario_id,@curso_id)
End
go
Execute dbo.Insertar_registro_Asesoria 22, '12:00:00', '2022-11-18',25, 6, 13
Select * from Asesoria

---------------------------------------
go
create procedure dbo.AsesoresXNota (@nota varchar(250))
as
begin
select Usuario_UPC_id Asesor,Nombre,Apellido,nota Nota_Asesoria from Calificacion C
	join Usuario_UPC U on C.Usuario_UPC_id=U.id_usuario
	where nota>@nota 
End
go
Execute dbo.AsesoresXNota 18

----------------------------------
go
create procedure dbo.AsesoriaXMonto (@monto int)
as
begin
select id_asesoria, Usuario_UPC_id,U.Nombre,Monto from Asesoria A
join Usuario_UPC U on A.Usuario_UPC_id=U.id_usuario
where Monto>@monto
End
go
Execute dbo.AsesoriaXMonto 30

-----------------------------------------------------------
go
create procedure dbo.ReseniaXAsesoria_asesor (@puntuacion int)
as
begin
select id_asesoria,Puntacion,id_usuario Asesor_id,
Nombre Nombre_Asesor,Apellido Apellido_Asesor,Comentario 
from Asesoria A
join Usuario_UPC U on id_usuario=Usuario_UPC_id
join Resenias C on  Asesoria_id=id_asesoria
where Puntacion>@puntuacion
End
go
Execute dbo.ReseniaXAsesoria_asesor 4
----------------------------------------------------------
--Thomas
CREATE PROCEDURE InsertarCalificacion
(
    @Usuario_UPC_id int,
    @Asesoria_id int,
    @Nota int
)
AS
BEGIN
    INSERT INTO Calificacion (Usuario_UPC_id, Asesoria_id, Nota)
    VALUES (@Usuario_UPC_id, @Asesoria_id, @Nota)
END
execute InsertarCalificacion 16,4,12
select * from Calificacion 

-----------------------------------------------
go
CREATE PROCEDURE ObtenerAsesoriasPorUsuario
(
    @Usuario_UPC_id int
)
AS
BEGIN
    SELECT A.*
    FROM Asesoria A
    WHERE A.Usuario_UPC_id = @Usuario_UPC_id
END
execute ObtenerAsesoriasPorUsuario 5

----------------------------------------------------------
go
CREATE PROCEDURE ObtenerCalificacionesPorAsesoria
(
    @Asesoria_id int
)
AS
BEGIN
    SELECT C.*
    FROM Calificacion C
    WHERE C.Asesoria_id = @Asesoria_id
END

execute ObtenerCalificacionesPorAsesoria 4
---------------------------------------------------------/*INTERMEDIO*/
go
CREATE PROCEDURE ObtenerCalificacionesPorAlumnoYAnio
(
    @Usuario_UPC_id int,
    @Anio date
)
AS
BEGIN
    SELECT C.Nota
    FROM Calificacion C
    INNER JOIN Asesoria A ON C.Asesoria_id = A.id_asesoria
    WHERE C.Usuario_UPC_id = @Usuario_UPC_id
    AND YEAR(A.Fecha) = @Anio
END
EXEC ObtenerCalificacionesPorAlumnoYAnio @Usuario_UPC_id = 4, @Anio = '2022';
select * from Asesoria
----------------------------------------------------------------
go
CREATE PROCEDURE CalcularPromedioCalificacionesPorAlumno
(
    @Usuario_UPC_id int,
    @PromedioCalificaciones decimal(10,2) OUTPUT
)
AS
BEGIN
    SELECT @PromedioCalificaciones = AVG(Nota)
    FROM Calificacion
    WHERE Usuario_UPC_id = @Usuario_UPC_id
END
DECLARE @Promedio decimal(10,2)
EXEC CalcularPromedioCalificacionesPorAlumno @Usuario_UPC_id = 1, @PromedioCalificaciones = @Promedio OUTPUT
SELECT @Promedio AS PromedioCalificaciones;
---------------------------------------------------------
--Ricaldi
CREATE PROCEDURE ActualizarAsesoriaVirtual
@AsesoriaID INT,
@Hora time,
@Fecha date,
@Monto int,
@id_usuario int,
@id_curso int
AS
BEGIN
    UPDATE Asesoria
    SET  Hora = @Hora, Fecha = @Fecha,Monto=@Monto,Usuario_UPC_id=@id_usuario
    WHERE id_asesoria = @AsesoriaID;
END;
execute ActualizarAsesoriaVirtual 1, '15:00:00','2022-11-05',20,5,13
select * from Asesoria

---------------------------------------------
go
CREATE PROCEDURE ObtenerAsesoriaVirtualPorID
@AsesoriaID INT
AS
BEGIN
    SELECT *
    FROM Asesoria
    WHERE id_asesoria = @AsesoriaID;
END;
execute ObtenerAsesoriaVirtualPorID 15
---------------------------------------------------------
go
CREATE PROCEDURE ObtenerAsesoriasXTipoCurso
@Curso VARCHAR(50)
AS
BEGIN
    SELECT id_asesoria,Curso_id,Nombre Nombre_Curso,Tema Tema_Curso FROM Asesoria A
	join Curso on Curso_id=id_curso
    WHERE id_curso = @Curso;
END;
execute ObtenerAsesoriasXTipoCurso 2

----------------------------------------





