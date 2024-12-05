USE GD2C2024
GO

----------------------------------------------------------
---- Elimino Tablas y constraints ----
----------------------------------------------------------

-- TABLAS 

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'H_Facturacion')
  DROP TABLE SSGT.H_Facturacion
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'H_Envio')
  DROP TABLE SSGT.H_Envio 
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'H_Venta')
  DROP TABLE SSGT.H_Venta 
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'H_Publicacion')
  DROP TABLE SSGT.H_Publicacion
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_rango_etario')
  DROP TABLE SSGT.D_rango_etario
GO


IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_ubicacion')
  DROP TABLE SSGT.D_ubicacion  
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Marca')
  DROP TABLE SSGT.D_Marca
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Tipo_Envio')
  DROP TABLE SSGT.D_Tipo_Envio
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Sub_rubro')
  DROP TABLE SSGT.D_Sub_rubro
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Tiempo')
  DROP TABLE SSGT.D_Tiempo
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Medio_De_Pago')
  DROP TABLE SSGT.D_Medio_De_Pago
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Localidad')
  DROP TABLE SSGT.D_Localidad
GO

IF EXISTS ( SELECT name FROM sys.tables WHERE name = 'D_Provincia')
  DROP TABLE SSGT.D_Provincia
GO
---- FUNCIONES y PROCEDURES


IF EXISTS (SELECT name FROM sys.objects WHERE type_desc = 'SQL_SCALAR_FUNCTION' AND name = 'get_Rango_Etario_Cliente')
	DROP FUNCTION SSGT.get_Rango_Etario_Cliente 
GO

-- ELIMINO MIGRACIONES
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_medios_de_pago' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_medios_de_pago
GO

IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_ubicacion' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_ubicacion
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_marca' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_marca
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_tipo_envio' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_tipo_envio
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_Sub_rubro' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_Sub_rubro
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_rango_etario' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_rango_etario
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_rango_horario' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_rango_horario
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_d_tiempo' AND type='p')
	DROP PROCEDURE SSGT.migracion_d_tiempo
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_h_ventas' AND type='p')
	DROP PROCEDURE SSGT.migracion_h_ventas
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_h_publicacion' AND type='p')
	DROP PROCEDURE SSGT.migracion_h_publicacion
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_h_facturacion' AND type='p')
	DROP PROCEDURE SSGT.migracion_h_facturacion
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name='migracion_h_envio' AND type='p')
	DROP PROCEDURE SSGT.migracion_h_envio
GO
-- VISTAS
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_promedio_tiempo_publicaciones')
	DROP VIEW SSGT.v_promedio_tiempo_publicaciones
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_promedio_stock_inicial')
	DROP VIEW SSGT.v_promedio_stock_inicial
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_venta_promedio_mensual')
	DROP VIEW SSGT.v_venta_promedio_mensual
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_rendimiento_rubros')
	DROP VIEW SSGT.v_rendimiento_rubros
GO

--la 5 no entra
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_Pago_Cuotas')
	DROP VIEW SSGT.v_Pago_Cuotas
GO

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_porcentaje_cumplimientos_envios')
	DROP VIEW SSGT.v_porcentaje_cumplimientos_envios
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_localidades_con_mayor_costo_envio')
	DROP VIEW SSGT.v_localidades_con_mayor_costo_envio
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_porcentaje_facturacion_concepto')
	DROP VIEW SSGT.v_porcentaje_facturacion_concepto
GO
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'v_facturacion_provincia')
	DROP VIEW SSGT.v_facturacion_provincia
GO





---- Creo tablas  -----

CREATE TABLE SSGT.D_rango_etario (
	id_rango_etario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	d_rango_etario NVARCHAR(6) NOT NULL,
)
GO
 

CREATE TABLE SSGT.D_Marca(
	id_marca INT PRIMARY KEY NOT NULL,
	d_marca NVARCHAR(255)NOT NULL,

)
GO



