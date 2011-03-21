USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPIssueTypeDetails]    Script Date: 03/21/2011 14:18:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  IssueType details from IssueTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPIssueTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from IssueTypetbl 
	
  
END

GO


