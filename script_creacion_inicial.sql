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
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Domicilio_Provincia') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Domicilio DROP CONSTRAINT FK_Domicilio_Provincia;
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
END

IF OBJECT_ID('SSGT.Producto', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Producto_Almacen') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Producto DROP CONSTRAINT FK_Producto_Almacen;
    END
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
END

IF OBJECT_ID('SSGT.Publicacion', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Vendedor') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Vendedor;
    END
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Producto') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Producto;
    END
	    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Publicacion_Almacen') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Publicacion DROP CONSTRAINT FK_Publicacion_Almacen;
    END
END

IF OBJECT_ID('SSGT.Venta', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Venta_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Venta DROP CONSTRAINT FK_Venta_Usuario;
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
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Factura_Publicacion') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Factura DROP CONSTRAINT FK_Factura_Publicacion;
    END
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Factura_Venta') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Factura DROP CONSTRAINT FK_Factura_Venta;
    END
END

IF OBJECT_ID('SSGT.DetalleFactura', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleFactura_Factura') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.DetalleFactura DROP CONSTRAINT FK_DetalleFactura_Factura;
    END
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_DetalleFactura_Concepto') AND type = 'F')
	BEGIN
        ALTER TABLE SSGT.DetalleFactura DROP CONSTRAINT FK_DetalleFactura_Concepto;
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
IF OBJECT_ID('SSGT.Venta', 'U') IS NOT NULL DROP TABLE SSGT.Venta;
IF OBJECT_ID('SSGT.Envio', 'U') IS NOT NULL DROP TABLE SSGT.Envio;
IF OBJECT_ID('SSGT.TipoEnvio', 'U') IS NOT NULL DROP TABLE SSGT.TipoEnvio;
IF OBJECT_ID('SSGT.Pago', 'U') IS NOT NULL DROP TABLE SSGT.Pago;
IF OBJECT_ID('SSGT.MedioPago', 'U') IS NOT NULL DROP TABLE SSGT.MedioPago;
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


-- Verificación y eliminación del esquema si ya existe
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'SSGT')
    DROP SCHEMA SSGT;
GO

-- Creación del esquema SSGT
CREATE SCHEMA SSGT;
GO
    
-- Creación de tablas dentro del esquema SSGT
CREATE TABLE SSGT.Domicilio (
    id_domicilio INT NOT NULL,
    id_provincia INT NOT NULL,
    id_localidad INT NOT NULL,
    d_calle VARCHAR(100),
    d_altura varchar(6),
    d_piso VARCHAR(10),
    d_depto VARCHAR(5),
    d_codigo_postal VARCHAR(5)
);

CREATE TABLE SSGT.Provincia (
    id_provincia INT NOT NULL,
    d_provincia VARCHAR(100)
);

CREATE TABLE SSGT.Localidad (
    id_localidad INT NOT NULL,
--    id_provincia INT NOT NULL,
    d_localidad VARCHAR(100)
);

CREATE TABLE SSGT.Usuario (
    id_usuario INT NOT NULL,
    d_email VARCHAR(100),
    d_password VARCHAR(80),
    d_fecha_alta DATE
);

CREATE TABLE SSGT.Cliente (
	id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    id_domicilio INT NOT NULL,
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	dni VARCHAR(10),
	f_nacimiento DATE
);

CREATE TABLE SSGT.Vendedor (
	id_vendedor INT NOT NULL,
    id_usuario INT NOT NULL,
    d_razon_social VARCHAR(50),
    d_cuit VARCHAR(25)
);

CREATE TABLE SSGT.Rubro (
    id_rubro INT NOT NULL,
    d_rubro VARCHAR(100)
);

CREATE TABLE SSGT.Subrubro (
    id_subrubro INT NOT NULL,
    id_rubro INT NOT NULL,
    d_subrubro VARCHAR(100)
);

CREATE TABLE SSGT.Marca (
    id_marca INT NOT NULL,
    d_marca VARCHAR(100)
);

CREATE TABLE SSGT.Modelo (
    id_modelo INT NOT NULL,
    d_modelo VARCHAR(100)
);

CREATE TABLE SSGT.Almacen (
    id_almacen INT NOT NULL,
    id_domicilio INT NOT NULL,
    costo_dia FLOAT
);

CREATE TABLE SSGT.Producto (
    id_producto INT NOT NULL,
    id_almacen INT NOT NULL,
    id_subrubro INT NOT NULL,
    id_marca INT NOT NULL,
    id_modelo INT NOT NULL,
    d_descripcion VARCHAR(1000),
    precio FLOAT
);

CREATE TABLE SSGT.Publicacion (
    id_publicacion INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_producto INT NOT NULL,
	id_almacen INT NOT NULL,
--    d_titulo VARCHAR(1000),
    d_descripcion VARCHAR(1000),
    fecha_inicio DATE,
	fecha_fin DATE,
	d_stock INT,
	d_precio FLOAT,
    costo FLOAT,
    porcentaje_venta FLOAT
);

CREATE TABLE SSGT.Venta (
    id_venta INT NOT NULL,
    id_detalle_venta INT NOT NULL,
    id_cliente INT NOT NULL,
    id_publicacion INT NOT NULL,
    importe_total FLOAT
);

CREATE TABLE SSGT.Envio (
    id_envio INT NOT NULL,
    id_venta INT NOT NULL,
    id_domicilio INT NOT NULL,
    id_tipo_envio INT NOT NULL,
    f_programada  DATE,
    hora_inicial DATETIME2,
    hora_final DATETIME2,
	f_entrega DATE,
    costo FLOAT
);


CREATE TABLE SSGT.TipoEnvio (
    id_tipo_envio INT NOT NULL,
    d_tipo_envio VARCHAR(100)
);

CREATE TABLE SSGT.Pago (
    id_pago INT NOT NULL,
    id_venta INT NOT NULL,
    id_medio_pago INT NOT NULL,
    id_detalle_pago INT NOT NULL,
    importe_total FLOAT
);	

CREATE TABLE SSGT.MedioPago (
    id_medio_pago INT NOT NULL,
    d_medio_pago VARCHAR(100)
);

CREATE TABLE SSGT.DetalleVenta (
    id_detalle_venta INT NOT NULL,
    --id_venta INT NOT NULL,
    precio FLOAT,
    cantidad INT,
    subtotal FLOAT,
	f_venta DATE
);

CREATE TABLE SSGT.DetallePago (
    id_detalle_pago INT NOT NULL,
    nro_tarjeta VARCHAR(16),
    f_vencimiento DATE,
    f_pago DATE,
    cuotas INT
);


CREATE TABLE SSGT.Factura (
    id_factura INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_publicacion INT NOT NULL,
    fecha DATE,
    importe_total FLOAT
);

CREATE TABLE SSGT.DetalleFactura (
    id_detalle_factura INT NOT NULL,
    id_factura INT NOT NULL,
    id_concepto_factura INT NOT NULL,
    precio FLOAT,
    cantidad INT,
    subtotal FLOAT
);

CREATE TABLE SSGT.Concepto_Det_Factura (
    id_concepto_factura INT NOT NULL,
    d_concepto VARCHAR(100)
);

-- Crea la secuencia comenzando en 1
CREATE SEQUENCE SSGT.DomicilioSeq
    START WITH 1
    INCREMENT BY 1;

-- Crea la secuencia comenzando en 1
CREATE SEQUENCE SSGT.SubrubroSeq
    START WITH 1
    INCREMENT BY 1;



-- Crea la secuencia comenzando en 1
CREATE SEQUENCE SSGT.RubroSeq
    START WITH 1
    INCREMENT BY 1;


-- Creación de PRIMARY KEY constraints
ALTER TABLE SSGT.Domicilio		ADD CONSTRAINT PK_Domicilio PRIMARY KEY (id_domicilio);
ALTER TABLE SSGT.Provincia		ADD CONSTRAINT PK_Provincia PRIMARY KEY (id_provincia);
ALTER TABLE SSGT.Localidad		ADD CONSTRAINT PK_Localidad PRIMARY KEY (id_localidad);
ALTER TABLE SSGT.Usuario		ADD CONSTRAINT PK_Usuario PRIMARY KEY (id_usuario);
ALTER TABLE SSGT.Cliente		ADD CONSTRAINT PK_Cliente PRIMARY KEY (id_cliente);
ALTER TABLE SSGT.Vendedor		ADD CONSTRAINT PK_Vendedor PRIMARY KEY (id_vendedor);
ALTER TABLE SSGT.Rubro			ADD CONSTRAINT PK_Rubro PRIMARY KEY (id_rubro);
ALTER TABLE SSGT.Subrubro		ADD CONSTRAINT PK_Subrubro PRIMARY KEY (id_subrubro);
ALTER TABLE SSGT.Marca			ADD CONSTRAINT PK_Marca PRIMARY KEY (id_marca);
ALTER TABLE SSGT.Modelo			ADD CONSTRAINT PK_Modelo PRIMARY KEY (id_modelo);
ALTER TABLE SSGT.Almacen		ADD CONSTRAINT PK_Almacen PRIMARY KEY (id_almacen);
ALTER TABLE SSGT.Producto		ADD CONSTRAINT PK_Producto PRIMARY KEY (id_producto);
ALTER TABLE SSGT.Publicacion	ADD CONSTRAINT PK_Publicacion PRIMARY KEY (id_publicacion);
ALTER TABLE SSGT.Venta			ADD CONSTRAINT PK_Venta PRIMARY KEY (id_venta);
ALTER TABLE SSGT.Envio			ADD CONSTRAINT PK_Envio PRIMARY KEY (id_envio);
ALTER TABLE SSGT.TipoEnvio		ADD CONSTRAINT PK_TipoEnvio PRIMARY KEY (id_tipo_envio);
ALTER TABLE SSGT.Pago			ADD CONSTRAINT PK_Pago PRIMARY KEY (id_pago);
ALTER TABLE SSGT.MedioPago		ADD CONSTRAINT PK_MedioPago PRIMARY KEY (id_medio_pago);
ALTER TABLE SSGT.DetalleVenta	ADD CONSTRAINT PK_DetalleVenta PRIMARY KEY (id_detalle_venta);
ALTER TABLE SSGT.DetallePago	ADD CONSTRAINT PK_DetallePago PRIMARY KEY (id_detalle_pago);
ALTER TABLE SSGT.Factura		ADD CONSTRAINT PK_Factura PRIMARY KEY (id_factura);
ALTER TABLE SSGT.DetalleFactura	ADD CONSTRAINT PK_DetalleFactura PRIMARY KEY (id_detalle_factura);
ALTER TABLE SSGT.Concepto_Det_Factura ADD CONSTRAINT PK_ConceptoDetFactura PRIMARY KEY (id_concepto_factura);

-- Creación de FOREIGN KEY constraints
ALTER TABLE SSGT.Almacen			ADD CONSTRAINT FK_Almacen_Domicilio		FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);

ALTER TABLE SSGT.Cliente			ADD CONSTRAINT FK_Cliente_Domicilio		FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Cliente			ADD CONSTRAINT FK_Cliente_Usuario		FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.Domicilio			ADD CONSTRAINT FK_Domicilio_Localidad	FOREIGN KEY (id_localidad) REFERENCES SSGT.Localidad(id_localidad);
ALTER TABLE SSGT.Domicilio			ADD CONSTRAINT FK_Domicilio_Provincia	FOREIGN KEY (id_provincia) REFERENCES SSGT.Provincia(id_provincia);
ALTER TABLE SSGT.DetalleFactura		ADD CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY (id_factura) REFERENCES SSGT.Factura(id_factura);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_Domicilio		FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_TipoEnvio		FOREIGN KEY (id_tipo_envio) REFERENCES SSGT.TipoEnvio(id_tipo_envio);
ALTER TABLE SSGT.Envio				ADD CONSTRAINT FK_Envio_Venta			FOREIGN KEY (id_venta) REFERENCES SSGT.Venta(id_venta);
ALTER TABLE SSGT.Factura			ADD CONSTRAINT FK_Factura_Publicacion	FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.Factura			ADD CONSTRAINT FK_Factura_Vendedor		FOREIGN KEY (id_vendedor) REFERENCES SSGT.Vendedor(id_vendedor);
--ALTER TABLE SSGT.Localidad			ADD CONSTRAINT FK_Localidad_Provincia	FOREIGN KEY (id_provincia) REFERENCES SSGT.Provincia(id_provincia);
ALTER TABLE SSGT.Pago				ADD CONSTRAINT FK_Pago_DetallePago		FOREIGN KEY (id_detalle_pago) REFERENCES SSGT.DetallePago(id_detalle_pago);
ALTER TABLE SSGT.Pago				ADD CONSTRAINT FK_Pago_MedioPago		FOREIGN KEY (id_medio_pago) REFERENCES SSGT.MedioPago(id_medio_pago);
ALTER TABLE SSGT.Pago				ADD CONSTRAINT FK_Pago_Venta			FOREIGN KEY (id_venta) REFERENCES SSGT.Venta(id_venta);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Almacen		FOREIGN KEY (id_almacen) REFERENCES SSGT.Almacen(id_almacen);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Marca		FOREIGN KEY (id_marca) REFERENCES SSGT.Marca(id_marca);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Modelo		FOREIGN KEY (id_modelo) REFERENCES SSGT.Modelo(id_modelo);
ALTER TABLE SSGT.Producto			ADD CONSTRAINT FK_Producto_Subrubro		FOREIGN KEY (id_subrubro) REFERENCES SSGT.Subrubro(id_subrubro);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Producto	FOREIGN KEY (id_producto) REFERENCES SSGT.Producto(id_producto);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Vendedor	FOREIGN KEY (id_vendedor) REFERENCES SSGT.Vendedor(id_vendedor);
ALTER TABLE SSGT.Publicacion		ADD CONSTRAINT FK_Publicacion_Almacen	FOREIGN KEY (id_almacen) REFERENCES SSGT.Almacen(id_almacen);
ALTER TABLE SSGT.Subrubro			ADD CONSTRAINT FK_Subrubro_Rubro		FOREIGN KEY (id_rubro) REFERENCES SSGT.Rubro(id_rubro);
ALTER TABLE SSGT.Venta				ADD CONSTRAINT FK_Venta_DetalleVenta	FOREIGN KEY (id_detalle_venta) REFERENCES SSGT.DetalleVenta(id_detalle_venta);
ALTER TABLE SSGT.Venta				ADD CONSTRAINT FK_Venta_Publicacion		FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.Venta				ADD CONSTRAINT FK_Venta_Cliente			FOREIGN KEY (id_cliente) REFERENCES SSGT.Cliente(id_cliente);
ALTER TABLE SSGT.Vendedor			ADD CONSTRAINT FK_Vendedor_Usuario		FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
DROP INDEX IX_Maestra_RubroSubRubro ON gd_esquema.Maestra;

-- Crear índice temporal
CREATE INDEX IX_Maestra_RubroSubRubro ON gd_esquema.Maestra (PRODUCTO_RUBRO_DESCRIPCION, PRODUCTO_SUB_RUBRO);




 --RUBRO
-- Inserta los valores únicos en la tabla Rubro
INSERT INTO SSGT.Rubro (id_rubro, d_rubro)
SELECT  
        NEXT VALUE FOR SSGT.RubroSeq 
 AS id_rubro,
    m.PRODUCTO_RUBRO_DESCRIPCION AS d_rubro
FROM gd_esquema.Maestra m
WHERE m.PRODUCTO_RUBRO_DESCRIPCION IS NOT NULL
GROUP BY m.PRODUCTO_RUBRO_DESCRIPCION;


--Subrubro
-- Inserta en la tabla Subrubro con la FK del Rubro asociado
INSERT INTO SSGT.Subrubro (id_subrubro, id_rubro, d_subrubro)
SELECT  
            NEXT VALUE FOR SSGT.SubrubroSeq 
 AS id_subrubro,
    r.id_rubro,
    m.PRODUCTO_SUB_RUBRO AS d_subrubro
FROM gd_esquema.Maestra m
JOIN SSGT.Rubro r ON r.d_rubro = m.PRODUCTO_RUBRO_DESCRIPCION
WHERE m.PRODUCTO_SUB_RUBRO IS NOT NULL
GROUP BY m.PRODUCTO_SUB_RUBRO, r.id_rubro;



  
--PRODUCTO
/*insert into SSGT.Producto
select 
	m.producto_codigo as c_producto,
	m.PRODUCTO_DESCRIPCION as d_descripcion,
	m.PRODUCTO_PRECIO as precio,
	mar.id_marca as id_marca,
	mo.id_modelo as  id_modelo,
	sub.id_subrubro as id_subrubro,
	alm.id_almacen as id_almacen
from gd_esquema.Maestra m
JOIN SSGT.Marca mar ON mar.id_marca= m.PRODUCTO_MARCA
JOIN SSGT.Modelo mo ON mo.id_modelo = m.PRODUCTO_MOD_CODIGO
JOIN SSGT.Subrubro sub ON sub.id_subrubro = m.PRODUCTO_SUB_RUBRO
JOIN SSGT.Almacen alm ON alm.id_almacen = m.ALMACEN_CODIGO;
*/
