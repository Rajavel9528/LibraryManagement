USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[crudtbluser]    Script Date: 02/24/2021 10:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[crudtbluser](@OPERATION INT,@Userid int,@user_Name varchar(250),@user_Pwd nvarchar(250),
@User_Role int,
@Newno int Output)
AS
BEGIN TRY
DECLARE @COUNT INT = 0;
SELECT @COUNT = COUNT(0) FROM [LibraryManagement].[dbo].[tblUser] WHERE [User_Name] = @user_Name;
IF(@OPERATION = 1)--insert
BEGIN
 IF(@COUNT = 0)
 BEGIN
	INSERT INTO [LibraryManagement].[dbo].[tblUser]
           ([User_Name]
           ,[User_Password]
           ,User_Role
           ,[Status])
     VALUES
           (@user_Name,@user_Pwd,@User_Role,@OPERATION)
             SELECT @Newno =  @@IDENTITY;
  END
  ELSE
  BEGIN
		 SELECT @Newno = -3;--Same User Name Already Exist
  END
END
ELSE IF(@OPERATION = 2)--update
BEGIN
	UPDATE [LibraryManagement].[dbo].[tblUser] SET [User_Name] = @user_Name,[User_Password] = @user_Pwd
	WHERE  UserID = @Userid;
END
ELSE IF(@OPERATION = 3)--Delete
BEGIN
	UPDATE [LibraryManagement].[dbo].[tblUser] SET [Status] = @OPERATION
	WHERE  UserID = @Userid;
END
END TRY
BEGIN CATCH
	exec [dbo].[SP_ErrorLog]
END CATCH