CREATE TABLE SSGT.D_Sub_rubro (
	id_subrubro INT PRIMARY KEY NOT NULL,
	d_subrubro NVARCHAR(50) NOT NULL,
	d_rubro NVARCHAR(50) NOT NULL,
)
GO

CREATE TABLE SSGT.D_Tiempo (
	id_tiempo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	anio	DECIMAL(5,0) NOT NULL,
	mes	DECIMAL(3,0) NOT NULL,
	cuatrimestre  DECIMAL(2,0) NOT NULL,
)
GO


CREATE TABLE SSGT.D_Medio_De_Pago (
	id_medio_pago INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	d_medio_pago NVARCHAR(50) NOT NULL,
	cant_cuotas DECIMAL(18,0) NOT NULL,
    d_tipo_medio_pago NVARCHAR(50) 
)
GO


CREATE TABLE SSGT.D_Ubicacion (
	id_ubicacion INT PRIMARY KEY NOT NULL,
	id_provincia NVARCHAR(50) NOT NULL,
	id_localidad NVARCHAR(50) NOT NULL,
)
GO

CREATE TABLE SSGT.D_Localidad (
	id_localidad INT PRIMARY KEY NOT NULL,
	d_localidad NVARCHAR(50) NOT NULL,
)
GO

CREATE TABLE SSGT.D_Provincia (
	id_provincia INT PRIMARY KEY NOT NULL,
	d_provincia NVARCHAR(50) NOT NULL,
)
GO


CREATE TABLE SSGT.D_Tipo_Envio (
	id_tipo_envio INT PRIMARY KEY NOT NULL,
	d_tipo_envio NVARCHAR(50) NOT NULL,
)
GO


CREATE TABLE SSGT.H_Publicacion (
	id_marca INT NOT NULL,
	id_subrubro INT NOT NULL,
	id_tiempo INT NOT NULL, 
	promedio_stock_inicial DECIMAL(18,2),
	promedio_cant_publicaciones DECIMAL(18,0),
	promedio_tiempo_vigente DECIMAL(18,2),
	CONSTRAINT fk_id_marca
	FOREIGN KEY (id_marca) REFERENCES SSGT.D_marca (id_marca),
	CONSTRAINT fk_id_subrubro
	FOREIGN KEY (id_subrubro) REFERENCES SSGT.D_Sub_rubro (id_subrubro),
	CONSTRAINT fk_id_tiempo
	FOREIGN KEY (id_tiempo) REFERENCES SSGT.D_tiempo (id_tiempo),
)
GO


CREATE TABLE SSGT.H_Venta(
	id_subrubro INT NOT NULL,
	id_tiempo INT NOT NULL,
	id_ubi_almacen INT NOT NULL,
	id_ubi_cliente INT NOT NULL,
	id_rango_etario INT NOT NULL,
	id_medio_pago INT NOT NULL,
	ingreso_total DECIMAL(18,2) NOT NULL,
	cantidad_vendida DECIMAL(18,0) NOT NULL
	CONSTRAINT fk_vent_id_subrubro
	FOREIGN KEY (id_subrubro) REFERENCES SSGT.D_Sub_rubro (id_subrubro),
	CONSTRAINT fk_vent_id_tiempo
	FOREIGN KEY (id_tiempo) REFERENCES SSGT.D_tiempo (id_tiempo),
	CONSTRAINT id_ubi_almacen 
	FOREIGN KEY (id_ubi_almacen) REFERENCES SSGT.D_ubicacion (id_ubicacion),
	CONSTRAINT id_ubi_cliente 
	FOREIGN KEY (id_ubi_cliente) REFERENCES SSGT.D_ubicacion (id_ubicacion),
	CONSTRAINT fk_id_rango_etario
	FOREIGN KEY (id_rango_etario) REFERENCES SSGT.D_rango_etario (id_rango_etario),
	CONSTRAINT fk_id_medio_pago 
	FOREIGN KEY (id_medio_pago ) REFERENCES SSGT.D_Medio_De_Pago (id_medio_pago),
)
GO



