USE [CentroMedico]
GO
/****** Object:  UserDefinedDataType [dbo].[especialidad]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[especialidad] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[historia]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[historia] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observacion]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[observacion] FROM [varchar](1000) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[test]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[test] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 17/05/2024 23:56:58 ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspcialida] [dbo].[especialidad] IDENTITY(1,1) NOT NULL,
	[Especialidad] [varchar](30) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspcialida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia](
	[idHistoria] [dbo].[historia] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Historia] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idHistoria] [dbo].[historia] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [dbo].[medico] IDENTITY(1,1) NOT NULL,
	[Ncolegiado] [varchar](10) NULL,
	[Nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [dbo].[medico] NOT NULL,
	[idEspecialidad] [dbo].[especialidad] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MedicoEspecialidad] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](20) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fNacimiento] [date] NULL,
	[domicilio] [varchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacienteLog]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacienteLog](
	[idpaciente] [dbo].[paciente] NOT NULL,
	[idpais] [char](3) NULL,
	[fechaAlta] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[fechaBaja] [datetime] NULL,
 CONSTRAINT [PK_PacienteLog] PRIMARY KEY CLUSTERED 
(
	[idpaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[idConcepto] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[estado] [tinyint] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK__Pago__BD2295ADF2D4E821] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idPago] [int] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idTurno] [dbo].[turno] NOT NULL,
 CONSTRAINT [PK__PagoPaci__82C033A9C6936BF5] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idPaciente] ASC,
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[Pais] [varchar](30) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idEstado] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TurnoEstado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [dbo].[turno] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[Historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Paciente]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspcialida])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Concepto] FOREIGN KEY([idConcepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Concepto]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Paciente]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pago]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Turno]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idEstado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Medico]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
/****** Object:  StoredProcedure [dbo].[alta_paciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[alta_paciente](
@dni varchar(20),
@nombre varchar(50),
@apellido varchar(50),
@fNacimiento varchar(8),
@domicilio varchar(50),
@idPais char(3),
@telefono varchar(20),
@email varchar(30),
@observacion varchar(1000) = ''
)
AS

IF NOT EXISTS(SELECT * FROM Paciente WHERE dni = @dni)
BEGIN
	INSERT INTO Paciente(dni,nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)
	VALUES(@dni,@nombre,@apellido,@fNacimiento,@domicilio,@idPais,@telefono,@email,@observacion)
	PRINT 'EL PACIENTE AGG CORRECTAMENTE....'
	RETURN
END
ELSE
BEGIN
	PRINT 'EL PASIENTE YA EXISTE'
	RETURN
END


GO
/****** Object:  StoredProcedure [dbo].[alta_turno]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[alta_turno](
	@fechaTurno char(14), --20190215 12:00
	@idpaciente paciente,
	@idmedico medico,
	@observacion observacion = ''
)
AS
/*
ESTADO = 0(pendiente), 1=(realizado),2=(cancelado)
*/
-- Este script inserta diferentes turnos con la misma hora pero tiene que se diferente medico
SET NOCOUNT ON
IF NOT EXISTS(SELECT * FROM Turno t
INNER JOIN TurnoPaciente tp
ON t.idTurno = tp.idTurno
WHERE t.fechaTurno = @fechaTurno
AND (idMedico = @idmedico OR idPaciente = @idpaciente))
--IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno = @fechaTurno)
BEGIN
	--insertando el Turno
	INSERT INTO Turno(fechaTurno,estado,observacion)
	VALUES(@fechaTurno,0,@observacion)

	declare @auxIdTurno turno
	set @auxIdTurno = @@IDENTITY

	--insertando el turnopaciente
	INSERT INTO TurnoPaciente(idTurno,idPaciente,idMedico)
	VALUES(@auxIdTurno,@idpaciente,@idmedico)


	PRINT 'EL TURNO SE AGG CORRECTAMENTE....'
	RETURN
END
ELSE
BEGIN
	PRINT 'EL TURNO YA EXISTE'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[S_pacientes]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--

CREATE PROC [dbo].[S_pacientes](
	@idpaciente int
)
AS

SELECT nombre,apellido, idPais  ,observacion,
	(SELECT ps.Pais  FROM Pais ps WHERE ps.idPais = pa.idPais)AS descPais
