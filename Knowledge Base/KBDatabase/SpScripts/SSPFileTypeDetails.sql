USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPFileTypeDetails]    Script Date: 03/21/2011 14:15:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  FileType details from FileType Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPFileTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from FileType
	
  
END

GO