CREATE TABLE SSGT.H_Envio (
	id_ubi_cliente INT NOT NULL,
	id_ubi_almacen INT NOT NULL,
	id_tiempo INT NOT NULL,
	id_tipo_envio INT NOT NULL,
	cant_cumplidos DECIMAL(18,0),
	total_envios DECIMAL(18,0) NOT NULL,
	costo_envio DECIMAL(18,2) NOT NULL,
	CONSTRAINT env_id_ubi_cliente 
	FOREIGN KEY (id_ubi_cliente) REFERENCES SSGT.D_ubicacion (id_ubicacion),
	CONSTRAINT env_id_ubi_almacen 
	FOREIGN KEY (id_ubi_almacen) REFERENCES SSGT.D_ubicacion (id_ubicacion),
	CONSTRAINT fk_env_id_tiempo
	FOREIGN KEY (id_tiempo) REFERENCES SSGT.D_tiempo (id_tiempo),
	CONSTRAINT fk_id_tipo_envio
	FOREIGN KEY (id_tipo_envio) REFERENCES SSGT.D_Tipo_Envio (id_tipo_envio),
)
GO


CREATE TABLE SSGT.H_Facturacion (
	id_ubi_vendedor INT NOT NULL,
	id_tiempo INT NOT NULL,
	cantidad_facturada DECIMAL(18,2),
	cant_concepto_fact DECIMAL(18,2),
	CONSTRAINT fk_fact_env_id_ubicacion
	FOREIGN KEY (id_ubi_vendedor) REFERENCES SSGT.D_ubicacion (id_ubicacion),
	CONSTRAINT fk_fact_id_tiempo
	FOREIGN KEY (id_tiempo) REFERENCES SSGT.D_tiempo (id_tiempo),
)
GO



------------- Creo Funciones  --------------

CREATE FUNCTION SSGT.get_Rango_Etario_Cliente (@fechaNacimiento DATE)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @age INT;
    DECLARE @rango_etario NVARCHAR(10);


    SET @age = DATEDIFF(YEAR, @fechaNacimiento, GETDATE());
    IF (MONTH(@fechaNacimiento) > MONTH(GETDATE())) OR 
       (MONTH(@fechaNacimiento) = MONTH(GETDATE()) AND DAY(@fechaNacimiento) > DAY(GETDATE()))
    BEGIN
        SET @age = @age - 1;
    END


    IF @age < 25
        SET @rango_etario = '< 25';
    ELSE IF @age BETWEEN 25 AND 35
        SET @rango_etario = '25-35';
    ELSE IF @age BETWEEN 36 AND 50
        SET @rango_etario = '36-50';
    ELSE
        SET @rango_etario = '> 50';

    RETURN @rango_etario;
END;
GO

----------------- MIGRACIONES --------


CREATE PROCEDURE SSGT.migracion_d_Marca
AS
INSERT INTO SSGT.D_marca ( 
	id_marca,d_marca
) 
select id_marca, d_marca
from SSGT.marca

GO


----------------- meto indice ----------------------------- 


CREATE NONCLUSTERED INDEX idx_H_Venta_Ids
ON SSGT.H_Venta (id_tiempo, id_ubi_almacen,id_ubi_cliente, id_rango_etario, id_subrubro);
GO



CREATE PROCEDURE SSGT.migracion_d_medios_de_pago
AS
INSERT INTO SSGT.D_Medio_De_Pago (
	d_medio_pago,
	cant_cuotas,
    d_tipo_medio_pago
)
--dejo el distinct??
SELECT distinct mp.d_medio_pago,  det.cuotas, tmp.d_tipo_medio_pago
	FROM SSGT.MedioPago mp
	join SSGT.Pago p on p.id_medio_pago = mp.id_medio_pago 
	JOIN SSGT.DetallePago det
		ON det.id_detalle_pago = p.id_detalle_pago
	join SSGT.tipoMedioPago tmp on tmp.id_tipo_medio_pago = mp.id_tipo_medio_pago  
	
