USE [DBpresupuesto]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 1/05/2024 11:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id_categorias] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[id_usuarios] [int] NULL,
	[id_tiposOp] [int] NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[id_categorias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](1000) NULL,
	[id_TiposCuen] [int] NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentas]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentas](
	[id_tiposCuen] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Orden] [int] NULL,
	[id_usuarios] [int] NULL,
 CONSTRAINT [PK_TiposCuentas] PRIMARY KEY CLUSTERED 
(
	[id_tiposCuen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposOperaciones]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposOperaciones](
	[id_tiposOp] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nchar](100) NULL,
 CONSTRAINT [PK_TiposOperaciones] PRIMARY KEY CLUSTERED 
(
	[id_tiposOp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[id_transacciones] [int] IDENTITY(1,1) NOT NULL,
	[fechaTransaccion] [datetime] NULL,
	[monto] [decimal](18, 2) NULL,
	[nota] [nvarchar](1000) NULL,
	[id_usuarios] [int] NULL,
	[id_cuenta] [int] NULL,
	[id_categorias] [int] NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[id_transacciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuarios] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[EmailNormalizado] [nvarchar](250) NULL,
	[PaswordHash] [nvarchar](250) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categorias]  WITH CHECK ADD  CONSTRAINT [FK_categorias_TiposOperaciones] FOREIGN KEY([id_tiposOp])
REFERENCES [dbo].[TiposOperaciones] ([id_tiposOp])
GO
ALTER TABLE [dbo].[categorias] CHECK CONSTRAINT [FK_categorias_TiposOperaciones]
GO
ALTER TABLE [dbo].[categorias]  WITH CHECK ADD  CONSTRAINT [FK_categorias_usuarios] FOREIGN KEY([id_usuarios])
REFERENCES [dbo].[usuarios] ([id_usuarios])
GO
ALTER TABLE [dbo].[categorias] CHECK CONSTRAINT [FK_categorias_usuarios]
GO
ALTER TABLE [dbo].[TiposCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TiposCuentas_usuarios] FOREIGN KEY([id_usuarios])
REFERENCES [dbo].[usuarios] ([id_usuarios])
GO
ALTER TABLE [dbo].[TiposCuentas] CHECK CONSTRAINT [FK_TiposCuentas_usuarios]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_categorias] FOREIGN KEY([id_categorias])
REFERENCES [dbo].[categorias] ([id_categorias])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_categorias]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Cuentas] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[Cuentas] ([id_cuenta])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Cuentas]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_usuarios] FOREIGN KEY([id_usuarios])
REFERENCES [dbo].[usuarios] ([id_usuarios])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_usuarios]
GO
/****** Object:  StoredProcedure [dbo].[CrearDatosUsuarioNuevo]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearDatosUsuarioNuevo]
	-- Add the parameters for the stored procedure here
	@id_usuarios int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Efectivo nvarchar(50) = 'Efectivo';
	DECLARE @CuentasDeBanco nvarchar(50) = 'Cuentas de Banco';
	DECLARE @Tarjetas nvarchar(50) = 'Tarjetas';

	INSERT INTO TiposCuentas(Nombre,id_usuarios,Orden)
	VALUES (@Efectivo,@id_usuarios,1),
			(@CuentasDeBanco,@id_usuarios,2),
			(@Tarjetas,@id_usuarios,3);

	INSERT INTO Cuentas(Nombre,Balance,id_TiposCuen)
	SELECT Nombre, 0 , id_tiposCuen
	FROM TiposCuentas
	WHERE id_usuarios = @id_usuarios;

	INSERT INTO categorias(Nombre,id_tiposOp,id_usuarios)
	values('Libros',2,@id_usuarios),
	('Salario',1,@id_usuarios),
	('Mesada',1,@id_usuarios),
	('Comida',2,@id_usuarios)
END
GO
/****** Object:  StoredProcedure [dbo].[TiposCuentasInsertar]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TiposCuentasInsertar]
	@Nombre nvarchar(50),
	@id_usuarios int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @Orden int;
	SELECT @Orden = COALESCE(MAX(Orden), 0) +1
	FROM TiposCuentas
	WHERE id_usuarios = @id_usuarios

	INSERT INTO TiposCuentas(Nombre,Orden,id_usuarios)
	VALUES(@Nombre,@Orden,@id_usuarios)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Transaccion_Insertar]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaccion_Insertar] 
	-- Add the parameters for the stored procedure here
	@fechaTransaccion date,
	@monto decimal,
	@nota nvarchar(100) = NULL,
	@id_usuarios int,
	@id_cuenta int,
	@id_categorias int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insertando los datos en la tabla transaccion
	INSERT INTO Transacciones(fechaTransaccion,monto,nota,id_usuarios,id_cuenta,id_categorias)
	Values(@fechaTransaccion,ABS(@monto),@nota,@id_usuarios,@id_cuenta,@id_categorias)

	--actualizando los datos de la tabla cuentas
	UPDATE Cuentas
	SET Balance += @monto
	WHERE id_cuenta = @id_cuenta;
	
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Actualizar]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Actualizar] 
	-- Add the parameters for the stored procedure here
	@id_transacciones int,
	@fechaTransaccion datetime,
	@monto decimal(18,2),
	@MontoAnterior decimal(18,2),
	@id_cuenta int,
	@cuentaAnteriorId int,
	@id_categorias int,
	@nota nvarchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Revertir la transaccions anterior
	UPDATE Cuentas
	SET Balance -= @MontoAnterior
	WHERE id_cuenta = @cuentaAnteriorId;

	--Realizar la nueva Transaccion
	UPDATE Cuentas
	SET Balance += @monto
	WHERE id_cuenta = @id_cuenta;

	UPDATE Transacciones
	SET monto = ABS(@monto), fechaTransaccion = @fechaTransaccion,id_categorias = @id_categorias,id_cuenta = @id_cuenta,nota = @nota
	WHERE id_transacciones = @id_transacciones;
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Borrar]    Script Date: 1/05/2024 11:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Borrar]
	-- Add the parameters for the stored procedure here
	@id_transacciones int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @monto decimal(18,2);
	DECLARE @id_cuenta int;
	DECLARE @TipoOperacionId int;

	SELECT @monto = monto, @id_cuenta = id_cuenta, @TipoOperacionId = cat.id_tiposOp
	FROM Transacciones
	inner join categorias cat
	on cat.id_categorias = Transacciones.id_categorias
	where Transacciones.id_transacciones = @id_transacciones;

	DECLARE @FactorMultiplicativo int = 1;

	IF(@TipoOperacionId = 2)
		SET @FactorMultiplicativo = -1;

	set @monto = @monto * @FactorMultiplicativo;

	UPDATE Cuentas
	SET Balance -= @monto
	WHERE id_cuenta = @id_cuenta;

	DELETE Transacciones
	WHERE id_transacciones = @id_transacciones;

END
GO
