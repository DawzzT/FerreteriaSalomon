use FerreteriaSalomon

-- ALGEBRA RELACIONAL
-- OPERACIONES CONJUNTISTAS.
-- 1.- UNION
-- A: PROVEEDOR B: PRODUCTOS
-- A U B
select PNP, DirProv, TelP, Id_Mun, EstadoProv, CodProd,
NombreProd, DescProd, PrecioP, ExistP, EstadoProd from Proveedor
full join Productos on Proveedor.Id_Prov=Productos.Id_Prov

alter view UnionProvXProd as
select PNP,PAP, DirProv, TelP, Id_Mun, EstadoProv, CodProd,
NombreProd, DescProd, PrecioP, ExistP, EstadoProd from Proveedor
full join Productos on Proveedor.Id_Prov=Productos.Id_Prov

select * from UnionProvXProd

-- ALGEBRA RELACIONAL
-- OPERACIONES CONJUNTISTAS.
-- 1.- UNION
-- A: Ventas B: Clientes
-- A U B

select PNC,PAC, DirC, TelC, Id_Mun, EstadoC,Id_Venta,
FechaVenta,Ventas.Id_Cliente from Ventas full join Clientes on 
Clientes.Id_Cliente=Ventas.Id_Cliente

alter view UnionVentasXClients as
select PNC,PAC, DirC, TelC, Id_Mun, EstadoC,Id_Venta,
FechaVenta,Ventas.Id_Cliente from Ventas full join Clientes on 
Clientes.Id_Cliente=Ventas.Id_Cliente

select * from UnionVentasXClients

-- ALGEBRA RELACIONAL
-- OPERACIONES CONJUNTISTAS.
-- 1.- UNION
-- A: Compras B: Proveedor
-- A U B

select PNP, PAP, DirProv,Telp,Id_Mun, EstadoProv, Id_Compra,
FechaC, Compras.Id_Prov from Compras full join Proveedor on
Proveedor.Id_Prov=Compras.Id_Prov

create view UnionProvXCompras as
select PNP, PAP, DirProv,Telp,Id_Mun, EstadoProv, Id_Compra,
FechaC, Compras.Id_Prov from Compras full join Proveedor on
Proveedor.Id_Prov=Compras.Id_Prov

select * from UnionProvXCompras


