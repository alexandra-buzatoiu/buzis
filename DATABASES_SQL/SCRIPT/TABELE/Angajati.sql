USE [PROIECT]
GO

/****** Object:  Table [dbo].[Angajati]    Script Date: 5/12/2021 7:41:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Angajati](
	[Id_Angajat] [int] IDENTITY(1,1) NOT NULL,
	[NumeAngajat] [nvarchar](64) NOT NULL,
	[PrenumeAngajat] [nvarchar](64) NOT NULL,
	[Functie] [nvarchar](64) NOT NULL,
	[DataNastere] [date] NOT NULL,
	[DataAngajare] [date] NOT NULL,
	[AdresaDomiciliu] [nvarchar](64) NOT NULL,
	[Oras] [nvarchar](64) NOT NULL,
	[IdJudet] [int] NOT NULL,
	[CodPostal] [nvarchar](64) NOT NULL,
	[SefDirect] [int] NULL,
	[Telefon] [nvarchar](64) NOT NULL,
	[SalariuBrut] [float] NOT NULL,
 CONSTRAINT [PK_Angajati] PRIMARY KEY CLUSTERED 
(
	[Id_Angajat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Angajati]  WITH CHECK ADD  CONSTRAINT [FK_Angajati_Angajati] FOREIGN KEY([SefDirect])
REFERENCES [dbo].[Angajati] ([Id_Angajat])
GO

ALTER TABLE [dbo].[Angajati] CHECK CONSTRAINT [FK_Angajati_Angajati]
GO

ALTER TABLE [dbo].[Angajati]  WITH CHECK ADD  CONSTRAINT [FK_Angajati_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[Angajati] CHECK CONSTRAINT [FK_Angajati_Judete]
GO


