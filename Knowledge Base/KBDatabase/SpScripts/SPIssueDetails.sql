USE [kb]
GO
/****** Object:  StoredProcedure [dbo].[SPIssueDetails]    Script Date: 03/22/2011 11:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  Issue details from Issue Table 
-- =============================================
ALTER PROCEDURE [dbo].[SPIssueDetails]
@IDIssue int
AS

BEGIN
	
	SET NOCOUNT ON;
	IF @IDIssue=0
		BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType 
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
		END
	ELSE IF @IDIssue>0
	BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
            where Issuetbl.IDIssue= @IDIssue
	END
	
	

                        

  
END
