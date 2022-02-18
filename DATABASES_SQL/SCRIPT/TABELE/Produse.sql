USE [PROIECT]
GO

/****** Object:  Table [dbo].[Produse]    Script Date: 5/12/2021 8:20:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Produse](
	[Id_Produs] [int] IDENTITY(1,1) NOT NULL,
	[DenumireProdus] [nvarchar](64) NOT NULL,
	[IdBrand] [int] NOT NULL,
	[IdCategorie] [int] NOT NULL,
	[PretUnitar] [money] NOT NULL,
	[BucatiStock] [int] NULL,
	[BucatiRezervateCos] [int] NULL,
	[BucatiComanda] [int] NULL,
 CONSTRAINT [PK_Produse] PRIMARY KEY CLUSTERED 
(
	[Id_Produs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Produse]  WITH CHECK ADD  CONSTRAINT [FK_Produse_Branduri] FOREIGN KEY([IdBrand])
REFERENCES [dbo].[Branduri] ([IdBrand])
GO

ALTER TABLE [dbo].[Produse] CHECK CONSTRAINT [FK_Produse_Branduri]
GO

ALTER TABLE [dbo].[Produse]  WITH CHECK ADD  CONSTRAINT [FK_Produse_CategoriiProduse] FOREIGN KEY([IdCategorie])
REFERENCES [dbo].[CategoriiProduse] ([IdCategorie])
GO

ALTER TABLE [dbo].[Produse] CHECK CONSTRAINT [FK_Produse_CategoriiProduse]
GO


