USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertProcessingType]    Script Date: 03/21/2011 14:18:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert ProcessingType details into ProcessingTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPInsertProcessingType]
@IDProcessingType int OUTPUT,
@ProcessingType varchar(150),
@ProcessingTypeDescription varchar(150),
@Createddate datetime,
@Createduser int,
@Updateddate datetime,
@Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
INSERT INTO [kb].[dbo].[ProcessingTypetbl]
           ([ProcessingType]
           ,[ProcessingTypeDescription]
           ,[Createddate]
           ,[Createduser]
           ,[Updateddate]
           ,[Updateduser])
     VALUES
           (@ProcessingType,@ProcessingTypeDescription,@Createddate,@Createduser,@Updateddate,@Updateduser)






           SET @IDProcessingType = @@IDENTITY

END


GO


