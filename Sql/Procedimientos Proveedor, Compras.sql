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