FROM Paciente pa
WHERE idPaciente = @idpaciente
GO
/****** Object:  StoredProcedure [dbo].[sl_especialidaMedica]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sl_especialidaMedica]
AS
SET NOCOUNT ON
IF EXISTS(SELECT * FROM Especialidad)
BEGIN
	SELECT * FROM Especialidad	
END
ELSE
BEGIN
	SELECt 0 AS restulado
END

GO
/****** Object:  StoredProcedure [dbo].[slt_turnoPaciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[slt_turnoPaciente](@idpaciente paciente)
AS
set nocount on
	SELECT * FROM Paciente p
	inner join TurnoPaciente tp
	on tp.idPaciente = p.idPaciente
	inner join Turno t
	on tp.idTurno = t.idTurno
	inner join MedicoEspecialidad md
	on tp.idMedico = md.idMedico
	where p.idPaciente = @idpaciente
GO
/****** Object:  StoredProcedure [dbo].[sp_historiaPaciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_historiaPaciente](@idpaciente paciente)
AS
SET NOCOUNT ON
IF EXISTS(
	SELECT * FROM Paciente p
	inner join HistoriaPaciente hp
	on hp.idPaciente = p.idPaciente
	inner join Historia h
	on hp.idHistoria = h.idHistoria
	inner join Medico m
	on hp.idMedico = m.idMedico
	inner join MedicoEspecialidad me
	on me.idMedico = m.idMedico
	where p.idPaciente = @idpaciente
	)
BEGIN
	SELECT * FROM Paciente p
	inner join HistoriaPaciente hp
	on hp.idPaciente = p.idPaciente
	inner join Historia h
	on hp.idHistoria = h.idHistoria
	inner join Medico m
	on hp.idMedico = m.idMedico
	inner join MedicoEspecialidad me
	on me.idMedico = m.idMedico
	where p.idPaciente = @idpaciente
END
ELSE
	BEGIN
		PRINT 'NO EXISTE HISTORIA CLINIC PARA EL PACIENTE'
		SELECT 0 AS resultado
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_medicoEsp]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from medico
--select * from MedicoEspecialidad
CREATE PROC [dbo].[sp_medicoEsp](
@colegiado varchar(10),
@nombre varchar(50),
@apellido varchar(50),
@idespecialidad int,
@descripcion varchar(50)
)
AS

IF NOT EXISTS(SELECT TOP 1 * FROM Medico WHERE Ncolegiado = @colegiado )
BEGIN
	INSERT INTO Medico(Ncolegiado,Nombre,apellido) 
	VALUES(@colegiado,@nombre,@apellido)

	DECLARE @auxIdMedico medico
	SET @auxIdMedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad(idMedico,idEspecialidad,descripcion)
	VALUES(@auxIdMedico,@idespecialidad,@descripcion)
	PRINT 'SE AGREGO NUEVO MEDICO CON SU ESPECIALIDAD'
	RETURN
END
ELSE
BEGIN
	PRINT 'EL MEDICO YA EXISTE'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[up_paciente]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[up_paciente]( 
@idpaciente paciente,@nombre varchar(50),@apellido varchar(50),
@domicilio varchar(50))
AS 
SET NOCOUNT ON

declare @nom varchar(50)
declare @ape varchar(50)
SET @nom = UPPER(LEFT(@nombre,1))+ LOWER(RIGHT(@nombre,LEN(@nombre)-1))
SET @ape = UPPER(LEFT(@apellido,1))+ LOWER(RIGHT(@apellido,LEN(@apellido)-1))
BEGIN TRAN

	UPDATE Paciente SET nombre = @nom,apellido = @ape,
						domicilio = @domicilio where idPaciente = @idpaciente
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
BEGIN
	ROLLBACK TRAN
	PRINT 'NO SE LOGRO ACTUALIZar'
END
GO
/****** Object:  StoredProcedure [dbo].[up_turno]    Script Date: 17/05/2024 23:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_turno](@idturno turno)
AS
SET NOCOUNT ON
IF EXISTS(select * from Turno where idTurno = @idturno)
BEGIN
	DELETE FROM TurnoPaciente where idTurno = @idturno
	DELETE FROM Turno where idTurno = @idturno
	
END
ELSE
BEGIN
	SELECT 0 as resultado
END
GO
