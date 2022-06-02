USE [master]
GO
/****** Object:  Database [ToTheWorld]    Script Date: 01/06/2022 10:46:33 p. m. ******/
CREATE DATABASE [ToTheWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToTheWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ToTheWorld.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToTheWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ToTheWorld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ToTheWorld] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToTheWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToTheWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToTheWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToTheWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToTheWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToTheWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToTheWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToTheWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToTheWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToTheWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToTheWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToTheWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToTheWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToTheWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToTheWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToTheWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToTheWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToTheWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToTheWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToTheWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToTheWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToTheWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToTheWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToTheWorld] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToTheWorld] SET  MULTI_USER 
GO
ALTER DATABASE [ToTheWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToTheWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToTheWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToTheWorld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToTheWorld] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToTheWorld] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ToTheWorld] SET QUERY_STORE = OFF
GO
USE [ToTheWorld]
GO
/****** Object:  Table [dbo].[EstadoTipo]    Script Date: 01/06/2022 10:46:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoTipo](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_EstadoTipo] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 01/06/2022 10:46:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[IdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[Comentario] [nvarchar](max) NOT NULL,
	[Recomendaciones] [nvarchar](50) NULL,
	[Fotografía] [nvarchar](max) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VCiudad]    Script Date: 01/06/2022 10:46:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VCiudad]
AS
SELECT        dbo.Ciudades.IdCiudad, dbo.Ciudades.IdUsuario, dbo.Ciudades.Nombre, dbo.Ciudades.Estado, dbo.EstadoTipo.Descripcion, dbo.Ciudades.Comentario, dbo.Ciudades.Recomendaciones, dbo.Ciudades.Fotografía
FROM            dbo.Ciudades INNER JOIN
                         dbo.EstadoTipo ON dbo.Ciudades.Estado = dbo.EstadoTipo.IdEstado
GO
SET IDENTITY_INSERT [dbo].[Ciudades] ON 
GO
INSERT [dbo].[Ciudades] ([IdCiudad], [IdUsuario], [Nombre], [Estado], [Comentario], [Recomendaciones], [Fotografía]) VALUES (1, 1, N'Guanajuato', 11, N'Me gusto mucho es muy interesante y hay muchos lugares a donde ir', N'Museo de las momias', NULL)
GO
INSERT [dbo].[Ciudades] ([IdCiudad], [IdUsuario], [Nombre], [Estado], [Comentario], [Recomendaciones], [Fotografía]) VALUES (3, 2, N'Reynosa', 28, N'No hay muchos lugares a donde ir pero como es frontera se facilitan muchos puentes para acceder a Estados Unidos', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoTipo] ON 
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (1, N'Aguascalientes')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (2, N'Baja California')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (3, N'Baja California Sur')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (4, N'Campeche')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (5, N'Coahuila')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (6, N'Colima')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (7, N'Chiapas')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (8, N'Chihuahua')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (9, N'Durango')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (10, N'Distrito Federal')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (11, N'Guanajuato')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (12, N'Guerrero')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (13, N'Hidalgo')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (14, N'Jalisco')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (15, N'Estado de México')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (16, N'Michoacán')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (17, N'Morelos')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (18, N'Nayarit')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (19, N'Nuevo León')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (20, N'Oaxaca')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (21, N'Puebla')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (22, N'Querétaro')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (23, N'Quintana Roo')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (24, N'San Luis Potosí')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (25, N'Sinaloa')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (26, N'Sonora')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (27, N'Tabasco')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (28, N'Tamaulipas')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (29, N'Tlaxcala')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (30, N'Veracruz')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (31, N'Yucatán')
GO
INSERT [dbo].[EstadoTipo] ([IdEstado], [Descripcion]) VALUES (32, N'Zacatecas')
GO
SET IDENTITY_INSERT [dbo].[EstadoTipo] OFF
GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudades_EstadoTipo] FOREIGN KEY([Estado])
REFERENCES [dbo].[EstadoTipo] ([IdEstado])
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudades_EstadoTipo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Ciudades"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "EstadoTipo"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 102
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCiudad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VCiudad'
GO
USE [master]
GO
ALTER DATABASE [ToTheWorld] SET  READ_WRITE 
GO
