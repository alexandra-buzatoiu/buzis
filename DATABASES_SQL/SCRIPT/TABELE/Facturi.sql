USE [PROIECT]
GO

/****** Object:  Table [dbo].[Facturi]    Script Date: 5/12/2021 7:52:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Facturi](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdComanda] [int] NOT NULL,
	[IdProdus] [int] NOT NULL,
	[Cantitate] [int] NOT NULL,
	[PretUnitar] [money] NOT NULL,
 CONSTRAINT [PK_Facturi] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Facturi]  WITH CHECK ADD  CONSTRAINT [FK_Facturi_Comenzi] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comenzi] ([IdComanda])
GO

ALTER TABLE [dbo].[Facturi] CHECK CONSTRAINT [FK_Facturi_Comenzi]
GO

ALTER TABLE [dbo].[Facturi]  WITH CHECK ADD  CONSTRAINT [FK_Facturi_Produse] FOREIGN KEY([IdProdus])
REFERENCES [dbo].[Produse] ([Id_Produs])
GO

ALTER TABLE [dbo].[Facturi] CHECK CONSTRAINT [FK_Facturi_Produse]
GO


