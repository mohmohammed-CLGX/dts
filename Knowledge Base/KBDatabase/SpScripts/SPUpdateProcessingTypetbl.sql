USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPUpdateProcessingTypetbl]    Script Date: 03/21/2011 14:23:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update ProcessingType details of ProcessingTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdateProcessingTypetbl]
@IDProcessingType int ,
@ProcessingType varchar(150),
@ProcessingTypeDescription varchar(150),
@Updateddate datetime,
@Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
UPDATE [kb].[dbo].[ProcessingTypetbl]
   SET [ProcessingType] = @ProcessingType,[ProcessingTypeDescription] = @ProcessingTypeDescription,[Updateddate] = @Updateddate,
   [Updateduser] = @Updateduser
 WHERE IDProcessingType=@IDProcessingType
END


GO


