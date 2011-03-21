USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertfaqtbl]    Script Date: 03/21/2011 14:16:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert faq details into faqtbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPInsertfaqtbl]
	@IDFaq int output,
	@Faqs varchar,
	@Faqsans varchar,
	@Createddate datetime,
    @Createduser int,
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  INSERT INTO [kb].[dbo].[faqtbl]
           ([Faqs]
           ,[Faqsans]
           ,[Createddate]
           ,[Createduser]
           ,[Updateddate]
           ,[Updateduser])
     VALUES
           (@Faqs,@Faqsans,@Createddate,@Createduser,@Updateddate,@Updateduser)
           set @IDFaq=@@IDENTITY



END

GO


