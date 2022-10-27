use FerreteriaSalomon

--Procedimientos para Productos

--Incersion
create procedure NProd
@COP char(5),
@NP nvarchar(40),
@DP nvarchar(50),
@PP float,
@ExistProd int,
@IDP char(5)
as
declare @idprov as char(5) 
set @idprov = (select Id_Prov from Proveedor where Id_Prov=@IDP)
begin
if(@COP = '' or @NP ='' or @DP = '' or @IDP = '')
begin
 print 'No puede ser nulos'
end
else
begin
 if(@idprov = @IDP)
 begin
  insert into Productos values(@COP,@NP,@DP,@PP,@ExistProd,1,@IDP)
 end
 else
 begin
  print 'Proveedor no registrado'
 end
end
end

--Dar de baja
create procedure BProductos
@COP char(5)
as
declare @codp as int
set @codp=(select CodProd from Productos where CodProd=@COP)
if(@codp=@COP)
begin
  update Productos set EstadoProd=0 where CodProd=@COP
end
else
begin
  print 'Producto no encontrado'
end

--Actualizacion
create procedure ActProd
@COP char(5),
@DP nvarchar(50),
@PP float,
@ExistProd int
as
declare @codprod as char(5)
set @codprod = (select @codprod from Productos where CodProd=@COP)
if(@COP = '')
begin
 print 'No pueden ser nulos'
end
else
begin
 if(@codprod = @COP)
 begin
  update Productos set DescProd=@DP where CodProd=@COP
  update Productos set PrecioP=@PP where CodProd=@COP
  update Productos set ExistP=@ExistProd where CodProd=@COP
 end
 else
 begin
 print 'Producto no registrado'
 end
end

-- Busqueda
create procedure BuscarProd
@COP char(5)
as
declare @codprod as int
set @codprod=(select CodProd from Productos where CodProd=@COP)
if(@codprod=@COP)
begin
	select * from Productos where CodProd=@COP
end
else
begin
  print 'Producto no encontrado'
end

-- Lista
create procedure ListarProd
as
select * from Productos where EstadoProd=1


--Procedimientos para Venta 
--Incersion
create procedure NVenta
@IDC int
as
declare @idcliente as int
set @idcliente=(select Id_Cliente
from Clientes where Id_Cliente=@IDC)
if(@IDC='')
begin
 print 'No puede ser nulo'
end
else
begin
  if(@IDC=@idcliente)
  begin
    insert into Ventas values(
	getdate(),@IDC,0)
  end
  else
  begin
    print 'Cliente no registrado'
  end
end

--Actualizacion
create procedure ActV
@IDV int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas
where Id_Venta=@IDV)
declare @stp as float
set @stp=(select sum(subtv) from Det_Ventas
where Id_Venta=@IDV)
if(@idventa=@IDV)
begin
  update Ventas set TotalV=@stp where
  Id_Venta=@IDV
end
else
begin
  print 'Venta no registrada'
end


--Busqueda
create procedure BuscarVenta
@IDV int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
if(@idventa=@IDV)
begin
	select * from Ventas where Id_Venta=@IDV
end
else
begin
  print 'Venta no encontrada'
end

-- Lista
create procedure ListarV
as
select * from Ventas

--Procedimientos para Det_Ventas

--Funcion para calcular subtotal de ventas y trigger para actualizar inventario
create function CSTV(@COP int,@cv as int)
returns float
as
begin
  declare @stv as float
  select @stv=PrecioP * @cv
  from Productos where CodProd=@COP
  return @stv
end

create trigger ActINV
on
Det_Ventas
after insert
as
  update Productos set ExistP=ExistP-(select
  ExistP from inserted) from Productos p,
  Det_Ventas dv where p.CodProd= dv.CodProd

