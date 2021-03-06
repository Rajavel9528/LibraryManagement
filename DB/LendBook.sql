USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[LendBook]    Script Date: 02/24/2021 10:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[LendBook](@Userid int,@Bookid int,@Newno int Output)
AS
BEGIN TRY
	INSERT INTO [LibraryManagement].[dbo].[tblLendBook]
           ([UserID]
           ,[BookId]
           ,[BuyDateTime]
           ,[ExpirtyDateTime])
     VALUES
           (@Userid,@Bookid,GETDATE(),DateAdd(DD,+7,GETDATE()))
           
      update tblBook set LEND_STATUS = 2 where  BookID = @Bookid;
      
           SELECT @Newno =  @@IDENTITY;
END TRY
BEGIN CATCH
	exec [dbo].[SP_ErrorLog]
END CATCH
