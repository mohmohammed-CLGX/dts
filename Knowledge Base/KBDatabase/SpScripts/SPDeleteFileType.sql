USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPDeleteFileType]    Script Date: 03/21/2011 14:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from FileType table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteFileType]
@IDFileType int
AS
DELETE FROM FileType WHERE IDFileType = @IDFileType

GO


