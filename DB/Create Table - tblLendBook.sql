USE [LibraryManagement]
GO

/****** Object:  Table [dbo].[tblLendBook]    Script Date: 02/24/2021 10:56:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLendBook](
	[UserID] [int] NOT NULL,
	[BookId] [int] NULL,
	[BuyDateTime] [smalldatetime] NULL,
	[ExpirtyDateTime] [nchar](10) NULL
) ON [PRIMARY]

GO


