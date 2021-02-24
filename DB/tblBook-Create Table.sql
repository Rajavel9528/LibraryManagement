USE [LibraryManagement]
GO

/****** Object:  Table [dbo].[tblBook]    Script Date: 02/24/2021 10:55:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblBook](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Author_Name] [varchar](250) NULL,
	[Book_Name] [varchar](250) NULL,
	[Publisher_Name] [varchar](250) NULL,
	[Status] [int] NULL,
	[LEND_STATUS] [int] NULL,
	[CATEGORY] [int] NULL,
	[CATEGORY_DESCRIPTION] [varchar](250) NULL,
	[BOOK_IMGFILENAME] [nvarchar](max) NULL,
	[Created_date] [datetime] NULL,
 CONSTRAINT [PK_tblBook] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


