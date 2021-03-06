
GO
/****** Object:  StoredProcedure [dbo].[GetBookDetails]    Script Date: 02/24/2021 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
create PROCEDURE [dbo].[GetBookDetails](@BOOKID INT,@PUBLISHERNAME VARCHAR(250),@BOOKNAME VARCHAR(250),  
@AUTHOR  VARCHAR(250),@CATEGORY INT,@LendStatus int = 0)  
AS  
BEGIN TRY  
SELECT [BookID]  
      ,[Author_Name]  
      ,[Book_Name]  
      ,[Publisher_Name]  
      ,[Category],CATEGORY_DESCRIPTION  
      ,[Status]  
      ,[LEND_STATUS],  
      CASE WHEN [LEND_STATUS] = 1 THEN 'Available' ELSE 'Not Available' END AS LendStatusDesc,  
      BOOK_IMGFILENAME  
  FROM [LibraryManagement].[dbo].[tblBook] WHERE Status = 1 AND  
  (BookID = @BOOKID OR (@BOOKID = 0)) AND 
  (([Book_Name] LIKE '%' + @BOOKNAME + '%') OR (@BOOKNAME = ''))  AND 
  (([Publisher_Name] LIKE '%' + @PUBLISHERNAME + '%') OR (@PUBLISHERNAME = ''))  AND  
  (([Author_Name] LIKE + '%' + @AUTHOR + '%') OR (@AUTHOR = ''))  AND  
  ([Category] = @CATEGORY OR (@CATEGORY = 0))  AND
   ([LEND_STATUS] = @LendStatus OR (@LendStatus = 0))  
  order by Created_date desc  
END TRY  
BEGIN CATCH  
 exec [dbo].[SP_ErrorLog]  
END CATCH  