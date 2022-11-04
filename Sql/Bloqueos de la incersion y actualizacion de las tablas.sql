use FerreteriaSalomon


--2
--No econtramos una forma exacta para lograr bloquear los dos usuarios cuando intentan acceder a la misma tabla, opciones como "lock table" no estan disponibles en 
--SQL server, segun las documentaciones revisadas SQL Server se encarga automaticamente de la simulteniedad, solo pudimos cambiar algunos parametros

--2.1 Nivel de aislamiento de transacciones Controla el comportamiento de bloqueo y control de versiones de filas de las instrucciones Transact-SQL emitidas por una conexión a SQL Server.
--Rango SERIALIZABLE
--Las declaraciones no pueden leer datos que hayan sido modificados pero aún no confirmados por otras transacciones.
--Ninguna otra transacción puede modificar los datos leídos por la transacción actual hasta que se complete la transacción actual.
--Otras transacciones no pueden insertar nuevas filas con valores de clave que se encontrarían en el rango de claves leídas por cualquier declaración en la transacción actual hasta que se complete la transacción actual.

set transaction isolation level serializable

--2.2 Prioridad de DeadLock especifica la importancia relativa de que la sesión actual continúe procesando si está bloqueada con otra sesión.
-- High Especifica que la sesión actual no será la víctima de interbloqueo si otras sesiones involucradas en la cadena de interbloqueo tienen una prioridad de interbloqueo inferior
-- solo será interbloqueada por una sesión con prioridad establecida mayor a 5

set Deadlock_Priority high



--Aqui haremos los bloqueos para los procedimientos de incersion de todas las tablas

--Para ventas
alter Procedure VentaProcess
 @IDC int,
 @CP char(5),
 @cv int
 as 
 begin try

	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NVenta @IDC
		declare @IDV as int
		set @IDV=(select Ident_Current('Ventas'))
		exec NDV @IDV, @CP, @cv
		exec ActV @IDV
	 commit
end try
begin catch
	print 'No se ha podido concretar la venta'
	rollback tran
end catch

--Para Clientes
create Procedure ClienteProcess
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@IDM int,
@DC nvarchar(70),
@TC char(8),
@EC nvarchar(50)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NCliente @PNC,@SNC,@PAC,@SAC,@IDM,@DC,@TC,@EC
	 commit
end try
begin catch
	print 'No se ha podido registrar al cliente'
	rollback tran
end catch

--Para colaboradores
create Procedure ColabProcess
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
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NColab @PNC,@SNC,@PAC,@SAC,@IDM,@DC,@TC,@EC,@CVC
	 commit
end try
begin catch
	print 'No se ha podido registrar al colaborador'
	rollback tran
end catch

--Para Devoluciones Sobre ventas
create Procedure DevVentaProcess
 @IDC int,
 @IDV int
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NDev_Ventas @IDC,@IDV
	 commit
end try
begin catch
	print 'No se ha podido concretar la devolucion sobre venta'
	rollback tran
end catch

--Para Productos
create Procedure ProductoProcess
@COP char(5),
@NP nvarchar(40),
@DP nvarchar(50),
@PP float,
@ExistP int,
@IDP char(5)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NProd @COP,@NP,@DP,@PP,@ExistP,@IDP
	 commit
end try
begin catch
	print 'No se ha podido registrar el producto'
	rollback tran
end catch

--Para Departamentos
create Procedure DptoProcess
@ND nvarchar(35)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NuevoDpto @ND
	 commit
end try
begin catch
	print 'No se ha podido registrar el dpto'
	rollback tran
end catch

--Para Municipios
create Procedure MuniProcess
@NM nvarchar(50),
@IDD int
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec NuevoM @NM,@IDD
	 commit
end try
begin catch
	print 'No se ha podido registrar el municipio'
	rollback tran
end catch

--Aqui haremos los bloqueos para los procedimientos de actualizacion de todas las tablas

--Para Clientes
create Procedure ClienteActProcess
@IDC int,
@IDM int,
@DC nvarchar(70),
@TC char(8),
@EC nvarchar(50)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActCliente @IDC,@IDM,@DC,@TC,@EC
	 commit
end try
begin catch
	print 'No se ha podido actualizar al cliente'
	rollback tran
end catch

--Para Colaboradores
create Procedure ColabActProcess
@IDC int,
@IDM int,
@TC char(8),
@DC nvarchar(50),
@EC nvarchar(60)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActColab @IDC,@IDM,@TC,@DC,@EC
	 commit
end try
begin catch
	print 'No se ha podido actualizar al colaborador'
	rollback tran
end catch

--Para devolucion sobre ventas
create Procedure DevVActProcess
@IDDevV int
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActDevVentas @IDDevV
	 commit
end try
begin catch
	print 'No se ha podido actualizar a la devolucion sobre ventas'
	rollback tran
end catch

--Para Dptos
create Procedure DptoActProcess
@IDD int,
@ND nvarchar(35)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActDpto @IDD,@ND
	 commit
end try
begin catch
	print 'No se ha podido actualizar al departamento'
	rollback tran
end catch

--Para Municipios
create Procedure MunActProcess
@IDM int,
@NM nvarchar(35)
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActDpto @IDM,@NM
	 commit
end try
begin catch
	print 'No se ha podido actualizar al municipio'
	rollback tran
end catch

--Para Productos
create Procedure ProdActProcess
@COP char(5),
@DP nvarchar(50),
@PP float,
@EP int
 as 
 begin try
	set transaction isolation level serializable
	set Deadlock_Priority high
	set Lock_Timeout 1000
	begin tran
		exec ActProd @COP,@DP,@PP,@EP
	 commit
end try
begin catch
	print 'No se ha podido actualizar el producto'
	rollback tran
end catch



