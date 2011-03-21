USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertIssueTypetbl]    Script Date: 03/21/2011 14:17:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert FileType details into FileType Table 
-- =============================================
create PROCEDURE [dbo].[SPInsertIssueTypetbl]
	@IDIssueType int output,
	@IssueType varchar(150),
    @IssueTypeDescription varchar(250),
    @Createddate datetime,
    @Createduser int,
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  INSERT INTO [kb].[dbo].[IssueTypetbl]
           ([IssueType]
           ,[IssueTypeDescription]
           ,[Createddate]
           ,[Createduser]
           ,[Updateddate]
           ,[Updateduser])
     VALUES
           (@IssueType,@IssueTypeDescription,@Createddate,@Createduser,@Updateddate,@Updateduser)
		SET @IDIssueType=@@IDENTITY


END

GO


