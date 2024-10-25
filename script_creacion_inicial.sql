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


IF OBJECT_ID('SSGT.Envio', 'U') IS NOT NULL 
BEGIN
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
END

IF OBJECT_ID('SSGT.Vendedor', 'U') IS NOT NULL 
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Vendedor_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Vendedor DROP CONSTRAINT FK_Vendedor_Usuario;
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
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SSGT.FK_Factura_Usuario') AND type = 'F')
    BEGIN
        ALTER TABLE SSGT.Factura DROP CONSTRAINT FK_Factura_Usuario;
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
    d_provincia VARCHAR(50),
    d_localidad VARCHAR(100),
    d_calle VARCHAR(100),
    d_altura INT,
    d_piso VARCHAR(10),
    d_depto VARCHAR(5),
    d_codigo_postal VARCHAR(5),
    d_localidad_desc VARCHAR(30)
);

CREATE TABLE SSGT.Provincia (
    id_provincia INT NOT NULL,
    d_provincia VARCHAR(100)
);

CREATE TABLE SSGT.Localidad (
    id_localidad INT NOT NULL,
    id_provincia INT NOT NULL,
    d_localidad VARCHAR(100)
);

CREATE TABLE SSGT.Usuario (
    id_usuario INT NOT NULL,
    d_email VARCHAR(100),
    d_password VARCHAR(80),
    d_fecha_alta DATE
);

CREATE TABLE SSGT.Cliente (
    id_usuario INT NOT NULL,
    id_domicilio INT NOT NULL
);

CREATE TABLE SSGT.Vendedor (
    id_usuario INT NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20)
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
    id_marca INT NOT NULL,
    d_modelo VARCHAR(100)
);

CREATE TABLE SSGT.Almacen (
    id_almacen INT NOT NULL,
    d_direccion VARCHAR(100),
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
    d_titulo VARCHAR(1000),
    d_descripcion VARCHAR(1000),
    fecha_inicio DATE,
    fecha_fin DATE,
    costo FLOAT,
    porcentaje_venta FLOAT
);

CREATE TABLE SSGT.Venta (
    id_venta INT NOT NULL,
    id_comprador INT NOT NULL,
    id_publicacion INT NOT NULL,
    importe_total FLOAT,
    fecha DATE
);

CREATE TABLE SSGT.Envio (
    id_envio INT NOT NULL,
    id_venta INT NOT NULL,
    id_domicilio INT NOT NULL,
    id_tipo_envio INT NOT NULL,
    f_prog  DATE,
    f_entrega DATE,
    hora_inicio INT,
    hora_fin INT,
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
    fecha DATE,
    f_limite DATE,
    importe_total FLOAT
);


CREATE TABLE SSGT.MedioPago (
    id_medio_pago INT NOT NULL,
    d_medio_pago VARCHAR(100)
);

CREATE TABLE SSGT.DetalleVenta (
    id_detalle_venta INT NOT NULL,
    id_venta INT NOT NULL,
    precio FLOAT,
    cantidad INT,
    subtotal FLOAT
);

CREATE TABLE SSGT.DetallePago (
    id_detalle INT NOT NULL,
    n_registro VARCHAR(16),
    f_vencimiento DATE,
    importe_total FLOAT,
    card_cuotas INT
);

CREATE TABLE SSGT.Factura (
    id_factura INT NOT NULL,
    id_usuario INT NOT NULL,
    id_publicacion INT NOT NULL,
    id_venta INT NOT NULL,
    fecha DATE,
    importe_total FLOAT
);

CREATE TABLE SSGT.DetalleFactura (
    id_detalle_factura INT NOT NULL,
    id_factura INT NOT NULL,
    id_concepto INT NOT NULL,
    precio FLOAT,
    cantidad INT,
    subtotal FLOAT
);

CREATE TABLE SSGT.Concepto_Det_Factura (
    id_concepto_factura INT NOT NULL,
    d_concepto VARCHAR(100)
);