GO


CREATE PROC	SSGT.migracion_d_ubicacion
AS
INSERT INTO SSGT.D_Ubicacion(id_ubicacion, id_provincia,id_localidad)
	select 	
			d.id_domicilio,
			l.id_localidad, --ponemos los nombres en vez del id??
			p.id_provincia
	from domicilio d
	join SSGT.Localidad l on d.id_localidad = l.id_localidad
	join SSGT.Provincia p on p.id_provincia = l.id_provincia
GO



CREATE PROC SSGT.migracion_d_tipo_envio
AS
INSERT INTO SSGT.D_Tipo_Envio(id_tipo_envio,d_tipo_envio)
	select id_tipo_envio,d_tipo_envio from SSGT.TipoEnvio
GO



CREATE PROC SSGT.migracion_d_Sub_rubro
AS
INSERT INTO SSGT.D_Sub_rubro(id_subrubro,d_subrubro,d_rubro)
	select id_subrubro,d_subrubro,r.d_rubro from SSGT.Subrubro s
	join SSGT.Rubro r on r.id_rubro = s.id_rubro
GO




CREATE PROC SSGT.migracion_d_rango_etario
AS
INSERT INTO SSGT.D_rango_etario(d_rango_etario) 
	VALUES	('< 25'),
			('25-35'),
			('36-50'),
			('> 50')
GO



CREATE PROC SSGT.migracion_d_tiempo
AS
INSERT INTO SSGT.D_Tiempo(anio,mes,cuatrimestre)
	select distinct YEAR(fecha),MONTH(fecha),DATEPART(QUARTER,fecha) 
	from SSGT.Factura
	union
	select distinct YEAR(f_venta),MONTH(f_venta),DATEPART(QUARTER,f_venta) 
	from SSGT.Venta
	union
	select distinct YEAR(fecha_inicio),MONTH(fecha_inicio),DATEPART(QUARTER,fecha_inicio) 
	from SSGT.Publicacion
	union
	select distinct YEAR(fecha_fin),MONTH(fecha_fin),DATEPART(QUARTER,fecha_fin) 
	from SSGT.Publicacion
	union
	select distinct YEAR(f_pago),MONTH(f_pago),DATEPART(QUARTER,f_pago) 
	from SSGT.Pago
	union
	select distinct YEAR(f_programada),MONTH(f_programada),DATEPART(QUARTER,f_programada) 
	from SSGT.Envio
	union
	select distinct YEAR(f_entrega),MONTH(f_entrega),DATEPART(QUARTER,f_entrega) 
	from SSGT.Envio
GO



CREATE PROC SSGT.migracion_h_ventas
AS
INSERT INTO SSGT.H_venta(	id_subrubro,
								id_tiempo,
								id_ubi_almacen,
								id_ubi_cliente,
								id_rango_etario ,
								ingreso_total,
								cantidad_vendida,
								id_medio_pago
								) --falta el promedio mensual?
SELECT  sr.id_subrubro,
		ti.id_tiempo,
		ubi_almacen.id_ubicacion,
		ubi_c.id_ubicacion,
		re.id_rango_etario,
		sum(v.importe_total),
		count(*) AS CantVentas,
		bmdp.id_medio_pago
