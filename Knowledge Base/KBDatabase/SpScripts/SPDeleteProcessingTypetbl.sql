USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPDeleteProcessingTypetbl]    Script Date: 03/21/2011 14:25:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from ProcessingTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteProcessingTypetbl]
@IDProcessingType int
AS
DELETE FROM ProcessingTypetbl WHERE IDProcessingType = @IDProcessingType

GO


