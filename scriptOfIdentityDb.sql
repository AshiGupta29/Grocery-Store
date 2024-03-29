USE [master]
GO
/****** Object:  Database [IdentityStore]    Script Date: 19-06-2023 11:49:11 ******/
CREATE DATABASE [IdentityStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IdentityStore', FILENAME = N'C:\Users\ashigupta02\IdentityStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IdentityStore_log', FILENAME = N'C:\Users\ashigupta02\IdentityStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IdentityStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IdentityStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IdentityStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IdentityStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IdentityStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IdentityStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IdentityStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [IdentityStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IdentityStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IdentityStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IdentityStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IdentityStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IdentityStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IdentityStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IdentityStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IdentityStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IdentityStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IdentityStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IdentityStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IdentityStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IdentityStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IdentityStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IdentityStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IdentityStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IdentityStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IdentityStore] SET  MULTI_USER 
GO
ALTER DATABASE [IdentityStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IdentityStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IdentityStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IdentityStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IdentityStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IdentityStore] SET QUERY_STORE = OFF
GO
USE [IdentityStore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IdentityStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19-06-2023 11:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608105940_IdentityInitial', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611173314_IdentityUserUpdate', N'6.0.16')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'189d7ea4-9897-43b3-af7f-2398558d2145', N'Pranav Gupta', N'pranav@gmail.com', N'PRANAV@GMAIL.COM', N'pranav@gmail.com', N'PRANAV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAGlUrvqgUGgW44LrOkEyPG4FkGhlwJ/z+HtzUROZ1ZvTwe3f2+NUxPR5v8oGYpsAw==', N'GYBAMBA7EJSJO3AMAS6DAZ33CEECF7VB', N'9c813af5-8149-4ee3-8384-73ae8b6c94f1', N'9827782827', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'1f51545f-3a24-4876-bc6c-a80b0126a47d', N'Admin', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECwQmgBIZ9RcUhxm2ARZk5g+y7vNPUd5cUohAVBEc/WBVM040B6SnVPhq5KEI0lPdg==', N'B63QVTHITQ2GJS5PL7JDMFIUMLROCVM3', N'a9f6eb54-1562-45dc-b979-a66fc82b22fc', N'8448963690', 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'22a7190d-73fd-45c9-9719-c25543714d75', N'Ashi Gupta', N'ashigupta0529@gmail.com', N'ASHIGUPTA0529@GMAIL.COM', N'ashigupta0529@gmail.com', N'ASHIGUPTA0529@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPItcwNPD0tBwm9QqfJni3/9hfTAllKXMZnwqW4A0zW0G4hFXunXgrIOAH71ctCcig==', N'ZCCIPK6CBLHXNV2DG3JVMRGIEVSVHPI3', N'45a57033-2dd5-4bb5-935e-58ffc6c3f7d0', N'8448963670', 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'469af39d-f00e-404b-a85d-7e012fd7e3a5', N'Yash Agrawal', N'yash@gmail.com', N'YASH@GMAIL.COM', N'yash@gmail.com', N'YASH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEImpDp8k3KodEEDMQH6Jje/l9e8tVJ1viZkEPzYRVzA4Ctbbzs6R8SKP35y09X+eag==', N'H7TATTL2JMWNUWS46KOG4UKGWV5ALJ2U', N'e0e02d47-fa8c-4574-ba08-e3c00304c202', N'7777567891', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'4d98eeaa-f3be-4e95-8751-5817a4924eac', N'Nikku', N'nikku@gmail.com', N'NIKKU@GMAIL.COM', N'nikku@gmail.com', N'NIKKU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKMVIwFk8biUW2APij0jccOeNSaiAi0DEFfH1t2W3NdnVRM8M/ZV5r3D8Amgmfi6tQ==', N'64KZSQCMPU6CKY2STKJV6CQFCWEHWIQR', N'f32ebd8f-af8a-40c4-a1c0-770961fa8509', N'7865343554', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'cda4d7ae-7db4-4a1f-b0e1-efe0a0360f11', N'Puneet Rekhi', N'puneet@gmail.com', N'PUNEET@GMAIL.COM', N'puneet@gmail.com', N'PUNEET@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHAvUMOiTPtsKRnE0KXiyscfz5nRyxdZCiQNECpdD4q/cRE9+swiK9qXP4s2GGFOCA==', N'7JMAS56P5TIYAXOT2ZMYB3NRP2LMW4LY', N'bf588478-4c38-4c88-b4df-eeb1bcb31aaf', N'7982987712', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'db607c80-c3bd-4930-b18c-4f29e7d75342', N'Kriti Gupta', N'kriti@gmail.com', N'KRITI@GMAIL.COM', N'kriti@gmail.com', N'KRITI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHCzLe+y73exJfwuQ202/6U4d5Eh6jKNmKjpXVAZ4Qn9vVozcOnknsc+zFdtt2T4vQ==', N'3T2EVADI5NCKYDLPCOELHZ5MXU3WFRMX', N'c4c49cfc-53d0-4f08-a4ce-b9d81cbcb3bf', N'7011587377', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'f2921d9b-21fc-40f9-95f5-467f56c60897', N'Vaani Mehra', N'vaani@gmail.com', N'VAANI@GMAIL.COM', N'vaani@gmail.com', N'VAANI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELkIqa336eulq+i8oSpxOab5gsrnPftaqB/Us4EJBuX0xPBKV9wqdCSPWmM8o0FiSg==', N'7QHZ2DYBH7FUT2NIRSQ2JXA6QARQBBBQ', N'6d6687da-2f7f-4c18-a550-5c7282ea9a70', N'8787649787', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'f7d0eeae-4d68-444b-8120-862204393d14', N'Test', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKRvR5fbCR98+Cwy0mx+NgQSeKUL3/VwRa3flPCkwZ3hHfsdrfYEWcVOxIyQ2Xku5A==', N'75YNBSPUXT7CV5FHJXATF2UPBXLRKW5O', N'8f99cdb6-282c-4cd9-a52a-55658bdaa8e8', N'8648963690', 0, 0, NULL, 1, 0, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 19-06-2023 11:49:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19-06-2023 11:49:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 19-06-2023 11:49:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 19-06-2023 11:49:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 19-06-2023 11:49:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 19-06-2023 11:49:12 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 19-06-2023 11:49:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [IdentityStore] SET  READ_WRITE 
GO
