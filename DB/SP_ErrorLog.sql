USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[SP_ErrorLog]    Script Date: 02/24/2021 10:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_ErrorLog]
AS
BEGIN
SET NOCOUNT ON 
        
         INSERT INTO [tblErrorLog]  
             (
             ErrorNumber 
            ,ErrorDescription 
            ,ErrorProcedure 
            ,ErrorState 
            ,ErrorSeverity 
            ,ErrorLine 
            ,ErrorTime 
           )
           VALUES
           (
             ERROR_NUMBER()
            ,ERROR_MESSAGE()
            ,ERROR_PROCEDURE()
            ,ERROR_STATE()
            ,ERROR_SEVERITY()
            ,ERROR_LINE()
            ,GETDATE()  
           );
    
SET NOCOUNT OFF    
END
