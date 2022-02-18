USE [PROIECT]
GO

/****** Object:  Table [dbo].[ImpoziteAngajati]    Script Date: 5/12/2021 7:55:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImpoziteAngajati](
	[IdImpozit] [int] NOT NULL,
	[IdAngajat] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ImpoziteAngajati]  WITH CHECK ADD  CONSTRAINT [FK_ImpoziteAngajati_Angajati] FOREIGN KEY([IdAngajat])
REFERENCES [dbo].[Angajati] ([Id_Angajat])
GO

ALTER TABLE [dbo].[ImpoziteAngajati] CHECK CONSTRAINT [FK_ImpoziteAngajati_Angajati]
GO

ALTER TABLE [dbo].[ImpoziteAngajati]  WITH CHECK ADD  CONSTRAINT [FK_ImpoziteAngajati_Impozite] FOREIGN KEY([IdImpozit])
REFERENCES [dbo].[Impozite] ([IdImpozit])
GO

ALTER TABLE [dbo].[ImpoziteAngajati] CHECK CONSTRAINT [FK_ImpoziteAngajati_Impozite]
GO