-- Creación de PRIMARY KEY constraints
ALTER TABLE SSGT.Domicilio ADD CONSTRAINT PK_Domicilio PRIMARY KEY (id_domicilio);
ALTER TABLE SSGT.Provincia ADD CONSTRAINT PK_Provincia PRIMARY KEY (id_provincia);
ALTER TABLE SSGT.Localidad ADD CONSTRAINT PK_Localidad PRIMARY KEY (id_localidad);
ALTER TABLE SSGT.Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (id_usuario);
ALTER TABLE SSGT.Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (id_usuario);
ALTER TABLE SSGT.Vendedor ADD CONSTRAINT PK_Vendedor PRIMARY KEY (id_usuario);
ALTER TABLE SSGT.Rubro ADD CONSTRAINT PK_Rubro PRIMARY KEY (id_rubro);
ALTER TABLE SSGT.Subrubro ADD CONSTRAINT PK_Subrubro PRIMARY KEY (id_subrubro);
ALTER TABLE SSGT.Marca ADD CONSTRAINT PK_Marca PRIMARY KEY (id_marca);
ALTER TABLE SSGT.Modelo ADD CONSTRAINT PK_Modelo PRIMARY KEY (id_modelo);
ALTER TABLE SSGT.Almacen ADD CONSTRAINT PK_Almacen PRIMARY KEY (id_almacen);
ALTER TABLE SSGT.Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (id_producto);
ALTER TABLE SSGT.Publicacion ADD CONSTRAINT PK_Publicacion PRIMARY KEY (id_publicacion);
ALTER TABLE SSGT.Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (id_venta);
ALTER TABLE SSGT.Envio ADD CONSTRAINT PK_Envio PRIMARY KEY (id_envio);
ALTER TABLE SSGT.TipoEnvio ADD CONSTRAINT PK_TipoEnvio PRIMARY KEY (id_tipo_envio);
ALTER TABLE SSGT.Pago ADD CONSTRAINT PK_Pago PRIMARY KEY (id_pago);
ALTER TABLE SSGT.MedioPago ADD CONSTRAINT PK_MedioPago PRIMARY KEY (id_medio_pago);
ALTER TABLE SSGT.DetalleVenta ADD CONSTRAINT PK_DetalleVenta PRIMARY KEY (id_detalle_venta);
ALTER TABLE SSGT.DetallePago ADD CONSTRAINT PK_DetallePago PRIMARY KEY (id_detalle);
ALTER TABLE SSGT.Factura ADD CONSTRAINT PK_Factura PRIMARY KEY (id_factura);
ALTER TABLE SSGT.DetalleFactura ADD CONSTRAINT PK_DetalleFactura PRIMARY KEY (id_detalle_factura);
ALTER TABLE SSGT.Concepto_Det_Factura ADD CONSTRAINT PK_ConceptoDetFactura PRIMARY KEY (id_concepto_factura);

