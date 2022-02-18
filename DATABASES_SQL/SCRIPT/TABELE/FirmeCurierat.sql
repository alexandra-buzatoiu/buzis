USE [PROIECT]
GO

/****** Object:  Table [dbo].[FirmeCurierat]    Script Date: 5/12/2021 7:53:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FirmeCurierat](
	[IdFirmaCurierat] [int] IDENTITY(1,1) NOT NULL,
	[NumeFirma] [nvarchar](64) NOT NULL,
	[AdresaSediu] [nvarchar](64) NOT NULL,
	[OrasSediu] [nvarchar](64) NOT NULL,
	[IdJudetSediu] [int] NOT NULL,
	[TelefonSediu] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_FirmeCurierat] PRIMARY KEY CLUSTERED 
(
	[IdFirmaCurierat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FirmeCurierat]  WITH CHECK ADD  CONSTRAINT [FK_FirmeCurierat_Judete] FOREIGN KEY([IdJudetSediu])
REFERENCES [dbo].[Judete] ([IdJudet])
GO

ALTER TABLE [dbo].[FirmeCurierat] CHECK CONSTRAINT [FK_FirmeCurierat_Judete]
GO


