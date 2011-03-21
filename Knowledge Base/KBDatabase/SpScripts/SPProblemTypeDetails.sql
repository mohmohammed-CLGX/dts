USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPProblemTypeDetails]    Script Date: 03/21/2011 14:19:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  ProblemTypet details from ProblemTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPProblemTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from ProblemTypetbl
	
  
END

GO


