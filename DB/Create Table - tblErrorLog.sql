USE [LibraryManagement]
GO

/****** Object:  Table [dbo].[tblErrorLog]    Script Date: 02/24/2021 10:56:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblErrorLog](
	[ErrorID] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorNumber] [nvarchar](50) NOT NULL,
	[ErrorDescription] [nvarchar](4000) NULL,
	[ErrorProcedure] [nvarchar](100) NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 85) ON [PRIMARY]
) ON [PRIMARY]

GO


