USE [kb]
GO
/****** Object:  FullTextCatalog [documents_catalog]    Script Date: 03/21/2011 14:33:33 ******/
CREATE FULLTEXT CATALOG [documents_catalog]WITH ACCENT_SENSITIVITY = ON
AUTHORIZATION [dbo]
GO
/****** Object:  FullTextCatalog [ft]    Script Date: 03/21/2011 14:33:33 ******/
CREATE FULLTEXT CATALOG [ft]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
AUTHORIZATION [dbo]
GO
/****** Object:  FullTextCatalog [IssueDetails_catalog]    Script Date: 03/21/2011 14:33:33 ******/
CREATE FULLTEXT CATALOG [IssueDetails_catalog]WITH ACCENT_SENSITIVITY = ON
AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[Uploadedfiletbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Uploadedfiletbl](
	[IDuploadedfile] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[FileSize] [int] NOT NULL,
	[ContentType] [varchar](50) NOT NULL,
	[FileData] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Upladedfiletbl] PRIMARY KEY CLUSTERED 
(
	[IDuploadedfile] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SPDeleteIssuetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from FileType table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteIssuetbl]
@IDIssue int
AS
--DELETE FROM Issuetbl WHERE IDIssue = @IDIssue
GO
/****** Object:  Table [dbo].[FileType]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileType](
	[IDFileType] [int] IDENTITY(1,1) NOT NULL,
	[FileType] [varchar](100) NOT NULL,
	[FileTypeDescription] [varchar](150) NULL,
	[Createddate] [datetime] NULL,
	[Createduser] [int] NULL,
	[Updateddate] [datetime] NULL,
	[Updateduser] [int] NULL,
 CONSTRAINT [PK_File_Type] PRIMARY KEY CLUSTERED 
(
	[IDFileType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[faqtbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faqtbl](
	[IDFaq] [int] IDENTITY(1,1) NOT NULL,
	[Faqs] [varchar](max) NOT NULL,
	[Faqsans] [varchar](max) NULL,
	[Createddate] [datetime] NULL,
	[Createduser] [int] NULL,
	[Updateddate] [datetime] NULL,
	[Updateduser] [int] NULL,
 CONSTRAINT [PK_faqtbl] PRIMARY KEY CLUSTERED 
(
	[IDFaq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[County]    Script Date: 03/21/2011 14:33:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[County](
	[FIPS] [varchar](5) NOT NULL,
	[StateCounty] [varchar](50) NOT NULL,
	[State] [varchar](15) NOT NULL,
	[County] [varchar](50) NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[FIPS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProcessingTypetbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProcessingTypetbl](
	[IDProcessingType] [int] IDENTITY(1,1) NOT NULL,
	[ProcessingType] [varchar](150) NULL,
	[ProcessingTypeDescription] [varchar](150) NULL,
	[Createddate] [datetime] NULL,
	[Createduser] [int] NULL,
	[Updateddate] [datetime] NULL,
	[Updateduser] [int] NULL,
 CONSTRAINT [PK_ProcessingTypetbl] PRIMARY KEY CLUSTERED 
(
	[IDProcessingType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProblemTypetbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProblemTypetbl](
	[IDProblemType] [int] IDENTITY(1,1) NOT NULL,
	[ProblemType] [varchar](250) NOT NULL,
	[ProblemTypeDescription] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUser] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Updateduser] [int] NULL,
 CONSTRAINT [PK_Problem_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IDProblemType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IssueTypetbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueTypetbl](
	[IDIssueType] [int] IDENTITY(1,1) NOT NULL,
	[IssueType] [varchar](150) NOT NULL,
	[IssueTypeDescription] [varchar](250) NULL,
	[Createddate] [datetime] NULL,
	[Createduser] [int] NULL,
	[Updateddate] [datetime] NULL,
	[Updateduser] [int] NULL,
 CONSTRAINT [PK_Issue_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IDIssueType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issuetbl]    Script Date: 03/21/2011 14:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issuetbl](
	[IDIssue] [int] IDENTITY(1,1) NOT NULL,
	[FIPSCounty] [varchar](5) NOT NULL,
	[IDProcessingType] [int] NULL,
	[IDFileType] [int] NULL,
	[IDIssueType] [int] NULL,
	[Edition] [int] NULL,
	[Version] [int] NULL,
	[Title] [varchar](100) NULL,
	[IssueDetails] [varchar](max) NULL,
	[Resolution] [varchar](max) NULL,
	[Submitter] [varchar](50) NULL,
	[Relatedlink] [varchar](max) NULL,
	[ICP] [int] NULL,
	[IssueCreatedDate] [datetime] NULL,
	[IssueCreatedUser] [int] NULL,
	[IssueUpdatedDate] [datetime] NULL,
	[IssueUpdatedUser] [int] NULL,
	[Isuplodedfile] [bit] NOT NULL,
	[IDuploadedfile] [int] NULL,
 CONSTRAINT [PK_Issue_tbl] PRIMARY KEY CLUSTERED 
(
	[IDIssue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SPInsertFileType]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPInsertfaqtbl]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPFileTypeDetails]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  FileType details from FileType Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPFileTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from FileType
	
  
END
GO
/****** Object:  StoredProcedure [dbo].[SPfaqDetails]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPDeleteProcessingTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from ProcessingTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteProcessingTypetbl]
@IDProcessingType int
AS
DELETE FROM ProcessingTypetbl WHERE IDProcessingType = @IDProcessingType
GO
/****** Object:  StoredProcedure [dbo].[SPDeleteProblemTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from ProblemTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteProblemTypetbl]
@IDProblemType int
AS
DELETE FROM ProblemTypetbl WHERE IDProblemType = @IDProblemType
GO
/****** Object:  StoredProcedure [dbo].[SPDeleteIssueTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from IssueTypetbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteIssueTypetbl]
@IDIssueType int
AS
DELETE FROM IssueTypetbl WHERE IDIssueType = @IDIssueType
GO
/****** Object:  StoredProcedure [dbo].[SPInsertProcessingType]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPInsertProblemTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPInsertIssueTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Insert FileType details into FileType Table 
-- =============================================
create PROCEDURE [dbo].[SPInsertIssueTypetbl]
	@IDIssueType int output,
	@IssueType varchar(150),
    @IssueTypeDescription varchar(250),
    @Createddate datetime,
    @Createduser int,
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  INSERT INTO [kb].[dbo].[IssueTypetbl]
           ([IssueType]
           ,[IssueTypeDescription]
           ,[Createddate]
           ,[Createduser]
           ,[Updateddate]
           ,[Updateduser])
     VALUES
           (@IssueType,@IssueTypeDescription,@Createddate,@Createduser,@Updateddate,@Updateduser)
		SET @IDIssueType=@@IDENTITY


END
GO
/****** Object:  StoredProcedure [dbo].[SPDeleteFileType]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from FileType table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeleteFileType]
@IDFileType int
AS
DELETE FROM FileType WHERE IDFileType = @IDFileType
GO
/****** Object:  StoredProcedure [dbo].[SPDeletefaqtbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Delete record from faqtbl table
-- =============================================
CREATE PROCEDURE [dbo].[SPDeletefaqtbl]
@IDFaq int
AS
DELETE FROM faqtbl WHERE IDFaq = @IDFaq
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateProcessingTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPUpdateProblemTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPUpdateIssueTypetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	 Update IssueType details of IssueTypetbl Table 
-- =============================================
 CREATE PROCEDURE [dbo].[SPUpdateIssueTypetbl]
@IDIssueType int ,
	@IssueType varchar(150),
    @IssueTypeDescription varchar(250),
    @Updateddate datetime,
    @Updateduser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [kb].[dbo].[IssueTypetbl]
   SET [IssueType] = @IssueType,[IssueTypeDescription] = @IssueTypeDescription,[Updateddate] = @Updateddate,[Updateduser] = @Updateduser
 WHERE IDIssueType=@IDIssueType
END
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateFileType]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPUpdatefaqtbl]    Script Date: 03/21/2011 14:33:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SPProcessingTypeDetails]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  ProcessingType details from ProcessingTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPProcessingTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from ProcessingTypetbl
	
  
END
GO
/****** Object:  StoredProcedure [dbo].[SPProblemTypeDetails]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  ProblemTypet details from ProblemTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPProblemTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from ProblemTypetbl
	
  
END
GO
/****** Object:  StoredProcedure [dbo].[SPIssueTypeDetails]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  IssueType details from IssueTypetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPIssueTypeDetails]

AS

BEGIN
	
	SET NOCOUNT ON;
	select * from IssueTypetbl 
	
  
END
GO
/****** Object:  StoredProcedure [dbo].[SPIssueDetails]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To fetch  Issue details from Issue Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPIssueDetails]
@IssueID int
AS

BEGIN
	
	SET NOCOUNT ON;
	IF @ISSUEID=0
		BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID 
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
		END
	ELSE IF @ISSUEID>0
	BEGIN
			SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
               IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
               Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty 
            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID 
            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType 
            where Issuetbl.IDIssue= @ISSUEID
	END
	
	

                        

  
END
GO
/****** Object:  StoredProcedure [dbo].[SPInsertIssuetbl]    Script Date: 03/21/2011 14:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dasarath
-- Create date: 2/12/20
-- Description:	To Insert Issue details into Issuetbl Table 
-- =============================================
CREATE PROCEDURE [dbo].[SPInsertIssuetbl]
	@IDIssue int OUTPUT,
	@FIPSCounty varchar(5),
	@IDProcessingType int,
	@IDFileType int,
	@IDIssueType int,
	@Edition int,
	@Version int,
	@Title varchar(100),
	@IssueDetails varchar,
	@Resolution varchar,
	@Submitter varchar(50),
	@Relatedlink varchar,
	@ICP int,
	@IssueCreatedDate datetime,
	@IssueCreatedUser int,
	@IssueUpdatedDate datetime,
	@IssueUpdatedUser int,
	@Isuplodedfile bit,
	@IDuploadedfile int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [kb].[dbo].[Issuetbl]
           ([FIPSCounty]
           ,[IDProcessingType]
           ,[IDFileType]
           ,[IDIssueType]
           ,[Edition]
           ,[Version]
           ,[Title]
           ,[IssueDetails]
           ,[Resolution]
           ,[Submitter]
           ,[Relatedlink]
           ,[ICP]
           ,[IssueCreatedDate]
           ,[IssueCreatedUser]
           ,[IssueUpdatedDate]
           ,[IssueUpdatedUser]
           ,[Isuplodedfile]
           ,[IDuploadedfile])
     VALUES
           (@FIPSCounty ,@IDProcessingType,@IDFileType,@IDIssueType ,@Edition ,@Version,@Title,@IssueDetails,@Resolution,@Submitter
           ,@Relatedlink ,@ICP,@IssueCreatedDate,@IssueCreatedUser,@IssueUpdatedDate,@IssueUpdatedUser,@Isuplodedfile,@IDuploadedfile)
           
           SET @IDIssue = @@IDENTITY




END
GO
/****** Object:  ForeignKey [FK_Issuetbl_County]    Script Date: 03/21/2011 14:33:33 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_County] FOREIGN KEY([FIPSCounty])
REFERENCES [dbo].[County] ([FIPS])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_County]
GO
/****** Object:  ForeignKey [FK_Issuetbl_FileType]    Script Date: 03/21/2011 14:33:33 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_FileType] FOREIGN KEY([IDFileType])
REFERENCES [dbo].[FileType] ([IDFileType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_FileType]
GO
/****** Object:  ForeignKey [FK_Issuetbl_IssueTypetbl]    Script Date: 03/21/2011 14:33:33 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_IssueTypetbl] FOREIGN KEY([IDIssueType])
REFERENCES [dbo].[IssueTypetbl] ([IDIssueType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_IssueTypetbl]
GO
/****** Object:  ForeignKey [FK_Issuetbl_ProcessingTypetbl]    Script Date: 03/21/2011 14:33:33 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_ProcessingTypetbl] FOREIGN KEY([IDProcessingType])
REFERENCES [dbo].[ProcessingTypetbl] ([IDProcessingType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_ProcessingTypetbl]
GO
/****** Object:  ForeignKey [FK_Issuetbl_Upladedfiletbl]    Script Date: 03/21/2011 14:33:33 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_Upladedfiletbl] FOREIGN KEY([IDuploadedfile])
REFERENCES [dbo].[Uploadedfiletbl] ([IDuploadedfile])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_Upladedfiletbl]
GO
