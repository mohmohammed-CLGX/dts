USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPDeletefaqtbl]    Script Date: 03/21/2011 14:23:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from faqtbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeletefaqtbl]
@IDFaq int
AS
DELETE FROM faqtbl WHERE IDFaq = @IDFaq

GO


