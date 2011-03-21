USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPUpdateIssueTypetbl]    Script Date: 03/21/2011 14:20:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update IssueType details of IssueTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdateIssueTypetbl]
@IDIssueType int ,
	@IssueType varchar(150),
    @IssueTypeDescription varchar(250),
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [kb].[dbo].[IssueTypetbl]
   SET [IssueType] = @IssueType,[IssueTypeDescription] = @IssueTypeDescription,[Updateddate] = @Updateddate,[Updateduser] = @Updateduser
 WHERE IDIssueType=@IDIssueType
END


GO


