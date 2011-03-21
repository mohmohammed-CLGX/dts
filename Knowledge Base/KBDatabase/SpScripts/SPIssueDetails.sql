USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPIssueDetails]    Script Date: 03/21/2011 14:18:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  Issue details from Issue Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPIssueDetails]
@IssueID int
AS

BEGIN
	
	SET NOCOUNT ON;
	IF @ISSUEID=0
		BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID 
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
		END
	ELSE IF @ISSUEID>0
	BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID 
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
            where Issuetbl.IDIssue= @ISSUEID
	END
	
	

                        

  
END

GO


