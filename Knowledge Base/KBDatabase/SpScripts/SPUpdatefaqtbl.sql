USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPUpdatefaqtbl]    Script Date: 03/21/2011 14:20:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update faqs  details of faqtbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdatefaqtbl]
@IDFaq int ,
	@Faqs varchar,
	@Faqsans varchar,
	@Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [kb].[dbo].[faqtbl]
   SET [Faqs] = @Faqs,[Faqsans] = @Faqsans,[Updateddate] = @Updateddate,[Updateduser] = @Updateduser
 WHERE IDFaq=@IDFaq
END


GO


