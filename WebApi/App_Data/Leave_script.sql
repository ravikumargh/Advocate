USE [master]
GO
/****** Object:  Database [Advocate]    Script Date: 12/17/2015 00:52:07 ******/
CREATE DATABASE [Advocate] ON  PRIMARY 
( NAME = N'Advocate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Advocate.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Advocate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Advocate_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/17/2015 00:52:09 ******/
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
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'Admin', NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'User', NULL, NULL, NULL)
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 12/17/2015 00:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_LeaveType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'Casual Leave', 0, CAST(0x0000A5710005C615 AS DateTime), CAST(0x0000A5710005C615 AS DateTime))
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (2, N'Sick Leave', 0, CAST(0x0000A57100061153 AS DateTime), CAST(0x0000A57100061153 AS DateTime))
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (3, N'Compensatory Leave', 0, CAST(0x0000A57100064E3E AS DateTime), CAST(0x0000A57100064E3E AS DateTime))
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (4, N'Marriage Leave', 0, CAST(0x0000A57100066E4B AS DateTime), CAST(0x0000A57100066E4B AS DateTime))
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (5, N'Maternity Leave', 0, CAST(0x0000A571000689EA AS DateTime), CAST(0x0000A571000689EA AS DateTime))
INSERT [dbo].[LeaveTypes] ([Id], [Name], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (6, N'Paternity Leave', 0, CAST(0x0000A57100069619 AS DateTime), CAST(0x0000A57100069619 AS DateTime))
/****** Object:  Table [dbo].[LeaveStatus]    Script Date: 12/17/2015 00:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStatus](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_LeaveStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaves]    Script Date: 12/17/2015 00:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaves](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[ApproverId] [bigint] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[LeaveType] [bigint] NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[Reason] [nvarchar](200) NULL,
	[Status] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Leaves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/17/2015 00:52:09 ******/
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
INSERT [dbo].[Users] ([Id], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [Name], [Address], [IsLocked], [AccessFailedCount], [RoleId], [IsDeleted], [DateCreated], [DateUpdated]) VALUES (1, N'ravikumargh13@gmail.com', 1, N'P@ssword1', N'9986756756', 0, N'Ravikumar', N'123', 0, 0, 1, 0, CAST(0x0000A55000DDD671 AS DateTime), CAST(0x0000A55000DDD671 AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Default [DF_LeaveType_IsDeleted]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveTypes] ADD  CONSTRAINT [DF_LeaveType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_LeaveType_DateCreated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveTypes] ADD  CONSTRAINT [DF_LeaveType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_LeaveType_DateUpdated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveTypes] ADD  CONSTRAINT [DF_LeaveType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_LeaveStatus_IsDeleted]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveStatus] ADD  CONSTRAINT [DF_LeaveStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_LeaveStatus_DateCreated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveStatus] ADD  CONSTRAINT [DF_LeaveStatus_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_LeaveStatus_DateUpdated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[LeaveStatus] ADD  CONSTRAINT [DF_LeaveStatus_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Leaves_IsDeleted]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[Leaves] ADD  CONSTRAINT [DF_Leaves_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_Leaves_DateCreated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[Leaves] ADD  CONSTRAINT [DF_Leaves_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Leaves_DateUpdated]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[Leaves] ADD  CONSTRAINT [DF_Leaves_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 12/17/2015 00:52:09 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
