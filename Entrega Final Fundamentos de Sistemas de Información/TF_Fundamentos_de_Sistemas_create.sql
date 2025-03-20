 Create database TF_Fundamentos_Sistemas_Informacion
 Use TF_Fundamentos_Sistemas_Informacion
-- Table: Cliente
CREATE TABLE Cliente (
    ClienteID int  NOT NULL IDENTITY,
    Dni nvarchar(8)  NOT NULL,
    Nombre nvarchar(20)  NOT NULL,
    Apellido nvarchar(20)  NOT NULL,
    Direccion nvarchar(50)  NOT NULL,
    Telefono nvarchar(9)  NOT NULL,
    Tipo_Cliente nvarchar(50)  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY  (ClienteID)
);

-- Table: Cuenta
CREATE TABLE Cuenta (
    CuentaID int  NOT NULL IDENTITY,
    ClienteID int  NOT NULL,
    Sucursal_ID int  NOT NULL,
    Saldo decimal(10,4)  NOT NULL,
    FechaApertura date  NOT NULL,
    Tipo_Cuenta nvarchar(50)  NOT NULL,
    CONSTRAINT Cuenta_pk PRIMARY KEY  (CuentaID)
);

-- Table: Empleado
CREATE TABLE Empleado (
    EmpleadoID int  NOT NULL IDENTITY,
    Sucursal_ID int  NOT NULL,
    Nombre nvarchar(30)  NOT NULL,
    Apellido nvarchar(30)  NOT NULL,
    Cargo nvarchar(30)  NOT NULL,
    CONSTRAINT Empleado_pk PRIMARY KEY  (EmpleadoID)
);

-- Table: SolicitudPrestamo
CREATE TABLE SolicitudPrestamo (
    SolicitudID int  NOT NULL IDENTITY,
    MontoSolicitado decimal(10,2)  NOT NULL,
    TasaInteres decimal(10,2)  NOT NULL,
    FechaSolicitud date  NOT NULL,
    EmpleadoID int  NOT NULL,
    CuentaID int  NOT NULL,
    CONSTRAINT SolicitudPrestamo_pk PRIMARY KEY  (SolicitudID)
);

-- Table: Sucursal
CREATE TABLE Sucursal (
    ID int  NOT NULL IDENTITY,
    Ubicacion nvarchar(20)  NOT NULL,
    Telefono nvarchar(9)  NOT NULL,
    CONSTRAINT Sucursal_pk PRIMARY KEY  (ID)
);

-- Table: Transacciones
CREATE TABLE Transacciones (
    TransaccionID int  NOT NULL IDENTITY,
    Fecha date  NOT NULL,
    Monto decimal(10,4)  NOT NULL,
    CuentaID int  NOT NULL,
    Tipo_Transaccion nvarchar(50)  NOT NULL,
    CONSTRAINT Transacciones_pk PRIMARY KEY  (TransaccionID)
);

-- foreign keys
-- Reference: Cuenta_Cliente (table: Cuenta)
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_Cliente
    FOREIGN KEY (ClienteID)
    REFERENCES Cliente (ClienteID);

-- Reference: Cuenta_Sucursal (table: Cuenta)
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_Sucursal
    FOREIGN KEY (Sucursal_ID)
    REFERENCES Sucursal (ID);

-- Reference: Empleado_Sucursal (table: Empleado)
ALTER TABLE Empleado ADD CONSTRAINT Empleado_Sucursal
    FOREIGN KEY (Sucursal_ID)
    REFERENCES Sucursal (ID);

-- Reference: SolicitudPrestamo_Cuenta (table: SolicitudPrestamo)
ALTER TABLE SolicitudPrestamo ADD CONSTRAINT SolicitudPrestamo_Cuenta
    FOREIGN KEY (CuentaID)
    REFERENCES Cuenta (CuentaID);

-- Reference: SolicitudPrestamo_Empleado (table: SolicitudPrestamo)
ALTER TABLE SolicitudPrestamo ADD CONSTRAINT SolicitudPrestamo_Empleado
    FOREIGN KEY (EmpleadoID)
    REFERENCES Empleado (EmpleadoID);

-- Reference: Transacciones_Cuenta (table: Transacciones)
ALTER TABLE Transacciones ADD CONSTRAINT Transacciones_Cuenta
    FOREIGN KEY (CuentaID)
    REFERENCES Cuenta (CuentaID);

-- End of file.

INSERT INTO Cliente (Dni, Nombre, Apellido, Direccion, Telefono, Tipo_Cliente) 
VALUES
('61164069', 'Juan', 'Perez', 'San Miguel, Lima, Peru', '987654321', 'Empresarial'),
('71248783', 'Maria', 'Gomez', 'Comas, Lima, Peru', '987123456', 'Inversionista'),
('61123987', 'Carlos', 'Lopez', 'Chorrillos, Lima, Peru', '987987654', 'Pensionado'),
('71234567', 'Ana', 'Martinez', 'San Isidro, Lima, Peru', '987789012', 'Estudiante'),
('61198765', 'Laura', 'Rodriguez', 'Lince, Lima, Peru', '987345678', 'Empresarial');

INSERT INTO Sucursal (Ubicacion, Telefono)
VALUES
('San Isidro', '995361758'),
('Chorrillos', '912345678'),
('Comas', '987654321'),
('San Miguel', '998765432'),
('Lince', '912345678'),
('Miraflores', '987654321'),
('Barranco', '995361758'),
('Surco', '912345678'),
('La Molina', '987654321'),
('Jesús María', '995361758');

INSERT INTO Empleado (Sucursal_ID, Nombre, Apellido, Cargo) 
VALUES
(1, 'Carlos', 'Gutierrez', 'Gerente'),
(2, 'Ana', 'Rodriguez', 'Cajero'),
(3, 'Pedro', 'Lopez', 'Asesor Comercial'),
(4, 'María', 'Fernández', 'Cajero');

INSERT INTO Cuenta (ClienteID, Sucursal_ID, Saldo, FechaApertura, Tipo_Cuenta) 
VALUES
(1, 1, 1500.00, '2023-11-16', 'Cuenta de Ahorro'),
(2, 2, 2500.00, '2023-11-16', 'Cuenta Corriente'),
(3, 3, 1800.00, '2023-11-16', 'Cuenta de Ahorro'),
(4, 4, 2000.00, '2023-11-16', 'Cuenta Corriente'),
(5, 5, 3000.00, '2023-11-16', 'Cuenta de Ahorro');

INSERT INTO SolicitudPrestamo (MontoSolicitado, TasaInteres, FechaSolicitud, EmpleadoID,CuentaID) 
VALUES
(5000.00, 0.05, '2023-08-16', 1, 1),
(8000.00, 0.08, '2023-11-16', 3, 3),
(10000.00, 0.07, '2023-10-13', 4, 4),
(12000.00, 0.06, '2023-11-15', 2, 2),
(6000.00, 0.09, '2022-12-14', 5, 5);

INSERT INTO Transacciones (Fecha, Monto,CuentaID, Tipo_Transaccion) 
VALUES
('2023-11-16', 500.00, 1, 'Deposito'),
('2023-11-17', 200.00, 2, 'Retiro'),
('2023-11-18', 1000.00, 3, 'Transferencia'),
('2023-11-19', 150.00, 4, 'Deposito'),
('2023-11-20', 300.00, 5, 'Retiro');
 
 select * from Cuenta