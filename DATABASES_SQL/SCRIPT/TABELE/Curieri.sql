USE [PROIECT]
GO

/****** Object:  Table [dbo].[Curieri]    Script Date: 5/12/2021 7:51:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Curieri](
	[IdCurier] [int] IDENTITY(1,1) NOT NULL,
	[NumeCurier] [nvarchar](64) NOT NULL,
	[PrenumeCurier] [nvarchar](64) NOT NULL,
	[IdFirmaCurierat] [int] NOT NULL,
	[OrasLivrare] [nvarchar](64) NOT NULL,
	[IdJudetLivrare] [int] NOT NULL,
	[TelefonCurier] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Curieri] PRIMARY KEY CLUSTERED 
(
	[IdCurier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Curieri]  WITH CHECK ADD  CONSTRAINT [FK_Curieri_FirmeCurierat] FOREIGN KEY([IdFirmaCurierat])
REFERENCES [dbo].[FirmeCurierat] ([IdFirmaCurierat])
GO

ALTER TABLE [dbo].[Curieri] CHECK CONSTRAINT [FK_Curieri_FirmeCurierat]
GO

ALTER TABLE [dbo].[Curieri]  WITH CHECK ADD  CONSTRAINT [FK_Curieri_Judete] FOREIGN KEY([IdJudetLivrare])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[Curieri] CHECK CONSTRAINT [FK_Curieri_Judete]
GO


