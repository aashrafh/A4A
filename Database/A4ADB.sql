USE [master]
GO
/****** Object:  Database [A4A]    Script Date: 16-Dec-19 4:06:53 PM ******/
CREATE DATABASE [A4A]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'A4A', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AASHRAFH\MSSQL\DATA\A4A.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'A4A_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AASHRAFH\MSSQL\DATA\A4A_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [A4A] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [A4A].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [A4A] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [A4A] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [A4A] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [A4A] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [A4A] SET ARITHABORT OFF 
GO
ALTER DATABASE [A4A] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [A4A] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [A4A] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [A4A] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [A4A] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [A4A] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [A4A] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [A4A] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [A4A] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [A4A] SET  ENABLE_BROKER 
GO
ALTER DATABASE [A4A] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [A4A] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [A4A] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [A4A] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [A4A] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [A4A] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [A4A] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [A4A] SET RECOVERY FULL 
GO
ALTER DATABASE [A4A] SET  MULTI_USER 
GO
ALTER DATABASE [A4A] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [A4A] SET DB_CHAINING OFF 
GO
ALTER DATABASE [A4A] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [A4A] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [A4A] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'A4A', N'ON'
GO
ALTER DATABASE [A4A] SET QUERY_STORE = OFF
GO
USE [A4A]
GO
/****** Object:  Table [dbo].[_Group]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Group](
	[GroupID] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[GroupAdmin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_User]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_User](
	[UserID] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Passowrd] [varchar](50) NOT NULL,
	[Rating] [int] NULL,
	[Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] NOT NULL,
	[BlogTitle] [varchar](50) NOT NULL,
	[BlogWriter] [int] NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contest](
	[ContestID] [int] NOT NULL,
	[ContestName] [varchar](50) NOT NULL,
	[ContestDate] [date] NOT NULL,
	[ContestLength] [int] NOT NULL,
	[ContestWriter] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[UserID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupContest]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupContest](
	[GroupID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMembers]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMembers](
	[GroupID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMgrs]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMgrs](
	[MgrID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[MgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] NOT NULL,
	[OrganizationName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgGroups]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgGroups](
	[GroupID] [int] NOT NULL,
	[OrgID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ContestantID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContestantID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problem]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problem](
	[ProblemWriter] [int] NOT NULL,
	[ProblemName] [varchar](50) NOT NULL,
	[ProblemTopic] [varchar](50) NULL,
	[ProblemLink] [varchar](50) NOT NULL,
	[ProblemDifficulty] [int] NULL,
	[ProblemContest] [int] NOT NULL,
	[ProblemID] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Problem_ID] PRIMARY KEY CLUSTERED 
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submission]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submission](
	[SubmissionID] [int] NOT NULL,
	[ContestantID] [int] NOT NULL,
	[SubmissionVerdict] [varchar](50) NOT NULL,
	[SubmissionMemory] [int] NULL,
	[SubmissionTime] [int] NOT NULL,
	[SubmissionDate] [date] NOT NULL,
	[SubmissionLang] [varchar](50) NOT NULL,
	[ProblemID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] NOT NULL,
	[TeamName] [varchar](50) NOT NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamContest]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamContest](
	[TeamID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[MemberID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_User] ([UserID], [Fname], [Lname], [Email], [Passowrd], [Rating], [Type]) VALUES (1, N'Ahmed', N'Ashraf', N'aashrafh31@gmail.com', N'123456789', 123456, N'Admin')
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (1, N'TestContest', CAST(N'2019-05-06' AS Date), 2, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (100, N'CMP Contest 2022', CAST(N'2019-05-22' AS Date), 3, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (101, N'CMP Contest 2021', CAST(N'2018-05-22' AS Date), 5, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (102, N'CMP Contest 2020', CAST(N'2017-05-22' AS Date), 8, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (103, N'CMP Contest 2019', CAST(N'2016-05-22' AS Date), 2, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (104, N'CMP Contest 2018', CAST(N'2015-05-22' AS Date), 5, 1)
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Carpeting the Room', N'Implementation', N'https://codeforces.s3.amazonaws.com/100A.pdf', 800, 100, N'100A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Friendly Numbers', N'Implementation', N'https://codeforces.s3.amazonaws.com/100B.pdf', 1000, 100, N'100B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'A+B', N'Implementation', N'https://codeforces.s3.amazonaws.com/100C.pdf', 1200, 100, N'100C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'World of Mouth', N'Strings', N'https://codeforces.s3.amazonaws.com/100D.pdf', 1400, 100, N'100D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Lamps in a Line', N'Math', N'https://codeforces.s3.amazonaws.com/100E.pdf', 1600, 100, N'100E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Polynom', N'Implementation', N'https://codeforces.s3.amazonaws.com/100F.pdf', 1800, 100, N'100F')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Name the album', N'Implementation', N'https://codeforces.s3.amazonaws.com/100G.pdf', 2000, 100, N'100G')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Battleship', N'Implementation', N'https://codeforces.s3.amazonaws.com/100H.pdf', 2200, 100, N'100H')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Rotation', N'Geometry', N'https://codeforces.s3.amazonaws.com/100I.pdf', 2400, 100, N'100I')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Interval Coloring', N'Greedy', N'https://codeforces.s3.amazonaws.com/100J.pdf', 2600, 100, N'100J')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Homework', N'Greedy', N'https://codeforces.s3.amazonaws.com/101A.pdf', 800, 101, N'101A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buses', N'Binary Search', N'https://codeforces.s3.amazonaws.com/101B.pdf', 1000, 101, N'101B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Vectors', N'Implementation', N'https://codeforces.s3.amazonaws.com/101C.pdf', 1200, 101, N'101C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Castle', N'Dynamic Programming', N'https://codeforces.s3.amazonaws.com/101D.pdf', 1400, 101, N'101D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Candies and Stones', N'Divide and Conquer', N'https://codeforces.s3.amazonaws.com/101E.pdf', 1600, 101, N'101E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Clothes', N'Brute Force', N'https://codeforces.s3.amazonaws.com/102A.pdf', 800, 102, N'102A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Sum of Digits', N'Implementation', N'https://codeforces.s3.amazonaws.com/102B.pdf', 1000, 102, N'102B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Homework', N'Greedy', N'https://codeforces.s3.amazonaws.com/102C.pdf', 1200, 102, N'102C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buses', N'Data Structures', N'https://codeforces.s3.amazonaws.com/102D.pdf', 1400, 102, N'102D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Vectors', N'Implementation', N'https://codeforces.s3.amazonaws.com/102E.pdf', 1600, 102, N'102E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Testing Pants for Sadness', N'Greedy', N'https://codeforces.s3.amazonaws.com/103A.pdf', 800, 103, N'103A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Cthulhu', N'DFS and Similar', N'https://codeforces.s3.amazonaws.com/103B.pdf', 1000, 103, N'103B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Russian Roulette', N'Constructive Algorithm', N'https://codeforces.s3.amazonaws.com/103C.pdf', 1200, 103, N'103C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Time to Raid Cowavans', N'Brute Force', N'https://codeforces.s3.amazonaws.com/103D.pdf', 1400, 103, N'103D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buying Sets', N'Graphs', N'https://codeforces.s3.amazonaws.com/103E.pdf', 1600, 103, N'103E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Blackjack', N'Implementation', N'https://codeforces.s3.amazonaws.com/104A.pdf', 800, 104, N'104A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Testing Pants for Sadness', N'Math', N'https://codeforces.s3.amazonaws.com/104B.pdf', 1000, 104, N'104B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Cthulhu', N'DSU', N'https://codeforces.s3.amazonaws.com/104C.pdf', 1200, 104, N'104C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Russian Roulette', N'Math', N'https://codeforces.s3.amazonaws.com/104D.pdf', 1400, 104, N'104D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Time to Raid Cowavans', N'Implementation', N'https://codeforces.s3.amazonaws.com/104E.pdf', 1600, 104, N'104E')
/****** Object:  Index [UQ___Group__149AF30BEACCDB97]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[_Group] ADD UNIQUE NONCLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ___User__1788CCAD149BFA88]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[_User] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ___User__A9D10534805D43B8]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[_User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Blog__54379E51E59FB85C]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[Blog] ADD UNIQUE NONCLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Contest__87DE08FBF78121E8]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[Contest] ADD UNIQUE NONCLUSTERED 
(
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Organiza__CADB0B73869657FF]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[Organization] ADD UNIQUE NONCLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Submissi__449EE10406F6C223]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[Submission] ADD UNIQUE NONCLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Team__123AE7B882090E83]    Script Date: 16-Dec-19 4:06:54 PM ******/
ALTER TABLE [dbo].[Team] ADD UNIQUE NONCLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_User] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Submission] ADD  DEFAULT ((0)) FOR [SubmissionMemory]
GO
ALTER TABLE [dbo].[Team] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[_Group]  WITH CHECK ADD FOREIGN KEY([GroupAdmin])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([BlogWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD FOREIGN KEY([ContestWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([FriendID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[GroupContest]  WITH CHECK ADD FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[GroupContest]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[GroupMgrs]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMgrs]  WITH CHECK ADD FOREIGN KEY([MgrID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[OrgGroups]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[OrgGroups]  WITH CHECK ADD FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD FOREIGN KEY([ContestantID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD FOREIGN KEY([ProblemContest])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD FOREIGN KEY([ProblemWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD FOREIGN KEY([ContestantID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [fK_Problem_ID] FOREIGN KEY([ProblemID])
REFERENCES [dbo].[Problem] ([ProblemID])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [fK_Problem_ID]
GO
ALTER TABLE [dbo].[TeamContest]  WITH CHECK ADD FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[TeamContest]  WITH CHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
/****** Object:  StoredProcedure [dbo].[selectAllOfProblems]    Script Date: 16-Dec-19 4:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllOfProblems]
AS
BEGIN
	Select * from Problem;
END
GO
USE [master]
GO
ALTER DATABASE [A4A] SET  READ_WRITE 
GO
