 create database TF_Finanzas_Ingenieria_Economica_Grupo5
 use  TF_Finanzas_Ingenieria_Economica_Grupo5
-- drop database TF_Finanzas_Ingenieria_Economica_Grupo5
-----------------------------------------------------------------------------
   
-- Table: AnualidadCronogramaPagos
CREATE TABLE AnualidadCronogramaPagos (
    ID int  NOT NULL IDENTITY,
    Cliente_ID int  NOT NULL,
    Credito_ID int  NOT NULL,
    Periodo int  NOT NULL,
    Cuota decimal(10,2)  NOT NULL,
    EstadoPago bit  NOT NULL,
    CONSTRAINT AnualidadCronogramaPagos_pk PRIMARY KEY  (ID)
);

-- Table: Cliente
CREATE TABLE Cliente (
    ID int  NOT NULL IDENTITY,
    DNI varchar(8)  NOT NULL,
    NombresCompletos varchar(50)  NOT NULL,
    Direccion varchar(50)  NOT NULL,
    Telefono varchar(9)  NOT NULL,
    Correo varchar(50)  NOT NULL,
    Saldo decimal(10,2)  NOT NULL,
    DiaPagoConfigurable int  NOT NULL,
    Contrasenia varchar(50)  NOT NULL,
    EstadoCliente bit  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY  (ID)
);

-- Table: CreditoValorFuturo
CREATE TABLE CreditoValorFuturo (
    ID int  NOT NULL IDENTITY,
    Credito_ID int  NOT NULL,
    ValorFuturo decimal(10,2)  NOT NULL,
    FechaPago date  NULL,
    EstadoPago bit  NOT NULL,
    CONSTRAINT CreditoValorFuturo_pk PRIMARY KEY  (ID)
);

-- Table: Creditos
CREATE TABLE Creditos (
    ID int  NOT NULL IDENTITY,
    Cliente_ID int  NOT NULL,
    Tienda_ID int  NOT NULL,
    TipoCredito varchar(50)  NOT NULL,
    MontoCredito decimal(10,2)  NOT NULL,
    Plazo int  NOT NULL,
    TEA decimal(10,2)  NOT NULL,
    TasaMora decimal(10,2)  NOT NULL,
    FechaCompra date  NOT NULL,
    FechaPago date  NULL,
    PagoFinal decimal(10,2)  NULL,
    Interes decimal(10,2)  NULL,
    TipoGracia varchar(50)  NULL,
    DiasGracia int  NOT NULL,
    EstadoPago bit  NOT NULL,
    CONSTRAINT Creditos_pk PRIMARY KEY  (ID)
);

-- Table: Tienda
CREATE TABLE Tienda (
    ID int  NOT NULL IDENTITY,
    Nombre varchar(50)  NOT NULL,
    RUC varchar(50)  NOT NULL,
    Telefono varchar(9)  NOT NULL,
    Correo varchar(50)  NOT NULL,
    Direccion varchar(50)  NOT NULL,
    Contrasenia varchar(50)  NOT NULL,
    CONSTRAINT Tienda_pk PRIMARY KEY  (ID)
);

