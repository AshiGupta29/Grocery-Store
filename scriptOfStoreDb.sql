USE [master]
GO
/****** Object:  Database [ProductStore2]    Script Date: 19-06-2023 11:50:42 ******/
CREATE DATABASE [ProductStore2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductStore2', FILENAME = N'C:\Users\ashigupta02\ProductStore2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductStore2_log', FILENAME = N'C:\Users\ashigupta02\ProductStore2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductStore2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductStore2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductStore2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductStore2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductStore2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductStore2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductStore2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductStore2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductStore2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductStore2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductStore2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductStore2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductStore2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductStore2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductStore2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductStore2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductStore2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductStore2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductStore2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductStore2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductStore2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductStore2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductStore2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProductStore2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductStore2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductStore2] SET  MULTI_USER 
GO
ALTER DATABASE [ProductStore2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductStore2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductStore2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductStore2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductStore2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductStore2] SET QUERY_STORE = OFF
GO
USE [ProductStore2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProductStore2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19-06-2023 11:50:43 ******/
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
/****** Object:  Table [dbo].[OrderItems]    Script Date: 19-06-2023 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_ProductItemId] [int] NULL,
	[ItemOrdered_ProductName] [nvarchar](max) NULL,
	[ItemOrdered_ImageUrl] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
	[Discount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19-06-2023 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[Orderdate] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 19-06-2023 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 19-06-2023 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[ProductSpecification] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 19-06-2023 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DatePosted] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602142522_InitialCreate', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608170913_OrderEntityAdded', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608183522_OrderEntityUpdated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230613075637_AddedReviews', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230618090255_AddedReview', N'6.0.16')
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (1, 1, N'Banana', N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), 2, 1, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (2, 1, N'Banana', N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), 2, 2, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (3, 10, N'Aloo Bhujia', N'images/products/Bicano.jpg', CAST(55.00 AS Decimal(18, 2)), 2, 3, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (4, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 4, 3, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (5, 5, N'Amul Butter', N'images/products/Butter.jpg', CAST(266.00 AS Decimal(18, 2)), 1, 3, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (6, 7, N'Coco-Cola', N'images/products/cococola.jpg', CAST(95.00 AS Decimal(18, 2)), 1, 3, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (7, 12, N'Eggs', N'images/products/Egg.jpg', CAST(229.00 AS Decimal(18, 2)), 1, 3, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (8, 14, N'Toor-Dal', N'images/products/Dal.jpg', CAST(93.00 AS Decimal(18, 2)), 1, 3, CAST(11.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (9, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 1, 4, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (10, 5, N'Amul Butter', N'images/products/Butter.jpg', CAST(266.00 AS Decimal(18, 2)), 1, 4, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (11, 10, N'Aloo Bhujia', N'images/products/Bicano.jpg', CAST(55.00 AS Decimal(18, 2)), 1, 5, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (12, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 1, 6, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (13, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 2, 7, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (14, 12, N'Eggs', N'images/products/Egg.jpg', CAST(229.00 AS Decimal(18, 2)), 1, 8, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (15, 7, N'Coco-Cola', N'images/products/cococola.jpg', CAST(95.00 AS Decimal(18, 2)), 1, 9, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (16, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 1, 10, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (17, 8, N'Catch Shikanji Masala', N'images/products/Catch.jpg', CAST(10.00 AS Decimal(18, 2)), 2, 11, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (18, 3, N'Tomato', N'images/products/Tomato.jpg', CAST(18.00 AS Decimal(18, 2)), 3, 11, CAST(17.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (19, 9, N'Lays- Potato Chips', N'images/products/Lays.jpg', CAST(20.00 AS Decimal(18, 2)), 2, 11, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (20, 2, N'Pomegranate', N'images/products/Pomegranate.jpg', CAST(160.00 AS Decimal(18, 2)), 2, 11, CAST(37.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (21, 10, N'Aloo Bhujia', N'images/products/Bicano.jpg', CAST(55.00 AS Decimal(18, 2)), 1, 12, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (22, 4, N'Amul - Fresh Toned Milk', N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), 1, 12, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (23, 5, N'Amul Butter', N'images/products/Butter.jpg', CAST(266.00 AS Decimal(18, 2)), 1, 12, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (24, 8, N'Catch Shikanji Masala', N'images/products/Catch.jpg', CAST(10.00 AS Decimal(18, 2)), 1, 12, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (25, 1, N'Banana', N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), 1, 12, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (26, 14, N'Toor-Dal', N'images/products/Dal.jpg', CAST(93.00 AS Decimal(18, 2)), 1, 13, CAST(11.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (27, 2, N'Pomegranate', N'images/products/Pomegranate.jpg', CAST(160.00 AS Decimal(18, 2)), 2, 14, CAST(37.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (28, 3, N'Tomato', N'images/products/Tomato.jpg', CAST(18.00 AS Decimal(18, 2)), 2, 14, CAST(17.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (29, 35, N'Biscuit', N'images/products/Biscuit.jpg', CAST(10.00 AS Decimal(18, 2)), 2, 15, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (30, 35, N'Biscuit', N'/images/products/Biscuit.jpg', CAST(10.00 AS Decimal(18, 2)), 13, 16, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (31, 36, N'Brown Bread', N'images/products/Bread.jpg', CAST(45.00 AS Decimal(18, 2)), 6, 17, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (32, 44, N'Fanta', N'/images/products/Fanta.jpg', CAST(30.00 AS Decimal(18, 2)), 1, 18, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (33, 3, N'Tomato', N'images/products/Tomato.jpg', CAST(18.00 AS Decimal(18, 2)), 1, 18, CAST(17.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (34, 1, N'Banana', N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), 1, 18, CAST(27.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (35, 13, N'Fish', N'images/products/Fish.jpg', CAST(539.00 AS Decimal(18, 2)), 2, 19, CAST(31.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (36, 14, N'Toor Dal', N'images/products/Dal.jpg', CAST(93.00 AS Decimal(18, 2)), 1, 19, CAST(11.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_ImageUrl], [Price], [Quantity], [OrderId], [Discount]) VALUES (37, 1, N'Banana', N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), 3, 19, CAST(27.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (1, N'ashigupta0529@gmail.com', CAST(N'2023-06-09T12:20:38.6775527' AS DateTime2), CAST(40.88 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (2, N'ashigupta0529@gmail.com', CAST(N'2023-06-09T12:54:50.1825083' AS DateTime2), CAST(40.88 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (3, N'yash@gmail.com', CAST(N'2023-06-09T15:10:18.3561658' AS DateTime2), CAST(891.72 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (4, N'yash@gmail.com', CAST(N'2023-06-09T15:10:58.7930492' AS DateTime2), CAST(292.68 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (5, N'yash@gmail.com', CAST(N'2023-06-09T15:16:09.1597660' AS DateTime2), CAST(52.80 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (6, N'yash@gmail.com', CAST(N'2023-06-09T15:16:57.7829875' AS DateTime2), CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (7, N'yash@gmail.com', CAST(N'2023-06-09T15:18:15.1487761' AS DateTime2), CAST(64.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (8, N'yash@gmail.com', CAST(N'2023-06-09T15:21:43.7737204' AS DateTime2), CAST(224.42 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (9, N'yash@gmail.com', CAST(N'2023-06-09T15:25:22.4280611' AS DateTime2), CAST(90.25 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (10, N'puneet@gmail.com', CAST(N'2023-06-09T15:52:11.0497319' AS DateTime2), CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (11, N'yash@gmail.com', CAST(N'2023-06-09T16:07:35.6068057' AS DateTime2), CAST(306.22 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (12, N'kriti@gmail.com', CAST(N'2023-06-09T18:00:13.7640406' AS DateTime2), CAST(396.26 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (13, N'yash@gmail.com', CAST(N'2023-06-10T07:54:02.9588470' AS DateTime2), CAST(82.77 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (14, N'kriti@gmail.com', CAST(N'2023-06-10T09:35:23.8322011' AS DateTime2), CAST(231.48 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (15, N'yash@gmail.com', CAST(N'2023-06-12T13:25:38.2398451' AS DateTime2), CAST(19.80 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (16, N'yash@gmail.com', CAST(N'2023-06-13T15:17:07.9942411' AS DateTime2), CAST(128.70 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (17, N'pranav@gmail.com', CAST(N'2023-06-13T15:18:20.8634668' AS DateTime2), CAST(264.60 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (18, N'yash@gmail.com', CAST(N'2023-06-18T09:36:00.4313451' AS DateTime2), CAST(85.82 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [Orderdate], [Total]) VALUES (19, N'kriti@gmail.com', CAST(N'2023-06-18T10:51:49.8697060' AS DateTime2), CAST(949.23 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (1, N'Fruits and Vegetables')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (2, N'Bakery, Cakes and Dairy')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (3, N'Beverages')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (4, N'Snacks')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (5, N'Eggs, Meat and Fish')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (6, N'Foodgrains, Oil and Masala')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (1, N'Banana', N'Relish the soft, buttery texture of Robusta bananas that are light green and have a great fragrance and taste. The stalks of Robustas are thick and rigid.', 1, 8, N'images/products/Banana.jpg', CAST(56.00 AS Decimal(18, 2)), CAST(27.00 AS Decimal(18, 2)), N'Quantity - 1 Dozen,Expiry - 3 Days')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (2, N'Pomegranate', N'With ruby color and an intense floral, sweet tart flavor, the pomegranate delivers both taste and beauty.', 1, 8, N'images/products/Pomegranate.jpg', CAST(150.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Weight - 1kg ,Expiry - 6 Days')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (3, N'Tomato', N'Local tomatoes are partly sour and partly sweet and contain many seeds inside which are edible. The red colour present in tomatoes is due to lycopene, an anti oxidant.', 1, 9, N'images/products/Tomato.jpg', CAST(18.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)), N'Weight - 1 kg,Expiry - 3 Days')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (4, N'Amul  Fresh Toned Milk', N'Amul Taaza fresh toned milk is an excellent quality milk from Gujarat. It can be consumed directly from the pack. No need to boil, it has virtually zero bacteria. No need to refrigerate till open.', 2, 10, N'images/products/Milk.jpg', CAST(32.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Weight - 1 Packet,Expiry - 2 Days')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (5, N'Amul Butter', N'Amul is synonymous with Butter in India.Several Generation of Indian consumers have grown up with the taste of Amul Butter for the six decades.', 2, 11, N'images/products/Butter.jpg', CAST(266.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'Weight - 500 g,Expiry - 2 months after opening.')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (8, N'Catch Shikanji Masala', N'Catch Shikanji masala is made from natural spring water. It is a truly refreshing way to beat the heat. Shikanji Shikanjavi is an Indian lemonade made with freshwater, lemon juice and simple spices. ', 3, 2, N'images/products/Catch.jpg', CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Quantity - 200 ml,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (9, N'Lays Potato Chips', N'When it comes to great taste, simplicity is key and Lays Classic Salted Potato Chips is here to prove it It all starts with the highest quality farm grown potatoes, cooked to crunchy perfection and sprinkled with microlite salt.', 4, 30, N'images/products/Lays.jpg', CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Weight - 40 g,Expiry - 2 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (11, N'Chicken Nuggets', N'Completely continental food and mostly used a snack, the finished result is delicious and crispy in texture. Its properly packed and frozen to ensure that it retains its taste and holds the crisp once fried.', 5, 3, N'images/products/Chicken.jpg', CAST(314.50 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'Weight - 500 g,Expiry - 2 Days')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (12, N'Eggs', N'Eggs are one of the common food items in most of the households. From breakfast to dinner, eggs are indulged in various ways. Poached, boiled, fried we all have our own favourite choices. ', 5, 6, N'images/products/Egg.jpg', CAST(229.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'Quantity - 30 pcs,Expiry - 1 Days ')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (13, N'Fish', N'Found in the muddy bottoms, this ubiquitously loved fish is full of flavour. Dont get fooled by the flattened appearance, the White Pomfret is rich in taste and has a soft flaky texture..', 5, 2, N'images/products/Fish.jpg', CAST(539.00 AS Decimal(18, 2)), CAST(31.00 AS Decimal(18, 2)), N'Weight - 250 g,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (14, N'Toor Dal', N'The 5 step process ensures that Tata Sampann grains are uniform and of premium quality, giving you an all natural, authentic taste.', 6, 3, N'images/products/Dal.jpg', CAST(93.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), N'Weight - 1 kg,Expiry - 6 months after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (15, N'Mustard Oil', N'Fortune Premium Kachi Ghani Pure Mustard Oil, traditionally extracted from the first press of mustard seeds, comes with a high pungency level and strong aroma.', 6, 0, N'images/products/oil.jpg', CAST(71.64 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)), N'Quantity- 500 ml,Expiry - 18 months after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (35, N'Biscuit', N'Hide seek biscuit are really delicious', 4, 7, N'images/products/Biscuit.jpg', CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (36, N'Brown Bread', N'Healthy n Natural daily bread', 2, 10, N'images/products/Bread.jpg', CAST(45.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'Quantity - 1 Packet,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (38, N'Cake', N'Delicious Britania cake.', 2, 4, N'images/products/cake.jpg', CAST(25.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Quantity- 50g')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (40, N'Coco Cola', N'Coca Cola is the most popular and biggest selling soft drink in history, as well as the best known brand in the world.', 3, 4, N'images/products/cococola.jpg', CAST(40.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Quantity - 1 l,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (43, N'Paneer', N'Fresh and delicious paneer', 2, 16, N'images/products/Paneer.jpg', CAST(125.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), N'Quantity- 500g')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (44, N'Fanta', N'get yourself refreshed', 3, 4, N'images/products/Fanta.jpg', CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Quantity- 1L')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (45, N'Aloo Bhujia', N'Bikaneri Aloo Bhujia Is Prepared From Potatoes And Special Spice, This Snack Has A Nice Highly Spiced Flavour. The Tastes Enormous With Any Food You Have. Carry A Small Suitable Pack To Your Office And Have Something To Munch On When Hungry.', 4, 7, N'images/products/Bicano.jpg', CAST(55.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'Weight - 200g ,Expiry - 3 Days after opening')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (48, N'ashi Gupta', N'dd', 3, 3, N'images/products/cake.jpg', CAST(454.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'efvg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductCategoryId], [Quantity], [ImageUrl], [Price], [Discount], [ProductSpecification]) VALUES (51, N'ashi Gupta', N'rg', 4, 3, N'images/products/cococola.jpg', CAST(354.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [UserEmail], [ProductId], [Description], [DatePosted]) VALUES (3, N'puneet@gmail.com', 1, N'fresh', CAST(N'2023-06-18T09:30:40.7821867' AS DateTime2))
INSERT [dbo].[Reviews] ([Id], [UserEmail], [ProductId], [Description], [DatePosted]) VALUES (5, N'yash@gmail.com', 3, N'farm fresh.', CAST(N'2023-06-18T09:35:11.6592090' AS DateTime2))
INSERT [dbo].[Reviews] ([Id], [UserEmail], [ProductId], [Description], [DatePosted]) VALUES (6, N'kriti@gmail.com', 13, N'Fresh and Juicy.', CAST(N'2023-06-18T10:51:41.5881586' AS DateTime2))
INSERT [dbo].[Reviews] ([Id], [UserEmail], [ProductId], [Description], [DatePosted]) VALUES (7, N'pranav@gmail.com', 45, N'very tasty and crispy.', CAST(N'2023-06-18T10:58:51.0698338' AS DateTime2))
INSERT [dbo].[Reviews] ([Id], [UserEmail], [ProductId], [Description], [DatePosted]) VALUES (8, N'yash@gmail.com', 45, N'yummy', CAST(N'2023-06-18T11:12:52.6654091' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 19-06-2023 11:50:43 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductCategoryId]    Script Date: 19-06-2023 11:50:43 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductCategoryId] ON [dbo].[Products]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_ProductId]    Script Date: 19-06-2023 11:50:43 ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_ProductId] ON [dbo].[Reviews]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_products_discount]  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories_ProductCategoryId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [ProductStore2] SET  READ_WRITE 
GO