--Incersion
create procedure NDV
@IDV int,
@COP char(5),
@cv int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
declare @codProd as char(5)
set @codProd=(select CodProd from Productos where CodProd=@COP)
declare @exi as int
set @exi=(select ExistP from Productos where CodProd=@COP)
if(@idventa=@IDV)
begin
  if(@COP='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@COP=@codProd)
	begin
	  if(@cv<=@exi)
	  begin
	    insert into Det_Ventas values(
		@IDV,@COP,@cv,dbo.CSTV(@COP,@cv))
	  end
	  else
	  begin
	    print 'Inventario insufiente'
	  end
	end
	else
	begin
	  print 'Producto no registrado'
	end
  end
end
else
begin
  print 'Venta no registrada'
end

--Busqueda
create procedure BuscarDetVentas
@IDV int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
if(@idventa=@IDV)
begin
	select * from Det_Ventas where Id_Venta=@IDV
end
else
begin
  print 'Venta no encontrada'
end

-- Lista
create procedure ListarDetV
as
select * from Det_Ventas

--Procedimientos para Dev_Ventas
--Insercion
create procedure NDev_Ventas
@IDC int,
@IDV int
as
declare @idcliente as int
set @idcliente = (select Id_Cliente from Clientes where Id_Cliente=@IDC)
declare @idventa as int
set @idventa = (select Id_Venta from Ventas where Id_Venta=@IDV)
if(@idcliente=@IDC)
begin
 if(@idventa=@IDV)
 begin
  insert into Dev_Ventas values(getdate(),@IDC,@IDV,0)
 end
 else
 begin
  print 'Venta no registrada'
 end
end 
else
begin
 print 'Cliente no registrado'
end

--Actualizacion
alter procedure ActDevVentas
@IDDevV int
as
declare @iddevVentas as int
set @iddevVentas=(select Id_Dev from Dev_Ventas where Id_Dev=@IDDevV)
declare @stp as float
set @stp=(select sum(subtdev) from Det_DevVentas where Id_Dev=@IDDevV)
if(@iddevVentas=@IDDevV)
begin
  update Dev_Ventas set TotalDevPedidos=@stp where
  Id_Dev=@IDDevV
end
else
begin
  print 'Devolucion no registrada'
end

--Busqueda
create procedure BuscarDevVenta
@IDDevV int
as
declare @iddevVenta as int
set @iddevVenta=(select Id_Dev from Dev_Ventas where Id_Dev=@IDDevV)
if(@iddevVenta=@IDDevV)
begin
	select * from Dev_Ventas where Id_Dev=@IDDevV
end
else
begin
  print 'Devolucion no encontrada'
end

-- Lista
create procedure ListarDevV
as
select * from Dev_Ventas

--Procedimiento de Det_DevVentas
--Funcion para calcular subtotal de dev_ventas y trigger para actualizar inventario
create function CSTDevV(@COP int,@cv as int)
returns float
as
begin
  declare @stv as float
  select @stv=PrecioP * @cv
  from Productos where CodProd=@COP
  return @stv
end

create trigger ActINV
on
Det_DevVentas
after insert
as
  update Productos set ExistP=ExistP+(select
  ExistP from inserted) from Productos p,
 Det_DevVentas dv where p.CodProd= dv.CodProd

--Incersion
create procedure NDV
@IDV int,
@COP char(5),
@cv int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
declare @codProd as char(5)
set @codProd=(select CodProd from Productos where CodProd=@COP)
declare @exi as int
set @exi=(select ExistP from Productos where CodProd=@COP)
if(@idventa=@IDV)
begin
  if(@COP='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@COP=@codProd)
	begin
	  if(@cv<=@exi)
	  begin
	    insert into Det_Ventas values(
		@IDV,@COP,@cv,dbo.CSTV(@COP,@cv))
	  end
	  else
	  begin
	    print 'Inventario insufiente'
	  end
	end
	else
	begin
	  print 'Producto no registrado'
	end
  end
end
else
begin
  print 'Venta no registrada'
end

--Busqueda
create procedure BuscarDetVentas
@IDV int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
if(@idventa=@IDV)
begin
	select * from Det_Ventas where Id_Venta=@IDV
end
else
begin
  print 'Venta no encontrada'
end

-- Lista
create procedure ListarDetV
as
select * from Det_Ventas



backup database FerreteriaSalomon to disk='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FerreteriaSalomon.bak'