-- Table: TiendaCliente
CREATE TABLE TiendaCliente (
    ID int  NOT NULL IDENTITY,
    Cliente_ID int  NOT NULL,
    Tienda_ID int  NOT NULL,
    NombresCliente varchar(50)  NOT NULL,
    EstadoCliente bit  NOT NULL,
    CONSTRAINT TiendaCliente_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: AnualidadCronogramaPagos_Cliente (table: AnualidadCronogramaPagos)
ALTER TABLE AnualidadCronogramaPagos ADD CONSTRAINT AnualidadCronogramaPagos_Cliente
    FOREIGN KEY (Cliente_ID)
    REFERENCES Cliente (ID);

-- Reference: AnualidadCronogramaPagos_Credito (table: AnualidadCronogramaPagos)
ALTER TABLE AnualidadCronogramaPagos ADD CONSTRAINT AnualidadCronogramaPagos_Credito
    FOREIGN KEY (Credito_ID)
    REFERENCES Creditos (ID);

-- Reference: Credito_Cliente (table: Creditos)
ALTER TABLE Creditos ADD CONSTRAINT Credito_Cliente
    FOREIGN KEY (Cliente_ID)
    REFERENCES Cliente (ID);

-- Reference: Credito_Tienda (table: Creditos)
ALTER TABLE Creditos ADD CONSTRAINT Credito_Tienda
    FOREIGN KEY (Tienda_ID)
    REFERENCES Tienda (ID);

-- Reference: Tienda_Cliente_Cliente (table: TiendaCliente)
ALTER TABLE TiendaCliente ADD CONSTRAINT Tienda_Cliente_Cliente
    FOREIGN KEY (Cliente_ID)
    REFERENCES Cliente (ID);

-- Reference: Tienda_Cliente_Tienda (table: TiendaCliente)
ALTER TABLE TiendaCliente ADD CONSTRAINT Tienda_Cliente_Tienda
    FOREIGN KEY (Tienda_ID)
    REFERENCES Tienda (ID);

-- Reference: ValorFuturo_Credito (table: CreditoValorFuturo)
ALTER TABLE CreditoValorFuturo ADD CONSTRAINT ValorFuturo_Credito
    FOREIGN KEY (Credito_ID)
    REFERENCES Creditos (ID);

-- End of file.
 ----------------------------------------------------------------------------
--REGISTRO

INSERT INTO Cliente (Dni, NombresCompletos, Direccion,Telefono ,Correo ,Saldo,DiaPagoConfigurable,Contrasenia, EstadoCliente ) 
VALUES
('61123987', 'Keo Franck Luis Pozo Coras ','San Miguel, Lima, Peru' , '987987654', 'u202120258@upc.edu.pe',10000 ,30,'user',  1 ),
('71234567', 'Aldair Farroñan Cruz	     ','San Miguel, Lima, Peru' , '987789012', 'u202120789@upc.edu.pe',10000 ,30,'user',  1 ),
('61198765', 'Jefferson Cabrera Camizan  ','San Miguel, Lima, Peru'      , '987345678', 'u202120375@upc.edu.pe',10000 ,30,'user',  1 ),
('61164069', 'Jara Figueroa Nemberk Jesus','Comas, Lima, Peru'		, '995361755', 'u202120738@upc.edu.pe',10000 ,30,'user',  1 ),
('71248783', 'Niels Ygdaly Caballero Balladares  ','Carabayllo, Lima, Peru'      , '987123456', 'u202120752@upc.edu.pe',10000 ,30,'user',  1 ),
('61564060', 'Elian Salvador Vivanco Chavez','San Miguel, Lima, Peru' , '987654321', 'u202120739@upc.edu.pe',10000 ,30,'user',  1 );
 select * from Cliente

INSERT INTO Tienda(Nombre, RUC, Telefono,Correo,Direccion,Contrasenia ) 
VALUES
('Tienda UPESHE',  '785123', '978658132' , 'upeche@gmail.com',     'Lima, San Miguel','admin'   ),
('Tienda Financiero','756841', '945682129','FinanzasTienda@gmail.com','Lima, San Miguel','admin' ),
('Tienda Barrio','789456', '987465798','Barrio123@gmail.com','Lima, San Miguel','admin' ),
('Tienda Comelon', '758961', '945612478' , 'comeloncito@gmail.com',  'Lima, San Miguel','admin'    );
select * from Tienda  

INSERT INTO TiendaCliente(Cliente_ID,Tienda_ID,NombresCliente,EstadoCliente) 
VALUES
(1,1,'Keo Franck Luis Pozo Coras ',1),
(2,1,'Aldair Farroñan Cruz ',1),
(3,1,'Jefferson Cabrera Camizan      ',1),
(4,1,'Jara Figueroa Nemberk Jesus',1),
(5,3,'Niels Ygdaly Caballero Balladares  ',1),
(6,3,'Elian Salvador Vivanco Chavez',1);
select * from TiendaCliente 
select * from CreditoValorFuturo 
select * from Creditos 
select * from AnualidadCronogramaPagos 
select * from Cliente 
select * from Tienda 
select * from TiendaCliente 




