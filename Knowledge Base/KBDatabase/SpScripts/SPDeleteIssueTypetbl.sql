USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPDeleteIssueTypetbl]    Script Date: 03/21/2011 14:24:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from IssueTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteIssueTypetbl]
@IDIssueType int
AS
DELETE FROM IssueTypetbl WHERE IDIssueType = @IDIssueType

GO


