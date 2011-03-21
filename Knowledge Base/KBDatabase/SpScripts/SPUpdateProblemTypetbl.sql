USE [kb]
GO

/****** Object:  StoredProcedure [dbo].[SPUpdateProblemTypetbl]    Script Date: 03/21/2011 14:23:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update ProblemType details of ProblemTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdateProblemTypetbl]
@IDProblemType int ,
@ProblemType varchar(250),
@ProblemTypeDescription varchar(250),
@UpdatedDate datetime,
@Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [kb].[dbo].[ProblemTypetbl]
   SET [ProblemType] = @ProblemType,[ProblemTypeDescription] = @ProblemTypeDescription,[UpdatedDate] = @UpdatedDate,[Updateduser] = @Updateduser
    WHERE IDProblemType=@IDProblemType
END


GO


