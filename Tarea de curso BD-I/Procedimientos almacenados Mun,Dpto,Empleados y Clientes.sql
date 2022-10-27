--Procedimientos database Ferrteria Salomon

use FerreteriaSalomon

--Procedimientos para Departamentos

--Insercion
create procedure NuevoDpto
@ND nvarchar(35)
as
declare @nomd as nvarchar(35)
set @nomd=(select NombreDepto from Departamentos where NombreDepto=@ND)
if(@ND='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@nomd=@ND)
  begin
    print 'Departamento ya registrado'
  end
  else
  begin
    insert into Departamentos values(@ND)
  end
end

-- Dar de baja
alter table Departamentos add EstadoD bit default 1
update Departamentos set EstadoD=1 

create procedure BDpto
@ID int
as
declare @iddept as int
set @iddept=(select Id_Depto from Departamentos where Id_Depto=@ID)
if(@iddept=@ID)
begin
  update Departamentos set EstadoD=0 where Id_Depto=@ID
end
else
begin
  print 'Departamento no encontrado'
end

-- Actualizacion
create procedure ActDpto
@ID int,
@ND nvarchar(35)
as
declare @idd as int
set @idd=(select Id_Depto from Departamentos where Id_Depto=@ID)
declare @nde as nvarchar(35)
set @nde=(select NombreDepto from Departamentos where NombreDepto=@ND)
declare @ed as bit
set @ed=(select EstadoD from Departamentos where Id_Depto=@ID)
if(@ND='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@idd=@ID)
  begin
    if(@ND=@nde)
	begin
	  print 'Departamento no puede duplicarse'
	end
	else
	begin
	  if(@ed=1)
	  begin
	  update Departamentos set NombreDepto=@ND where Id_Depto=@ID
	  end
	  else
	  begin
	    print 'Departamento inactivo'
	  end
	end
  end
  else
  begin
    print 'Departamento no registrado'
  end
end

select * from Departamentos

-- Busqueda
create procedure BuscarDpto
@ID int
as
declare @idde as int
set @idde=(select Id_Depto from Departamentos where Id_Depto=@ID)
if(@idde=@ID)
begin
  select * from Departamentos where Id_Depto=@ID
end
else
begin
  print 'Dpto no encontrado'
end

-- Lista
create procedure ListarD
as
select * from Departamentos where EstadoD=1

--Procedimientos para Municipios

--Insercion
create procedure NuevoM
@NM nvarchar(50),
@IDD int
as
declare @iddept as int
set @iddept=(select Id_Depto from Departamentos where Id_Depto=@IDD)
if(@NM='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@IDD=@iddept)
  begin
    insert into Municipios values(@NM,@IDD,1)
  end
  else
  begin
     print 'Municipio no registrado'
  end
end

--Dar de baja
alter table Municipios add EstadoM bit default 1
update Municipios set EstadoM=1 

create procedure BMuni
@ID int
as
declare @idmuni as int
set @idmuni=(select Id_Mun from Municipios where Id_Mun=@ID)
if(@idmuni=@ID)
begin
  update Municipios set EstadoM=0 where Id_Mun=@ID
end
else
begin
  print 'Municipio no encontrado'
end

--Actualizacion Municipio
create procedure ActMuni
@ID int,
@NM nvarchar(35)
as
declare @idd as int
set @idd=(select Id_Mun from Municipios where Id_Mun=@ID)
declare @nmun as nvarchar(35)
set @nmun=(select NombreMun from Municipios where NombreMun=@NM)
declare @ed as bit
set @ed=(select EstadoM from Municipios where Id_Mun=@ID)
if(@NM='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@idd=@ID)
  begin
    if(@NM=@nmun)
	begin
	  print 'Municipio no puede duplicarse'
	end
	else
	begin
	  if(@ed=1)
	  begin
	  update Municipios set NombreMun=@NM where Id_Mun=@ID
	  end
	  else
	  begin
	    print 'Municipio inactivo'
	  end
	end
  end
  else
  begin
    print 'Municipio no registrado'
  end
end

-- Busqueda
create procedure BuscarMuni
@ID int
as
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@ID)
if(@idmun=@ID)
begin
  select * from Municipios where Id_Mun=@ID
end
else
begin
  print 'Municipio no encontrado'
end

-- Lista
create procedure ListarM
as
select * from Municipios where EstadoM=1

--Procedimientos para Colaborador

--Insercion
create procedure NColab
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@IDM int,
@DC nvarchar(70),
@TC char(8),
@EC nvarchar(50),
@CVC float
as
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
begin
  if(@PNC='' or @PAC='' or @IDM='' or @DC='' or @TC='')
  begin
    print 'No pueden ser nulos'
  end
  else
  begin
     if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
	 begin
	   if(@idmun=@IDM)
	   begin
	   if(@CVC >= 0)

	      insert into Empleados values(@PNC,@SNC,@PAC,@SAC,@IDM,@DC,@TC,@EC,1,@CVC)
	   end
	   else
	   begin
	     print 'Municipio no registrado'
	   end
	 end
	 else
	 begin
	   print 'Debe iniciar con 2,5,7 u 8'
	 end
  end
end

--Dar de baja
create procedure BColab
@IDC int
as
declare @idcolab as int
set @idcolab=(select Id_Colab from Colaborador where Id_Colab=@IDC)
if(@idcolab=@IDC)
begin
  update Colaborador set EstadoC=0 where Id_Colab=@IDC
end
else
begin
  print 'Colaborador no encontrado'
end

--Actualizacion
create procedure ActColab
@IDC int,
@IDM int,
@TC char(8),
@DC nvarchar(50),
@EmailC nvarchar(60)
as
declare @idcolab as int
set @idcolab=(select Id_Colab from Colaborador where  Id_Colab=@IDC)
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
declare @ec as bit
set @ec=(select EstadoC from Colaborador where Id_Colab=@IDC)
begin
 if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
 begin
  if(@idmun=@IDM)
  begin
    if(@idcolab=@IDC)
	begin
	 if(@ec=1)
	 begin
	  update Colaborador set @DC=@DC where Id_Colab=@IDC
	  update Colaborador set @TC=@TC where Id_Colab=@IDC
	  update Colaborador set @EmailC=@EmailC where Id_Colab=@IDC
	 end
	 else
	 begin
	  print 'Colaborador inactivo'
	 end
	end
	else
	begin
	 print 'Colaborador no registrado'
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
create procedure BuscarColab
@IDC int
as
declare @idcolab as int
set @idcolab=(select Id_Colab from Colaborador where Id_Colab=@IDC)
if(@idcolab=@IDC)
begin
	select * from Colaborador where Id_Colab=@IDC
end
else
begin
  print 'Colaborador no encontrado'
end

-- Lista
create procedure ListarC
as
select * from Colaborador where EstadoC=1

--Procedimientos para Clientes

--Insercion 
create procedure NCliente
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@IDM int,
@DC nvarchar(70),
@TC char(8),
@EC nvarchar(50)
as
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
begin
  if(@PNC='' or @PAC='' or @IDM='' or @DC='' or @TC='')
  begin
    print 'No pueden ser nulos'
  end
  else
  begin
     if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
	 begin
	   if(@idmun=@IDM)
	   begin
	      insert into Clientes values(@PNC,@SNC,@PAC,@SAC,@IDM,@TC,@DC,@EC,1)
	   end
	   else
	   begin
	     print 'Municipio no registrado'
	   end
	 end
	 else
	 begin
	   print 'Debe iniciar con 2,5,7 u 8'
	 end
  end
end

--Dar de baja
create procedure BCliente
@IDC int
as
declare @idcomp as int
set @idcomp=(select Id_Cliente from Clientes where Id_Cliente=@IDC)
if(@idcomp=@IDC)
begin
  update Clientes set EstadoC=0 where Id_Cliente=@IDC
end
else
begin
  print 'Cliente no encontrado'
end

--Actualizacion
create procedure ActCliente
@IDC int,
@IDM int,
@DC nvarchar(70),
@TC char(8),
@EmailC nvarchar(50)
as
declare @idcomp as int
set @idcomp=(select Id_Cliente from Clientes where  Id_Cliente=@IDC)
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idmun as int
set @idmun=(select Id_Mun from Municipios where Id_Mun=@IDM)
declare @ec as bit
set @ec=(select EstadoC from Clientes where Id_Cliente=@IDC)
begin
 if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
 begin
  if(@idmun=@IDM)
  begin
    if(@idcomp=@IDC)
	begin
	 if(@ec=1)
	 begin
	  update Clientes set DirC=@DC where Id_Cliente=@IDC
	  update Clientes set TelC=@TC where Id_Cliente=@IDC
	  update Clientes set Email=@EmailC where Id_Cliente=@IDC
	 end
	 else
	 begin
	  print 'Cliente inactivo'
	 end
	end
	else
	begin
	 print 'Cliente no registrado'
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

-- Busqueda
create procedure BuscarCliente
@IDC int
as
declare @idcomp as int
set @idcomp=(select Id_Cliente from Clientes where Id_Cliente=@IDC)
if(@idcomp=@IDC)
begin
	select * from Clientes where Id_Cliente=@IDC
end
else
begin
  print 'Cliente no encontrado'
end

-- Lista
create procedure ListarC
as
select * from Clientes where EstadoC=1