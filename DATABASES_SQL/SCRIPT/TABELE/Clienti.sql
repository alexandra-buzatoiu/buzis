USE [PROIECT]
GO

/****** Object:  Table [dbo].[Clienti]    Script Date: 5/12/2021 7:48:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Clienti](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[NumeClient] [nvarchar](64) NOT NULL,
	[PrenumeClient] [nvarchar](64) NOT NULL,
	[Adresa] [nvarchar](64) NOT NULL,
	[Oras] [nvarchar](64) NOT NULL,
	[IdJudet] [int] NOT NULL,
	[Mail] [nvarchar](64) NOT NULL,
	[Telefon] [nvarchar](64) NOT NULL,
	[DataNastere] [date] NOT NULL,
 CONSTRAINT [PK_Clienti] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clienti]  WITH CHECK ADD  CONSTRAINT [FK_Clienti_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[Clienti] CHECK CONSTRAINT [FK_Clienti_Judete]
GO


