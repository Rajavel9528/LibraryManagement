USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[crudttblBook]    Script Date: 02/24/2021 10:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[crudttblBook](@AuthorName varchar(250),@BookName varchar(250),@PublisherName varchar(250),
@Categoryid int,@Catdesc varchar(250),@OPERATION INT,@Bookid int,@Bookimgname NVARCHAR(MAX)
,@Newno int Output)
AS
BEGIN TRY
IF(@OPERATION = 1)--insert
BEGIN
	INSERT INTO [LibraryManagement].[dbo].[tblBook]
           ([Author_Name]
           ,[Book_Name]
           ,[Publisher_Name]
           ,[Category],CATEGORY_DESCRIPTION
           ,[Status],Lend_Status,BOOK_IMGFILENAME,Created_date)
     VALUES
        (@AuthorName,@BookName,@PublisherName,@Categoryid,@Catdesc,@OPERATION,1,@Bookimgname,GETDATE())
       SELECT @Newno =  @@IDENTITY;
END
ELSE IF(@OPERATION = 2)--update
BEGIN
	UPDATE [LibraryManagement].[dbo].[tblBook] SET 
	[Author_Name] = @AuthorName,[Book_Name] = @BookName,[Publisher_Name] = @PublisherName,BOOK_IMGFILENAME = @Bookimgname
	,[Category] = @Categoryid,CATEGORY_DESCRIPTION =@Catdesc, Created_date = GETDATE() WHERE [BookID] = @Bookid; 
	 SELECT @Newno =  @Bookid;
END
ELSE IF(@OPERATION = 3)--Delete
BEGIN
	UPDATE [LibraryManagement].[dbo].[tblBook] SET [Status] = 3 WHERE [BookID] = @Bookid; 
	 SELECT @Newno =  @Bookid;
END
END TRY
BEGIN CATCH
	exec [dbo].[SP_ErrorLog]
END CATCH