from SSGT.Venta v
join SSGT.DetalleVenta dv on dv.codigo_venta = v.codigo_venta
join SSGT.Publicacion pu on pu.id_publicacion = dv.id_publicacion
join SSGT.Producto pr on pr.id_producto = pu.id_producto
join SSGT.D_Sub_rubro sr on sr.id_subrubro = pr.id_subrubro
--aca me falta la fecha de la venta
join SSGT.D_Tiempo ti on ti.anio = year(v.f_venta) and MONTH(v.f_venta) = ti.mes
join SSGT.Almacen al on al.codigo_almacen = pu.codigo_almacen
join SSGT.Domicilio do on do.id_domicilio = al.id_domicilio 
join SSGT.D_Ubicacion ubi_almacen on ubi_almacen.id_ubicacion = do.id_domicilio --esto nose si esta bien
join SSGT.Usuario us on us.id_usuario = v.id_cliente
join SSGT.Cliente c on c.id_usuario = us.id_usuario
join SSGT.D_rango_etario re on re.d_rango_etario = SSGT.get_Rango_Etario_Cliente(c.f_nacimiento)
join SSGT.Pago p on p.codigo_venta = v.codigo_venta
join SSGT.DetallePago dp on dp.id_detalle_pago = p.id_detalle_pago
join SSGT.MedioPago mdp on mdp.id_medio_pago = dp.id_detalle_pago
join SSGT.D_Medio_De_Pago bmdp on bmdp.cant_cuotas = dp.cuotas and bmdp.d_medio_pago = mdp.d_medio_pago
join SSGT.Envio e on e.codigo_venta = v.codigo_venta --and e.id_domicilio = c.id_domicilio
join SSGT.Domicilio domU on domU.id_usuario = us.id_usuario and e.id_domicilio = domU.id_domicilio
join SSGT.D_Ubicacion ubi_c on ubi_c.id_ubicacion = domU.id_domicilio
group by	sr.id_subrubro,
			ti.id_tiempo,
			ubi_almacen.id_ubicacion,
			re.id_rango_etario,
			bmdp.id_medio_pago,
			ubi_c.id_ubicacion

GO	



CREATE PROC SSGT.migracion_h_publicacion
AS
INSERT INTO SSGT.H_Publicacion(id_marca,id_subrubro,id_tiempo,promedio_stock_inicial,promedio_tiempo_vigente,promedio_cant_publicaciones)
	select distinct prod.id_marca,prod.id_subrubro,t1.id_tiempo, --joinear con marca y subrrubro
		sum(p.d_stock) + sum(isnull(det.cantidad,0)), 
		avg(DATEDIFF(DAY, p.fecha_inicio, p.fecha_fin)),
		count(*)
	from SSGT.Publicacion p
	join SSGT.DetalleVenta det on p.id_publicacion = det.id_publicacion
	join SSGT.Producto prod on p.id_producto = prod.id_producto
	join SSGT.D_Marca d_marca on d_marca.id_marca = prod.id_marca
	join SSGT.D_Sub_rubro d_sub on d_sub.id_subrubro = prod.id_subrubro
	join SSGT.D_Tiempo t1 on YEAR(p.fecha_inicio) = t1.anio and MONTH(p.fecha_inicio) = t1.mes
	group by prod.id_marca,prod.id_subrubro,id_tiempo
GO


CREATE PROC SSGT.migracion_h_facturacion
AS
	INSERT INTO SSGT.H_Facturacion(id_ubi_vendedor,id_tiempo,cant_concepto_fact,cantidad_facturada)
	select distinct id_ubicacion,id_tiempo,
	sum(det.precio),
	sum(f.importe_total)
	from SSGT.Factura f
	join SSGT.DetalleFactura det on det.factura_numero = f.factura_numero and 
	det.id_concepto_factura = f.id_concepto_factura
	join SSGT.D_Tiempo on YEAR(f.fecha) = anio and MONTH(f.fecha) = mes
    --join SSGT.UsuDom on usu_id = usu_dom_usu_id 
    join SSGT.Vendedor v on v.id_vendedor = f.id_vendedor --uso VENDEDOR COMO USUDOM
	join SSGT.Usuario us  on v.id_usuario = us.id_usuario
	join SSGT.Domicilio d on us.id_usuario = d.id_usuario 
	join SSGT.D_Ubicacion on d.id_localidad = id_ubicacion
	group by id_ubicacion,id_tiempo
GO




