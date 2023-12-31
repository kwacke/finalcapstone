USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END
/****** Object:  Database [final_capstone]    Script Date: 12/14/2023 8:30:27 PM ******/
CREATE DATABASE [final_capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'final_capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'final_capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [final_capstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final_capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [final_capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [final_capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [final_capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [final_capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [final_capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [final_capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [final_capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [final_capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [final_capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [final_capstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [final_capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [final_capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [final_capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [final_capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [final_capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [final_capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [final_capstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [final_capstone] SET  MULTI_USER 
GO
ALTER DATABASE [final_capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [final_capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [final_capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [final_capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [final_capstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [final_capstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [final_capstone] SET QUERY_STORE = OFF
GO
USE [final_capstone]
GO
/****** Object:  Table [dbo].[allergens]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[allergens](
	[allergen_id] [int] IDENTITY(301,1) NOT NULL,
	[allergen_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_allergens] PRIMARY KEY CLUSTERED 
(
	[allergen_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diet_ingredient]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diet_ingredient](
	[diet_name] [nvarchar](30) NOT NULL,
	[ingredient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diet_name] ASC,
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diets]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diets](
	[diet_id] [int] IDENTITY(601,1) NOT NULL,
	[diet_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diet_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_allergies]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_allergies](
	[dish_id] [int] NOT NULL,
	[allergen_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[allergen_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_diet]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_diet](
	[dish_id] [int] NOT NULL,
	[diet_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[diet_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_rating]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_rating](
	[dish_id] [int] NOT NULL,
	[rater] [int] NOT NULL,
	[rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[rater] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dishes]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dishes](
	[dish_id] [int] IDENTITY(1501,1) NOT NULL,
	[creator] [nvarchar](30) NOT NULL,
	[dish_name] [nvarchar](50) NOT NULL,
	[recipe] [nvarchar](max) NOT NULL,
	[rating] [numeric](2, 1) NULL,
	[course_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friends_list]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friends_list](
	[self_id] [int] NOT NULL,
	[friend_id] [int] NOT NULL,
	[friend_start] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[self_id] ASC,
	[friend_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredient_dish]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredient_dish](
	[ingredient_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[quantity] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[ingredient_id] [int] IDENTITY(201,1) NOT NULL,
	[ingredient_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invitations]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invitations](
	[potluck_id] [int] NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[status] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_course]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_course](
	[potluck_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[how_many] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_diet]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_diet](
	[potluck_id] [int] NOT NULL,
	[diet_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[diet_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_dish]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_dish](
	[potluck_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_user]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_user](
	[potluck_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potlucks]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potlucks](
	[potluck_id] [int] IDENTITY(1001,1) NOT NULL,
	[host_id] [int] NOT NULL,
	[potluck_name] [nvarchar](100) NOT NULL,
	[summary] [nvarchar](max) NULL,
	[location] [nvarchar](100) NOT NULL,
	[time] [datetime] NOT NULL,
	[theme] [nvarchar](100) NULL,
	[is_recurring] [bit] NULL,
	[repeat_interval] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recovery_questions]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recovery_questions](
	[question_id] [int] IDENTITY(701,1) NOT NULL,
	[question_text] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles](
	[title_id] [int] IDENTITY(401,1) NOT NULL,
	[title_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_allergies]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_allergies](
	[user_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_diet]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_diet](
	[user_id] [int] NOT NULL,
	[diet_name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[diet_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_dish]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_dish](
	[user_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_recovery]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_recovery](
	[user_id] [int] NULL,
	[question_id] [int] NULL,
	[answer] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_title]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_title](
	[user_id] [int] NOT NULL,
	[title_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/14/2023 8:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NOT NULL,
	[password_hash] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](50) NOT NULL,
	[user_role] [nvarchar](20) NOT NULL,
	[user_summary] [nvarchar](max) NULL,
	[diet_rest] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[allergens] ON 

INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (304, N'eggs')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (301, N'fish')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (303, N'milk')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (308, N'peanuts')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (306, N'sesame')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (302, N'shellfish')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (305, N'soy')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (307, N'treenuts')
INSERT [dbo].[allergens] ([allergen_id], [allergen_name]) VALUES (309, N'wheat')
SET IDENTITY_INSERT [dbo].[allergens] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (1, N'apps')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (2, N'main')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (3, N'side')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (4, N'dessert')
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[diets] ON 

INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (604, N'celiac friendly')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (605, N'dairy-free')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (603, N'halal')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (606, N'kosher')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (601, N'vegan')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (602, N'vegetarian')
SET IDENTITY_INSERT [dbo].[diets] OFF
GO
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1519, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1521, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1521, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1521, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Eggs')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Peanuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Sesame')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Soy')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Treenuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1522, N'Wheat')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Eggs')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Peanuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Sesame')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Soy')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Treenuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1523, N'Wheat')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1525, N'Eggs')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1525, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1525, N'Sesame')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1525, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1525, N'Treenuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Eggs')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Sesame')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1526, N'Treenuts')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Eggs')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Fish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Milk')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Sesame')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Shellfish')
INSERT [dbo].[dish_allergies] ([dish_id], [allergen_name]) VALUES (1527, N'Treenuts')
GO
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1512, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1512, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1513, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1513, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1514, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1514, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1515, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1515, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1516, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1516, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1516, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1517, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1517, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1517, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1518, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1518, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1518, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1519, N'Celiac Friendly')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1519, N'Dairy-Free')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1519, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1519, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1519, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Celiac Friendly')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Dairy-Free')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Kosher')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1520, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Celiac Friendly')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Dairy-Free')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Kosher')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1524, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1525, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1525, N'Kosher')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1525, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1525, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1526, N'Celiac Friendly')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1526, N'Dairy-Free')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1526, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1526, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1526, N'Vegetarian')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1527, N'Celiac Friendly')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1527, N'Dairy-Free')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1527, N'Halal')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1527, N'Vegan')
INSERT [dbo].[dish_diet] ([dish_id], [diet_name]) VALUES (1527, N'Vegetarian')
GO
SET IDENTITY_INSERT [dbo].[dishes] ON 

INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1504, N'', N'Matt''s Lunch', N'Rotini, Red Sauce, Chicken, Broccoli', CAST(3.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1505, N'', N'Matt''s Dinner', N'3 eggs, 4 egg whites, 2 english muffins, salsa, apple', CAST(3.5 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1506, N'', N'Matt''s Breakfast', N'80 grams of quick oats, 1 scoop of whey protein, 15g walnuts, 1 banana', CAST(4.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1507, N'', N'Matt''s Midnight Snack', N'Pint of Ben & Jerry''s', CAST(5.0 AS Numeric(2, 1)), 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1508, N'', N'Ted''s Chili', N'Idk ask his wife', CAST(5.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1509, N'', N'Ted''s Soup', N'Idk ask him', CAST(5.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1510, N'', N'Aseel''s Tiramisu Cheesecake', N'...ask him', CAST(5.0 AS Numeric(2, 1)), 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1511, N'', N'This is an Appetizer', N'who cares', CAST(3.0 AS Numeric(2, 1)), 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1512, N'mott', N'newest dessert', N'Hey look I have a dessert', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1513, N'mott', N'newest dessert', N'Hey look I have a dessert', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1514, N'mott', N'newest dessert', N'Hey look I have a dessert', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1515, N'mott', N'newest desserter', N'Hey look I have a dessert', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1516, N'mott', N'A new appetizer', N'here are the instructions', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1517, N'mott', N'A new appetizer', N'here are the instructions', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1518, N'mott', N'A new appetizer', N'here are the instructions', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1519, N'mott', N'A new appetizer', N'here are the instructions', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1520, N'mott', N'A new appetizer', N'here are the instructions', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1521, N'mott', N'new dish testing allergens', N'asgasf', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1522, N'mott', N'new dish testing allergens', N'asgasf', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1523, N'mott', N'new dish testing allergens', N'asgasf', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1524, N'mott', N'asdfadf', N'asdfasdfasdf', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1525, N'mott', N'asdfasdf', N'asdfdsafasdf', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1526, N'mott', N'asdfasd', N'fasdfasdfasdf', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1527, N'mott', N'asdfasd', N'fasdfasdfasdf', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1528, N'matt', N'Cabbage Soup (Shchi)', N'1 large Onion
1 medium Cabbage
1 Carrots
1 Celery
1 Bay Leaf
8 cups  Vegetable Stock
2 large Potatoes
2 large Tomatoes
Garnish Sour Cream
Garnish Dill


Add the butter to a large Dutch oven or other heavy-duty pot over medium heat. When the butter has melted, add the onion and sauté until translucent.
Add the cabbage, carrot, and celery. Sauté until the vegetables begin to soften, stirring frequently, about 3 minutes.
Add the bay leaf and vegetable stock and bring to a boil over high heat. Reduce the heat to low and simmer, covered, until the vegetables are crisp-tender, about 15 minutes.
Add the potatoes and bring it back to a boil over high heat. Reduce the heat to low and simmer, covered, until the potatoes are tender, about 10 minutes.
Add the tomatoes (or undrained canned tomatoes) and bring the soup back to a boil over high heat. Reduce the heat to low and simmer, uncovered, for 5 minutes. Season to taste with salt and pepper.
emove and discard the bay leaf from the pot.
Serve topped with fresh sour cream and fresh dill.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1529, N'matt', N'Smoky Lentil Chili with Squash', N'1 Onion
1 chopped Leek
3 cloves Garlic
4 tsp ground  Cumin
2 tsp ground Coriander
1 tsp Smoked Paprika
1/2 tsp Cinnamon
1 tsp Chili Powder
1 tsp Cocoa
1/2 tsp Dried Oregano
1 can Diced Tomatoes
3 cups Water
3 chopped Carrots
1 1/2 cups Brown Lentils
1 tsp Sea Salt
1 Small Squash
1 Cup Cashews
1 tsp Apple Cider Vinegar


Begin by roasting the squash. Slice it into thin crescents and drizzle with a little oil and sprinkle with sea salt. I added a fresh little sage I had in the fridge, but it’s unnecessary. Roast the squash a 205 C (400 F) for 20-30 minutes, flipping halfway through, until soft and golden. Let cool and chop into cubes.
Meanwhile, rinse the lentils and cover them with water. Bring them to the boil then turn down to a simmer and let cook (uncovered) for 20-30 minutes, or until tender. Drain and set aside.
While the lentils are cooking heat the 1 Tbsp. of oil on low in a medium pot. Add the onions and leeks and sauté for 5 or so minutes, or until they begin to soften. Add the garlic next along with the cumin and coriander, cooking for a few more minutes. Add the remaining spices – paprika, cinnamon, chilli, cocoa, Worcestershire sauce, salt, and oregano. Next add the can of tomatoes, the water or stock, and carrots. Let simmer, covered, for 20 minutes or until the veg is tender and the mixture has thickened up. You’ll need to check on the pot periodically for a stir and a top of of liquid if needed.
Add the lentils and chopped roasted squash. Let cook for 10 more minutes to heat through.
Serve with sliced jalapeno, lime wedges, cilantro, green onions, and cashew sour cream.

SIMPLE CASHEW SOUR CREAM

1 Cup Raw Unsalted Cashews
Pinch Sea Salt
1 tsp. Apple Cider Vinegar
Water

Bring some water to the boil, and use it to soak the cashews for at least four hours. Alternatively, you can use cold water and let the cashews soak overnight, but I’m forgetful/lazy, so often use the boil method which is much faster.
After the cashews have soaked, drain them and add to a high speed blender. Begin to puree, slowly adding about 1/2 cup fresh water, until a creamy consistency is reached. You may need to add less or more water to reach the desired consistency.
Add a pinch of sea salt and vinegar (or lemon juice).', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1532, N'matt', N'Tahini Lentils', N'zest and juice of 1 Lemon
2 tblsp  Olive Oil
1 chopped Red Onions
1 clove peeled crushed Garlic
1 thinly sliced Yellow Pepper
200g Green Beans
1 sliced Courgettes
100g shredded Kale
250g pack Lentils


In a jug, mix the tahini with the zest and juice of the lemon and 50ml of cold water to make a runny dressing. Season to taste, then set aside.
Heat the oil in a wok or large frying pan over a medium-high heat. Add the red onion, along with a pinch of salt, and fry for 2 mins until starting to soften and colour. Add the garlic, pepper, green beans and courgette and fry for 5 min, stirring frequently.
Tip in the kale, lentils and the tahini dressing. Keep the pan on the heat for a couple of mins, stirring everything together until the kale is wilted and it’s all coated in the creamy dressing.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1533, N'matt', N'Boulangère Potatoes', N'sprigs of fresh Thyme
2 tbs Olive Oil
1.5kg Potatoes
425g Vegetable Stock


Heat oven to 200C/fan 180C/gas 6. Fry the onions and thyme sprigs in the oil until softened and lightly coloured (about 5 mins).
Spread a layer of potatoes over the base of a 1.5-litre oiled gratin dish. Sprinkle over a few onions (see picture, above) and continue layering, finishing with a layer of potatoes. Pour over the stock and bake for 50-60 mins until the potatoes are cooked and the top is golden and crisp.', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1534, N'matt', N'Three-cheese souffles', N'25g Parmesan
300ml  Milk
2 Bay Leaves
5 tbs Plain Flour
½ tsp English Mustard
Pod of Cayenne Pepper
140g Gruyère
3 Eggs
8 slices Goats Cheese
150ml Double Cream
to serve Spinach


Heat oven to 200C/180C fan/ gas 6 and butter 4 small (about 200ml) ramekins. Sprinkle the Parmesan into the ramekins, turning until all sides are covered. Place the milk and bay leaves in a large saucepan over a gentle heat and bring to the boil. Turn off the heat and leave to infuse for 15 mins.
Discard the bay leaves, add the butter and flour, and return to a low heat. Very gently simmer, stirring continuously with a balloon whisk, for about 6 mins until you get a smooth, thick white sauce. Make sure that you get right into the corners of the pan to stop the sauce from catching or becoming lumpy.
Once thickened, transfer the sauce to a large bowl and stir in the mustard powder, cayenne pepper, Gruyère and egg yolks until fully combined.
In a spotlessly clean bowl and with a clean whisk, beat the egg whites just until peaks begin to form.
Carefully fold the egg whites into the cheese sauce in three stages making sure you fold, rather than stir, to keep the egg whites light and airy. Fill the prepared ramekins with the soufflé mix.
Top each soufflé with a slice of goat’s cheese, then place on a baking tray. Bake for 20-25 mins or until springy and well risen but cooked through.
Leave to cool, then run a knife around the edge of each dish and remove the soufflés. If preparing in advance, place soufflés upside down (for neat presentation), on a tray. Cover tray in cling film. Chill for a few days or freeze for up to 1 month.
When ready to re-bake, heat oven to 200C/180C fan/gas 6. Place the upside-down soufflés in a shallow baking dish, top with the remaining goat’s cheese slices and pour over the cream (this stops them from drying out when baked for the second time). Cook for 8-10 mins until golden. Serve immediately alongside some simply dressed salad.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1535, N'matt', N'Burek', N'150g Minced Beef
150g Onion
40g Oil
Dash Salt
Dash Pepper


Fry the finely chopped onions and minced meat in oil. Add the salt and pepper. Grease a round baking tray and put a layer of pastry in it. Cover with a thin layer of filling and cover this with another layer of filo pastry which must be well coated in oil. Put another layer of filling and cover with pastry. When you have five or six layers, cover with filo pastry, bake at 200ºC/392ºF for half an hour and cut in quarters and serve.', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1536, N'matt', N'French Onion Soup', N'1 tbs Olive Oil
1 kg Onion
1 tsp  Sugar
4 sliced Garlic Clove
2 tbs Plain Flour
250ml Dry White Wine
1L Beef Stock
4 sliced Bread
140g Gruyère


Melt the butter with the oil in a large heavy-based pan. Add the onions and fry with the lid on for 10 mins until soft. Sprinkle in the sugar and cook for 20 mins more, stirring frequently, until caramelised. The onions should be really golden, full of flavour and soft when pinched between your fingers. Take care towards the end to ensure that they don’t burn.
Add the garlic for the final few mins of the onions’ cooking time, then sprinkle in the flour and stir well. Increase the heat and keep stirring as you gradually add the wine, followed by the hot stock. Cover and simmer for 15-20 mins.
To serve, turn on the grill, and toast the bread. Ladle the soup into heatproof bowls. Put a slice or two of toast on top of the bowls of soup, and pile on the cheese. Grill until melted. Alternatively, you can complete the toasts under the grill, then serve them on top.', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1537, N'matt', N'Sticky Toffee Pudding', N'175g Muscovado Sugar
2 large Eggs
225g Self-raising Flour
1 tsp  Baking Powder
1 tsp  Bicarbonate Of Soda
3 tbs Black Treacle
275ml Milk
to serve Double Cream
100g  Butter
125g Muscovado Sugar
1 tbs Black Treacle
300ml  Double Cream
1 tsp  Vanilla Extract


Preheat the oven to 180C/160C Fan/Gas 4. Butter a wide shallow 1.7-litre/3-pint ovenproof dish.
Put the butter, sugar, eggs, flour, baking powder, bicarbonate of soda and treacle into a mixing bowl. Beat using an electric handheld whisk for about 30 seconds or until combined. Pour in the milk gradually and whisk again until smooth. Pour into the prepared dish. Bake for 35–40 minutes or until well risen and springy in the centre.
To make the sauce, put all the ingredients into a saucepan and stir over a low heat until the sugar has dissolved and the butter has melted. Bring to the boil, stirring for a minute.
To serve, pour half the sauce over the pudding in the baking dish. Serve with the cream or ice cream.', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1538, N'matt', N'Poutine', N'1 Can Beef Gravy
5 thin cut Potatoes
2 cups Cheese Curds


Heat oil in a deep fryer or deep heavy skillet to 365°F (185°C).
Warm gravy in saucepan or microwave.
Place the fries into the hot oil, and cook until light brown, about 5 minutes.
Remove to a paper towel lined plate to drain.
Place the fries on a serving platter, and sprinkle the cheese over them.
Ladle gravy over the fries and cheese, and serve immediately.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1539, N'matt', N'Chakchouka ', N'2 tbs Olive Oil
1 Diced Onion
1 sliced Red Pepper
1 sliced Green Pepper
3 Cloves Crushed Garlic
1 tsp  Cumin
1 tsp  Paprika
3/4 teaspoon Salt
1/2 teaspoon Chili Powder
4 Eggs


In a large cast iron skillet or sauté pan with a lid, heat oil over medium high heat. Add the onion and sauté for 2-3 minutes, until softened. Add the peppers and garlic, and sauté for an additional 3-5 minutes. Add the tomatoes, cumin, paprika, salt, and chili powder. Mix well and bring the mixture to a simmer. Reduce the heat to medium low and continue to simmer, uncovered, 10-15 minutes until the mixture has thickened to your desired consistency. (Taste the sauce at this point and adjust for salt and spice, as desired.) Using the back of a spoon, make four craters in the mixture, large enough to hold an egg. Crack one egg into each of the craters. Cover the skillet and simmer for 5-7 minutes, until the eggs have set. Serve immediately with crusty bread or pita.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1540, N'matt', N'Blackberry Fool', N'125g Butter
150g Caster Sugar
Grated Lemon
150g Plain Flour
½ tsp Baking Powder
600g Blackberrys
75g Sugar
2 tbs Caster Sugar
1 tbs Lemon Juice
300ml  Double Cream
100ml Yogurt
Garnish with Mint


For the biscuits, preheat the oven to 200C/180C (fan)/Gas 6 and line two large baking trays with baking parchment. Scatter the nuts over a baking tray and roast in the oven for 6-8 minutes, or until golden-brown. Watch them carefully so that they don’t have a chance to burn. Remove from the oven, tip onto a board and leave to cool.
Put the butter and sugar in a large bowl and beat with a wooden spoon until light and creamy. Roughly chop the cooled nuts and add to the creamed butter and sugar, along with the lemon zest, flour and baking powder. Stir well until the mixture comes together and forms a ball – you may need to use your hands.
Divide the biscuit dough into 24 even pieces and roll into small balls. Place the balls the prepared baking trays, spaced well apart to allow for spreading.
Press the biscuits to flatten to around 1cm/½in thick. Bake the biscuits, one tray at a time, for 12 minutes or until very pale golden-brown. Leave to cool on the trays. They will be very soft when you take them out of the oven, but will crisp as they cool.
Store in an airtight tin and eat within five days.
For the fool, rinse the blackberries in a colander to wash away any dust or dirt. Put the blackberries in a non-stick saucepan and sprinkle over the caster sugar.
Stir in the lemon juice and heat gently for two minutes, or until the blackberries begin to soften and release their juices. Remove and reserve 12 blackberries for decoration and continue cooking the rest.
Simmer the blackberries very gently for 15 minutes, stirring regularly until very soft and squidgy. Remove from the heat and press the berries and juice through a sieve over a bowl, using the bottom of a ladle to help you extract as much of the purée as possible. Leave the purée to cool and discard the seeds. You should end up with around 325ml/11fl oz of purée.
Put the cream and yoghurt in a large bowl and whip with an electric whisk until soft peaks form when the whisk is removed from the bowl – the acidity of the fruit will thicken the cream further, so don’t take it too far.
When the purée is completely cold, adjust the sweetness to taste by adding more sugar if needed. Pour it into the bowl with the whipped cream and yoghurt and stir just once or twice until very lightly combined.
Spoon the blackberry fool into individual wide, glass dishes – or one large, single bowl. It should look quite marbled, so don’t over-stir it. Scatter a few tiny mint leaves on top and decorate with the reserved blackberries. Sprinkle with a little sugar if you like and serve with the hazelnut biscuits.', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1541, N'matt', N'Home-made Mandazi', N'6 tablespoons Sugar
2 Eggs
1 cup  Milk


This is one recipe a lot of people have requested and I have tried to make it as simple as possible and I hope it will work for you. Make sure you use the right flour which is basically one with raising agents. Adjust the amount of sugar to your taste and try using different flavours to have variety whenever you have them.
You can use Coconut milk instead of regular milk, you can also add desiccated coconut to the dry flour or other spices like powdered cloves or cinnamon.
For “healthy looking” mandazis do not roll the dough too thin before frying and use the procedure I have indicated above.

1. Mix the flour,cinnamon and sugar in a suitable bowl.
2. In a separate bowl whisk the egg into the milk
3. Make a well at the centre of the flour and add the milk and egg mixture and slowly mix to form a dough.
4. Knead the dough for 3-4 minutes or until it stops sticking to the sides of the bowl and you have a smooth surface.
5. Cover the dough with a damp cloth  and allow to rest for 15 minutes.
6. Roll the dough on a lightly floured surface into a 1cm thick piece.
7. Using a sharp small knife, cut the dough into the desired size setting aside ready for deep frying.
8. Heat your oil in a suitable pot and gently dip the mandazi pieces to cook until light brown on the first side then turn to cook on the second side.
9. Serve them warm or cold', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1542, N'matt', N'Breakfast Potatoes', N'1 tbs Olive Oil
2 strips Bacon
Minced Garlic Clove
1 tbs Maple Syrup
Garnish Parsley
Pinch Salt
Pinch Pepper
To taste Allspice


Before you do anything, freeze your bacon slices that way when you''re ready to prep, it''ll be so much easier to chop!
Wash the potatoes and cut medium dice into square pieces. To prevent any browning, place the already cut potatoes in a bowl filled with water.
In the meantime, heat 1-2 tablespoons of oil in a large skillet over medium-high heat. Tilt the skillet so the oil spreads evenly.
Once the oil is hot, drain the potatoes and add to the skillet. Season with salt, pepper, and Old Bay as needed.
Cook for 10 minutes, stirring the potatoes often, until brown. If needed, add a tablespoon more of oil.
Chop up the bacon and add to the potatoes. The bacon will start to render and the fat will begin to further cook the potatoes. Toss it up a bit! The bacon will take 5-6 minutes to crisp.
Once the bacon is cooked, reduce the heat to medium-low, add the minced garlic and toss. Season once more. Add dried or fresh parsley. Control heat as needed.
Let the garlic cook until fragrant, about one minute.
Just before serving, drizzle over the maple syrup and toss. Let that cook another minute, giving the potatoes a caramelized effect.
Serve in a warm bowl with a sunny side up egg!', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1543, N'matt', N'Rocky Road Fudge', N'3 cups Chocolate Chips
½ cup Peanut Butter
1 tsp Vanilla Extract
1 ¼ cups Peanuts


Line an 8-inch-square baking pan with wax paper or foil, and coat with non-stick spray.
Pour ½ cup of the miniature marshmallows into the bottom of the lined baking dish.
In a microwave-safe bowl, combine the chocolate chips and peanut butter. Microwave the chocolate mixture in 20-second intervals, stirring in between each interval, until the chocolate is melted.
Add the vanilla extract and stir well, until smooth.
Reserve 2 tablespoons of the chopped almonds or peanuts, and set aside.
Fold 1 ½ cups of the miniature marshmallows and the remaining chopped nuts into the chocolate mixture.
Transfer the chocolate mixture into the prepared pan and spread into an even layer. Immediately top with the reserved chopped nuts and the mallow bits or additional miniature marshmallows, if using.
Refrigerate for 4 hours, or until set.
Remove the fudge and wax paper from the pan. Carefully peel all of wax paper from the fudge.
Cut the fudge into bite-sized pieces and serve.', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1544, N'matt', N'Yaki Udon', N'2 tbs Sesame Seed Oil
1 sliced Onion
0.25 Cabbage
10 Shiitake Mushrooms
4 Spring Onions
4 tbsp Mirin
2 tbs Soy Sauce
1 tblsp  Caster Sugar
1 tblsp  Worcestershire Sauce


Boil some water in a large saucepan. Add 250ml cold water and the udon noodles. (As they are so thick, adding cold water helps them to cook a little bit slower so the middle cooks through). If using frozen or fresh noodles, cook for 2 mins or until al dente; dried will take longer, about 5-6 mins. Drain and leave in the colander.
Heat 1 tbsp of the oil, add the onion and cabbage and sauté for 5 mins until softened. Add the mushrooms and some spring onions, and sauté for 1 more min. Pour in the remaining sesame oil and the noodles. If using cold noodles, let them heat through before adding the ingredients for the sauce – otherwise tip in straight away and keep stir-frying until sticky and piping hot. Sprinkle with the remaining spring onions.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1545, N'matt', N'Home-made Mandazi', N'6 tablespoons Sugar
2 Eggs
1 cup  Milk


This is one recipe a lot of people have requested and I have tried to make it as simple as possible and I hope it will work for you. Make sure you use the right flour which is basically one with raising agents. Adjust the amount of sugar to your taste and try using different flavours to have variety whenever you have them.
You can use Coconut milk instead of regular milk, you can also add desiccated coconut to the dry flour or other spices like powdered cloves or cinnamon.
For “healthy looking” mandazis do not roll the dough too thin before frying and use the procedure I have indicated above.

1. Mix the flour,cinnamon and sugar in a suitable bowl.
2. In a separate bowl whisk the egg into the milk
3. Make a well at the centre of the flour and add the milk and egg mixture and slowly mix to form a dough.
4. Knead the dough for 3-4 minutes or until it stops sticking to the sides of the bowl and you have a smooth surface.
5. Cover the dough with a damp cloth  and allow to rest for 15 minutes.
6. Roll the dough on a lightly floured surface into a 1cm thick piece.
7. Using a sharp small knife, cut the dough into the desired size setting aside ready for deep frying.
8. Heat your oil in a suitable pot and gently dip the mandazi pieces to cook until light brown on the first side then turn to cook on the second side.
9. Serve them warm or cold', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1546, N'matt', N'Ratatouille', N'4 Courgettes
2 Yellow Pepper
4 large Tomato
5 tbs Olive Oil
Bunch Basil
1 medium Onion
3 finely chopped Garlic Clove
1 tsp  Red Wine Vinegar
1 tsp  Sugar


Cut the aubergines in half lengthways. Place them on the board, cut side down, slice in half lengthways again and then across into 1.5cm chunks. Cut off the courgettes ends, then across into 1.5cm slices. Peel the peppers from stalk to bottom. Hold upright, cut around the stalk, then cut into 3 pieces. Cut away any membrane, then chop into bite-size chunks.
Score a small cross on the base of each tomato, then put them into a heatproof bowl. Pour boiling water over the tomatoes, leave for 20 secs, then remove. Pour the water away, replace the tomatoes and cover with cold water. Leave to cool, then peel the skin away. Quarter the tomatoes, scrape away the seeds with a spoon, then roughly chop the flesh.
Set a sauté pan over medium heat and when hot, pour in 2 tbsp olive oil. Brown the aubergines for 5 mins on each side until the pieces are soft. Set them aside and fry the courgettes in another tbsp oil for 5 mins, until golden on both sides. Repeat with the peppers. Don’t overcook the vegetables at this stage, as they have some more cooking left in the next step.
Tear up the basil leaves and set aside. Cook the onion in the pan for 5 mins. Add the garlic and fry for a further min. Stir in the vinegar and sugar, then tip in the tomatoes and half the basil. Return the vegetables to the pan with some salt and pepper and cook for 5 mins. Serve with basil.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1547, N'matt', N'Chocolate Caramel Crispy', N'150g Butter
120g Rice Krispies
150g Milk Chocolate


Grease and line a 20 x 20cm/8" x 8" baking tin with parchment paper.
Put the mars bars and butter in a heat proof bowl and place over a pan of barely simmering water. Mixing with a whisk, melt until the mixture is smooth.
Pour over the rice krispies in a mixing bowl and mix until all the ingredients are evenly combined. Press evenly into the prepare baking tin and set aside.
Melt the milk chocolate in the microwave or over a pan of barely simmering water.
Spread the melted chocolate over the rice krispie mixture and leave to set in a cool place. Once set slice into squares and serve!', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1548, N'matt', N'Three-cheese souffles', N'25g Parmesan
300ml  Milk
2 Bay Leaves
5 tbs Plain Flour
½ tsp English Mustard
Pod of Cayenne Pepper
140g Gruyère
3 Eggs
8 slices Goats Cheese
150ml Double Cream
to serve Spinach


Heat oven to 200C/180C fan/ gas 6 and butter 4 small (about 200ml) ramekins. Sprinkle the Parmesan into the ramekins, turning until all sides are covered. Place the milk and bay leaves in a large saucepan over a gentle heat and bring to the boil. Turn off the heat and leave to infuse for 15 mins.
Discard the bay leaves, add the butter and flour, and return to a low heat. Very gently simmer, stirring continuously with a balloon whisk, for about 6 mins until you get a smooth, thick white sauce. Make sure that you get right into the corners of the pan to stop the sauce from catching or becoming lumpy.
Once thickened, transfer the sauce to a large bowl and stir in the mustard powder, cayenne pepper, Gruyère and egg yolks until fully combined.
In a spotlessly clean bowl and with a clean whisk, beat the egg whites just until peaks begin to form.
Carefully fold the egg whites into the cheese sauce in three stages making sure you fold, rather than stir, to keep the egg whites light and airy. Fill the prepared ramekins with the soufflé mix.
Top each soufflé with a slice of goat’s cheese, then place on a baking tray. Bake for 20-25 mins or until springy and well risen but cooked through.
Leave to cool, then run a knife around the edge of each dish and remove the soufflés. If preparing in advance, place soufflés upside down (for neat presentation), on a tray. Cover tray in cling film. Chill for a few days or freeze for up to 1 month.
When ready to re-bake, heat oven to 200C/180C fan/gas 6. Place the upside-down soufflés in a shallow baking dish, top with the remaining goat’s cheese slices and pour over the cream (this stops them from drying out when baked for the second time). Cook for 8-10 mins until golden. Serve immediately alongside some simply dressed salad.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1549, N'matt', N'Bread omelette', N'2 Egg
0.5 Salt


Make and enjoy', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1550, N'matt', N'Spinach & Ricotta Cannelloni', N'8 cloves chopped Garlic
3 tbsp Caster Sugar
2 tblsp  Red Wine Vinegar
3 400g Cans Chopped Tomatoes
Bunch Basil Leaves
2 tubs Mascarpone
3 tbsp Milk
85g Parmesan
2 sliced Mozzarella
1kg Spinach
100g  Parmesan
3 tubs Ricotta
pinch Nutmeg
400g Cannellini Beans


First make the tomato sauce. Heat the oil in a large pan and fry the garlic for 1 min. Add the sugar, vinegar, tomatoes and some seasoning and simmer for 20 mins, stirring occasionally, until thick. Add the basil and divide the sauce between 2 or more shallow ovenproof dishes (see Tips for freezing, below). Set aside. Make a sauce by beating the mascarpone with the milk until smooth, season, then set aside.

Put the spinach in a large colander and pour over a kettle of boiling water to wilt it (you may need to do this in batches). When cool enough to handle squeeze out the excess water. Roughly chop the spinach and mix in a large bowl with 100g Parmesan and ricotta. Season well with salt, pepper and the nutmeg.

Heat oven to 200C/180C fan/gas 6. Using a piping bag or plastic food bag with the corner snipped off, squeeze the filling into the cannelloni tubes. Lay the tubes, side by side, on top of the tomato sauce and spoon over the mascarpone sauce. Top with Parmesan and mozzarella. You can now freeze the cannelloni, uncooked, or you can cook it first and then freeze. Bake for 30-35 mins until golden and bubbling. Remove from oven and let stand for 5 mins before serving.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1551, N'matt', N'Home-made Mandazi', N'6 tablespoons Sugar
2 Eggs
1 cup  Milk


This is one recipe a lot of people have requested and I have tried to make it as simple as possible and I hope it will work for you. Make sure you use the right flour which is basically one with raising agents. Adjust the amount of sugar to your taste and try using different flavours to have variety whenever you have them.
You can use Coconut milk instead of regular milk, you can also add desiccated coconut to the dry flour or other spices like powdered cloves or cinnamon.
For “healthy looking” mandazis do not roll the dough too thin before frying and use the procedure I have indicated above.

1. Mix the flour,cinnamon and sugar in a suitable bowl.
2. In a separate bowl whisk the egg into the milk
3. Make a well at the centre of the flour and add the milk and egg mixture and slowly mix to form a dough.
4. Knead the dough for 3-4 minutes or until it stops sticking to the sides of the bowl and you have a smooth surface.
5. Cover the dough with a damp cloth  and allow to rest for 15 minutes.
6. Roll the dough on a lightly floured surface into a 1cm thick piece.
7. Using a sharp small knife, cut the dough into the desired size setting aside ready for deep frying.
8. Heat your oil in a suitable pot and gently dip the mandazi pieces to cook until light brown on the first side then turn to cook on the second side.
9. Serve them warm or cold', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1552, N'matt', N'Ratatouille', N'4 Courgettes
2 Yellow Pepper
4 large Tomato
5 tbs Olive Oil
Bunch Basil
1 medium Onion
3 finely chopped Garlic Clove
1 tsp  Red Wine Vinegar
1 tsp  Sugar


Cut the aubergines in half lengthways. Place them on the board, cut side down, slice in half lengthways again and then across into 1.5cm chunks. Cut off the courgettes ends, then across into 1.5cm slices. Peel the peppers from stalk to bottom. Hold upright, cut around the stalk, then cut into 3 pieces. Cut away any membrane, then chop into bite-size chunks.
Score a small cross on the base of each tomato, then put them into a heatproof bowl. Pour boiling water over the tomatoes, leave for 20 secs, then remove. Pour the water away, replace the tomatoes and cover with cold water. Leave to cool, then peel the skin away. Quarter the tomatoes, scrape away the seeds with a spoon, then roughly chop the flesh.
Set a sauté pan over medium heat and when hot, pour in 2 tbsp olive oil. Brown the aubergines for 5 mins on each side until the pieces are soft. Set them aside and fry the courgettes in another tbsp oil for 5 mins, until golden on both sides. Repeat with the peppers. Don’t overcook the vegetables at this stage, as they have some more cooking left in the next step.
Tear up the basil leaves and set aside. Cook the onion in the pan for 5 mins. Add the garlic and fry for a further min. Stir in the vinegar and sugar, then tip in the tomatoes and half the basil. Return the vegetables to the pan with some salt and pepper and cook for 5 mins. Serve with basil.', NULL, 1)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1553, N'matt', N'Choc Chip Pecan Pie', N'75g Butter
100g  Cream Cheese
1 tbls Icing Sugar
150g Butter
200ml Maple Syrup
250g Light Brown Soft Sugar
100g  Dark Brown Soft Sugar
4 Eggs
1 tsp  Vanilla Extract
400g Pecan Nuts
200g Dark Chocolate Chips


First, make the pastry. Tip the ingredients into a food processor with 1 /4 tsp salt. Blend until the mixture resembles breadcrumbs. Drizzle 2-3 tsp cold water into the funnel while the blade is running – the mixture should start to clump together. Tip onto a work surface and bring together, kneading briefly into a ball. Pat into a disc, wrap in cling film, and chill for at least 20 mins. Heat oven to 200C/180C fan/gas 6.

Remove the pastry from the fridge and leave at room temperature for 5 mins to soften. Flour the work surface, then unwrap the pastry and roll to a circle the thickness of a £1 coin. Use the pastry to line a deep, 23cm round fluted tin – mine was about 3cm deep. Press the pastry into the corners and up the sides, making sure there are no gaps. Leave 1cm pastry overhanging (save some of the pastry scraps for later). Line with baking parchment (scrunch it up first to make it more pliable) and fill with baking beans. Blind-bake for 15-20 mins until the sides are set, then remove the parchment and beans and return to the oven for 5 mins until golden brown. Trim the pastry so it’s flush with the top of the tin – a small serrated knife is best for this. If there are any cracks, patch them up with the pastry scraps.

Meanwhile, weigh the butter, syrup and sugars into a pan, and add 1 /4 tsp salt. Heat until the butter has melted and the sugar dissolved, stirring until smooth. Remove from the heat and cool for 10 mins. Reduce oven to 160C/140C fan/gas 3.

Beat the eggs in a bowl. Add the syrup mixture, vanilla and pecans, and mix until well combined. Pour half the mixture into the tart case, scatter over half the chocolate chips, then cover with the remaining filling and chocolate chips. Bake on the middle shelf for 50-55 mins until set. Remove from the oven and leave to cool, then chill for at least 2 hrs before serving.', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1554, N'matt', N'Bean & Sausage Hotpot', N'1 Jar Tomato Sauce
1200g Butter Beans
1 tbls Black Treacle
1 tsp  English Mustard


In a large casserole, fry the sausages until brown all over – about 10 mins.

Add the tomato sauce, stirring well, then stir in the beans, treacle or sugar and mustard. Bring to the simmer, cover and cook for 30 mins. Great served with crusty bread or rice.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1555, N'matt', N'Chakchouka ', N'2 tbs Olive Oil
1 Diced Onion
1 sliced Red Pepper
1 sliced Green Pepper
3 Cloves Crushed Garlic
1 tsp  Cumin
1 tsp  Paprika
3/4 teaspoon Salt
1/2 teaspoon Chili Powder
4 Eggs


In a large cast iron skillet or sauté pan with a lid, heat oil over medium high heat. Add the onion and sauté for 2-3 minutes, until softened. Add the peppers and garlic, and sauté for an additional 3-5 minutes. Add the tomatoes, cumin, paprika, salt, and chili powder. Mix well and bring the mixture to a simmer. Reduce the heat to medium low and continue to simmer, uncovered, 10-15 minutes until the mixture has thickened to your desired consistency. (Taste the sauce at this point and adjust for salt and spice, as desired.) Using the back of a spoon, make four craters in the mixture, large enough to hold an egg. Crack one egg into each of the craters. Cover the skillet and simmer for 5-7 minutes, until the eggs have set. Serve immediately with crusty bread or pita.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1556, N'matt', N'Duck Confit', N'4 Bay Leaf
4 cloves Garlic
Handful Thyme
4 Duck Legs
100ml White Wine


The day before you want to make the dish, scatter half the salt, half the garlic and half of the herbs over the base of a small shallow dish. Lay the duck legs, skin-side up, on top, then scatter over the remaining salt, garlic and herbs. Cover the duck and refrigerate overnight. This can be done up to 2 days ahead.
Pour the wine into a saucepan that will snugly fit the duck legs in a single layer. Brush the salt off the duck legs and place them, skin-side down, in the wine. Cover the pan with a lid and place over a medium heat. As soon as the wine starts to bubble, turn the heat down to the lowest setting and cook for 2 hours, checking occasionally that the liquid is just barely simmering. (If you own a heat diffuser, it would be good to use it here.) After 2 hours, the duck legs should be submerged in their own fat and the meat should feel incredibly tender when prodded. Leave to cool.
The duck legs are now cooked and can be eaten immediately – or you can follow the next step if you like them crisp. If you are preparing ahead, pack the duck legs tightly into a plastic container or jar and pour over the fat, but not the liquid at the bottom of the pan. Cover and leave in the fridge for up to a month, or freeze for up to 3 months. The liquid you are left with makes a tasty gravy, which can be chilled or frozen until needed.
To reheat and crisp up the duck legs, heat oven to 220C/fan 200C/gas 7. Remove the legs from the fat and place them, skin-side down, in an ovenproof frying pan. Roast for 30-40 mins, turning halfway through, until brown and crisp. Serve with the reheated gravy, a crisp salad and some crisp golden ptoatoes.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1557, N'matt', N'Chocolate Gateau', N'175g Butter
2 tablespoons Milk
5 Eggs
175g Granulated Sugar
125g Flour


Preheat the oven to 180°C/350°F/Gas Mark 4. Grease and line the base of an 8 in round spring form cake tin with baking parchment
Break the chocolate into a heatproof bowl and place over a saucepan of gently simmering water and stir until it melts. (or melt in the microwave for 2-3 mins stirring occasionally)
Place the butter and sugar in a mixing bowl and cream together with a wooden spoon until light and fluffy. Gradually beat in the eggs, adding a little flour if the mixture begins to curdle. Fold in the remaining flour with the cooled, melted chocolate and milk. Mix until smooth.
Spread the mixture into the cake tin and bake for 50-55 mins or until firm in the centre and a skewer comes out cleanly. Cool for 10 minutes, then turn out and cool completely.', NULL, 4)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1558, N'matt', N'Osso Buco alla Milanese', N'½ cup Flour
2 tablespoons  Olive Oil
3 tablespoons Butter
1 medium chopped into ½-inch pieces Onion
1 chopped into ½-inch pieces Carrot
1 chopped into ½-inch pieces Celery
1 bulb chopped into ½-inch pieces Fennel
3 cloves Garlic
2 strips Orange Zest
1 ½ teaspoons Marjoram
1 Bay Leaf
1 cup Dry White Wine
½ cup  Chicken Stock
1 cup chopped with juice Tomatoes
2 tablespoons chopped Parsley
1 teaspoon minced Garlic
1 teaspoon grated  Lemon Zest


Heat the oven to 300 degrees.
Dredging the shanks: pour the flour into a shallow dish (a pie plate works nicely). Season the veal shanks on all sides with salt and pepper. One at a time, roll the shanks around in the flour coat, and shake and pat the shank to remove any excuses flour. Discard the remaining flour.
Browning the shanks: put the oil and 1 tablespoon of the butter in a wide Dutch oven or heavy braising pot (6 to 7 quart) and heat over medium-high heat. When the butter has melted and the oil is shimmering, lower the shanks into the pot, flat side down; if the shanks won’t fit without touching one another, do this in batches. Brown the shanks, turning once with tongs, until both flat sides are well caramelized, about 5 minutes per side. If the butter-oil mixture starts to burn, lower the heat just a bit. Transfer the shanks to a large platter or tray and set aside.
The aromatics: pour off and discard the fat from the pot. Wipe out any burnt bits with a damp paper towel, being careful not to remove any delicious little caramelized bits. Ad the remaining 2 tablespoons butter to the pot and melt it over medium heat. When the butter has stopped foaming, add the onion, carrot, celery, and fennel. Season with salt and pepper, stir, and cook the vegetables until they begin to soften but do not brown, about 6 minutes. Stir in the garlic, orange zest, marjoram, and bay leaf, and stew for another minute or two.
The braising liquid: add the wine, increase the heat to high, and bring to a boil. Boil, stirring occasionally, to reduce the wine by about half, 5 minutes. Add the stock and tomatoes, with their juice, and boil again to reduce the liquid to about 1 cup total, about 10 minutes.
The braise: Place the shanks in the pot so that they are sitting with the exposed bone facing up, and pour over any juices that accumulated as they sat. Cover with parchment paper, pressing down so the parchment nearly touches the veal and the edges hang over the sides of the pot by about an inch. Cover tightly with the lid, and slide into the lower part of the oven to braise at a gentle simmer. Check the pot after the first 15 minutes, and if the liquid is simmering too aggressively, lower the oven heat by 10 or 15 degrees. Continue braising, turning the shanks and spooning some pan juices over the top after the first 40 minutes, until the meat is completely tender and pulling away from the bone, about 2 hours.
The gremolata: While the shanks are braising, stir together the garlic, parsley, and lemon zest in a small bowl. Cover with plastic wrap and set aside in a cool place (or the refrigerator, if your kitchen is very warm.)
The finish: When the veal is fork-tender and falling away from the bone, remove the lid and sprinkle over half of the gremolata. Return the veal to the oven, uncovered, for another 15 minutes to caramelize it some.
Using a slotted spatula or spoon, carefully lift the shanks from the braising liquid, doing your best to keep them intact. The shanks will be very tender and threatening to fall into pieces, and the marrow will be wobbly inside the bones, so this can be a bit tricky. But if they do break apart, don’t worry, the flavor won’t suffer at all. Arrange the shanks on a serving platter or other large plate, without stacking, and cover with foil to keep warm.
Finishing the sauce: Set the braising pot on top of the stove and evaluate the sauce: if there is a visible layer of fat floating on the surface, use a large spoon to skim it off and discard it. Taste the sauce for concentration of flavor. If it tastes a bit weak or flat, bring it to a boil over high heat, and boil to reduce the volume and intensify the flavor for 5 to 10 minutes. Taste again for salt and pepper. If the sauce wants more zip, stir in a teaspoon or two of the remaining gremolata.
Portioning the veal shanks: if the shanks are reasonably sized, serve one per person. If the shanks are gargantuan or you’re dealing with modest appetites, pull apart the larger shanks, separating them at their natural seams, and serve smaller amounts. Be sure to give the marrow bones to whomever prizes them most.
Serving: Arrange the veal shanks on warm dinner plates accompanied by the risotto, if serving. Just before carrying the plates to the table, sprinkle on the remaining gremolata and then spoon over a generous amount of sauce – the contact with the hot liquid will aromatize the gremolata and perk up everyone’s appetite with the whiff of garlic and lemon.', NULL, 3)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1559, N'matt', N'English Breakfast', N'3 Bacon
2 Mushrooms
2 Tomatoes
1 Slice Black Pudding
2 Eggs
1 Slice Bread


Heat the flat grill plate over a low heat, on top of 2 rings/flames if it fits, and brush sparingly with light olive oil.
Cook the sausages first. Add the sausages to the hot grill plate/the coolest part if there is one and allow to cook slowly for about 15-20 minutes, turning occasionally, until golden. After the first 10 minutes, increase the heat to medium before beginning to cook the other ingredients. If you are struggling for space, completely cook the sausages and keep hot on a plate in the oven.
Snip a few small cuts into the fatty edge of the bacon. Place the bacon straight on to the grill plate and fry for 2-4 minutes each side or until your preferred crispiness is reached. Like the sausages, the cooked bacon can be kept hot on a plate in the oven.
For the mushrooms, brush away any dirt using a pastry brush and trim the stalk level with the mushroom top. Season with salt and pepper and drizzle over a little olive oil. Place stalk-side up on the grill plate and cook for 1-2 minutes before turning and cooking for a further 3-4 minutes. Avoid moving the mushrooms too much while cooking, as this releases the natural juices, making them soggy.
For the tomatoes, cut the tomatoes across the centre/or in half lengthways if using plum tomatoes , and with a small, sharp knife remove the green ''eye''. Season with salt and pepper and drizzle with a little olive oil. Place cut-side down on the grill plate and cook without moving for 2 minutes. Gently turn over and season again. Cook for a further 2-3 minutes until tender but still holding their shape.
For the black pudding, cut the black pudding into 3-4 slices and remove the skin. Place on the grill plate and cook for 1½-2 minutes each side until slightly crispy.
For ''proper'' fried bread it''s best to cook it in a separate pan. Ideally, use bread that is a couple of days old. Heat a frying pan to a medium heat and cover the base with oil. Add the bread and cook for 2-3 minutes each side until crispy and golden. If the pan becomes too dry, add a little more oil. For a richer flavour, add a knob of butter after you turn the slice.
For the fried eggs, break the egg straight into the pan with the fried bread and leave for 30 seconds. Add a good knob of butter and lightly splash/baste the egg with the butter when melted. Cook to your preferred stage, season and gently remove with a fish slice.
Once all the ingredients are cooked, serve on warm plates and enjoy straight away with a good squeeze of tomato ketchup or brown sauce.', NULL, 2)
INSERT [dbo].[dishes] ([dish_id], [creator], [dish_name], [recipe], [rating], [course_id]) VALUES (1560, N'matt', N'Tunisian Orange Cake', N'300g Caster Sugar
75 ml  Olive Oil
280g Flour
1 tbs Baking Powder
4 large Eggs
2 tsp Vanilla Extract


Preheat oven to 190 C / Gas 5. Grease a 23cm round springform tin.
Cut off the hard bits from the top and bottom of the orange. Slice the orange and remove all seeds. Puree the orange with its peel in a food processor. Add one third of the sugar and the olive oil and continue to mix until well combined.
Sieve together flour and baking powder.
Beat the eggs and the remaining sugar with an electric hand mixer for at least five minutes until very fluffy. Fold in half of the flour mixture, then the orange and the vanilla, then fold in the remaining flour. Mix well but not for too long.
Pour cake mixture into prepared tin and smooth out. Bake in preheated oven for 20 minutes. Reduce the oven temperature to 160 C / Gas 2 and bake again for 30 minutes Bake until the cake is golden brown and a skewer comes out clean. Cool on a wire cake rack.', NULL, 4)
SET IDENTITY_INSERT [dbo].[dishes] OFF
GO
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'admin@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'matt@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'ted@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1002, N'user@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1003, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1003, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1003, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1003, N'ted@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1003, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1011, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1011, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1011, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1011, N'ted@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1011, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1012, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1012, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1012, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1012, N'ted@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1012, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1013, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1013, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1013, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1013, N'ted@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1013, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1015, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1015, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1015, N'matt@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1015, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1015, N'tomanderson@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1016, N'kelsey@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1016, N'kyle@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1016, N'matt@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1016, N'robert@gmail.com', N'Invited')
INSERT [dbo].[invitations] ([potluck_id], [email], [status]) VALUES (1016, N'tomanderson@gmail.com', N'Invited')
GO
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 1, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 3, 5)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 4, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 1, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 2, 5)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 3, 5)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 4, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 3, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 1, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 2, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 3, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 4, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1015, 1, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1015, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1015, 3, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1015, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1016, 1, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1016, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1016, 3, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1016, 4, 3)
GO
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1549)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1539)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1540)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1541)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1542)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1543)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1544)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1004, 1528)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1011, 1545)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1011, 1546)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1011, 1547)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1011, 1548)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1529)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1532)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1533)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1534)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1535)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1536)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1537)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1538)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1558)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1559)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1012, 1560)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1013, 1550)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1551)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1552)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1553)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1554)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1555)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1556)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1015, 1557)
GO
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1002, 3, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1002, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1002, 7, N'inactive')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 3, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 7, N'inactive')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1004, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1005, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1006, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1007, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1008, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1009, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1010, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 3, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 3, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 3, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1014, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1015, 3, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1015, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1015, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1015, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1015, 7, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1016, 3, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1016, 4, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1016, 5, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1016, 6, N'invited')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1016, 7, N'invited')
GO
SET IDENTITY_INSERT [dbo].[potlucks] ON 

INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1002, 7, N'Graduation Day Potluck', N'We''re graduating from Tech Elevator! Bring food if you want, just get your diploma', N'Tech Elevator', CAST(N'2023-12-15T14:00:00.000' AS DateTime), N'❄️Winter', 0, 0, N'inactive')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1003, 7, N'Autumn Harvest Hoedown', N'Embrace the rich and robust flavors of fall with dishes inspired by the bountiful harvest - think pumpkins, apples, and hearty stews.', N'In a Cornfield', CAST(N'2023-10-23T12:00:00.000' AS DateTime), N'🎃Fall', 0, 0, N'inactive')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1004, 7, N'Frosty Flavors Festival', N'Chill out with an ice-inspired potluck showcasing cool and refreshing dishes, perfect for a winter wonderland.', N'Tech Elevator', CAST(N'2023-12-15T12:00:00.000' AS DateTime), N'❄️Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1005, 6, N'Kyle''s Potluck', N'food moment', N'His Place', CAST(N'2023-12-08T11:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1006, 6, N'Kyle loves potlucks', N'It''s true.', N'His Place', CAST(N'2023-12-09T17:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1007, 6, N'Enough is enough, Kyle.', N'The final Hootinany', N'His Garage', CAST(N'2023-12-17T18:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1008, 4, N'Kelsey''s Potluck', N'We eatin out here', N'Her House', CAST(N'2023-12-08T14:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1009, 4, N'Kelsey''s other potluck', N'Bring cigs', N'Her porch', CAST(N'2023-12-16T16:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1010, 4, N'Cigarette Caseroles Only', N'I''m not joking', N'Dahn the block', CAST(N'2023-12-25T06:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1011, 7, N'PIZZA PARTY!!!!!', N'We''re having a huge pizza party! Bring as much pizza as you can fit in your car. Put pizza on the roof. We''ll eat so much pizza', N'My house bring pizza', CAST(N'2024-03-14T16:17:00.000' AS DateTime), N'🍀Spring', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1012, 7, N'Winter Wonderland Whisk & Ladle', N'Cozy up to the warmth of winter comfort foods, from hearty soups to decadent desserts, in a snow-kissed atmosphere.', N'Santa''s Workshop', CAST(N'2023-12-25T11:20:00.000' AS DateTime), N'❄️Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1013, 7, N'Springtime Sprouts Soiree', N'Celebrate the awakening of nature with fresh, vibrant dishes featuring seasonal greens, blossoms, and light flavors.', N'The Local Park', CAST(N'2024-04-10T10:00:00.000' AS DateTime), N'🍀Spring', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1014, 6, N'Testing!', N'summary', N'wherever I''m not picky', CAST(N'2023-12-13T08:11:00.000' AS DateTime), N'Summer', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1015, 3, N'Fireside Flavor Feast', N'Gather around the fire and share hearty, warming dishes that evoke the essence of a winter lodge retreat.', N'''Round the Fireside', CAST(N'2023-12-27T20:20:00.000' AS DateTime), N'❄️Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1016, 3, N'Gleaming Greens Gala', N'Highlight the vibrant shades of green that come with spring in a potluck dedicated to fresh salads, herb-infused dishes, and garden-fresh goodness.', N'In the middle of a field of wildflowers', CAST(N'2024-05-24T15:20:00.000' AS DateTime), N'🍀Spring', 0, 0, N'active')
SET IDENTITY_INSERT [dbo].[potlucks] OFF
GO
SET IDENTITY_INSERT [dbo].[recovery_questions] ON 

INSERT [dbo].[recovery_questions] ([question_id], [question_text]) VALUES (703, N'What is your favorite color?')
INSERT [dbo].[recovery_questions] ([question_id], [question_text]) VALUES (704, N'What is your favorite season?')
INSERT [dbo].[recovery_questions] ([question_id], [question_text]) VALUES (701, N'What is your mother''s maiden name?')
INSERT [dbo].[recovery_questions] ([question_id], [question_text]) VALUES (702, N'Where did you go to high school?')
SET IDENTITY_INSERT [dbo].[recovery_questions] OFF
GO
SET IDENTITY_INSERT [dbo].[titles] ON 

INSERT [dbo].[titles] ([title_id], [title_name]) VALUES (401, N'host')
INSERT [dbo].[titles] ([title_id], [title_name]) VALUES (402, N'guest')
SET IDENTITY_INSERT [dbo].[titles] OFF
GO
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (3, 1508)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (3, 1509)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (4, 1510)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (4, 1511)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (5, 1511)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1504)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1505)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1506)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1507)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1504)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1505)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1506)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1507)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1528)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1529)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1532)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1533)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1534)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1535)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1536)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1537)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1538)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1539)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1540)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1541)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1542)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1543)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1544)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1545)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1546)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1547)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1548)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1549)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1550)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1551)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1552)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1553)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1554)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1555)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1556)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1557)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1558)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1559)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1560)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (1, N'user', NULL, NULL, N'user@gmail.com', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (2, N'admin', NULL, NULL, N'admin@gmail.com', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (3, N'ted', NULL, NULL, N'ted@gmail.com', N'tH8BvtmnyMcS5Q9Oxlyiup5IqUQ=', N'yA4lHw0idGs=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (4, N'kelsey', NULL, NULL, N'kelsey@gmail.com', N'IscjyGodaIc9xNhASbt+fSnxgtI=', N'XdiczNYbBno=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (5, N'robert', NULL, NULL, N'robert@gmail.com', N'pfA+TsxwG1V0u7AE7Tqagl1fT1A=', N'4L75U8vaKT0=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (6, N'kyle', NULL, NULL, N'kyle@gmail.com', N'Fjhd4G3BwUgJ4SYdtL1oWk8eFPo=', N'xWO2yPBd7Sg=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (7, N'matt', NULL, NULL, N'matt@gmail.com', N'XrITqHZWKG4kOj1U95ema/cbb20=', N'8Vsd/EnDrOM=', N'admin', NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__recovery__C66EA13E2C4EB6F2]    Script Date: 12/14/2023 8:30:27 PM ******/
ALTER TABLE [dbo].[recovery_questions] ADD UNIQUE NONCLUSTERED 
(
	[question_text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572C79410BF]    Script Date: 12/14/2023 8:30:27 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dishes] ADD  DEFAULT ('') FOR [creator]
GO
ALTER TABLE [dbo].[invitations] ADD  DEFAULT ('Invited') FOR [status]
GO
ALTER TABLE [dbo].[potluck_user] ADD  DEFAULT ('Invited') FOR [status]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ((0)) FOR [is_recurring]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ((0)) FOR [repeat_interval]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('user') FOR [user_role]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [diet_rest]
GO
ALTER TABLE [dbo].[diet_ingredient]  WITH CHECK ADD FOREIGN KEY([diet_name])
REFERENCES [dbo].[diets] ([diet_name])
GO
ALTER TABLE [dbo].[diet_ingredient]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[dish_allergies]  WITH CHECK ADD FOREIGN KEY([allergen_name])
REFERENCES [dbo].[allergens] ([allergen_name])
GO
ALTER TABLE [dbo].[dish_allergies]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[dish_diet]  WITH CHECK ADD FOREIGN KEY([diet_name])
REFERENCES [dbo].[diets] ([diet_name])
GO
ALTER TABLE [dbo].[dish_diet]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[dish_rating]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[dish_rating]  WITH CHECK ADD FOREIGN KEY([rater])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[friends_list]  WITH CHECK ADD FOREIGN KEY([friend_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[friends_list]  WITH CHECK ADD FOREIGN KEY([self_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[ingredient_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[ingredient_dish]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[invitations]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_course]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[potluck_course]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_diet]  WITH CHECK ADD FOREIGN KEY([diet_name])
REFERENCES [dbo].[diets] ([diet_name])
GO
ALTER TABLE [dbo].[potluck_diet]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[potluck_dish]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_user]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_user]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[potlucks]  WITH CHECK ADD FOREIGN KEY([host_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_allergies]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[user_allergies]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_diet]  WITH CHECK ADD FOREIGN KEY([diet_name])
REFERENCES [dbo].[diets] ([diet_name])
GO
ALTER TABLE [dbo].[user_diet]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[user_dish]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_recovery]  WITH CHECK ADD FOREIGN KEY([question_id])
REFERENCES [dbo].[recovery_questions] ([question_id])
GO
ALTER TABLE [dbo].[user_recovery]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_title]  WITH CHECK ADD FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[user_title]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [final_capstone] SET  READ_WRITE 
GO
