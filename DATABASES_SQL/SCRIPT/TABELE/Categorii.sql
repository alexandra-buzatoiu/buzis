USE [PROIECT]
GO

/****** Object:  Table [dbo].[CategoriiProduse]    Script Date: 5/12/2021 7:47:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CategoriiProduse](
	[IdCategorie] [int] IDENTITY(100,1) NOT NULL,
	[NumeCategorie] [nvarchar](64) NOT NULL,
	[DescriereCategorie] [nvarchar](64) NULL,
 CONSTRAINT [PK_CategoriiProduse] PRIMARY KEY CLUSTERED 
(
	[IdCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


