USE [PROIECT]
GO

/****** Object:  Table [dbo].[Comenzi]    Script Date: 5/12/2021 7:50:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Comenzi](
	[IdComanda] [int] IDENTITY(1,1) NOT NULL,
	[IdAngajatPrelucrare] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[DataPlasare] [date] NOT NULL,
	[DataLimita] [date] NOT NULL,
	[IdCurier] [int] NOT NULL,
	[AdresaLivrare] [nvarchar](64) NOT NULL,
	[OrasLivrare] [nvarchar](64) NOT NULL,
	[IdJudetLivrare] [int] NOT NULL,
	[IdCod] [int] NOT NULL,
 CONSTRAINT [PK_Comenzi] PRIMARY KEY CLUSTERED 
(
	[IdComanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Angajati] FOREIGN KEY([IdAngajatPrelucrare])
REFERENCES [dbo].[Angajati] ([Id_Angajat])
GO

ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Angajati]
GO

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Clienti] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Clienti] ([IdClient])
GO

ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Clienti]
GO

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_CoduriReducere] FOREIGN KEY([IdCod])
REFERENCES [dbo].[CoduriReducere] ([IdCod])
GO

ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_CoduriReducere]
GO

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Curieri] FOREIGN KEY([IdCurier])
REFERENCES [dbo].[Curieri] ([IdCurier])
GO

ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Curieri]
GO

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Judete] FOREIGN KEY([IdJudetLivrare])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Judete]
GO


