
/****** Object:  StoredProcedure [dbo].[GetLoginUser]    Script Date: 02/24/2021 10:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetLoginUser](@USERNAME VARCHAR(250),@PWD VARCHAR(250))
AS
BEGIN TRY
DECLARE @COUNT INT = 0;
SELECT @COUNT = COUNT(0) from tblUser where USER_NAME = @USERNAME and User_Password = @PWD;
IF (@COUNT > 0)
BEGIN
	SELECT 1 AS VALID ,UserID,User_Role,case when User_Role = 1 THEN 'ADMIN' ELSE
	'USER' END AS LOGINROLE from tblUser where USER_NAME = @USERNAME and User_Password = @PWD
	AND Status = 1;
END
ELSE
BEGIN
	SELECT 0 AS VALID ,'' AS User_Role,'' AS LOGINROLE;
END 
END TRY
BEGIN CATCH
	exec [dbo].[SP_ErrorLog]
END CATCH
