USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPUpdateFileType]    Script Date: 03/21/2011 14:20:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update FileType  details of FileType Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdateFileType]
@IDFileType int ,
	@FileType varchar(100),
	@FileTypeDescription varchar(150),
	@Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [kb].[dbo].[FileType]
   SET [FileType] = @FileType,[FileTypeDescription] = @FileTypeDescription,[Updateddate] = @Updateddate,[Updateduser] = @Updateduser
 WHERE IDFileType=@IDFileType 
END


GO