CREATE PROC SSGT.migracion_h_envio
AS
	INSERT INTO SSGT.H_Envio(id_tiempo,id_ubi_cliente,id_ubi_almacen,id_tipo_envio,costo_envio,total_envios,cant_cumplidos)
	select id_tiempo,/*ubi cliente*/ubi.id_ubicacion,ubi_a.id_ubicacion,e.id_tipo_envio,sum(e.costo),count(*),
		SUM(CASE 
            WHEN DATEDIFF(DAY, f_programada, f_entrega) = 0 THEN 1
            ELSE 0 
        END)
	from SSGT.Envio e
	join SSGT.D_Tipo_Envio d_tipo on d_tipo.id_tipo_envio = e.id_envio
	join SSGT.D_Tiempo on anio = YEAR(e.f_programada) and MONTH(e.f_programada) = mes
	--join SSGT.UsuDom on env_usu_dom_envio = usu_dom_id
	join SSGT.Domicilio dom on e.id_domicilio = dom.id_domicilio
	join SSGT.D_Ubicacion ubi on ubi.id_ubicacion = dom.id_domicilio
	join SSGT.Venta v on e.codigo_venta = v.codigo_venta
	join SSGT.DetalleVenta det on det.codigo_venta = v.codigo_venta
	join SSGT.Publicacion p on det.id_publicacion = p.id_publicacion
	join SSGT.Almacen a on a.codigo_almacen = p.codigo_almacen
	join SSGT.Domicilio dom_a on dom_a.id_domicilio = a.id_domicilio
	join SSGT.D_Ubicacion ubi_a on ubi_a.id_ubicacion = dom_a.id_domicilio
	group by id_tiempo,ubi.id_ubicacion,ubi_a.id_ubicacion,e.id_tipo_envio
GO


--EJECUTO

EXEC SSGT.migracion_d_ubicacion
EXEC SSGT.migracion_d_Marca
EXEC SSGT.migracion_d_tipo_envio
EXEC SSGT.migracion_d_Sub_rubro
EXEC SSGT.migracion_d_medios_de_pago
EXEC SSGT.migracion_d_rango_etario
--EXEC SSGT.migracion_d_rango_horario
EXEC SSGT.migracion_d_tiempo
EXEC SSGT.migracion_h_ventas
EXEC SSGT.migracion_h_facturacion
EXEC SSGT.migracion_h_envio
EXEC SSGT.migracion_h_publicacion
GO

-- CREO VISTAS


-- 1
CREATE VIEW SSGT.v_promedio_tiempo_publicaciones
AS
	select anio,cuatrimestre,d_subrubro,avg(promedio_tiempo_vigente) as promedio_dias_vigente
	from SSGT.H_Publicacion h_publi
	join SSGT.D_Sub_rubro d_sub on h_publi.id_subrubro = d_sub.id_subrubro
	join SSGT.D_Tiempo d_tiempo on d_tiempo.id_tiempo = h_publi.id_tiempo
	group by d_subrubro,anio,cuatrimestre
GO

-- 2

CREATE VIEW SSGT.v_promedio_stock_inicial
AS
	select anio,d_marca,sum(promedio_stock_inicial)/sum(promedio_cant_publicaciones) as promedio_stock_inicial
	from SSGT.H_Publicacion h_publi
	join SSGT.D_Marca d_marca on h_publi.id_marca = d_marca.id_marca
	join SSGT.D_Tiempo d_tiempo on d_tiempo.id_tiempo = h_publi.id_tiempo
	group by anio,d_marca
GO


-- 3


CREATE VIEW SSGT.v_venta_promedio_mensual
AS
SELECT 
    ubi.id_provincia AS Provincia,
	d_tiemp.anio AS ANIO,
	d_tiemp.mes AS MES,
    SUM(ISNULL(v.ingreso_total,0)) / sum(ISNULL(v.cantidad_vendida,0)) AS Promedio_ventas
FROM 
    SSGT.H_Venta V
join SSGT.D_Ubicacion ubi on ubi.id_ubicacion = v.id_ubi_almacen
join SSGT.D_Tiempo d_tiemp on d_tiemp.id_tiempo = v.id_tiempo
group by	ubi.id_provincia,
			d_tiemp.anio,
			d_tiemp.mes
