use FerreteriaSalomon


--Tablas temp para Productos
create table TempProd(
CodProd char(5) primary key not null,
NombreProd nvarchar(40) not null,
DescProd nvarchar(50) not null,
PrecioP float not null,
ExistP int not null,
EstadoProd bit default 1 not null,
Id_Prov int foreign key references Proveedor(Id_Prov) not null
)

alter TRIGGER StatusChangeProdTrigger
ON Productos
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempProd ON
 IF UPDATE(EstadoProd)
 BEGIN
	UPDATE Productos SET EstadoProd=0 WHERE CodProd=(SELECT CodProd FROM inserted);
	INSERT INTO TempProd (CodProd, NombreProd,DescProd,PrecioP,ExistP,EstadoProd,Id_Prov) (SELECT CodProd, NombreProd,DescProd,PrecioP,ExistP,EstadoProd,Id_Prov FROM deleted WHERE CodProd=deleted.CodProd);
 END;

 --Tablas temp para Clientes

 create table TempClientes(
 Id_Cliente int primary key identity(1,1) not null,
PNC nvarchar(15) not null,
SNC nvarchar(15),
PAC nvarchar(15) not null,
SAC nvarchar(15),
Id_Mun int foreign key references Municipios(Id_Mun) not null,
DirC nvarchar(70) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email nvarchar(50),
EstadoC bit default 1 not null
 )

 create TRIGGER StatusChangeClientesTrigger
ON Clientes
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempClientes ON
 IF UPDATE(EstadoC)
 BEGIN
	UPDATE Clientes SET EstadoC=0 WHERE Id_Cliente=(SELECT Id_Cliente FROM inserted);
	INSERT INTO TempClientes (Id_Cliente, PNC,SNC,PAC,SAC,Id_Mun,DirC,TelC,Email,EstadoC) (SELECT Id_Cliente, PNC,SNC,PAC,SAC,Id_Mun,DirC,TelC,Email,EstadoC FROM deleted WHERE Id_Cliente=deleted.Id_Cliente);
 END;

 --Tabla temp para Colaborador
 create table TempColab(
 Id_Colab int primary key identity(1,1) not null,
PNC nvarchar(15) not null,
SNC nvarchar(15),
PAC nvarchar(15) not null,
SAC nvarchar(15),
Id_Mun int foreign key references Municipios(Id_Mun) not null,
DirC nvarchar(70) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
EmailC nvarchar(50),
EstadoC bit default 1 not null,
ComisionVentas float
 )

create TRIGGER StatusChangeColabTrigger
ON Colaborador
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempColab ON
 IF UPDATE(EstadoC)
 BEGIN
	UPDATE Colaborador SET EstadoC=0 WHERE Id_Colab=(SELECT Id_Colab FROM inserted);
	INSERT INTO TempColab (Id_Colab, PNC,SNC,PAC,SAC,Id_Mun,DirC,TelC,EmailC,EstadoC,ComisionVentas) (SELECT Id_Colab, PNC,SNC,PAC,SAC,Id_Mun,DirC,TelC,EmailC,EstadoC,ComisionVentas FROM deleted WHERE Id_Colab=deleted.Id_Colab);
 END;

 --Tabla temp para Departamentos

 create table TempDptos(
 Id_Depto int identity(1,1) primary key not null,
NombreDepto nvarchar(35) not null,
EstadoD bit default 1
 )

create TRIGGER StatusChangeDptoTrigger
ON Departamentos
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempDpto ON
 IF UPDATE(EstadoD)
 BEGIN
	UPDATE Departamentos SET EstadoD=0 WHERE Id_Depto=(SELECT Id_Depto FROM inserted);
	INSERT INTO TempDptos(Id_Depto,NombreDepto,EstadoD) (SELECT Id_Depto,NombreDepto,EstadoD FROM deleted WHERE Id_Depto=deleted.Id_Depto);
 END;

 --Tabla temp para Municipios
 create table TempMun(
Id_Mun int identity(1,1) primary key not null,
NombreMun nvarchar(50) not null,
Id_Depto int foreign key references Departamentos(Id_Depto) not null,
EstadoM bit default 1
 )

create TRIGGER StatusChangeMunTrigger
ON Municipios
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempMun ON
 IF UPDATE(EstadoM)
 BEGIN
	UPDATE Municipios SET EstadoM=0 WHERE Id_Mun=(SELECT Id_Mun FROM inserted);
	INSERT INTO TempMun(Id_Mun,NombreMun,Id_Depto,EstadoM) (SELECT Id_Mun,NombreMun,Id_Depto,EstadoM FROM deleted WHERE Id_Mun=deleted.Id_Mun);
 END;

 --Tabla temp para Proveedor
create table TempProv(
Id_Prov int primary key identity(1,1) not null,
PNP nvarchar(15) not null,
SNP nvarchar(15),
PAP nvarchar(15) not null,
SAP nvarchar(15) not null,
DirProv nvarchar(70) not null,
TelP char(8) check(TelP like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email nvarchar(50),
Id_Mun int foreign key references Municipios(Id_Mun) not null,
EstadoProv bit default 1 not null
 )

create TRIGGER StatusChangeProvTrigger
ON Proveedor
 AFTER UPDATE AS 

 SET IDENTITY_INSERT TempProv ON
 IF UPDATE(EstadoProv)
 BEGIN
	UPDATE Proveedor SET EstadoProv=0 WHERE Id_Prov=(SELECT Id_Prov FROM inserted);
	INSERT INTO TempProv (Id_Prov, PNP,SNP,PAP,SAP,DirProv,TelP,Email,Id_Mun,EstadoProv) (SELECT Id_Prov, PNP,SNP,PAP,SAP,DirProv,TelP,Email,Id_Mun,EstadoProv FROM deleted WHERE Id_Prov=deleted.Id_Prov);
 END;