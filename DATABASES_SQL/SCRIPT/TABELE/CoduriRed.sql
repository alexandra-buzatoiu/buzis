USE [PROIECT]
GO

/****** Object:  Table [dbo].[CoduriReducere]    Script Date: 5/12/2021 7:49:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CoduriReducere](
	[IdCod] [int] IDENTITY(1,1) NOT NULL,
	[IdInfluencer] [int] NULL,
	[ProcentReducere] [int] NOT NULL,
	[DataIntrare] [date] NOT NULL,
	[DataSfarsit] [date] NOT NULL,
 CONSTRAINT [PK_CoduriReducere] PRIMARY KEY CLUSTERED 
(
	[IdCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CoduriReducere]  WITH CHECK ADD  CONSTRAINT [FK_CoduriReducere_CoduriReducere] FOREIGN KEY([IdInfluencer])
REFERENCES [dbo].[Influenceri] ([IdInfluencer])
GO

ALTER TABLE [dbo].[CoduriReducere] CHECK CONSTRAINT [FK_CoduriReducere_CoduriReducere]
GO


