USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertIssuetbl]    Script Date: 03/21/2011 14:17:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To Insert Issue details into Issuetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPInsertIssuetbl]
	@IDIssue int OUTPUT,
	@FIPSCounty varchar(5),
	@IDProcessingType int,
	@IDFileType int,
	@IDIssueType int,
	@Edition int,
	@Version int,
	@Title varchar(100),
	@IssueDetails varchar,
	@Resolution varchar,
	@Submitter varchar(50),
	@Relatedlink varchar,
	@ICP int,
	@IssueCreatedDate datetime,
	@IssueCreatedUser int,
	@IssueUpdatedDate datetime,
	@IssueUpdatedUser int,
	@Isuplodedfile bit,
	@IDuploadedfile int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [kb].[dbo].[Issuetbl]
           ([FIPSCounty]
           ,[IDProcessingType]
           ,[IDFileType]
           ,[IDIssueType]
           ,[Edition]
           ,[Version]
           ,[Title]
           ,[IssueDetails]
           ,[Resolution]
           ,[Submitter]
           ,[Relatedlink]
           ,[ICP]
           ,[IssueCreatedDate]
           ,[IssueCreatedUser]
           ,[IssueUpdatedDate]
           ,[IssueUpdatedUser]
           ,[Isuplodedfile]
           ,[IDuploadedfile])
     VALUES
           (@FIPSCounty ,@IDProcessingType,@IDFileType,@IDIssueType ,@Edition ,@Version,@Title,@IssueDetails,@Resolution,@Submitter
           ,@Relatedlink ,@ICP,@IssueCreatedDate,@IssueCreatedUser,@IssueUpdatedDate,@IssueUpdatedUser,@Isuplodedfile,@IDuploadedfile)
           
           SET @IDIssue = @@IDENTITY




END

GO


