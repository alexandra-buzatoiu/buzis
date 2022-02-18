USE [PROIECT]
GO

/****** Object:  Table [dbo].[Regiuni]    Script Date: 5/12/2021 8:21:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Regiuni](
	[IdRegiune] [int] IDENTITY(1,1) NOT NULL,
	[NumeRegiune] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Regiuni_1] PRIMARY KEY CLUSTERED 
(
	[IdRegiune] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


