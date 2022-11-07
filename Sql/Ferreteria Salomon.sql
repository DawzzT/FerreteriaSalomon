create database FerreteriaSalomon 

use FerreteriaSalomon

create table Departamentos(
Id_Depto int identity(1,1) primary key not null,
NombreDepto nvarchar(35) not null
)

create table Municipios(
Id_Mun int identity(1,1) primary key not null,
NombreMun nvarchar(50) not null,
Id_Depto int foreign key references Departamentos(Id_Depto) not null
)

create table Clientes(
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

create table Colaborador(
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

create table Proveedor(
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

create table Productos(
CodProd char(5) primary key not null,
NombreProd nvarchar(40) not null,
DescProd nvarchar(50) not null,
PrecioP float not null,
ExistP int not null,
EstadoProd bit default 1 not null,
Id_Prov int foreign key references Proveedor(Id_Prov) not null
)

create table Ventas(
Id_Venta int identity(1,1) primary key not null,
FechaVenta datetime default getdate() not null,
Id_Cliente int foreign key references Clientes(Id_Cliente) not null,
TotalV float
)

create table Det_Ventas(
Id_Venta int foreign key references Ventas(Id_Venta) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
cantv int not null,
subtv float,
primary key(Id_Venta,CodProd)
)

create table Dev_Ventas(
Id_Dev int primary key identity(1,1) not null,
Fecha_Dev datetime default getdate() NOT NULL,
Id_Cliente int foreign key references Clientes(Id_Cliente) not null,
Id_Venta int foreign key references Ventas(Id_Venta) not null,
TotalDevVentas float 
)

create table Det_DevVentas(
Id_Dev int foreign key references Dev_Ventas(Id_Dev) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
cantdev int not null,
subtdev float
primary key(Id_Dev,CodProd)
)

create table Compras(
Id_Compra int primary key identity(1,1) not null,
FechaC datetime not null,
Id_Prov int foreign key references Proveedor(Id_Prov) not null,
TotalC float
)

Create table Det_Compras(
Id_Compra int foreign key references Compras(Id_Compra) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
cantc int not null,
precioc float not null,
subtc float,
primary key(Id_Compra,CodProd)
)

create table Dev_Compra(
Id_DevC int primary key identity(1,1) not null,
FechaDev datetime default getdate() NOT NULL,
Id_Prov int foreign key references Proveedor(Id_Prov) not null,
Id_Compra int foreign key references Compras(Id_Compra) not null,
TotalDevCompras float
)

create table Det_DevC(
Id_DevC int foreign key references Dev_Compra(Id_DevC) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
cantdevC int not null,
subtdevC float
primary key(Id_DevC,CodProd)
)