GO


-- 4 

CREATE VIEW SSGT.v_rendimiento_rubros
AS
SELECT t.anio, 
		t.cuatrimestre,
		ubi.id_localidad,
		re.d_rango_etario,
		srb.d_rubro
FROM SSGT.H_Venta v
join SSGT.D_Tiempo t on t.id_tiempo = v.id_tiempo
join SSGT.D_rango_etario re on re.id_rango_etario = v.id_rango_etario
join SSGT.D_Ubicacion ubi on ubi.id_ubicacion = v.id_ubi_cliente
join SSGT.D_Sub_rubro srb on srb.id_subrubro = v.id_subrubro
where srb.id_subrubro in (
		SELECT TOP 5 v2.id_subrubro
		from SSGT.H_Venta v2
		where t.id_tiempo = v2.id_tiempo and
				ubi.id_ubicacion = v2.id_ubi_cliente and 
				re.id_rango_etario = v2.id_rango_etario
		group by v2.id_subrubro
		order by sum(v2.ingreso_total)  DESC
		)
GO



-- 6

CREATE VIEW SSGT.v_Pago_Cuotas
AS
SELECT ti.anio,
			 ti.mes, 
			 mdp.d_medio_pago,
			 ubi.id_localidad
FROM SSGT.H_Venta v
join SSGT.D_Tiempo ti on ti.id_tiempo = v.id_tiempo
join SSGT.D_Ubicacion ubi on ubi.id_ubicacion = v.id_ubi_cliente
join SSGT.D_Medio_De_Pago mdp on mdp.id_medio_pago = v.id_medio_pago
WHERE cant_cuotas > 1 and
	ubi.id_ubicacion in (select top 3 ubi2.id_ubicacion
					from SSGT.H_Venta v2
					join SSGT.D_Ubicacion ubi2 on ubi2.id_ubicacion = v2.id_ubi_cliente
					where ti.id_tiempo = v2.id_tiempo and
					id_medio_pago = id_medio_pago
					group by ubi2.id_ubicacion
					order by sum(ingreso_total))
group by	ti.anio,
			ti.mes, 
			mdp.d_medio_pago, 
			ubi.id_localidad
GO


-- 7

CREATE VIEW SSGT.v_porcentaje_cumplimientos_envios
AS
	select id_provincia,anio,mes,(sum(isnull(cant_cumplidos,0))/sum(isnull(total_envios,0))) as porcentaje_cumplimientos_envios
	from SSGT.H_Envio h_envio
	join SSGT.D_Tiempo d_tiempo on h_envio.id_tiempo = d_tiempo.id_tiempo
	join SSGT.D_Ubicacion on id_ubi_almacen = id_ubicacion
	group by id_provincia,anio,mes
GO

-- 8

CREATE VIEW SSGT.v_localidades_con_mayor_costo_envio
AS
	select top 5 id_localidad
	from SSGT.H_Envio
	join SSGT.D_Ubicacion on id_ubi_cliente = id_ubicacion
	group by id_localidad
	order by sum(costo_envio) desc
GO

-- 9

CREATE VIEW SSGT.v_porcentaje_facturacion_concepto
AS
	select anio,mes,(sum(cant_concepto_fact)/sum(cantidad_facturada))*100 as porcentaje_concepto
	from SSGT.H_Facturacion h_fact
	join SSGT.D_Tiempo d_tiempo on h_fact.id_tiempo = d_tiempo.id_tiempo
	group by anio,mes
GO

-- 10

CREATE VIEW SSGT.v_facturacion_provincia
AS
	select anio,cuatrimestre,id_provincia,cantidad_facturada
	from SSGT.H_Facturacion h_fact
	join SSGT.D_Tiempo d_tiempo on h_fact.id_tiempo = d_tiempo.id_tiempo
	join SSGT.D_Ubicacion on id_ubicacion = id_ubi_vendedor
GO

/**/