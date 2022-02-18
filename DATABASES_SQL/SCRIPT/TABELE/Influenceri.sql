USE [PROIECT]
GO

/****** Object:  Table [dbo].[Influenceri]    Script Date: 5/12/2021 7:56:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Influenceri](
	[IdInfluencer] [int] IDENTITY(1,1) NOT NULL,
	[NumeInfluencer] [nvarchar](64) NOT NULL,
	[PrenumeInfluencer] [nvarchar](64) NOT NULL,
	[DataNastere] [date] NOT NULL,
	[Adresa] [nvarchar](64) NOT NULL,
	[Oras] [nvarchar](64) NOT NULL,
	[IdJudet] [int] NOT NULL,
	[NumarUrmaritoriInstagram] [int] NOT NULL,
 CONSTRAINT [PK_Influenceri] PRIMARY KEY CLUSTERED 
(
	[IdInfluencer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Influenceri]  WITH CHECK ADD  CONSTRAINT [FK_Influenceri_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[Influenceri] CHECK CONSTRAINT [FK_Influenceri_Judete]
GO


