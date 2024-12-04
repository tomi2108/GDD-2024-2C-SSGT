USE GD2C2024;
GO
-- Eliminación de foreign keys antes de eliminar las constraints primarias

IF OBJECT_ID('SSGT.Subrubro', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Subrubro_Rubro') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Subrubro DROP CONSTRAINT FK_Subrubro_Rubro;
    END
END


IF OBJECT_ID('SSGT.Domicilio', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Domicilio_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Domicilio DROP CONSTRAINT FK_Domicilio_Usuario;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Domicilio_Localidad') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Domicilio DROP CONSTRAINT FK_Domicilio_Localidad;
    END
END

IF OBJECT_ID('SSGT.Almacen', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Almacen_Domicilio') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Almacen DROP CONSTRAINT FK_Almacen_Domicilio;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Almacen_Producto') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Almacen DROP CONSTRAINT FK_Almacen_Producto;
    END
END

IF OBJECT_ID('SSGT.Envio', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Envio_Domicilio') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Envio DROP CONSTRAINT FK_Envio_Domicilio;
    END
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Envio_Venta') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Envio DROP CONSTRAINT FK_Envio_Venta;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Envio_Domicilio') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Envio DROP CONSTRAINT FK_Envio_Domicilio;
    END
END

IF OBJECT_ID('SSGT.Cliente', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Cliente_Domicilio') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Cliente DROP CONSTRAINT FK_Cliente_Domicilio;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Cliente_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Cliente DROP CONSTRAINT FK_Cliente_Usuario;
    END
END

IF OBJECT_ID('SSGT.Vendedor', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Vendedor_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Vendedor DROP CONSTRAINT FK_Vendedor_Usuario;
    END
END

IF OBJECT_ID('SSGT.Pago', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Pago_Venta') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Pago DROP CONSTRAINT FK_Pago_Venta;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Pago_MedioPago') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Pago DROP CONSTRAINT FK_Pago_MedioPago;
    END
END

IF OBJECT_ID('SSGT.MedioPago', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_MedioPago_Pago') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.MedioPago DROP CONSTRAINT FK_MedioPago_Pago;
    END
END

IF OBJECT_ID('SSGT.Localidad', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Localidad_Provincia') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Localidad DROP CONSTRAINT FK_Localidad_Provincia;
    END
END


IF OBJECT_ID('SSGT.DetallePago', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetallePago_Pago') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.DetallePago DROP CONSTRAINT FK_DetallePago_Pago;
    END
END


IF OBJECT_ID('SSGT.Producto', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Producto_Subrubro') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT FK_Producto_Subrubro;
    END
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Producto_Marca') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT FK_Producto_Marca;
    END
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Producto_Modelo') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT FK_Producto_Modelo;
    END
	    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Producto_Almacen') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT FK_Producto_Almacen;
    END
END

IF OBJECT_ID('SSGT.Publicacion', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Vendedor') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Vendedor;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Almacen') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Almacen;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Producto') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Producto;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_ImpuestoPublicacion') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_ImpuestoPublicacion;
    END
END

IF OBJECT_ID('SSGT.Venta', 'U') IS NOT NULL 
BEGIN
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Venta_Cliente') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Venta DROP CONSTRAINT FK_Venta_Cliente;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Venta_Publicacion') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Venta DROP CONSTRAINT FK_Venta_Publicacion;
    END
END

IF OBJECT_ID('SSGT.Factura', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Factura_Vendedor') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Factura DROP CONSTRAINT FK_Factura_Vendedor;
    END
END

IF OBJECT_ID('SSGT.DetalleFactura', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleFactura_Factura') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.DetalleFactura DROP CONSTRAINT FK_DetalleFactura_Factura;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleFactura_Publicacion') AND type = 'F')
	BEGIN
        ALTER TABLE SSGT.DetalleFactura DROP CONSTRAINT FK_DetalleFactura_Publicacion;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleFactura_Concepto') AND type = 'F')
	BEGIN
        ALTER TABLE SSGT.DetalleFactura DROP CONSTRAINT FK_DetalleFactura_Concepto;
    END
END

IF OBJECT_ID('SSGT.DetalleVenta', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleVenta_Publicacion') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.DetalleVenta DROP CONSTRAINT FK_DetalleVenta_Publicacion;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleVenta_Venta') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.DetalleVenta DROP CONSTRAINT FK_DetalleVenta_Venta;
    END
END


-- Luego eliminar las constraints primarias
IF OBJECT_ID('SSGT.Domicilio', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Domicilio') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Domicilio DROP CONSTRAINT PK_Domicilio;
    END
END

IF OBJECT_ID('SSGT.Provincia', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Provincia') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Provincia DROP CONSTRAINT PK_Provincia;
    END
END

IF OBJECT_ID('SSGT.Localidad', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Localidad') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Localidad DROP CONSTRAINT PK_Localidad;
    END
END

IF OBJECT_ID('SSGT.Usuario', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Usuario') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Usuario DROP CONSTRAINT PK_Usuario;
    END
END

IF OBJECT_ID('SSGT.Cliente', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Cliente') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Cliente DROP CONSTRAINT PK_Cliente;
    END
END

IF OBJECT_ID('SSGT.Vendedor', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Vendedor') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Vendedor DROP CONSTRAINT PK_Vendedor;
    END
END

IF OBJECT_ID('SSGT.Rubro', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Rubro') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Rubro DROP CONSTRAINT PK_Rubro;
    END
END

IF OBJECT_ID('SSGT.Subrubro', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Subrubro') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Subrubro DROP CONSTRAINT PK_Subrubro;
    END
END

IF OBJECT_ID('SSGT.Marca', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Marca') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Marca DROP CONSTRAINT PK_Marca;
    END
END

IF OBJECT_ID('SSGT.Modelo', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Modelo') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Modelo DROP CONSTRAINT PK_Modelo;
    END
END

IF OBJECT_ID('SSGT.Almacen', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Almacen') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Almacen DROP CONSTRAINT PK_Almacen;
    END
END

IF OBJECT_ID('SSGT.Producto', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Producto') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT PK_Producto;
    END
END

IF OBJECT_ID('SSGT.Publicacion', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Publicacion') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT PK_Publicacion;
    END
END

IF OBJECT_ID('SSGT.Venta', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Venta') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Venta DROP CONSTRAINT PK_Venta;
    END
END

IF OBJECT_ID('SSGT.Envio', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Envio') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Envio DROP CONSTRAINT PK_Envio;
    END
END

IF OBJECT_ID('SSGT.Factura', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_Factura') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.Factura DROP CONSTRAINT PK_Factura;
    END
END
GO

IF OBJECT_ID('SSGT.TipoMedioPago', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.PK_TipoMedioPago') AND type = 'PK')
    BEGIN
        ALTER TABLE SSGT.TipoMedioPago DROP CONSTRAINT PK_TipoMedioPago;
    END
END

-- Verificación y eliminación de tablas si ya existen
IF OBJECT_ID('SSGT.Domicilio', 'U') IS NOT NULL DROP TABLE SSGT.Domicilio;
IF OBJECT_ID('SSGT.Provincia', 'U') IS NOT NULL DROP TABLE SSGT.Provincia;
IF OBJECT_ID('SSGT.Localidad', 'U') IS NOT NULL DROP TABLE SSGT.Localidad;
IF OBJECT_ID('SSGT.Usuario', 'U') IS NOT NULL DROP TABLE SSGT.Usuario;
IF OBJECT_ID('SSGT.Cliente', 'U') IS NOT NULL DROP TABLE SSGT.Cliente;
IF OBJECT_ID('SSGT.Vendedor', 'U') IS NOT NULL DROP TABLE SSGT.Vendedor;
IF OBJECT_ID('SSGT.Rubro', 'U') IS NOT NULL DROP TABLE SSGT.Rubro;
IF OBJECT_ID('SSGT.Subrubro', 'U') IS NOT NULL DROP TABLE SSGT.Subrubro;
IF OBJECT_ID('SSGT.Marca', 'U') IS NOT NULL DROP TABLE SSGT.Marca;
IF OBJECT_ID('SSGT.Modelo', 'U') IS NOT NULL DROP TABLE SSGT.Modelo;
IF OBJECT_ID('SSGT.Almacen', 'U') IS NOT NULL DROP TABLE SSGT.Almacen;
IF OBJECT_ID('SSGT.Producto', 'U') IS NOT NULL DROP TABLE SSGT.Producto;
IF OBJECT_ID('SSGT.Publicacion', 'U') IS NOT NULL DROP TABLE SSGT.Publicacion;
IF OBJECT_ID('SSGT.ImpuestoPublicacion', 'U') IS NOT NULL DROP TABLE SSGT.ImpuestoPublicacion;
IF OBJECT_ID('SSGT.Venta', 'U') IS NOT NULL DROP TABLE SSGT.Venta;
IF OBJECT_ID('SSGT.Envio', 'U') IS NOT NULL DROP TABLE SSGT.Envio;
IF OBJECT_ID('SSGT.TipoEnvio', 'U') IS NOT NULL DROP TABLE SSGT.TipoEnvio;
IF OBJECT_ID('SSGT.Pago', 'U') IS NOT NULL DROP TABLE SSGT.Pago;
IF OBJECT_ID('SSGT.MedioPago', 'U') IS NOT NULL DROP TABLE SSGT.MedioPago;
IF OBJECT_ID('SSGT.TipoMedioPago', 'U') IS NOT NULL DROP TABLE SSGT.TipoMedioPago;
IF OBJECT_ID('SSGT.DetalleVenta', 'U') IS NOT NULL DROP TABLE SSGT.DetalleVenta;
IF OBJECT_ID('SSGT.DetallePago', 'U') IS NOT NULL DROP TABLE SSGT.DetallePago;
IF OBJECT_ID('SSGT.Factura', 'U') IS NOT NULL DROP TABLE SSGT.Factura;
IF OBJECT_ID('SSGT.DetalleFactura', 'U') IS NOT NULL DROP TABLE SSGT.DetalleFactura;
IF OBJECT_ID('SSGT.Concepto_Det_Factura', 'U') IS NOT NULL DROP TABLE SSGT.Concepto_Det_Factura;

-- Elimina la secuencia si ya existe
IF OBJECT_ID('SSGT.DomicilioSeq', 'SO') IS NOT NULL
    DROP SEQUENCE SSGT.DomicilioSeq;

	-- Elimina la secuencia si ya existe
IF OBJECT_ID('SSGT.RubroSeq', 'SO') IS NOT NULL
    DROP SEQUENCE SSGT.RubroSeq;

	-- Elimina la secuencia si ya existe
IF OBJECT_ID('SSGT.SubrubroSeq', 'SO') IS NOT NULL
    DROP SEQUENCE SSGT.SubrubroSeq;

	-- Elimina la secuencia si ya existe
IF OBJECT_ID('SSGT.ProductoSeq', 'SO') IS NOT NULL
    DROP SEQUENCE SSGT.ProductoSeq;

-- Verificación y eliminación del esquema si ya existe
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'SSGT')
    DROP SCHEMA SSGT;
GO

-- Creación del esquema SSGT
CREATE SCHEMA SSGT;
GO

    
-- Creación de tablas dentro del esquema SSGT
CREATE TABLE SSGT.Provincia (
    id_provincia decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_provincia VARCHAR(50)
);

CREATE TABLE SSGT.Localidad (
    id_localidad decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    id_provincia decimal(18,0) NOT NULL,
    d_localidad VARCHAR(50)
);


CREATE TABLE SSGT.Domicilio (
    id_domicilio decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    id_localidad decimal(18,0) NOT NULL,
    d_calle VARCHAR(50),
    d_altura decimal(18,0),
    d_piso decimal(18,2),
    d_depto VARCHAR(50),
    d_codigo_postal VARCHAR(50),
	id_usuario decimal(18,0),
);

CREATE TABLE SSGT.Usuario (
    id_usuario decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_email VARCHAR(100),
    d_password VARCHAR(80),
    d_fecha_alta DATE
);

CREATE TABLE SSGT.Cliente (
	id_cliente decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    id_usuario decimal(18,0) NOT NULL,
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	dni VARCHAR(10),
	f_nacimiento DATE
);

CREATE TABLE SSGT.Vendedor (
	id_vendedor decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    id_usuario decimal(18,0) NOT NULL,
    d_razon_social VARCHAR(50),
    d_cuit VARCHAR(25)
);

CREATE TABLE SSGT.Rubro (
    id_rubro decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_rubro VARCHAR(100)
);

CREATE TABLE SSGT.Subrubro (
    id_subrubro decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
	id_rubro decimal(18,0) NOT NULL,
    d_subrubro VARCHAR(100)
);

CREATE TABLE SSGT.Marca (
    id_marca decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_marca VARCHAR(100)
);

CREATE TABLE SSGT.Modelo (
    id_modelo decimal(18,0) PRIMARY KEY,
    d_modelo varchar(30)
);

CREATE TABLE SSGT.Almacen (
    codigo_almacen Decimal(18,0) PRIMARY KEY,
    id_domicilio decimal(18,0) NOT NULL,
    costo_dia FLOAT
);

CREATE TABLE SSGT.Producto (
	id_producto decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    id_subrubro decimal(18,0) NOT NULL,
    id_marca decimal(18,0) NOT NULL,
    id_modelo decimal(18,0) NOT NULL,
	codigo_producto VARCHAR(30),
    d_descripcion VARCHAR(1000),
    precio FLOAT
);

CREATE TABLE SSGT.Publicacion (
    id_publicacion Decimal(18,0) PRIMARY KEY,
    id_vendedor decimal(18,0) NOT NULL,
	id_producto decimal(18,0) NOT NULL,
	codigo_almacen Decimal(18,0) NOT NULL,
    d_descripcion VARCHAR(100),
    fecha_inicio DATE,
	fecha_fin DATE,
	d_stock INT,
	d_precio FLOAT,
    costo FLOAT,
    porcentaje_venta FLOAT
);

CREATE TABLE SSGT.DetalleVenta (
    id_detalle_venta decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
	codigo_venta decimal(18,0),
	id_publicacion DECIMAL (18,0) NOT NULL,
    cantidad decimal(18,0),
	precio decimal(18,2),
    subtotal decimal(18,2),
);

CREATE TABLE SSGT.Venta (
	codigo_venta decimal (18,0) PRIMARY KEY,
    id_cliente decimal(18,0) NOT NULL,
	f_venta DATE,
    importe_total decimal(18,2)
);

CREATE TABLE SSGT.Envio (
    id_envio decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    codigo_venta decimal (18,0) NOT NULL,
    id_domicilio decimal(18,0) NOT NULL,
    id_tipo_envio decimal(18,0) NOT NULL,
    f_programada  DATE,
    hora_inicial INT,
    hora_final INT,
	f_entrega DATETIME2,
    costo FLOAT
);

CREATE TABLE SSGT.TipoEnvio (
    id_tipo_envio decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_tipo_envio VARCHAR(100)
);

CREATE TABLE SSGT.TipoMedioPago (
    id_tipo_medio_pago decimal (18,0) IDENTITY (1,1) PRIMARY KEY,
	d_tipo_medio_pago NVARCHAR(50)
);

CREATE TABLE SSGT.MedioPago (
    id_medio_pago decimal (18,0) IDENTITY (1,1) PRIMARY KEY,
    d_medio_pago VARCHAR(50),
	nro_tarjeta NVARCHAR(50),
	f_vencimiento DATE,
	id_tipo_medio_pago decimal(18,0)
);


CREATE TABLE SSGT.Pago (
    id_pago decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    codigo_venta decimal(18,0) NOT NULL,
    id_medio_pago decimal (18,0) NOT NULL,
    importe_total FLOAT
);

CREATE TABLE SSGT.DetallePago (
    id_detalle_pago decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
	id_pago decimal(18,0) NOT NULL,
    nro_tarjeta VARCHAR(16),
    f_vencimiento DATE,
    f_pago DATE,
    cuotas INT
);

CREATE TABLE SSGT.DetalleFactura (
    id_detalle_factura decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
	factura_numero decimal(18,0) NOT NULL,
    id_publicacion Decimal(18,0) NOT NULL,
    id_concepto_factura decimal(18,0) NOT NULL,
    precio FLOAT,
    cantidad INT,
    subtotal FLOAT
);

CREATE TABLE SSGT.Factura (
    factura_numero DECIMAL(18,0) PRIMARY KEY,
    id_vendedor decimal(18,0) NOT NULL,
    fecha DATE,
    importe_total decimal(18,2)
);

CREATE TABLE SSGT.Concepto_Det_Factura (
    id_concepto_factura decimal(18,0) IDENTITY (1,1) PRIMARY KEY,
    d_concepto NVARCHAR(50)
);

-- Crea la secuencia comenzando en 1
CREATE SEQUENCE SSGT.DomicilioSeq
    START WITH 1
    INCREMENT BY 1;

-- Creación de FOREIGN KEY constraints
ALTER TABLE SSGT.Almacen			ADD CONSTRAINT FK_Almacen_Domicilio		FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Cliente			ADD CONSTRAINT FK_Cliente_Usuario		FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.Domicilio			ADD CONSTRAINT FK_Domicilio_Localidad	FOREIGN KEY (id_localidad) REFERENCES SSGT.Localidad(id_localidad);
ALTER TABLE SSGT.Domicilio			ADD CONSTRAINT FK_Domicilio_Usuario	FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.DetalleFactura		ADD CONSTRAINT FK_DetalleFactura_Publicacion FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.DetalleFactura		ADD CONSTRAINT FK_DetalleFactura_Concepto_Det_Factura FOREIGN KEY (id_concepto_factura) REFERENCES SSGT.Concepto_Det_Factura(id_concepto_factura);
ALTER TABLE SSGT.DetalleFactura		ADD CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY (factura_numero) REFERENCES SSGT.Factura(factura_numero);
ALTER TABLE SSGT.DetallePago		ADD CONSTRAINT FK_DetallePago_Pago FOREIGN KEY (id_pago) REFERENCES SSGT.Pago(id_pago);
ALTER TABLE SSGT.DetalleVenta		ADD CONSTRAINT FK_DetalleVenta_Publicacion FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_Domicilio		FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_TipoEnvio		FOREIGN KEY (id_tipo_envio) REFERENCES SSGT.TipoEnvio(id_tipo_envio);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_Venta			FOREIGN KEY (codigo_venta) REFERENCES SSGT.Venta(codigo_venta);
ALTER TABLE SSGT.Factura			ADD CONSTRAINT FK_Factura_Vendedor		FOREIGN KEY (id_vendedor) REFERENCES SSGT.Vendedor(id_vendedor);
ALTER TABLE SSGT.Localidad			ADD CONSTRAINT FK_Localidad_Provincia	FOREIGN KEY (id_provincia) REFERENCES SSGT.Localidad(id_localidad);
ALTER TABLE SSGT.MedioPago			ADD CONSTRAINT FK_MedioPago_TipoMedioPago FOREIGN KEY (id_tipo_medio_pago) REFERENCES SSGT.TipoMedioPago(id_tipo_medio_pago);
ALTER TABLE SSGT.Pago				ADD CONSTRAINT FK_Pago_MedioPago		FOREIGN KEY (id_medio_pago) REFERENCES SSGT.MedioPago(id_medio_pago);
ALTER TABLE SSGT.Pago				ADD CONSTRAINT FK_Pago_Venta			FOREIGN KEY (codigo_venta) REFERENCES SSGT.Venta(codigo_venta);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Marca		FOREIGN KEY (id_marca) REFERENCES SSGT.Marca(id_marca);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Modelo		FOREIGN KEY (id_modelo) REFERENCES SSGT.Modelo(id_modelo);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Subrubro		FOREIGN KEY (id_subrubro) REFERENCES SSGT.Subrubro(id_subrubro);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Vendedor	FOREIGN KEY (id_vendedor) REFERENCES SSGT.Vendedor(id_vendedor);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Producto	FOREIGN KEY (id_producto) REFERENCES SSGT.Producto(id_producto);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Almacen	FOREIGN KEY (codigo_almacen) REFERENCES SSGT.Almacen(codigo_almacen);
ALTER TABLE SSGT.Subrubro			ADD CONSTRAINT FK_Subrubro_Rubro		FOREIGN KEY (id_rubro) REFERENCES SSGT.Rubro(id_rubro);
ALTER TABLE SSGT.Venta				ADD CONSTRAINT FK_Venta_Cliente			FOREIGN KEY (id_cliente) REFERENCES SSGT.Cliente(id_cliente);
ALTER TABLE SSGT.DetalleVenta		ADD CONSTRAINT FK_DetalleVenta_Venta	FOREIGN KEY (codigo_venta) REFERENCES SSGT.Venta(codigo_venta);
ALTER TABLE SSGT.Vendedor			ADD CONSTRAINT FK_Vendedor_Usuario		FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);

-- Migracion de datos
--PROVINCIAS (23)
INSERT INTO SSGT.Provincia (d_provincia)
SELECT distinct
m.VEN_USUARIO_DOMICILIO_PROVINCIA
from gd_esquema.Maestra m
WHERE VEN_USUARIO_DOMICILIO_PROVINCIA IS NOT NULL
--(1)
INSERT INTO SSGT.Provincia (d_provincia)
SELECT distinct
m.CLI_USUARIO_DOMICILIO_PROVINCIA
from gd_esquema.Maestra m
WHERE m.CLI_USUARIO_DOMICILIO_PROVINCIA IS NOT NULL and
m.CLI_USUARIO_DOMICILIO_PROVINCIA NOT IN (SELECT p.d_provincia FROM SSGT.Provincia p);
--(0)
INSERT INTO SSGT.Provincia (d_provincia)
SELECT distinct
m.ALMACEN_PROVINCIA
from gd_esquema.Maestra m
WHERE m.ALMACEN_PROVINCIA IS NOT NULL and
m.ALMACEN_PROVINCIA NOT IN (SELECT p.d_provincia FROM SSGT.Provincia p);

--LOCALIDADES(68)
INSERT INTO SSGT.Localidad (id_provincia, d_localidad)
SELECT distinct
p.id_provincia,
m.ALMACEN_Localidad
from gd_esquema.Maestra m
JOIN SSGT.Provincia p on p.d_provincia = m.ALMACEN_PROVINCIA
WHERE NOT EXISTS(	Select * from SSGT.Localidad l
					JOIN SSGT.Provincia p on p.id_provincia = l.id_provincia
					WHERE l.d_localidad = m.ALMACEN_Localidad AND
					m.ALMACEN_Localidad is not null);
--LOCALIDADES (89)
INSERT INTO SSGT.Localidad (id_provincia, d_localidad)
SELECT distinct
p.id_provincia,
VEN_USUARIO_DOMICILIO_LOCALIDAD
from gd_esquema.Maestra m
JOIN SSGT.Provincia p on p.d_provincia = m.VEN_USUARIO_DOMICILIO_PROVINCIA 
WHERE VEN_USUARIO_DOMICILIO_LOCALIDAD IS NOT NULL
--LOCALIDADES (16575)
INSERT INTO SSGT.Localidad (id_provincia, d_localidad)
SELECT distinct
p.id_provincia,
CLI_USUARIO_DOMICILIO_LOCALIDAD
from gd_esquema.Maestra m
JOIN SSGT.Provincia p on p.d_provincia = m.CLI_USUARIO_DOMICILIO_PROVINCIA 
WHERE NOT EXISTS(	Select * from SSGT.Localidad l
					JOIN SSGT.Provincia p on p.id_provincia = l.id_provincia
					WHERE l.d_localidad = m.CLI_USUARIO_DOMICILIO_LOCALIDAD and
					m.CLI_USUARIO_DOMICILIO_LOCALIDAD is not null);

-- Usuario Clientes: 41298
INSERT INTO SSGT.Usuario (d_email, d_password, d_fecha_alta)
SELECT DISTINCT
CLIENTE_MAIL,
CLI_USUARIO_PASS,
CLI_USUARIO_FECHA_CREACION
from gd_esquema.Maestra m
WHERE CLIENTE_MAIL IS NOT NULL
--Usuarios Vendedores: 89
INSERT INTO SSGT.Usuario (d_email, d_password, d_fecha_alta)
SELECT DISTINCT
    VENDEDOR_MAIL AS email,
    VEN_USUARIO_PASS AS password,
    VEN_USUARIO_FECHA_CREACION AS fecha_creacion
FROM gd_esquema.Maestra m
WHERE VENDEDOR_MAIL IS NOT NULL

--(68)
INSERT INTO SSGT.Domicilio (id_localidad, d_calle, d_altura)
SELECT DISTINCT       
    l.id_localidad as id_localidad,          
    m.ALMACEN_CALLE as d_calle,
    m.ALMACEN_NRO_CALLE as n_calle
FROM gd_esquema.Maestra m
JOIN SSGT.Localidad l ON	l.d_localidad = m.ALMACEN_LOCALIDAD and
							l.id_provincia = (SELECT p.id_provincia FROM SSGT.Provincia p where p.d_provincia = ALMACEN_PROVINCIA)
WHERE M.ALMACEN_CALLE IS NOT NULL
--(89)
INSERT INTO SSGT.Domicilio (id_localidad, d_calle, d_altura, d_piso, d_depto, d_codigo_postal, id_usuario)
SELECT distinct
tl.id_localidad,
m.VEN_USUARIO_DOMICILIO_CALLE,
m.VEN_USUARIO_DOMICILIO_NRO_CALLE,
m.VEN_USUARIO_DOMICILIO_PISO,
m.VEN_USUARIO_DOMICILIO_DEPTO,
m.VEN_USUARIO_DOMICILIO_CP,
u.id_usuario
from gd_esquema.Maestra m
JOIN SSGT.Localidad tl on	tl.d_localidad = m.ven_usuario_domicilio_localidad and
							tl.id_provincia = (SELECT p.id_provincia FROM SSGT.Provincia p where p.d_provincia = m.VEN_USUARIO_DOMICILIO_PROVINCIA)
JOIN SSGT.Usuario u on	u.d_email = m.VENDEDOR_MAIL
WHERE VEN_USUARIO_DOMICILIO_CALLE IS NOT NULL
-- Solo domicilios de clientes (45819)
INSERT INTO SSGT.Domicilio (id_localidad, d_calle, d_altura, d_piso, d_depto, d_codigo_postal, id_usuario)
SELECT distinct
tl.id_localidad,
CLI_USUARIO_DOMICILIO_CALLE,
CLI_USUARIO_DOMICILIO_NRO_CALLE,
CLI_USUARIO_DOMICILIO_PISO,
CLI_USUARIO_DOMICILIO_DEPTO,
CLI_USUARIO_DOMICILIO_CP,
u.id_usuario
from gd_esquema.Maestra m
JOIN SSGT.Localidad tl on	tl.d_localidad = m.cli_usuario_domicilio_localidad and
							tl.id_provincia = (SELECT p.id_provincia FROM SSGT.Provincia p where p.d_provincia = m.CLI_USUARIO_DOMICILIO_PROVINCIA)	
JOIN SSGT.Usuario u on u.d_email = m.CLIENTE_MAIL
WHERE CLI_USUARIO_DOMICILIO_CALLE IS NOT NULL

--Migra los clientes. Cant: 41298
INSERT INTO SSGT.Cliente
SELECT DISTINCT
tu.id_usuario,
CLIENTE_NOMBRE,
CLIENTE_APELLIDO,
CLIENTE_DNI,
CLIENTE_FECHA_NAC
FROM gd_esquema.Maestra m
JOIN SSGT.Usuario tu	on tu.d_email = m.CLIENTE_MAIL and
							tu.d_fecha_alta = CLI_USUARIO_FECHA_CREACION
WHERE CLIENTE_DNI IS NOT NULL

--Migra Vendedores. Cant: 89
INSERT INTO SSGT.Vendedor
SELECT DISTINCT
tu.id_usuario,
VENDEDOR_RAZON_SOCIAL,
VENDEDOR_CUIT
FROM gd_esquema.Maestra m
JOIN SSGT.Usuario tu on tu.d_email = m.VENDEDOR_MAIL
WHERE VENDEDOR_CUIT IS NOT NULL

--Migración Almacén (68).
insert into SSGT.Almacen (codigo_almacen, id_domicilio, costo_dia)
select distinct
	M.ALMACEN_CODIGO,
    d.id_domicilio,
	m.ALMACEN_COSTO_DIA_AL as costo_dia
from gd_esquema.Maestra m
JOIN SSGT.Domicilio d ON d.d_calle		= m.ALMACEN_CALLE AND 
						d.d_altura		= m.ALMACEN_NRO_CALLE
where m.ALMACEN_CODIGO is not null

--Tipo de Envio (3)
INSERT INTO SSGT.TipoEnvio (d_tipo_envio)
SELECT distinct ENVIO_TIPO
FROM gd_esquema.Maestra
WHERE ENVIO_TIPO IS NOT NULL

--MARCA (4)
insert into SSGT.Marca (d_marca)
select DISTINCT 
	m.PRODUCTO_MARCA as d_marca
from gd_esquema.Maestra m
where m.PRODUCTO_MARCA is not null

--MODELO (7)
insert into SSGT.Modelo (id_modelo, d_modelo)
select DISTINCT 
    m.PRODUCTO_MOD_CODIGO AS id_modelo,
	m.PRODUCTO_MOD_DESCRIPCION as d_modelo
from gd_esquema.Maestra m
where m.PRODUCTO_MOD_CODIGO is not null

--RUBRO (22)
insert into SSGT.Rubro (d_rubro)
select DISTINCT 
	m.PRODUCTO_RUBRO_DESCRIPCION as d_rubro	
from gd_esquema.Maestra m
where m.PRODUCTO_RUBRO_DESCRIPCION is not null

  --Subrubro (815)
insert into SSGT.Subrubro (id_rubro, d_subrubro)
select DISTINCT 
 	r.id_rubro,
	m.PRODUCTO_SUB_RUBRO as d_subrubro
from gd_esquema.Maestra m
JOIN SSGT.Rubro r on r.d_rubro = m.PRODUCTO_RUBRO_DESCRIPCION
	where m.PRODUCTO_SUB_RUBRO is not null

--Producto. (6893)
INSERT INTO SSGT.PRODUCTO (id_subrubro, id_marca, id_modelo, codigo_producto, d_descripcion, precio)
	SELECT DISTINCT  
		sub.id_subrubro, 
		ma.id_marca, 
		mo.id_modelo, 
		m.PRODUCTO_CODIGO,
		m.PRODUCTO_DESCRIPCION, 
		m.PRODUCTO_PRECIO
	FROM gd_esquema.Maestra m
	JOIN SSGT.Subrubro sub ON sub.d_subrubro = m.PRODUCTO_SUB_RUBRO and sub.id_rubro = (SELECT r.id_rubro FROM SSGT.Rubro r WHERE r.d_rubro = m.PRODUCTO_RUBRO_DESCRIPCION)
	JOIN SSGT.Marca ma ON ma.d_marca = m.PRODUCTO_MARCA
	JOIN SSGT.Modelo mo ON mo.id_modelo = m.PRODUCTO_MOD_CODIGO
	WHERE m.PRODUCTO_CODIGO IS NOT NULL;

--Publicacion (34629)
INSERT INTO SSGT.Publicacion
SELECT DISTINCT
	m.PUBLICACION_CODIGO,
	tv.id_vendedor,
	tp.id_producto,
	ta.codigo_almacen,
    m.PUBLICACION_DESCRIPCION,
    m.PUBLICACION_FECHA AS fecha_inicio,
    m.PUBLICACION_FECHA_V AS fecha_fin,
    m.PUBLICACION_STOCK,
    m.PUBLICACION_PRECIO,
    m.PUBLICACION_COSTO,
    m.PUBLICACION_PORC_VENTA
FROM gd_esquema.Maestra m
JOIN SSGT.Almacen ta ON ta.codigo_almacen = m.ALMACEN_CODIGO
JOIN SSGT.Producto tp ON tp.id_subrubro = (select TOP 1 sub.id_subrubro from SSGT.Subrubro sub where sub.d_subrubro = m.PRODUCTO_SUB_RUBRO and
											sub.id_rubro = (SELECT TOP 1 r.id_rubro From SSGT.Rubro r where r.d_rubro = m.PRODUCTO_RUBRO_DESCRIPCION)) and
						tp.id_marca = (select ma.id_marca from SSGT.marca ma where ma.d_marca = m.PRODUCTO_MARCA) and
						tp.id_modelo = M.PRODUCTO_MOD_CODIGO and
						tp.codigo_producto = m.PRODUCTO_CODIGO and
						tp.d_descripcion = m.PRODUCTO_DESCRIPCION and
						tp.precio = m.PRODUCTO_PRECIO
JOIN SSGT.Vendedor tv ON tv.d_cuit = m.VENDEDOR_CUIT
WHERE m.PUBLICACION_CODIGO is not null

--CONCEPTO DET FACTURA (3)
INSERT INTO SSGT.Concepto_Det_Factura (d_concepto)
SELECT DISTINCT
	FACTURA_DET_TIPO
FROM gd_esquema.Maestra
WHERE FACTURA_DET_TIPO IS NOT NULL

--Factura (34629)
INSERT INTO SSGT.Factura
SELECT DISTINCT m.FACTURA_NUMERO,
p.id_vendedor,
m.FACTURA_FECHA,
m.FACTURA_TOTAL
from gd_esquema.Maestra m
JOIN SSGT.Publicacion p on p.id_publicacion = m.PUBLICACION_CODIGO
JOIN SSGT.Vendedor v on v.id_vendedor = p.id_vendedor
WHERE m.FACTURA_NUMERO IS NOT NULL

--Detalle Factura (103387)
INSERT INTO SSGT.DetalleFactura
SELECT DISTINCT
	f.factura_numero,
	tp.id_publicacion,
    tcdf.id_concepto_factura,
    m.FACTURA_DET_PRECIO,
    m.FACTURA_DET_CANTIDAD,
    m.FACTURA_DET_SUBTOTAL
FROM gd_esquema.Maestra m
JOIN SSGT.Factura f on f.factura_numero = m.FACTURA_NUMERO
JOIN SSGT.Publicacion tp on tp.id_publicacion = m.PUBLICACION_CODIGO
JOIN SSGT.Concepto_Det_Factura tcdf ON tcdf.d_concepto = m.FACTURA_DET_TIPO
WHERE m.FACTURA_DET_PRECIO IS NOT NULL;

INSERT INTO SSGT.Venta (codigo_venta, id_cliente, f_venta, importe_total)
SELECT DISTINCT
m.VENTA_CODIGO,
c.id_cliente,
m.VENTA_FECHA,
m.VENTA_TOTAL
from gd_esquema.Maestra m
JOIN SSGT.Publicacion p on p.id_publicacion = m.PUBLICACION_CODIGO
JOIN SSGT.Cliente c on	c.dni = m.CLIENTE_DNI and c.apellido = m.CLIENTE_APELLIDO and c.nombre = CLIENTE_NOMBRE
WHERE m.VENTA_CODIGO IS NOT NULL


--DETALLE DE VENTA (103592) Con Distinct 80080
INSERT INTO SSGT.DetalleVenta(id_publicacion, codigo_venta, cantidad, precio, subtotal)
SELECT 
p.id_publicacion,
v.codigo_venta,
m.VENTA_DET_CANT,
m.VENTA_DET_PRECIO,
m.VENTA_DET_SUB_TOTAL
from gd_esquema.Maestra m
join SSGT.Publicacion p on p.id_publicacion = m.PUBLICACION_CODIGO
JOIN SSGT.VENTA v on m.VENTA_CODIGO = v.codigo_venta
where	m.venta_det_precio is not null and
		m.PUBLICACION_CODIGO is not null

--TipoMedioPago (2)
INSERT INTO SSGT.TipoMedioPago (d_tipo_medio_pago)
SELECT DISTINCT
PAGO_TIPO_MEDIO_PAGO
FROM gd_esquema.Maestra m
WHERE PAGO_TIPO_MEDIO_PAGO IS NOT NULL

--Medio de Pago (103592).
INSERT INTO SSGT.MedioPago (d_medio_pago, nro_tarjeta, f_vencimiento, id_tipo_medio_pago)
SELECT DISTINCT
m.PAGO_MEDIO_PAGO,
m.PAGO_NRO_TARJETA,
M.PAGO_FECHA_VENC_TARJETA,
id_tipo_medio_pago
FROM gd_esquema.Maestra m
JOIN SSGT.TipoMedioPago tpm on tpm.d_tipo_medio_pago = m.PAGO_TIPO_MEDIO_PAGO
WHERE PAGO_MEDIO_PAGO IS NOT NULL

--PAGO ()
INSERT INTO SSGT.Pago(codigo_venta, id_medio_pago, importe_total)
SELECT DISTINCT
tv.codigo_venta,
tmp.id_medio_pago,
m.PAGO_IMPORTE
from gd_esquema.Maestra m
JOIN SSGT.MedioPago tmp on tmp.d_medio_pago= m.PAGO_MEDIO_PAGO
JOIN SSGT.Venta tv on tv.codigo_venta = m.venta_codigo
where m.VENTA_CODIGO is not null and
		m.pago_importe is not null

--DetallePago ()
INSERT INTO SSGT.DetallePago
SELECT DISTINCT
p.id_pago,
PAGO_NRO_TARJETA,
PAGO_FECHA_VENC_TARJETA,
PAGO_FECHA,
PAGO_CANT_CUOTAS
from gd_esquema.Maestra m
JOIN SSGT.Pago p on p.codigo_venta = m.VENTA_CODIGO and
					p.id_medio_pago = (SELECT mp.id_medio_pago FROM SSGT.MedioPago mp where mp.nro_tarjeta= m.PAGO_NRO_TARJETA) and
					p.importe_total = m.PAGO_IMPORTE
WHERE PAGO_NRO_TARJETA IS NOT NULL

--ENVIO	()
INSERT INTO SSGT.Envio
SELECT 
	tv.codigo_venta,
	td.id_domicilio,
	te.id_tipo_envio, 
	m.ENVIO_FECHA_PROGAMADA,
	m.ENVIO_HORA_INICIO,
	m.ENVIO_HORA_FIN_INICIO,
	m.ENVIO_FECHA_ENTREGA,
	m.ENVIO_COSTO
from gd_esquema.Maestra m
JOIN SSGT.TipoEnvio te on te.d_tipo_envio = m.ENVIO_TIPO
JOIN SSGT.Domicilio td on td.d_calle= m.CLI_USUARIO_DOMICILIO_CALLE and
						td.d_altura= m.CLI_USUARIO_DOMICILIO_NRO_CALLE and
						td.d_piso= m.CLI_USUARIO_DOMICILIO_PISO and
						td.d_depto= m.CLI_USUARIO_DOMICILIO_DEPTO and
						td.id_localidad = (SELECT TOP 1 l.id_localidad From SSGT.Localidad l where l.d_localidad = m.CLI_USUARIO_DOMICILIO_LOCALIDAD and
																								l.id_provincia = (SELECT TOP 1 p.id_provincia From SSGT.Provincia p where p.d_provincia = m.CLI_USUARIO_DOMICILIO_PROVINCIA))
JOIN SSGT.Venta tv on tv.codigo_venta = m.VENTA_CODIGO
WHERE m.ENVIO_FECHA_PROGAMADA is not null
