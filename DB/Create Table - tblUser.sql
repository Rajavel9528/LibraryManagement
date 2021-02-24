USE [LibraryManagement]
GO

/****** Object:  Table [dbo].[tblUser]    Script Date: 02/24/2021 10:57:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](250) NOT NULL,
	[User_Password] [nvarchar](250) NOT NULL,
	[Status] [int] NOT NULL,
	[User_Role] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