-- Creación de FOREIGN KEY constraints
ALTER TABLE SSGT.Cliente ADD CONSTRAINT FK_Cliente_Domicilio FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Vendedor ADD CONSTRAINT FK_Vendedor_Usuario FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.Localidad ADD CONSTRAINT FK_Localidad_Provincia FOREIGN KEY (id_provincia) REFERENCES SSGT.Provincia(id_provincia);
ALTER TABLE SSGT.Subrubro ADD CONSTRAINT FK_Subrubro_Rubro FOREIGN KEY (id_rubro) REFERENCES SSGT.Rubro(id_rubro);
ALTER TABLE SSGT.Modelo ADD CONSTRAINT FK_Modelo_Marca FOREIGN KEY (id_marca) REFERENCES SSGT.Marca(id_marca);
ALTER TABLE SSGT.Producto ADD CONSTRAINT FK_Producto_Almacen FOREIGN KEY (id_almacen) REFERENCES SSGT.Almacen(id_almacen);
ALTER TABLE SSGT.Producto ADD CONSTRAINT FK_Producto_Subrubro FOREIGN KEY (id_subrubro) REFERENCES SSGT.Subrubro(id_subrubro);
ALTER TABLE SSGT.Producto ADD CONSTRAINT FK_Producto_Marca FOREIGN KEY (id_marca) REFERENCES SSGT.Marca(id_marca);
ALTER TABLE SSGT.Producto ADD CONSTRAINT FK_Producto_Modelo FOREIGN KEY (id_modelo) REFERENCES SSGT.Modelo(id_modelo);
ALTER TABLE SSGT.Publicacion ADD CONSTRAINT FK_Publicacion_Vendedor FOREIGN KEY (id_vendedor) REFERENCES SSGT.Vendedor(id_usuario);
ALTER TABLE SSGT.Publicacion ADD CONSTRAINT FK_Publicacion_Producto FOREIGN KEY (id_producto) REFERENCES SSGT.Producto(id_producto);
ALTER TABLE SSGT.Venta ADD CONSTRAINT FK_Venta_Usuario FOREIGN KEY (id_comprador) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.Venta ADD CONSTRAINT FK_Venta_Publicacion FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.Envio ADD CONSTRAINT FK_Envio_Venta FOREIGN KEY (id_venta) REFERENCES SSGT.Venta(id_venta);
ALTER TABLE SSGT.Envio ADD CONSTRAINT FK_Envio_Domicilio FOREIGN KEY (id_domicilio) REFERENCES SSGT.Domicilio(id_domicilio);
ALTER TABLE SSGT.Envio ADD CONSTRAINT FK_Envio_TipoEnvio FOREIGN KEY (id_tipo_envio) REFERENCES SSGT.TipoEnvio(id_tipo_envio);
ALTER TABLE SSGT.Pago ADD CONSTRAINT FK_Pago_MedioPago FOREIGN KEY (id_medio_pago) REFERENCES SSGT.MedioPago(id_medio_pago);
ALTER TABLE SSGT.Pago ADD CONSTRAINT FK_Pago_Venta FOREIGN KEY (id_venta) REFERENCES SSGT.Venta(id_venta);
ALTER TABLE SSGT.Factura ADD CONSTRAINT FK_Factura_Usuario FOREIGN KEY (id_usuario) REFERENCES SSGT.Usuario(id_usuario);
ALTER TABLE SSGT.Factura ADD CONSTRAINT FK_Factura_Publicacion FOREIGN KEY (id_publicacion) REFERENCES SSGT.Publicacion(id_publicacion);
ALTER TABLE SSGT.Factura ADD CONSTRAINT FK_Factura_Venta FOREIGN KEY (id_venta) REFERENCES SSGT.Venta(id_venta);
ALTER TABLE SSGT.DetalleFactura ADD CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY (id_factura) REFERENCES SSGT.Factura(id_factura);

-- Domicilio y Ventas antes de pago y envio

INSERT INTO SSGT.MedioPago
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT null)), PAGO_MEDIO_PAGO
FROM gd_esquema.Maestra
WHERE PAGO_MEDIO_PAGO IS NOT NULL
GROUP BY PAGO_MEDIO_PAGO 

INSERT INTO SSGT.TipoEnvio
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT null)), ENVIO_TIPO
FROM gd_esquema.Maestra
WHERE ENVIO_TIPO IS NOT NULL
GROUP BY ENVIO_TIPO 

INSERT INTO SSGT.Envio
SELECT 
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), 
tv.id_venta,tv.id_domicilio,te.id_tipo_envio, 
m.ENVIO_FECHA_PROGAMADA , m.ENVIO_FECHA_ENTREGA,
m.ENVIO_HORA_INICIO, m.ENVIO_HORA_FIN_INICIO, m.ENVIO_COSTO
from gd_esquema.Maestra m
JOIN SSGT.TipoEnvio te on te.d_tipo_envio = m.ENVIO_TIPO
JOIN SSGT.Domicilio td 
on 
td.d_calle= m.CLI_USUARIO_DOMICILIO_CALLE, 
td.d_altura= m.CLI_USUARIO_DOMICILIO_NRO_CALLE,
td.d_piso= m.CLI_USUARIO_DOMICILIO_PISO,
td.d_depto= m.CLI_USUARIO_DOMICILIO_DEPTO
JOIN SSGT.Venta tv on tv.id_venta = m.VENTA_CODIGO

INSERT INTO SSGT.Pago
SELECT 
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), 
tv.id_venta,tmp.id_medio_pago,m.PAGO_FECHA,m.PAGO_FECHA_VENC_TARJETA,m.PAGO_IMPORTE
from gd_esquema.Maestra m
JOIN SSGT.MedioPago tmp on tmp.d_medio_pago= m.PAGO_MEDIO_PAGO
JOIN SSGT.Venta tv on tv.id_venta = m.VENTA_CODIGO

