USE [master]
GO
/****** Object:  Database [HealingPaws]    Script Date: 19-07-2024 13:09:52 ******/
CREATE DATABASE [HealingPaws]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealingPaws', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HealingPaws.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealingPaws_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HealingPaws_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HealingPaws] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealingPaws].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HealingPaws] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealingPaws] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealingPaws] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealingPaws] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealingPaws] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealingPaws] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HealingPaws] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealingPaws] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealingPaws] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealingPaws] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealingPaws] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealingPaws] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealingPaws] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealingPaws] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealingPaws] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HealingPaws] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealingPaws] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealingPaws] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealingPaws] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealingPaws] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealingPaws] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealingPaws] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealingPaws] SET RECOVERY FULL 
GO
ALTER DATABASE [HealingPaws] SET  MULTI_USER 
GO
ALTER DATABASE [HealingPaws] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealingPaws] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealingPaws] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealingPaws] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealingPaws] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HealingPaws] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HealingPaws', N'ON'
GO
ALTER DATABASE [HealingPaws] SET QUERY_STORE = OFF
GO
USE [HealingPaws]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 19-07-2024 13:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PetName] [nvarchar](100) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Reason] [nvarchar](500) NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 19-07-2024 13:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[OwnerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (1, N'tomi', 1, CAST(N'2024-07-19T03:21:28.793' AS DateTime), N'as', N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (2, N'tomi 1', 1, CAST(N'2024-07-19T03:21:55.430' AS DateTime), N'as test', N'Reschedule')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (3, N'tomi 12', 2, CAST(N'2024-07-04T00:00:00.000' AS DateTime), N'3', N'Reschedule')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (4, N'tony', 3, CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'test ', N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (5, N'tomi', 4, CAST(N'2024-07-19T04:39:05.663' AS DateTime), N'as', N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (6, N'Tomi ABC', 5, CAST(N'2024-07-21T09:00:00.000' AS DateTime), N'My dog has some health issue.', N'Reschedule')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (7, N'Tony', 6, CAST(N'2024-07-28T10:00:00.000' AS DateTime), N'He has a health issue.', N'Cancelled')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (8, N'Bin', 7, CAST(N'2024-07-26T10:15:00.000' AS DateTime), N'He has a health issue.', N'Pending')
INSERT [dbo].[Appointments] ([AppointmentId], [PetName], [OwnerId], [DateTime], [Reason], [Status]) VALUES (9, N'Kone', 8, CAST(N'2024-07-24T01:00:00.000' AS DateTime), N'Health issues.', N'Reschedule')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 

INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (1, N'vk', N'9784578451')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (2, N'vk', N'23')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (3, N'vk', N'9784578451')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (4, N'vk', N'9784578451')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (5, N'John win', N'7878781210')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (6, N'Cade B', N'8989781023')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (7, N'Cade B', N'8989781023')
INSERT [dbo].[Owners] ([OwnerId], [Name], [PhoneNumber]) VALUES (8, N'Mane C', N'5645122345')
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owners] ([OwnerId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Owner]
GO
USE [master]
GO
ALTER DATABASE [HealingPaws] SET  READ_WRITE 
GO
