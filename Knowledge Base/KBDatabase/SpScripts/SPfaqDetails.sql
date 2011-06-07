USE [kb]
GO
/****** Object:  StoredProcedure [dbo].[SPfaqDetails]    Script Date: 03/22/2011 11:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  faq details from faqtbl Table 
-- =============================================
ALTER PROCEDURE [dbo].[SPfaqDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select  [IDFaq]
      ,[Faqs]
      ,[Faqsans]
      ,[Createddate]
      ,[Createduser]
      ,[Updateddate]
      ,[Updateduser] from faqtbl
	
  
END
