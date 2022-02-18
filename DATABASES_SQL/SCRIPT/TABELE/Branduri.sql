USE [PROIECT]
GO

/****** Object:  Table [dbo].[Branduri]    Script Date: 5/12/2021 7:46:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Branduri](
	[IdBrand] [int] IDENTITY(500,1) NOT NULL,
	[NumeBrand] [nvarchar](64) NOT NULL,
	[Oras] [nvarchar](64) NOT NULL,
	[Tara] [nvarchar](64) NOT NULL,
	[PersoanaContact] [nvarchar](64) NOT NULL,
	[TelefonContact] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Branduri] PRIMARY KEY CLUSTERED 
(
	[IdBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


