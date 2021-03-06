USE [master]
GO
/****** Object:  Database [kb]    Script Date: 02/01/2011 12:52:16 ******/
CREATE DATABASE [kb] ON  PRIMARY 
( NAME = N'kb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\kb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\kb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [kb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [kb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [kb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [kb] SET ARITHABORT OFF
GO
ALTER DATABASE [kb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [kb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [kb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [kb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [kb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [kb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [kb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [kb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [kb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [kb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [kb] SET  DISABLE_BROKER
GO
ALTER DATABASE [kb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [kb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [kb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [kb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [kb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [kb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [kb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [kb] SET  READ_WRITE
GO
ALTER DATABASE [kb] SET RECOVERY FULL
GO
ALTER DATABASE [kb] SET  MULTI_USER
GO
ALTER DATABASE [kb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [kb] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'kb', N'ON'
GO
USE [kb]
GO
/****** Object:  Table [dbo].[IssueStatustbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueStatustbl](
	[IDIssueStatus] [int] NOT NULL,
	[IssueStatus] [varchar](150) NOT NULL,
	[IssueStatusDescription] [varchar](250) NULL,
	[IssueStatusCreatedDate] [datetime] NULL,
	[IssueStatusCreate_User] [int] NULL,
	[IssueStatusUpdatedDate] [datetime] NULL,
	[IssueStatusUpdatedUser] [int] NULL,
 CONSTRAINT [PK_Issue_Status_tbl] PRIMARY KEY CLUSTERED 
(
	[IDIssueStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ICPtbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICPtbl](
	[IDICP] [int] NULL,
	[ICPCode] [int] NOT NULL,
	[ICPDescription] [varchar](150) NULL,
 CONSTRAINT [PK_ICP_tbl] PRIMARY KEY CLUSTERED 
(
	[ICPCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileType]    Script Date: 02/01/2011 12:52:18 ******/
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
 CONSTRAINT [PK_File_Type] PRIMARY KEY CLUSTERED 
(
	[IDFileType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[County]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[County](
	[FIPS] [int] NOT NULL,
	[StateCounty] [varchar](50) NOT NULL,
	[State] [varchar](5) NOT NULL,
	[County] [varchar](50) NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[FIPS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommentTypetbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommentTypetbl](
	[IDCommentType] [int] IDENTITY(1,1) NOT NULL,
	[CommentType] [varchar](150) NOT NULL,
	[CommentTypeDescription] [varchar](250) NULL,
	[CommentTypeCreatedDate] [datetime] NULL,
	[CommentTypeCreatedUser] [int] NULL,
	[CommentTypeUpdatedDate] [datetime] NULL,
	[CommentTypeUpdatedUser] [int] NULL,
 CONSTRAINT [PK_Comment_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IDCommentType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateProcessingTypetbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateProcessingTypetbl](
	[IDStateProcessingType] [int] NOT NULL,
	[StateProcessingType] [varchar](100) NULL,
	[StateProcessingTypeDescription] [varchar](150) NULL,
	[StateProcessingcreatedDate] [datetime] NULL,
	[StateProcessingCreatedUser] [int] NULL,
	[StateProcessingUpdatedDate] [datetime] NULL,
	[StateProcessingUpdatedUser] [int] NULL,
 CONSTRAINT [PK_State_Processing_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IDStateProcessingType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCMtbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCMtbl](
	[IDSCM] [int] NOT NULL,
	[SCM] [varchar](150) NOT NULL,
	[SCMDescription] [varchar](150) NULL,
 CONSTRAINT [PK_SCM_tbl] PRIMARY KEY CLUSTERED 
(
	[IDSCM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProblemTypetbl]    Script Date: 02/01/2011 12:52:18 ******/
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
	[ProblemTypeCreatedDate] [datetime] NULL,
	[ProblemTypeCreatedUser] [int] NULL,
	[ProblemTypeUpdatedDate] [datetime] NULL,
	[ProblemTypeUpdateduser] [int] NULL,
 CONSTRAINT [PK_Problem_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IDProblemType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IssueTypetbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueTypetbl](
	[IssueType_ID] [int] IDENTITY(1,1) NOT NULL,
	[IssueType] [varchar](150) NOT NULL,
	[IssueTypeDescription] [varchar](250) NULL,
	[IssueTypeCreateddate] [datetime] NULL,
	[IssueTypeCreateduser] [int] NULL,
	[IssueTypeUpdateddate] [datetime] NULL,
	[IssueTypeUpdateduser] [int] NULL,
 CONSTRAINT [PK_Issue_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[IssueType_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issuetbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issuetbl](
	[IDIssue] [int] IDENTITY(1,1) NOT NULL,
	[FIPSCounty] [int] NOT NULL,
	[IDStateProcessingType] [int] NULL,
	[IDProblemType] [int] NULL,
	[IDIssueType] [int] NULL,
	[IDIssueStatus] [int] NULL,
	[IDCommentType] [int] NULL,
	[IDFileType] [int] NULL,
	[IssueDescription] [varchar](500) NULL,
	[IssueResolution] [varchar](250) NULL,
	[IssueRelatedICP] [int] NULL,
	[IssueCreatedDate] [datetime] NULL,
	[IssueCreatedUser] [int] NULL,
	[IssueUpdatedDate] [datetime] NULL,
	[IssueUpdatedUser] [int] NULL,
 CONSTRAINT [PK_Issue_tbl] PRIMARY KEY CLUSTERED 
(
	[IDIssue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IssueActiontakentbl]    Script Date: 02/01/2011 12:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IssueActiontakentbl](
	[IDIssue] [int] NOT NULL,
	[IDIssueAction] [int] NOT NULL,
	[IssueRecommendedAction] [varchar](150) NOT NULL,
	[ActiontakenUser] [int] NOT NULL,
	[ActiontakenDate] [datetime] NOT NULL,
	[Actiontaken] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Comment_Type_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Comment_Type_tbl] FOREIGN KEY([IDCommentType])
REFERENCES [dbo].[CommentTypetbl] ([IDCommentType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_Comment_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_County1]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_County1] FOREIGN KEY([FIPSCounty])
REFERENCES [dbo].[County] ([FIPS])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_County1]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_File_Type]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_File_Type] FOREIGN KEY([IDFileType])
REFERENCES [dbo].[FileType] ([IDFileType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_File_Type]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_ICP_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_ICP_tbl] FOREIGN KEY([IssueRelatedICP])
REFERENCES [dbo].[ICPtbl] ([ICPCode])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_ICP_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Issue_Type_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Issue_Type_tbl] FOREIGN KEY([IDIssueType])
REFERENCES [dbo].[IssueTypetbl] ([IssueType_ID])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_Issue_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Problem_Type_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Problem_Type_tbl] FOREIGN KEY([IDProblemType])
REFERENCES [dbo].[ProblemTypetbl] ([IDProblemType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_Problem_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_State_Processing_Type_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_State_Processing_Type_tbl] FOREIGN KEY([IDStateProcessingType])
REFERENCES [dbo].[StateProcessingTypetbl] ([IDStateProcessingType])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issue_tbl_State_Processing_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issuetbl_IssueStatustbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[Issuetbl]  WITH CHECK ADD  CONSTRAINT [FK_Issuetbl_IssueStatustbl] FOREIGN KEY([IDIssueStatus])
REFERENCES [dbo].[IssueStatustbl] ([IDIssueStatus])
GO
ALTER TABLE [dbo].[Issuetbl] CHECK CONSTRAINT [FK_Issuetbl_IssueStatustbl]
GO
/****** Object:  ForeignKey [FK_Issue_Actiontaken_tbl_Issue_tbl]    Script Date: 02/01/2011 12:52:18 ******/
ALTER TABLE [dbo].[IssueActiontakentbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Actiontaken_tbl_Issue_tbl] FOREIGN KEY([IDIssue])
REFERENCES [dbo].[Issuetbl] ([IDIssue])
GO
ALTER TABLE [dbo].[IssueActiontakentbl] CHECK CONSTRAINT [FK_Issue_Actiontaken_tbl_Issue_tbl]
GO
