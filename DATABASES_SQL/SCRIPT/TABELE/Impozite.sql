USE [PROIECT]
GO

/****** Object:  Table [dbo].[Impozite]    Script Date: 5/12/2021 7:54:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Impozite](
	[IdImpozit] [int] IDENTITY(1,1) NOT NULL,
	[NumeImpozit] [nvarchar](64) NOT NULL,
	[ProcentImpozit] [int] NOT NULL,
 CONSTRAINT [PK_Impozite] PRIMARY KEY CLUSTERED 
(
	[IdImpozit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


