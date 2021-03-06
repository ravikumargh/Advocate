USE [master]
GO
/****** Object:  Database [Advocate]    Script Date: 12/21/2015 19:27:17 ******/
CREATE DATABASE [Advocate] ON  PRIMARY 
( NAME = N'Advocate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008\MSSQL\DATA\Advocate.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Advocate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008\MSSQL\DATA\Advocate_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Advocate] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Advocate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Advocate] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Advocate] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Advocate] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Advocate] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Advocate] SET ARITHABORT OFF
GO
ALTER DATABASE [Advocate] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Advocate] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Advocate] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Advocate] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Advocate] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Advocate] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Advocate] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Advocate] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Advocate] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Advocate] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Advocate] SET  DISABLE_BROKER
GO
ALTER DATABASE [Advocate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Advocate] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Advocate] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Advocate] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Advocate] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Advocate] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Advocate] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Advocate] SET  READ_WRITE
GO
ALTER DATABASE [Advocate] SET RECOVERY FULL
GO
ALTER DATABASE [Advocate] SET  MULTI_USER
GO
ALTER DATABASE [Advocate] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Advocate] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Advocate', N'ON'
GO
USE [Advocate]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'Super Admin', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'Admin', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (3, N'Senior', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (4, N'Junior', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (5, N'Client', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (6, N'Public', NULL, NULL, NULL)
/****** Object:  Table [dbo].[Firms]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AdvocateId] [bigint] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Firms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Firms] ([Id], [Name], [Description], [AdvocateId], [DateCreated], [DateUpdated]) VALUES (0, N'Firm 1', NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[DocumentType]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DocumentType] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'Photo', 0, CAST(0x0000A56F0118C192 AS DateTime), CAST(0x0000A56F0118C192 AS DateTime))
INSERT [dbo].[DocumentType] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'IdProof', 0, CAST(0x0000A56F0118C9BE AS DateTime), CAST(0x0000A56F0118C9BE AS DateTime))
INSERT [dbo].[DocumentType] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (3, N'AddressProof', 0, CAST(0x0000A56F0118E4F5 AS DateTime), CAST(0x0000A56F0118E4F5 AS DateTime))
INSERT [dbo].[DocumentType] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (4, N'EducationCertificate', 0, CAST(0x0000A56F0118F18B AS DateTime), CAST(0x0000A56F0118F18B AS DateTime))
/****** Object:  Table [dbo].[Users]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[Password] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[WhatsAppNumber] [nvarchar](20) NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](256) NULL,
	[IsLocked] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[RoleId] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [WhatsAppNumber], [Name], [Address], [IsLocked], [AccessFailedCount], [RoleId], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'ravikumargh13@gmail.com', 1, N'P@ssword1', N'9986756756', 0, NULL, N'Ravikumar', N'123', 0, 0, 1, 0, CAST(0x0000A55000DDD671 AS DateTime), CAST(0x0000A55000DDD671 AS DateTime))
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [WhatsAppNumber], [Name], [Address], [IsLocked], [AccessFailedCount], [RoleId], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'ravikumar@a.com', 0, N'P@ssword1', N'123123', 0, N'123123`', N'kumar senior', N'qweqwew', 0, 0, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Documents]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
	[DocumentType] [bigint] NULL,
	[Content] [image] NULL,
	[UserId] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[Size] [int] NULL,
	[Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cases]    Script Date: 12/21/2015 19:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AdvocateId] [bigint] NULL,
	[ClientId] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Cases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cases] ON
INSERT [dbo].[Cases] ([Id], [Number], [Description], [AdvocateId], [ClientId], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'c1', N'c1 desc', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cases] ([Id], [Number], [Description], [AdvocateId], [ClientId], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (3, N'C2', N'c2 desc', 1, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cases] OFF
/****** Object:  Default [DF_Firms_DateCreated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Firms] ADD  CONSTRAINT [DF_Firms_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Firms_DateUpdated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Firms] ADD  CONSTRAINT [DF_Firms_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_DocumentType_IsDeleted]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DF_DocumentType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_DocumentType_DateCreated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DF_DocumentType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_DocumentType_DateUpdated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DF_DocumentType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Documents_IsDeleted]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Documents_DateCreated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Documents_DateUpdated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Cases_IsDeleted]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Cases] ADD  CONSTRAINT [DF_Cases_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Cases_DateCreated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Cases] ADD  CONSTRAINT [DF_Cases_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Cases_DateUpdated]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Cases] ADD  CONSTRAINT [DF_Cases_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_Documents_DocumentType]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_DocumentType] FOREIGN KEY([DocumentType])
REFERENCES [dbo].[DocumentType] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_DocumentType]
GO
/****** Object:  ForeignKey [FK_Documents_Users]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Users]
GO
/****** Object:  ForeignKey [FK_Cases_Users]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Users] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Users]
GO
/****** Object:  ForeignKey [FK_Cases_Users1]    Script Date: 12/21/2015 19:27:18 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Users1] FOREIGN KEY([AdvocateId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Users1]
GO
