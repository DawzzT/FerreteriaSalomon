create database SCI

restore database SCI from disk='F:\SCI.bak'
with replace,
move 'SCI' to 'C:\Program Files\Microsoft SQL Server\MSSQL15.CCBB25\MSSQL\DATA\SCI.mdf',
move 'SCI_log' to 'C:\Program Files\Microsoft SQL Server\MSSQL15.CCBB25\MSSQL\DATA\SCI_log.ldf'

use SCI

create table Devolucion(
Id_Devolucion int identity(1,1) primary key not null,
FechaDevolucion datetime not null,
Id_Comprador int foreign key references Comprador(Id_Comprador) not null,
TotalDev float
)

create table Det_Devolucion(
Id_Devolucion int foreign key references Devolucion(Id_Devolucion) not null,
CodArt char(4) foreign key references Articulos(CodArt) not null,
Id_Pedido int foreign key references Pedidos(Id_Pedido) not null,
DetalleDev nvarchar(75) not null,
Cantdev int not null,
subtotaldev float 
primary key(Id_Devolucion, CodArt)
)


--Function subtotal
create function STP(@CodArt char(4),@cantP int)
returns float
as
begin
   declare @stp as float
   select @stp=precioA * @cantP from
   Articulos where CodArt=@CodArt
   return @stp
end

--Pedidos
create procedure NuevoPedido
@IDC char(5)
as
declare @idcomp as char(5)
set @idcomp=(select Id_Comprador from
Comprador where Id_Comprador=@IDC)
if(@idcomp=@IDC)
begin
  if(@IDC='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    insert into Pedidos values(getdate(),
    @IDC,0)
  end
end
else
begin
  print 'Comprador no registrado'
end


create trigger ActInvPedidos
on Det_Pedidos
after insert
as
  update Articulos set cantA=cantA - 
  (select cants from inserted)
  from Articulos a, Det_Pedidos dp
  where a.CodArt=dp.CodArt


  create procedure NDetPedidos
@IDP int,
@CA char(5),
@cp int
as
declare @idped int
set @idped=(select Id_Pedido from Pedidos where Id_Pedido=@IDP)
declare @coda as char(5)
set @coda=(select CodArt from Articulos where CodArt=@CA)
declare @exp as int
set @exp=(select cantA from Articulos where CodArt=@CA)
if(@idped=@IDP)
begin
  if(@CA='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@CA=@coda)
	begin
	  if(@cp<=@exp)
	  begin
	    insert into Det_Pedidos values(@IDP,@CA,@cp,dbo.STP(@CA,@cp))
	  end
	  else
	  begin
	    print 'Inventario insuficiente'
	  end
	end
	else
	begin
	  print 'Articulo no registrado'
	end
  end
end
else
begin
  print 'Pedido no registrado'
end


create procedure ActPedidos
@IDP int
as
declare @idped as int
set @idped=(select Id_Pedido from Pedidos where Id_Pedido=@IDP)
declare @stp as float
set @stp=(select sum(subtped) from Det_Pedidos where Id_Pedido=@IDP)
if(@IDP=@idped)
begin
  update Pedidos set TotalP=@stp where Id_Pedido=@IDP
end
else
begin
 print 'Pedido no encontrado'
end


--Devolucion

create procedure NuevaDevolucion
@IDC char(5)
as
declare @idcomp as char(5)
set @idcomp=(select Id_Comprador from
Comprador where Id_Comprador=@IDC)
if(@idcomp=@IDC)
begin
  if(@IDC='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    insert into Pedidos values(getdate(),
    @IDC,0)
  end
end
else
begin
  print 'Comprador no registrado'
end

create trigger ActInvDevolucion
on Det_Devolucion
after insert 
as
  update Articulos set cantA=cantA + 
  (select CantA from inserted)
  from Articulos a, Det_Devolucion dd
  where a.CodArt=dd.CodArt

  create procedure NDetDevoluciones
@IDD int,
@CA char(5),
@IDP int,
@DetDev nvarchar(75),
@cd int
as
declare @iddev int
set @iddev=(select Id_Devolucion from Devolucion where Id_Devolucion=@IDD)
declare @coda as char(5)
set @coda=(select CodArt from Articulos where CodArt=@CA)
declare @idped int
set @idped=(select Id_Pedido from Pedidos where Id_Pedido=@IDP)
declare @cantp as int
set @cantp=(select cants from Det_Pedidos where Id_Pedido=@IDP)
if(@iddev=@IDD or @idped=@IDP )
begin
  if(@CA='' or @DetDev='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@CA=@coda)
	begin
	  if(@cd<=@cantp)
	  begin
	    insert into Det_Devolucion values(@IDD,@CA,@IDP,@DetDev,@cd,dbo.STP(@CA,@cd))
	  end
	  else
	  begin
	    print 'Inventario insuficiente'
	  end
	end
	else
	begin
	  print 'Articulo no registrado'
	end
  end
end
else
begin
  print 'Pedido o Devolucion no registrado'
end


create procedure ActDevolucion
@IDD int
as
declare @iddev as int
set @iddev=(select Id_Devolucion from Devolucion where Id_Devolucion=@IDD)
declare @std as float
set @std=(select sum(subtotaldev) from Det_Devolucion where Id_Devolucion=@IDD)
if(@IDD=@iddev)
begin
  update Devolucion set TotalDev=@std where Id_Devolucion=@IDD
end
else
begin
 print 'Devolucion no encontrado'
end
