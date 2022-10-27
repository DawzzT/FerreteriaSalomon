use FerreteriaSalomon

-- Cuenta de L/E
sp_addlogin 'Daniela','Colddriven02','FerreteriaSalomon'
sp_addsrvrolemember 'Daniela','sysadmin'
sp_adduser 'Daniela','Dueña'
sp_addrolemember 'db_datareader','Dueña'
sp_addrolemember 'db_datawriter','Dueña'

deny create table, create view, create procedure to
Dueña

--revoke insert, delete, update on Clientes to 
--Dueña

-- Cuenta de L/E
sp_addlogin 'Armando','Cama123','FerreteriaSalomon'
sp_addsrvrolemember 'Armando','sysadmin'
sp_adduser 'Armando','Colaborador'
sp_addrolemember 'db_datareader','Colaborador'
sp_addrolemember 'db_datawriter','Colaborador'

deny create table, create view, create procedure to
Colaborador

-- Cuenta de L/E
sp_addlogin 'Dayana','Abanaico123','FerreteriaSalomon'
sp_addsrvrolemember 'Dayana','sysadmin'
sp_adduser 'Dayana','Colaborador2'
sp_addrolemember 'db_datareader','Colaborador2'
sp_addrolemember 'db_datawriter','Colaborador2'

deny create table, create view, create procedure to
Colaborador2


