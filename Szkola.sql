
CREATE DATABASE [Szkola]
GO
USE [Szkola]

/****** Object:  Table [dbo].[Klasa]    Script Date: 16.02.2021 21:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rocznik] [int] NOT NULL,
	[Litera] [nchar](1) NOT NULL,
	[Id_Wychowawcy] [int] NOT NULL,
 CONSTRAINT [PK_Klasa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocena]    Script Date: 16.02.2021 21:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocena](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ocena] [int] NOT NULL,
	[Id_Ucznia] [int] NOT NULL,
 CONSTRAINT [PK_Ocena] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uczen]    Script Date: 16.02.2021 21:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uczen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[Id_Klasy] [int] NOT NULL,
 CONSTRAINT [PK_Uczen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wychowawca]    Script Date: 16.02.2021 21:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wychowawca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Wychowawca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Klasa]  WITH CHECK ADD  CONSTRAINT [FK_Klasa_Wychowawca] FOREIGN KEY([Id_Wychowawcy])
REFERENCES [dbo].[Wychowawca] ([Id])
GO
ALTER TABLE [dbo].[Klasa] CHECK CONSTRAINT [FK_Klasa_Wychowawca]
GO
ALTER TABLE [dbo].[Ocena]  WITH CHECK ADD  CONSTRAINT [FK_Ocena_Uczen] FOREIGN KEY([Id_Ucznia])
REFERENCES [dbo].[Uczen] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ocena] CHECK CONSTRAINT [FK_Ocena_Uczen]
GO
ALTER TABLE [dbo].[Uczen]  WITH CHECK ADD  CONSTRAINT [FK_Uczen_Klasa] FOREIGN KEY([Id_Klasy])
REFERENCES [dbo].[Klasa] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Uczen] CHECK CONSTRAINT [FK_Uczen_Klasa]
GO
ALTER TABLE [dbo].[Wychowawca]  WITH CHECK ADD  CONSTRAINT [FK_Wychowawca_Wychowawca] FOREIGN KEY([Id])
REFERENCES [dbo].[Wychowawca] ([Id])
GO
ALTER TABLE [dbo].[Wychowawca] CHECK CONSTRAINT [FK_Wychowawca_Wychowawca]
GO
USE [master]
GO
ALTER DATABASE [Szkola] SET  READ_WRITE 
GO
