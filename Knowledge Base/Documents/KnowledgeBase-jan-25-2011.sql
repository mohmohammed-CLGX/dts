USE [KnowledgeBase]
GO
/****** Object:  Table [dbo].[ICP_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ICP_tbl](
	[ID_ICP] [int] NULL,
	[ICP_Code] [int] NOT NULL,
	[ICP_Description] [varchar](150) NULL,
 CONSTRAINT [PK_ICP_tbl] PRIMARY KEY CLUSTERED 
(
	[ICP_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[File_Type]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[File_Type](
	[ID_File_Type] [int] NOT NULL,
	[File_Type] [varchar](100) NOT NULL,
	[File_Type_Description] [varchar](150) NULL,
 CONSTRAINT [PK_File_Type] PRIMARY KEY CLUSTERED 
(
	[ID_File_Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment_Type_tbl](
	[ID_Comment_Type] [int] NOT NULL,
	[Comment_Type] [varchar](150) NOT NULL,
	[Comment_Type_Description] [varchar](250) NULL,
	[Comment_Type_Created_Date] [datetime] NULL,
	[Comment_Type_Created_User] [int] NULL,
	[Comment_Type_Updated_Date] [datetime] NULL,
	[Comment_Type_Updated_User] [int] NULL,
 CONSTRAINT [PK_Comment_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_Comment_Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue_Status_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue_Status_tbl](
	[ID_Issue_Status] [int] NOT NULL,
	[Issue_Status] [varchar](150) NOT NULL,
	[Issue_Status_Description] [varchar](250) NULL,
	[Issue_Status_Created_Date] [datetime] NULL,
	[Issue_Status_Created_User] [int] NULL,
	[Issue_Status_Updated_Date] [datetime] NULL,
	[Issue_Status_Updated_User] [int] NULL,
 CONSTRAINT [PK_Issue_Status_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_Issue_Status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[US_States_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[US_States_tbl](
	[State] [varchar](150) NULL,
	[Abbreviation] [varchar](50) NULL,
	[FPIS] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[US_County_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[US_County_tbl](
	[County] [varchar](150) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[FIPS_County] [int] NOT NULL,
 CONSTRAINT [PK_US_County_tbl] PRIMARY KEY CLUSTERED 
(
	[FIPS_County] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State_Processing_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State_Processing_Type_tbl](
	[ID_State_Processing_Type] [int] NOT NULL,
	[State_Processing_Type] [varchar](100) NULL,
	[State_Processing_Type_Description] [varchar](150) NULL,
	[State_Processing_created_Date] [datetime] NULL,
	[State_Processing_Created_User] [int] NULL,
	[State_Processing_Updated_Date] [datetime] NULL,
	[State_Processing_Updated_User] [int] NULL,
 CONSTRAINT [PK_State_Processing_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_State_Processing_Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCM_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCM_tbl](
	[ID_SCM] [int] NOT NULL,
	[SCM] [varchar](150) NOT NULL,
	[SCM_Description] [varchar](150) NULL,
 CONSTRAINT [PK_SCM_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_SCM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Problem_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Problem_Type_tbl](
	[ID_Problem_Type] [int] NOT NULL,
	[Problem_Type] [varchar](250) NOT NULL,
	[Problem_Type_Description] [varchar](250) NULL,
	[Problem_Type_Created_Date] [datetime] NULL,
	[Problem_Type_Created_User] [int] NULL,
	[Problem_Type_Updated_Date] [datetime] NULL,
	[Problem_Type_Updated_user] [int] NULL,
 CONSTRAINT [PK_Problem_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_Problem_Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue_Type_tbl](
	[Issue_Type_ID] [int] NOT NULL,
	[Issue_Type] [varchar](150) NOT NULL,
	[Issue_Type_Description] [varchar](250) NULL,
	[Issue_Type_Created_date] [datetime] NULL,
	[Issue_Type_Created_user] [int] NULL,
	[Issue_Type_Updated_date] [datetime] NULL,
	[Issue_Type_Updated_user] [int] NULL,
 CONSTRAINT [PK_Issue_Type_tbl] PRIMARY KEY CLUSTERED 
(
	[Issue_Type_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue_tbl](
	[ID_Issue] [int] NOT NULL,
	[FIPS_County] [int] NOT NULL,
	[ID_State_Processing_Type] [int] NOT NULL,
	[ID_Problem_Type] [int] NOT NULL,
	[ID_Issue_Type] [int] NOT NULL,
	[ID_Issue_Status] [int] NOT NULL,
	[ID_Comment_Type] [int] NOT NULL,
	[ID_File_Type] [int] NOT NULL,
	[Issue_Description] [varchar](500) NOT NULL,
	[Issue_Resolution] [varchar](250) NULL,
	[Issue_Related_ICP] [int] NOT NULL,
	[Issue_Created_Date] [datetime] NOT NULL,
	[Issue_Created_User] [int] NOT NULL,
	[Issue_Updated_Date] [datetime] NULL,
	[Issue_Updated_User] [int] NULL,
 CONSTRAINT [PK_Issue_tbl] PRIMARY KEY CLUSTERED 
(
	[ID_Issue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue_Actiontaken_tbl]    Script Date: 01/25/2011 11:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue_Actiontaken_tbl](
	[ID_Issue] [int] NOT NULL,
	[ID_Issue_Action] [int] NOT NULL,
	[Issue_Recommended_Action] [varchar](150) NOT NULL,
	[Actiontaken_User] [int] NOT NULL,
	[Actiontaken_Date] [datetime] NOT NULL,
	[Actiontaken] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Issue_Actiontaken_tbl_Issue_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_Actiontaken_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Actiontaken_tbl_Issue_tbl] FOREIGN KEY([ID_Issue])
REFERENCES [dbo].[Issue_tbl] ([ID_Issue])
GO
ALTER TABLE [dbo].[Issue_Actiontaken_tbl] CHECK CONSTRAINT [FK_Issue_Actiontaken_tbl_Issue_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Comment_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Comment_Type_tbl] FOREIGN KEY([ID_Comment_Type])
REFERENCES [dbo].[Comment_Type_tbl] ([ID_Comment_Type])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_Comment_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_File_Type]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_File_Type] FOREIGN KEY([ID_File_Type])
REFERENCES [dbo].[File_Type] ([ID_File_Type])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_File_Type]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_ICP_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_ICP_tbl] FOREIGN KEY([Issue_Related_ICP])
REFERENCES [dbo].[ICP_tbl] ([ICP_Code])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_ICP_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Issue_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Issue_Type_tbl] FOREIGN KEY([ID_Issue_Type])
REFERENCES [dbo].[Issue_Type_tbl] ([Issue_Type_ID])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_Issue_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_Problem_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_Problem_Type_tbl] FOREIGN KEY([ID_Problem_Type])
REFERENCES [dbo].[Problem_Type_tbl] ([ID_Problem_Type])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_Problem_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_State_Processing_Type_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_State_Processing_Type_tbl] FOREIGN KEY([ID_State_Processing_Type])
REFERENCES [dbo].[State_Processing_Type_tbl] ([ID_State_Processing_Type])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_State_Processing_Type_tbl]
GO
/****** Object:  ForeignKey [FK_Issue_tbl_US_County_tbl]    Script Date: 01/25/2011 11:18:36 ******/
ALTER TABLE [dbo].[Issue_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Issue_tbl_US_County_tbl] FOREIGN KEY([FIPS_County])
REFERENCES [dbo].[US_County_tbl] ([FIPS_County])
GO
ALTER TABLE [dbo].[Issue_tbl] CHECK CONSTRAINT [FK_Issue_tbl_US_County_tbl]
GO
