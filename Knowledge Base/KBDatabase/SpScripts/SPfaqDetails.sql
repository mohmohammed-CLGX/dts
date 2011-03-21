USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPfaqDetails]    Script Date: 03/21/2011 14:14:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  faq details from faqtbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPfaqDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from faqtbl
	
  
END

GO


