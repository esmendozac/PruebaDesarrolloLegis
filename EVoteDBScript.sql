USE [EVote]
GO
/****** Object:  User [evoteuser]    Script Date: 10/09/2020 8:59:57 p. m. ******/
CREATE USER [evoteuser] FOR LOGIN [evoteuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [evoteuser]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [evoteuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [evoteuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [evoteuser]
GO
/****** Object:  Table [dbo].[Eleccion]    Script Date: 10/09/2020 8:59:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eleccion](
	[IdEleccion] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](max) NOT NULL,
	[FechaInicio] [datetime2](7) NOT NULL,
	[FechaFin] [datetime2](7) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Eleccion] PRIMARY KEY CLUSTERED 
(
	[IdEleccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 10/09/2020 8:59:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](200) NOT NULL,
	[Apellidos] [varchar](200) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[TipoIdentificacion] [varchar](20) NOT NULL,
	[NumeroIdentificacion] [varchar](50) NOT NULL,
	[Sexo] [varchar](20) NULL,
	[Foto] [varchar](max) NULL,
	[Contrasena] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaRol]    Script Date: 10/09/2020 8:59:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaRol](
	[IdPersonaRol] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[Propuestas] [varchar](max) NULL,
	[Rol] [varchar](30) NOT NULL,
	[IdEleccion] [int] NULL,
 CONSTRAINT [PK_PersonaRol] PRIMARY KEY CLUSTERED 
(
	[IdPersonaRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voto]    Script Date: 10/09/2020 8:59:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voto](
	[IdVoto] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[IdVotante] [int] NOT NULL,
	[IdCandidato] [int] NULL,
 CONSTRAINT [PK_Voto] PRIMARY KEY CLUSTERED 
(
	[IdVoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonaRol]  WITH CHECK ADD  CONSTRAINT [FK_PersonaRol_Eleccion] FOREIGN KEY([IdEleccion])
REFERENCES [dbo].[Eleccion] ([IdEleccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonaRol] CHECK CONSTRAINT [FK_PersonaRol_Eleccion]
GO
ALTER TABLE [dbo].[PersonaRol]  WITH CHECK ADD  CONSTRAINT [FK_PersonaRol_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonaRol] CHECK CONSTRAINT [FK_PersonaRol_Persona]
GO
ALTER TABLE [dbo].[Voto]  WITH CHECK ADD  CONSTRAINT [FK_Voto_PersonaRolCandidato] FOREIGN KEY([IdCandidato])
REFERENCES [dbo].[PersonaRol] ([IdPersonaRol])
GO
ALTER TABLE [dbo].[Voto] CHECK CONSTRAINT [FK_Voto_PersonaRolCandidato]
GO
ALTER TABLE [dbo].[Voto]  WITH CHECK ADD  CONSTRAINT [FK_Voto_PersonaRolVotante] FOREIGN KEY([IdVotante])
REFERENCES [dbo].[PersonaRol] ([IdPersonaRol])
GO
ALTER TABLE [dbo].[Voto] CHECK CONSTRAINT [FK_Voto_PersonaRolVotante]
GO
