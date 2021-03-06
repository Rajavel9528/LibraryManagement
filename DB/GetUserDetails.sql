USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 02/24/2021 10:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserDetails](@userid int,@Status int)
AS
BEGIN TRY

	SELECT UserID,USER_NAME,case when User_Role = 1 THEN 'Admin' ELSE 'Normal User' END AS LOGINROLE,User_Role,
	User_Password,Status from tblUser
	WHERE (Status = @Status or @Status = 0) AND (UserID = @userid or @userid = 0)
END TRY
BEGIN CATCH
	exec [dbo].[SP_ErrorLog]
END CATCH



