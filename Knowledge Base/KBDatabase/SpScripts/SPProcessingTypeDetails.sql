USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPProcessingTypeDetails]    Script Date: 03/21/2011 14:19:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  ProcessingType details from ProcessingTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPProcessingTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from ProcessingTypetbl
	
  
END

GO


