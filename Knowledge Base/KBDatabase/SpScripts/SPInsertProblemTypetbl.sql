USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPInsertProblemTypetbl]    Script Date: 03/21/2011 14:17:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert ProblemType details into ProblemTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPInsertProblemTypetbl]
@IDProblemType int OUTPUT,
@ProblemType varchar(250),
@ProblemTypeDescription varchar(250),
@CreatedDate datetime,
@CreatedUser int,
@UpdatedDate datetime,
@Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
INSERT INTO [kb].[dbo].[ProblemTypetbl]
           ([ProblemType]
           ,[ProblemTypeDescription]
           ,[CreatedDate]
           ,[CreatedUser]
           ,[UpdatedDate]
           ,[Updateduser])
     VALUES
           (@ProblemType,@ProblemTypeDescription,@CreatedDate,@CreatedUser,@UpdatedDate,@Updateduser)




           SET @IDProblemType = @@IDENTITY

END


GO


