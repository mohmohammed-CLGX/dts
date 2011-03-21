USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPDeleteProblemTypetbl]    Script Date: 03/21/2011 14:24:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from ProblemTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteProblemTypetbl]
@IDProblemType int
AS
DELETE FROM ProblemTypetbl WHERE IDProblemType = @IDProblemType

GO


