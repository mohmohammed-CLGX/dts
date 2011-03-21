USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertFileType]    Script Date: 03/21/2011 14:16:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert FileType details into FileType Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPInsertFileType]
	@IDFileType int output,
	@FileType varchar(100),
	@FileTypeDescription varchar(150),
	@Createddate datetime,
    @Createduser int,
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  INSERT INTO [kb].[dbo].[FileType]
           ([FileType]
           ,[FileTypeDescription]
           ,[Createddate]
           ,[Createduser]
           ,[Updateddate]
           ,[Updateduser])
     VALUES
           (@FileType,@FileTypeDescription,@Createddate,@Createduser,@Updateddate,@Updateduser)
		SET @IDFileType=@@IDENTITY


END

GO


