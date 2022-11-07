--Procedimientos para Proveedor

--Incersion
create procedure NProv
@PNP nvarchar(15),
@SNP nvarchar(15),
@PAP nvarchar(15),
@SAP nvarchar(15),
@DP nvarchar(70),
@TP char(8),
@EP nvarchar(50),
@IDM int,
@EstadoP bit
as
declare @pdt as char(1)
set @pdt=(select substring(@TP,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
if(@PNP='' or @PAP='' or @DP='' or @TP='' or @IDM = '' or @EstadoP = '')
begin
 print 'No pueden quedar en blanco'
end
else
	begin
	  if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
	  begin
	    if(@IDM=@idmun)
		begin
		   insert into Proveedor values(@PNP,@SNP,@PAP,@SAP,@DP,@TP,@EP,@IDM,1)
		end
		else
		begin
		  print 'Municipio no registrado'
		end
	  end
	  else
	  begin
	     print 'Debe iniciar con 2, 5, 7 u 8'
	  end
	end

--Dar de baja
create procedure BProv
@IDP int
as
declare @idprov as int
set @idprov=(select Id_Prov from Proveedor where Id_Prov=@IDP)
if(@idprov=@IDP)
begin
  update Proveedor set EstadoProv=0 where Id_Prov=@IDP
end
else
begin
  print 'Proveedor no encontrado'
end

--Actualizacion
create procedure ActProv
@IDP int,
@DP nvarchar(70),
@TP char(8),
@EmailP nvarchar(50),
@IDM int
as
declare @idprov as int
set @idprov=(select Id_Prov from Proveedor where Id_Prov=@IDP)
declare @pdt as char(1)
set @pdt=(select substring(@TP,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
declare @ep as bit
set @ep=(select EstadoProv from Proveedor where Id_Prov=@IDP)
begin
 if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
 begin
  if(@idmun=@IDM)
  begin
    if(@idprov=@IDP)
	begin
	 if(@ep=1)
	 begin
	  update Proveedor set DirProv = @DP  where Id_Prov=@IDP
	  update Proveedor set TelP=@TP where Id_Prov=@IDP
	  update Proveedor set Id_Mun=@IDM where Id_Prov=@IDP
	  update Proveedor set Email=@EmailP where Id_Prov=@IDP
	 end
	 else
	 begin
	  print 'Proveedor inactivo'
	 end
	end
	else
	begin
	 print 'Proveedor no registrado'
	end
  end
  else
  begin
   print 'Municipio no registrado'
  end
 end
 else
 begin 
  print'Debe comenzar por 2,5,7,8'
 end
end

--Busqueda
create procedure BuscarProv
@IDP int
as
declare @idprov as int
set @idprov=(select Id_Prov from Proveedor where Id_Prov=@IDP)
if(@IDP = '')
begin
 print 'No puede ser nulo'
end
else
begin
if(@idprov=@IDP)
begin
	select * from Proveedor where Id_Prov=@IDP
end
else
begin
  print 'Proveedor no encontrado'
end
end


-- Lista
create procedure ListarP
as
select * from Proveedor where EstadoProv=1

--Procedimientos para Compras

--Incersion
create procedure NCompra
@IDP char(5)
as 
declare @idprov as int
set @idprov=(select Id_Prov from Proveedor where Id_Prov=@IDP)
if(@IDP='')
begin 
	print 'No puede ser nulo'
end
else
begin 
		if(@IDP=@idprov)
		begin 
			insert into Compras values(getdate(),@IDP,0)
		end 
		else
		begin
			print 'Proveedor no registrado'
		end
	end

--Busqueda
create procedure BCompra
@IDC int
as
declare @idcomp as int
set @idcomp=(select Id_Compra from Compras where Id_Compra=@IDC)
if(@IDC = '')
begin
 print 'No puede ser nulo'
end
else
begin
if(@idcomp=@IDC)
begin
	select * from Compras where Id_Compra=@IDC
end
else
begin
  print 'Compra no encontrado'
end
end


-- Lista
create procedure ListarComp
as
select * from Compras 


--Procedimientos para Det_Compras

--Incersion
create Procedure NDC
@IDC int,
@COP  char(5),
@Cantc int,
@PrecioC float
as
declare @idcomp as char(5)
set @idcomp=(select Id_Compra from Compras where Id_Compra=@IDC)
declare @codprod as char(5)
set @codprod=(select CodProd from Productos where CodProd=@COP)
if(@Cantc<=0 or @PrecioC<=0 )
begin
	print 'No pueden ser 0 o Menores'
end 
else
begin
	if(@idcomp=@IDC)
	begin
		insert into Det_Compras values (@IDC,@COP,@Cantc,@PrecioC,dbo.CSTC(@COP,@Cantc))
	 end
	 else
	 begin 
		print 'Compra no registrada'
	 end
end

--Busqueda
create procedure BuscarDetC
@IDC int
as
declare @idcomp as int
set @idcomp=(select Id_Compra from Compras where Id_Compra=@IDC)
if(@idcomp=@IDC)
begin
	select * from Det_Compras where Id_Compra=@IDC
end
else
begin
  print 'Compra no encontrada'
end

--Lista
create procedure ListarDetC
as
select * from Det_Compras

create trigger ActInvC
on Det_Compras
after insert
as
update Productos set ExistP=ExistP+(select cantc from insertered)
from Productos p, Det_Compras dc where p.CodProd=dc.CodProd

create function CSTC(@COP int,@cc as int)
returns float
as
begin
  declare @stc as float
  select @stc=PrecioP * @cc
  from Productos where CodProd=@COP
  return @stc
end