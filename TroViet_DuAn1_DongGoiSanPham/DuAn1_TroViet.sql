USE [master]
GO
/****** Object:  Database [TroViet]    Script Date: 8/9/2023 9:31:02 PM ******/
CREATE DATABASE [TroViet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TroViet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TroViet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TroViet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TroViet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TroViet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TroViet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TroViet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TroViet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TroViet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TroViet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TroViet] SET ARITHABORT OFF 
GO
ALTER DATABASE [TroViet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TroViet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TroViet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TroViet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TroViet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TroViet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TroViet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TroViet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TroViet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TroViet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TroViet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TroViet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TroViet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TroViet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TroViet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TroViet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TroViet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TroViet] SET RECOVERY FULL 
GO
ALTER DATABASE [TroViet] SET  MULTI_USER 
GO
ALTER DATABASE [TroViet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TroViet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TroViet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TroViet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TroViet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TroViet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TroViet', N'ON'
GO
ALTER DATABASE [TroViet] SET QUERY_STORE = ON
GO
ALTER DATABASE [TroViet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TroViet]
GO
/****** Object:  User [TestDB]    Script Date: 8/9/2023 9:31:03 PM ******/
CREATE USER [TestDB] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Test1]    Script Date: 8/9/2023 9:31:03 PM ******/
CREATE USER [Test1] FOR LOGIN [Test1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [TestDB]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [TestDB]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Test1]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Test1]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMaPhongTro] [bigint] NOT NULL,
	[IdNguoiDung] [bigint] NOT NULL,
	[DanhGia] [int] NOT NULL,
	[NoiDung] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonGia_Config]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonGia_Config](
	[keyword] [nvarchar](255) NOT NULL,
	[value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdHopDong] [bigint] NOT NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[SoDienCu] [float] NULL,
	[SoDienMoi] [float] NULL,
	[SoNuocCu] [float] NULL,
	[SoNuocMoi] [float] NULL,
	[KhauTru] [float] NULL,
	[TienNo] [float] NULL,
	[TongCong] [float] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nvarchar](100) NULL,
	[Trash] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMaPhongTro] [bigint] NOT NULL,
	[IdNguoiDung] [bigint] NOT NULL,
	[NgayBatDauThue] [datetime] NULL,
	[NgayKetThucThue] [datetime] NULL,
	[TienDatCoc] [float] NULL,
	[GiaPhong] [float] NULL,
	[GiaDien] [float] NULL,
	[GiaNuoc] [float] NULL,
	[GiaInternet] [float] NULL,
	[GiaRac] [float] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nvarchar](100) NULL,
	[Trash] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKhuVuc] [nvarchar](255) NOT NULL,
	[Tang] [int] NULL,
	[DayNhaTro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhong] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DienThoai] [varchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nvarchar](100) NULL,
	[Trash] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongTro]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTro](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMaLoaiPhong] [int] NOT NULL,
	[IdNguoiDung] [bigint] NULL,
	[IdKhuVuc] [int] NOT NULL,
	[TenPhong] [nvarchar](100) NOT NULL,
	[DienTich] [float] NULL,
	[GiaPhong] [float] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nvarchar](100) NULL,
	[Trash] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/9/2023 9:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [bigint] NOT NULL,
	[ThoiGianDangNhap] [datetime] NULL,
	[ThoiGianDangXuat] [datetime] NULL,
	[NoiDung] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (1, 4, 2, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (2, 5, 3, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Phạm Thị B')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (3, 6, 4, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Thị C')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (4, 9, 5, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Lê Văn D')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (5, 10, 6, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Vũ Thị E')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (6, 12, 7, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Hoàng Văn F')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (7, 15, 8, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Đỗ Thị G')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (8, 17, 9, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Trần Văn H')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (9, 18, 10, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Lý Thị I')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (10, 20, 11, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn K')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (11, 21, 12, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Phạm Thị L')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (12, 23, 13, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Thị M')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (13, 24, 14, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Lê Văn N')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (14, 25, 15, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Vũ Thị O')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (15, 27, 16, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Hoàng Văn P')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (16, 28, 17, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Đỗ Thị Q')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (17, 30, 18, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Trần Văn R')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (18, 31, 19, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Lý Thị S')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (19, 33, 20, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn T')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (20, 35, 2, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Phạm Thị U')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (21, 36, 2, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (22, 38, 2, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (23, 39, 2, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (24, 41, 2, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (25, 42, 2, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (26, 44, 2, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (27, 45, 2, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (28, 46, 2, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (29, 48, 2, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (30, 49, 2, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (31, 50, 2, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (32, 51, 2, 1, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (33, 52, 2, 4, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (34, 54, 2, 2, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (35, 55, 2, 3, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
INSERT [dbo].[DanhGia] ([Id], [IdMaPhongTro], [IdNguoiDung], [DanhGia], [NoiDung], [NgayTao], [NguoiTao]) VALUES (36, 56, 2, 5, N'Nhà thoáng mát', CAST(N'2023-07-31T14:33:16.017' AS DateTime), N'Nguyễn Văn A')
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
INSERT [dbo].[DonGia_Config] ([keyword], [value]) VALUES (N'Giá điện', 3000)
INSERT [dbo].[DonGia_Config] ([keyword], [value]) VALUES (N'Giá nước', 17000)
INSERT [dbo].[DonGia_Config] ([keyword], [value]) VALUES (N'Giá internet', 150000)
INSERT [dbo].[DonGia_Config] ([keyword], [value]) VALUES (N'Giá rác', 30000)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (1, 1, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 230, 250, 22, 28, 0, 0, 2332000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (2, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 250, 280, 27, 35, 0, 0, 1896000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (3, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 100, 24, 38, 0, 0, 4502000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (4, 4, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 79, 24, 35, 0, 0, 3008000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (5, 5, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 79, 24, 35, 0, 0, 2468000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (6, 6, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 100, 24, 40, 0, 0, 3686000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (7, 7, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 62, 24, 29, 0, 0, 2315000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (8, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 100, 24, 33, 0, 0, 3567000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (9, 9, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 100, 24, 33, 0, 0, 3567000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (10, 10, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 120, 24, 38, 0, 0, 4567000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (11, 11, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 90, 24, 33, 0, 0, 3537000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (12, 12, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 50, 24, 27, 0, 0, 1745000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (13, 13, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 88, 24, 30, 0, 0, 3480000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (14, 14, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 110, 24, 33, 0, 0, 3597000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (15, 15, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T00:00:00.000' AS DateTime), 42, 59, 24, 28, 0, 0, 2289000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:39:33.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (16, 1, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 250, 330, 28, 40, 0, 0, 2614000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (17, 2, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 280, 340, 35, 40, 0, 0, 1935000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (18, 3, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 100, 300, 38, 48, 0, 0, 4860000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (19, 4, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 79, 150, 35, 39, 0, 0, 2991000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (20, 5, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 79, 148, 35, 40, 0, 0, 2462000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (21, 6, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 100, 170, 40, 51, 0, 0, 3637000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T14:52:57.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (22, 7, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 62, 130, 29, 37, 0, 0, 2510000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (23, 8, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 100, 176, 33, 44, 0, 0, 3655000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (24, 9, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 100, 166, 33, 41, 0, 0, 3574000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (25, 10, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 120, 190, 38, 47, 0, 0, 4458000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (26, 11, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 90, 170, 33, 38, 0, 0, 3565000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (27, 12, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 50, 130, 27, 31, 0, 0, 1978000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (28, 13, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 88, 154, 30, 36, 0, 0, 3540000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (29, 14, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 110, 200, 33, 41, 0, 0, 3646000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (30, 15, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 59, 124, 28, 35, 0, 0, 2484000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', CAST(N'2023-07-31T15:34:21.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (31, 1, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 330, 452, 40, 47, 0, 0, 2655000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (32, 2, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 340, 407, 40, 45, 0, 0, 1956000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (33, 3, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 300, 474, 48, 50, 0, 0, 4646000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (34, 4, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 150, 230, 39, 48, 0, 0, 3103000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (35, 5, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 148, 207, 40, 49, 0, 0, 2500000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (36, 6, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 170, 284, 51, 63, 0, 0, 3786000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (37, 7, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 130, 246, 37, 46, 0, 0, 2671000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (38, 8, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 176, 263, 44, 54, 0, 0, 3671000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (39, 9, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 166, 270, 41, 51, 0, 0, 3722000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (40, 10, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 190, 294, 47, 57, 0, 0, 4577000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (41, 11, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 170, 278, 38, 46, 0, 0, 3700000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (42, 12, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 130, 180, 31, 37, 0, 0, 1922000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (43, 13, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 154, 243, 36, 45, 0, 0, 3660000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (44, 14, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 200, 281, 41, 52, 0, 0, 3670000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (45, 15, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 124, 241, 35, 41, 0, 0, 2623000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[HoaDon] ([Id], [IdHopDong], [NgayBatDau], [NgayKetThuc], [SoDienCu], [SoDienMoi], [SoNuocCu], [SoNuocMoi], [KhauTru], [TienNo], [TongCong], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (46, 17, CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), 0, 50, 0, 10, 0, 0, 2000000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HopDong] ON 

INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (1, 4, 6, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1000000, 2000000, 3000, 17000, 150000, 20000, CAST(N'2023-07-30T14:45:40.000' AS DateTime), N'Phương Vũ', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (2, 8, 7, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-07-01T00:00:00.000' AS DateTime), 700000, 1500000, 3000, 17000, 150000, 20000, CAST(N'2023-07-30T14:48:08.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (3, 12, 8, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2025-05-01T00:00:00.000' AS DateTime), 1900000, 3800000, 3000, 17000, 250000, 40000, CAST(N'2023-07-30T14:50:31.000' AS DateTime), N'Phương Vũ', CAST(N'2023-05-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (4, 17, 9, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 2500000, 3000, 17000, 180000, 30000, CAST(N'2023-07-30T15:00:51.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (5, 2, 10, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1000000, 2000000, 3000, 17000, 150000, 20000, CAST(N'2023-07-30T15:03:26.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (6, 27, 11, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-30T15:05:54.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (7, 22, 12, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1000000, 2000000, 3000, 17000, 150000, 20000, CAST(N'2023-07-31T14:15:41.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (8, 30, 13, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-31T14:18:25.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (9, 37, 14, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-31T14:21:11.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (10, 43, 15, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1900000, 3800000, 3000, 17000, 250000, 45000, CAST(N'2023-07-31T14:21:11.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (11, 48, 16, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-31T14:21:11.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (12, 10, 17, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1000000, 1500000, 3000, 17000, 150000, 20000, CAST(N'2023-07-31T14:21:11.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Phương Vũ', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (13, 53, 18, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-31T14:27:10.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (14, 56, 19, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1500000, 3000000, 3000, 17000, 200000, 40000, CAST(N'2023-07-31T14:27:10.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (15, 6, 20, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1000000, 2000000, 3000, 17000, 150000, 20000, CAST(N'2023-07-31T14:27:10.000' AS DateTime), N'Phương Vũ', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (16, 5, 21, CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 2000000, 2000000, 3000, 17000, 150000, 30000, CAST(N'2023-08-03T13:09:59.000' AS DateTime), N'Phương Vũ', CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
INSERT [dbo].[HopDong] ([Id], [IdMaPhongTro], [IdNguoiDung], [NgayBatDauThue], [NgayKetThucThue], [TienDatCoc], [GiaPhong], [GiaDien], [GiaNuoc], [GiaInternet], [GiaRac], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (17, 9, 22, CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 1500000, 1500000, 3000, 17000, 150000, 30000, CAST(N'2023-08-03T14:08:53.000' AS DateTime), N'Phương Vũ', CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'thanh', 1, 1)
SET IDENTITY_INSERT [dbo].[HopDong] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuVuc] ON 

INSERT [dbo].[KhuVuc] ([Id], [TenKhuVuc], [Tang], [DayNhaTro]) VALUES (1, N'Khu A', 1, 2)
INSERT [dbo].[KhuVuc] ([Id], [TenKhuVuc], [Tang], [DayNhaTro]) VALUES (2, N'Khu B', 2, 1)
INSERT [dbo].[KhuVuc] ([Id], [TenKhuVuc], [Tang], [DayNhaTro]) VALUES (3, N'Khu C', 3, 2)
INSERT [dbo].[KhuVuc] ([Id], [TenKhuVuc], [Tang], [DayNhaTro]) VALUES (4, N'Khu D', 1, 3)
INSERT [dbo].[KhuVuc] ([Id], [TenKhuVuc], [Tang], [DayNhaTro]) VALUES (5, N'Khu E', 2, 3)
SET IDENTITY_INSERT [dbo].[KhuVuc] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([Id], [TenLoaiPhong]) VALUES (1, N'Phòng đơn')
INSERT [dbo].[LoaiPhong] ([Id], [TenLoaiPhong]) VALUES (2, N'Phòng đôi')
INSERT [dbo].[LoaiPhong] ([Id], [TenLoaiPhong]) VALUES (3, N'Phòng gia đình')
INSERT [dbo].[LoaiPhong] ([Id], [TenLoaiPhong]) VALUES (4, N'Phòng studio')
INSERT [dbo].[LoaiPhong] ([Id], [TenLoaiPhong]) VALUES (5, N'Phòng suite')
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (1, N'Phương Vũ', N'0386139125', N'phuongvu.xu@gmail.com', N'Quận 12', N'$2a$10$TUrGXJPs/RhQXqCrZC/zruo5OM96OpNot.3fvpidnRf8qAsYCA26y', N'Admin', CAST(N'2023-07-29T22:59:28.807' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (2, N'Khắc Sáng', N'0963700685', N'sangnkps26482@fpt.edu.vn', N'Bình Dương', N'$2a$10$K6jofPHKfIFuwpNMmsfUeeT/FUlL0n06aoqUlbJ0qXTcT1o76YC9C', N'Admin', CAST(N'2023-07-30T10:34:51.980' AS DateTime), N'Khắc Sáng', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (3, N'Hoàng Duy', N'0933277546', N'duychps26595@fpt.edu.vn', N'Biên Hòa', N'$2a$10$sAON4D.oYYil0sNKnqUlKOTCsUK/Y2rplEXylM2AjFieWNKNgAGVu', N'Admin', CAST(N'2023-07-30T10:36:19.597' AS DateTime), N'Hoàng Duy', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (4, N'Trường Sơn', N'0364490645', N'sonntps26480@fpt.edu.vn', N'Quận 12', N'$2a$10$p7u//x5j/j6fyZIg4JKm0.xsue.b84gdJ2Eog3ZUjD3XIWo8Eitvm', N'Admin', CAST(N'2023-07-30T10:37:02.443' AS DateTime), N'Trường Sơn', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (5, N'Minh Thành', N'0965843004', N'jaycedtp@gmail.com', N'Bình Dương', N'$2a$10$D1qu5Apck1GkQYZNE1sxXefVSZEKUpigtJnGH8fqU7Ylh1yMolFpq', N'Admin', CAST(N'2023-07-30T10:41:58.187' AS DateTime), N'Minh Thành', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (6, N'Nguyễn Văn An', N'0123456789', N'annguyen@gmail.com', N'An Giang', N'$2a$10$1L4T0iuz7pMne36gN411degtlwyiW87aYh9TepdWcvaVWwBaasPjm', N'Tenants', CAST(N'2023-07-30T14:04:41.880' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T14:47:11.917' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (7, N'Trần Thị Bình', N'0987654322', N'binhtran@gmail.com', N'Hà Nội', N'$2a$10$.Im5Y73EzIRG0v/vCyDRR.B047nb/fzAvZeg5xIDwkBrBofGM6jV2', N'Tenants', CAST(N'2023-07-30T14:08:09.507' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T14:47:31.493' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (8, N'Lê Văn Cường', N'0369852147', N'cuongle@gmail.com', N'Đà Nẵng', N'$2a$10$ek4E72TVKzlfVaIKfDCPZOOdBD3W.0.v3rnrc.Hsw8D8pY/oV97UK', N'Tenants', CAST(N'2023-07-30T14:09:28.790' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T14:49:58.620' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (9, N'Phạm Thị Diễm', N'0912345678', N'diempham@gmail.com', N'Hội An', N'$2a$10$/3Fgn/SDkNJyk/FsrXp2Qe36HvtOcQY6ZQmF4Aw8hoopsDDDuN75K', N'Tenants', CAST(N'2023-07-30T14:10:29.407' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:00:19.620' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (10, N'Hoàng Văn Dũng', N'0987123456', N'dunghoang@gmail.com', N'Bắc Ninh', N'$2a$10$P4jP.6vThRc57CD/lUaD0eWZ1waql7kK4DGWtT/O.f8PxTnSlR8Hq', N'Tenants', CAST(N'2023-07-30T14:13:32.017' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:02:51.350' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (11, N'Huỳnh Thái Hà', N'0909090901', N'hahuynh@gmail.com', N'Thành phố Hồ Chí Minh', N'$2a$10$D.wKbUhnWrINUV19ta44WuiCl2PKSILU2j7.BI1OtvAcN/Uz1J86.', N'Tenants', CAST(N'2023-07-30T14:14:11.730' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:05:05.407' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (12, N'Phan Văn Giang', N'0987654321', N'giangphan@gmail.com', N'Ninh Bình', N'$2a$10$Aqo6nADo9Lc99wZaO0hTseihHLutFJ4TWtc5LQk/.naUMrJUa3deq', N'Tenants', CAST(N'2023-07-30T14:14:55.897' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:16:10.790' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (13, N'Vũ Thu Hương', N'0369852148', N'huongvu@gmai.com', N'Tây Ninh', N'$2a$10$pD9vNJ6oae/3aBtwAaZIsOjvoMJNV/WP6kcGIdST6XIjYIHpDbQXe', N'Tenants', CAST(N'2023-07-30T14:15:59.063' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:16:17.680' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (14, N'Đỗ Văn Khánh', N'0912345671', N'khanhdo@gmail.com', N'Đồng Nai', N'$2a$10$W8U1/ZvsVOPYN9PC9JSNweetnJb2Mvi/al486LuPgEDEBvba.qtRW', N'Tenants', CAST(N'2023-07-30T14:16:58.053' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:16:27.403' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (15, N'Ngô Văn Minh', N'0987123457', N'minhngo@gmail.com', N'Thái Bình', N'$2a$10$utpIpzFuh.nHPcBLfGsgUuRKE0qjO9NEh1sZjHpjhkfwq1YKNAwP2', N'Tenants', CAST(N'2023-07-30T14:17:30.313' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:16:34.620' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (16, N'Dương Thanh Ngọc', N'0909090902', N'ngocduong@gmail.com', N'Thành phố Hồ Chí Minh', N'$2a$10$L5a3FcFU5e8ylJnHWvs6Vez0IDBRxRXd/7zuBi5ygySCFeN4KpKrm', N'Tenants', CAST(N'2023-07-30T14:18:57.083' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:16:41.583' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (17, N'Lý Uyên Thanh', N'0369852149', N'thanhly@gmail.com', N'Vũng Tàu', N'$2a$10$4/p1KcKuY2Xa1bI/9XRDRe4Dp875PCfA46ZC/8Jy3J2XxhayqJmvG', N'Tenants', CAST(N'2023-07-30T14:19:49.743' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:19:42.427' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (18, N'Phạm Phương Yến', N'0912345674', N'yenpham@gmail.com', N'Bảo Lộc', N'$2a$10$Jxp94xSkPFFwhaMP.nD81uGfysARW58Hlr./MZFMBxsCyHjeCPkym', N'Tenants', CAST(N'2023-07-30T14:20:27.130' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:19:48.110' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (19, N'Đặng Văn Đan', N'0987123458', N'dandang@gmail.com', N'Hà Nội', N'$2a$10$Onunv5nU.0IYXsYs6muFauJIQA/NseHuE0P3zL7./l978Azi7SI.y', N'Tenants', CAST(N'2023-07-30T14:21:23.710' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:19:54.197' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (20, N'Đỗ Thị Xuyến', N'0909090903', N'xuyendo@gmail.com', N'Đà Nẵng', N'$2a$10$4gRF0ntCInHupGSpkTv/5OzKKs7U.K.7Lv7R6WmXSKEFOF3BlUd5K', N'Tenants', CAST(N'2023-07-30T14:22:24.987' AS DateTime), N'Phương Vũ', CAST(N'2023-07-30T15:20:04.893' AS DateTime), N'Phương Vũ', 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (21, N'Huỳnh Văn Ái', N'0987654323', N'aihuynh@gmail.com', N'Hà Nội', N'$2a$10$kwBcmWPLeb3kz.GS4ejwaukJ7C.fRbPULIwFmg6J/nLUgSJbTllei', N'Tenants', CAST(N'2023-07-30T14:22:57.940' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (22, N'Phan Tú Tâm', N'0369852141', N'tamphan@gmail.com', N'Kiên Giang', N'$2a$10$vaCpK9xtTumMUzkFO/MtgeV//MuZJZxA4QUtOJcvGUVWwS69cpe7O', N'Tenants', CAST(N'2023-07-30T14:23:49.010' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (23, N'Trần Thị Tuyết', N'0912345677', N'tuyettran@gmail.com', N'Long An', N'$2a$10$Xt1bYA5bjHKjaSay6QoVu.IDRYkbhLdSVv9.m/PBrbz38UHcM4VW6', N'User', CAST(N'2023-07-30T14:24:32.713' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (24, N'Lương Văn Ôn', N'0987123459', N'onluong@gmail.com', N'Hà Nội', N'$2a$10$al8Cnsy7ENuA6sES9Ckd2OuvmmnfimjbFmQES5G9gDWXXsiUDSReG', N'User', CAST(N'2023-07-30T14:25:20.137' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([Id], [HoTen], [DienThoai], [Email], [DiaChi], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (25, N'Vũ Văn Uy', N'0909090909', N'uyvu@gmail.com', N'Thành phố Hồ Chí Minh', N'$2a$10$e0ecVlxe6FEZsw3ZX7UGOublKnl2TLkeO46VP1ad9pBH/qvrpbPr.', N'User', CAST(N'2023-07-30T14:26:00.420' AS DateTime), N'Phương Vũ', NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongTro] ON 

INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (2, 1, 10, 1, N'Phòng đơn 1', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (3, 1, NULL, 1, N'Phòng đơn 2', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (4, 1, 6, 1, N'Phòng đơn 3', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (5, 1, 21, 1, N'Phòng đơn 4', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (6, 1, 20, 1, N'Phòng đơn 5', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (7, 1, 23, 1, N'Phòng đơn 6', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (8, 1, 7, 1, N'Phòng nhỏ 1', 15, 1500000, N'Bình Thạnh, HCM', N'Phòng không có gác, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (9, 1, 22, 1, N'Phòng nhỏ 2', 15, 1500000, N'Bình Thạnh, HCM', N'Phòng không có gác, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (10, 1, 17, 1, N'Phòng nhỏ 3', 15, 1500000, N'Bình Thạnh, HCM', N'Phòng không có gác, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (11, 1, NULL, 1, N'Phòng nhỏ 4', 15, 1500000, N'Bình Thạnh, HCM', N'Phòng không có gác, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (12, 3, 8, 2, N'Phòng gia đình 1', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (13, 3, NULL, 2, N'Phòng gia đình 2', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (14, 3, NULL, 2, N'Phòng gia đình 3', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (15, 3, NULL, 2, N'Phòng gia đình 4', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (16, 3, NULL, 2, N'Phòng gia đình 5', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (17, 4, 9, 3, N'Phòng studio 1', 25, 2500000, N'Bình Thạnh, HCM', N'Phòng không có vách ngăn, nhà vệ sinh riêng, có bếp, có ban công', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (18, 4, NULL, 3, N'Phòng studio 2', 25, 2500000, N'Bình Thạnh, HCM', N'Phòng không có vách ngăn, nhà vệ sinh riêng, có bếp, có ban công', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (19, 4, NULL, 3, N'Phòng studio 3', 25, 2500000, N'Bình Thạnh, HCM', N'Phòng không có vách ngăn, nhà vệ sinh riêng, có bếp, có ban công', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (20, 4, NULL, 3, N'Phòng studio 4', 25, 2500000, N'Bình Thạnh, HCM', N'Phòng không có vách ngăn, nhà vệ sinh riêng, có bếp, có ban công', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (21, 4, NULL, 3, N'Phòng studio 5', 25, 2500000, N'Bình Thạnh, HCM', N'Phòng không có vách ngăn, nhà vệ sinh riêng, có bếp, có ban công', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (22, 4, 12, 3, N'Phòng đơn 7', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (23, 4, NULL, 3, N'Phòng đơn 8', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (24, 4, NULL, 3, N'Phòng đơn 9', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (25, 4, NULL, 3, N'Phòng đơn 10', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (26, 4, NULL, 3, N'Phòng đơn 11', 20, 2000000, N'Bình Thạnh, HCM', N'Phòng gác lửng, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (27, 2, 11, 4, N'Phòng đôi 1', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (28, 2, NULL, 4, N'Phòng đôi 2', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (29, 2, NULL, 4, N'Phòng đôi 3', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (30, 2, 13, 4, N'Phòng đôi 4', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (31, 2, NULL, 4, N'Phòng đôi 5', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (32, 2, NULL, 4, N'Phòng đôi 6', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (33, 2, NULL, 4, N'Phòng đôi 7', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (34, 2, NULL, 4, N'Phòng đôi 8', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (35, 2, NULL, 4, N'Phòng đôi 9', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (36, 2, NULL, 4, N'Phòng đôi 10', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (37, 5, 14, 4, N'Phòng suite 1', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (38, 5, NULL, 4, N'Phòng suite 2', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (39, 5, NULL, 4, N'Phòng suite 3', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (40, 5, NULL, 4, N'Phòng suite 4', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (41, 5, NULL, 4, N'Phòng suite 5', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (42, 5, NULL, 4, N'Phòng suite 5', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (43, 3, 15, 5, N'Phòng gia đình 6', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (44, 3, NULL, 5, N'Phòng gia đình 7', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (45, 3, NULL, 5, N'Phòng gia đình 8', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (46, 3, NULL, 5, N'Phòng gia đình 9', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (47, 3, NULL, 5, N'Phòng gia đình 10', 40, 3800000, N'Bình Thạnh, HCM', N'Phòng có 1 phòng lớn, 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (48, 3, 16, 5, N'Phòng suite 6', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (49, 3, NULL, 5, N'Phòng suite 7', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (50, 3, NULL, 5, N'Phòng suite 8', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (51, 3, NULL, 5, N'Phòng suite 9', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (52, 3, NULL, 5, N'Phòng suite 10', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng, ban công, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (53, 2, 18, 5, N'Phòng đôi 11', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (54, 2, NULL, 5, N'Phòng đôi 12', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (55, 2, NULL, 5, N'Phòng đôi 13', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (56, 2, 19, 5, N'Phòng đôi 14', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 1)
INSERT [dbo].[PhongTro] ([Id], [IdMaLoaiPhong], [IdNguoiDung], [IdKhuVuc], [TenPhong], [DienTich], [GiaPhong], [DiaChi], [MoTa], [NgayTao], [NguoiTao], [NgaySua], [NguoiSua], [Trash], [Status]) VALUES (57, 2, NULL, 5, N'Phòng đôi 15', 35, 3000000, N'Bình Thạnh, HCM', N'Phòng có 2 phòng nhỏ, nhà vệ sinh riêng, có bếp', CAST(N'2023-07-29T23:17:20.710' AS DateTime), N'Phương Vũ', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[PhongTro] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (1, 1, CAST(N'2023-07-29T22:59:43.087' AS DateTime), CAST(N'2023-07-29T23:01:49.207' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (2, 1, CAST(N'2023-07-29T23:02:59.577' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (3, 1, CAST(N'2023-07-29T23:03:48.840' AS DateTime), NULL, N'Thêm khu vực mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (4, 1, CAST(N'2023-07-29T23:04:02.450' AS DateTime), NULL, N'Thêm khu vực mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (5, 1, CAST(N'2023-07-29T23:04:15.083' AS DateTime), NULL, N'Thêm khu vực mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (6, 1, CAST(N'2023-07-29T23:04:31.897' AS DateTime), NULL, N'Thêm khu vực mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (7, 1, CAST(N'2023-07-29T23:04:46.347' AS DateTime), NULL, N'Thêm khu vực mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (8, 1, CAST(N'2023-07-29T23:05:04.390' AS DateTime), NULL, N'Thêm loại phòng mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (9, 1, CAST(N'2023-07-29T23:05:11.360' AS DateTime), NULL, N'Thêm loại phòng mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (10, 1, CAST(N'2023-07-29T23:05:20.447' AS DateTime), NULL, N'Thêm loại phòng mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (11, 1, CAST(N'2023-07-29T23:05:32.140' AS DateTime), NULL, N'Thêm loại phòng mới')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (12, 1, CAST(N'2023-07-29T23:05:49.203' AS DateTime), CAST(N'2023-07-29T23:09:52.770' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (13, 1, CAST(N'2023-07-29T23:17:38.057' AS DateTime), CAST(N'2023-07-29T23:18:12.740' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (14, 1, CAST(N'2023-07-30T10:34:14.573' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (15, 1, CAST(N'2023-07-30T10:34:54.147' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (16, 1, CAST(N'2023-07-30T10:36:21.303' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (17, 1, CAST(N'2023-07-30T10:37:03.310' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (18, 1, CAST(N'2023-07-30T10:41:59.490' AS DateTime), CAST(N'2023-07-30T10:42:12.823' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (19, 1, CAST(N'2023-07-30T10:42:44.960' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (20, 1, CAST(N'2023-07-30T10:42:57.397' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (21, 1, CAST(N'2023-07-30T10:43:14.120' AS DateTime), CAST(N'2023-07-30T10:43:17.607' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (22, 1, CAST(N'2023-07-30T10:45:44.630' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (23, 1, CAST(N'2023-07-30T10:46:01.627' AS DateTime), CAST(N'2023-07-30T10:47:35.570' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (24, 1, CAST(N'2023-07-30T13:52:45.003' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (25, 1, CAST(N'2023-07-30T13:52:59.640' AS DateTime), CAST(N'2023-07-30T13:53:11.627' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (26, 1, CAST(N'2023-07-30T13:59:27.627' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (27, 1, CAST(N'2023-07-30T14:01:41.790' AS DateTime), CAST(N'2023-07-30T14:03:36.807' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (28, 1, CAST(N'2023-07-30T14:04:13.573' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (29, 1, CAST(N'2023-07-30T14:04:43.023' AS DateTime), CAST(N'2023-07-30T14:05:41.083' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (30, 1, CAST(N'2023-07-30T14:07:31.080' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (31, 1, CAST(N'2023-07-30T14:08:10.587' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (32, 1, CAST(N'2023-07-30T14:09:29.790' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (33, 1, CAST(N'2023-07-30T14:10:30.770' AS DateTime), CAST(N'2023-07-30T14:10:45.117' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (34, 1, CAST(N'2023-07-30T14:12:44.113' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (35, 1, CAST(N'2023-07-30T14:13:33.070' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (36, 1, CAST(N'2023-07-30T14:14:12.577' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (37, 1, CAST(N'2023-07-30T14:14:56.847' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (38, 1, CAST(N'2023-07-30T14:15:59.993' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (39, 1, CAST(N'2023-07-30T14:16:58.880' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (40, 1, CAST(N'2023-07-30T14:17:31.200' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (41, 1, CAST(N'2023-07-30T14:18:58.233' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (42, 1, CAST(N'2023-07-30T14:19:50.570' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (43, 1, CAST(N'2023-07-30T14:20:28.100' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (44, 1, CAST(N'2023-07-30T14:21:24.587' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (45, 1, CAST(N'2023-07-30T14:22:25.927' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (46, 1, CAST(N'2023-07-30T14:22:58.737' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (47, 1, CAST(N'2023-07-30T14:23:49.737' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (48, 1, CAST(N'2023-07-30T14:24:33.467' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (49, 1, CAST(N'2023-07-30T14:25:20.883' AS DateTime), NULL, N'Thêm mới người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (50, 1, CAST(N'2023-07-30T14:26:01.407' AS DateTime), CAST(N'2023-07-30T14:26:28.057' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (51, 1, CAST(N'2023-07-30T14:38:22.957' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (52, 1, CAST(N'2023-07-30T14:38:57.583' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (53, 1, CAST(N'2023-07-30T14:40:42.477' AS DateTime), CAST(N'2023-07-30T14:40:55.370' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (54, 1, CAST(N'2023-07-30T14:42:00.803' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (55, 1, CAST(N'2023-07-30T14:42:55.247' AS DateTime), CAST(N'2023-07-30T14:43:17.743' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (56, 1, CAST(N'2023-07-30T14:45:39.183' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (57, 1, CAST(N'2023-07-30T14:46:22.473' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (58, 1, CAST(N'2023-07-30T14:47:13.010' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (59, 1, CAST(N'2023-07-30T14:47:32.717' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (60, 1, CAST(N'2023-07-30T14:47:47.077' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (61, 1, CAST(N'2023-07-30T14:49:10.150' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (62, 1, CAST(N'2023-07-30T14:49:59.563' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (63, 1, CAST(N'2023-07-30T14:50:16.647' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (64, 1, CAST(N'2023-07-30T14:51:51.553' AS DateTime), CAST(N'2023-07-30T14:52:58.333' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (65, 1, CAST(N'2023-07-30T14:55:03.793' AS DateTime), CAST(N'2023-07-30T14:59:03.000' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (66, 1, CAST(N'2023-07-30T14:59:39.957' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (67, 1, CAST(N'2023-07-30T15:00:21.113' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (68, 1, CAST(N'2023-07-30T15:00:49.993' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (69, 1, CAST(N'2023-07-30T15:02:12.440' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (70, 1, CAST(N'2023-07-30T15:02:52.763' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (71, 1, CAST(N'2023-07-30T15:03:24.877' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (72, 1, CAST(N'2023-07-30T15:04:13.637' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (73, 1, CAST(N'2023-07-30T15:05:06.417' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (74, 1, CAST(N'2023-07-30T15:05:51.633' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (75, 1, CAST(N'2023-07-30T15:06:55.200' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (76, 1, CAST(N'2023-07-30T15:16:12.170' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (77, 1, CAST(N'2023-07-30T15:16:19.110' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (78, 1, CAST(N'2023-07-30T15:16:22.967' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (79, 1, CAST(N'2023-07-30T15:16:28.237' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (80, 1, CAST(N'2023-07-30T15:16:35.357' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (81, 1, CAST(N'2023-07-30T15:16:42.553' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (82, 1, CAST(N'2023-07-30T15:19:43.820' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (83, 1, CAST(N'2023-07-30T15:19:48.797' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (84, 1, CAST(N'2023-07-30T15:19:54.893' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (85, 1, CAST(N'2023-07-30T15:20:05.730' AS DateTime), NULL, N'Cập nhật thông tin người dùng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (86, 1, CAST(N'2023-07-30T15:22:27.370' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (87, 1, CAST(N'2023-07-30T15:22:49.313' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (88, 1, CAST(N'2023-07-30T15:23:15.040' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (89, 1, CAST(N'2023-07-30T15:23:43.083' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (90, 1, CAST(N'2023-07-30T15:24:19.807' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (91, 1, CAST(N'2023-07-30T15:24:47.430' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (92, 1, CAST(N'2023-07-30T15:25:07.937' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (93, 1, CAST(N'2023-07-30T15:25:32.610' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (94, 1, CAST(N'2023-07-30T15:25:58.183' AS DateTime), CAST(N'2023-07-30T15:53:00.463' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (95, 1, CAST(N'2023-07-31T14:13:58.167' AS DateTime), CAST(N'2023-07-31T14:14:14.323' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (96, 1, CAST(N'2023-07-31T14:14:58.617' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (97, 1, CAST(N'2023-07-31T14:17:54.863' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (98, 1, CAST(N'2023-07-31T14:19:35.577' AS DateTime), CAST(N'2023-07-31T14:19:49.137' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (99, 1, CAST(N'2023-07-31T14:21:07.107' AS DateTime), NULL, N'login')
GO
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (100, 1, CAST(N'2023-07-31T14:22:33.113' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (101, 1, CAST(N'2023-07-31T14:23:52.113' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (102, 1, CAST(N'2023-07-31T14:24:47.210' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (103, 1, CAST(N'2023-07-31T14:26:09.900' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (104, 1, CAST(N'2023-07-31T14:26:58.750' AS DateTime), NULL, N'Cập nhật hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (105, 1, CAST(N'2023-07-31T14:27:58.197' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (106, 1, CAST(N'2023-07-31T14:28:46.153' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (107, 1, CAST(N'2023-07-31T14:29:33.327' AS DateTime), CAST(N'2023-07-31T14:30:20.483' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (108, 1, CAST(N'2023-07-31T14:33:46.690' AS DateTime), CAST(N'2023-07-31T14:38:19.343' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (109, 1, CAST(N'2023-07-31T14:39:31.360' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (110, 1, CAST(N'2023-07-31T14:41:04.370' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (111, 1, CAST(N'2023-07-31T14:41:18.433' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (112, 1, CAST(N'2023-07-31T14:42:56.187' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (113, 1, CAST(N'2023-07-31T14:43:01.737' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (114, 1, CAST(N'2023-07-31T14:44:23.567' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (115, 1, CAST(N'2023-07-31T14:44:58.123' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (116, 1, CAST(N'2023-07-31T14:45:06.270' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (117, 1, CAST(N'2023-07-31T14:45:47.430' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (118, 1, CAST(N'2023-07-31T14:46:00.253' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (119, 1, CAST(N'2023-07-31T14:46:26.567' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (120, 1, CAST(N'2023-07-31T14:46:45.337' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (121, 1, CAST(N'2023-07-31T14:47:15.310' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (122, 1, CAST(N'2023-07-31T14:47:39.763' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (123, 1, CAST(N'2023-07-31T14:47:46.473' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (124, 1, CAST(N'2023-07-31T14:47:51.600' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (125, 1, CAST(N'2023-07-31T14:48:20.023' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (126, 1, CAST(N'2023-07-31T14:48:42.353' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (127, 1, CAST(N'2023-07-31T14:49:12.597' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (128, 1, CAST(N'2023-07-31T14:49:37.897' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (129, 1, CAST(N'2023-07-31T14:49:44.763' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (130, 1, CAST(N'2023-07-31T14:49:49.053' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (131, 1, CAST(N'2023-07-31T14:49:55.103' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (132, 1, CAST(N'2023-07-31T14:50:02.530' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (133, 1, CAST(N'2023-07-31T14:50:28.787' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (134, 1, CAST(N'2023-07-31T14:50:35.760' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (135, 1, CAST(N'2023-07-31T14:50:53.980' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (136, 1, CAST(N'2023-07-31T14:51:01.797' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (137, 1, CAST(N'2023-07-31T14:51:52.040' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (138, 1, CAST(N'2023-07-31T14:51:59.280' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (139, 1, CAST(N'2023-07-31T14:52:27.787' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (140, 1, CAST(N'2023-07-31T14:52:36.193' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (141, 1, CAST(N'2023-07-31T14:53:51.717' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (142, 1, CAST(N'2023-07-31T14:54:04.623' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (143, 1, CAST(N'2023-07-31T15:21:04.927' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (144, 1, CAST(N'2023-07-31T15:21:19.560' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (145, 1, CAST(N'2023-07-31T15:24:01.107' AS DateTime), NULL, N'Tìm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (146, 1, CAST(N'2023-07-31T15:24:52.113' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (147, 1, CAST(N'2023-07-31T15:25:10.990' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (148, 1, CAST(N'2023-07-31T15:26:00.713' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (149, 1, CAST(N'2023-07-31T15:26:22.990' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (150, 1, CAST(N'2023-07-31T15:29:14.363' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (151, 1, CAST(N'2023-07-31T15:29:25.933' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (152, 1, CAST(N'2023-07-31T15:30:15.030' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (153, 1, CAST(N'2023-07-31T15:30:24.360' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (154, 1, CAST(N'2023-07-31T15:34:45.483' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (155, 1, CAST(N'2023-07-31T15:34:55.397' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (156, 1, CAST(N'2023-07-31T15:36:39.053' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (157, 1, CAST(N'2023-07-31T15:36:44.950' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (158, 1, CAST(N'2023-07-31T15:37:13.680' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (159, 1, CAST(N'2023-07-31T15:37:22.580' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (160, 1, CAST(N'2023-07-31T15:39:59.787' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (161, 1, CAST(N'2023-07-31T15:40:06.073' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (162, 1, CAST(N'2023-07-31T15:41:59.017' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (163, 1, CAST(N'2023-07-31T15:42:05.437' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (164, 1, CAST(N'2023-07-31T15:42:34.313' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (165, 1, CAST(N'2023-07-31T15:42:43.473' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (166, 1, CAST(N'2023-07-31T15:43:08.270' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (167, 1, CAST(N'2023-07-31T15:43:15.897' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (168, 1, CAST(N'2023-07-31T15:43:38.877' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (169, 1, CAST(N'2023-07-31T15:43:45.473' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (170, 1, CAST(N'2023-07-31T15:45:04.457' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (171, 1, CAST(N'2023-07-31T15:45:10.977' AS DateTime), NULL, N'Cập nhật hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (172, 1, CAST(N'2023-07-31T15:50:22.300' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (173, 1, CAST(N'2023-07-31T15:50:50.503' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (174, 1, CAST(N'2023-07-31T15:51:12.390' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (175, 1, CAST(N'2023-07-31T15:52:00.493' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (176, 1, CAST(N'2023-07-31T15:52:24.167' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (177, 1, CAST(N'2023-07-31T15:53:00.380' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (178, 1, CAST(N'2023-07-31T15:54:07.127' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (179, 1, CAST(N'2023-07-31T15:56:15.917' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (180, 1, CAST(N'2023-07-31T15:56:46.627' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (181, 1, CAST(N'2023-07-31T15:57:33.537' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (182, 1, CAST(N'2023-07-31T15:57:58.740' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (183, 1, CAST(N'2023-07-31T15:58:20.777' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (184, 1, CAST(N'2023-07-31T15:59:11.327' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (185, 1, CAST(N'2023-07-31T15:59:39.003' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (186, 1, CAST(N'2023-07-31T16:00:04.893' AS DateTime), CAST(N'2023-07-31T16:00:09.390' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (187, 1, CAST(N'2023-07-31T16:01:38.047' AS DateTime), CAST(N'2023-07-31T16:02:24.003' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (188, 6, CAST(N'2023-07-31T16:02:54.207' AS DateTime), CAST(N'2023-07-31T16:03:45.800' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (189, 6, CAST(N'2023-08-01T13:24:26.017' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (190, 1, CAST(N'2023-08-01T13:25:06.110' AS DateTime), CAST(N'2023-08-01T13:28:39.040' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (191, 6, CAST(N'2023-08-02T13:07:04.457' AS DateTime), CAST(N'2023-08-02T13:07:15.377' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (192, 21, CAST(N'2023-08-02T13:12:11.780' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (193, 1, CAST(N'2023-08-02T13:14:06.440' AS DateTime), CAST(N'2023-08-02T13:26:45.797' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (194, 6, CAST(N'2023-08-02T15:23:47.453' AS DateTime), CAST(N'2023-08-02T15:24:11.140' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (195, 6, CAST(N'2023-08-02T15:38:39.383' AS DateTime), CAST(N'2023-08-02T15:39:03.487' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (196, 6, CAST(N'2023-08-02T15:43:48.690' AS DateTime), CAST(N'2023-08-02T15:44:16.467' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (197, 6, CAST(N'2023-08-02T15:45:26.447' AS DateTime), CAST(N'2023-08-02T15:45:50.483' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (198, 6, CAST(N'2023-08-02T15:50:39.507' AS DateTime), CAST(N'2023-08-02T15:51:53.467' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (199, 6, CAST(N'2023-08-02T15:53:35.217' AS DateTime), CAST(N'2023-08-02T15:54:23.663' AS DateTime), N'logout')
GO
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (200, 6, CAST(N'2023-08-02T15:54:58.163' AS DateTime), CAST(N'2023-08-02T15:55:36.677' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (201, 6, CAST(N'2023-08-02T15:58:27.253' AS DateTime), CAST(N'2023-08-02T15:59:05.640' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (202, 6, CAST(N'2023-08-02T16:01:26.403' AS DateTime), CAST(N'2023-08-02T16:01:54.397' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (203, 6, CAST(N'2023-08-02T16:04:06.423' AS DateTime), CAST(N'2023-08-02T16:04:19.230' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (204, 6, CAST(N'2023-08-02T16:10:33.523' AS DateTime), CAST(N'2023-08-02T16:14:22.647' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (205, 6, CAST(N'2023-08-02T16:21:12.900' AS DateTime), CAST(N'2023-08-02T16:22:24.357' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (206, 6, CAST(N'2023-08-02T16:33:14.367' AS DateTime), CAST(N'2023-08-02T16:33:42.120' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (207, 21, CAST(N'2023-08-02T16:48:57.453' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (208, 1, CAST(N'2023-08-02T16:49:49.707' AS DateTime), CAST(N'2023-08-02T16:50:03.530' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (209, 1, CAST(N'2023-08-02T16:58:30.853' AS DateTime), CAST(N'2023-08-02T16:59:03.020' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (210, 1, CAST(N'2023-08-02T17:50:20.600' AS DateTime), CAST(N'2023-08-02T17:51:57.217' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (211, 1, CAST(N'2023-08-02T17:55:02.547' AS DateTime), CAST(N'2023-08-02T17:55:41.060' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (212, 1, CAST(N'2023-08-02T21:19:58.917' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (213, 1, CAST(N'2023-08-02T21:20:25.580' AS DateTime), CAST(N'2023-08-02T21:20:29.220' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (214, 1, CAST(N'2023-08-02T21:24:52.383' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (215, 1, CAST(N'2023-08-02T21:25:02.687' AS DateTime), CAST(N'2023-08-02T21:25:05.903' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (216, 1, CAST(N'2023-08-02T21:26:13.933' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (217, 1, CAST(N'2023-08-02T21:26:43.067' AS DateTime), CAST(N'2023-08-02T21:26:49.777' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (218, 1, CAST(N'2023-08-02T21:31:28.257' AS DateTime), CAST(N'2023-08-02T21:32:22.803' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (219, 1, CAST(N'2023-08-02T21:32:38.487' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (220, 1, CAST(N'2023-08-02T21:32:54.420' AS DateTime), CAST(N'2023-08-02T21:33:07.497' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (221, 1, CAST(N'2023-08-02T21:39:12.760' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (222, 1, CAST(N'2023-08-02T21:39:38.803' AS DateTime), CAST(N'2023-08-02T21:40:45.637' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (223, 1, CAST(N'2023-08-02T21:41:42.153' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (224, 1, CAST(N'2023-08-02T21:42:16.353' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (225, 1, CAST(N'2023-08-02T21:43:03.967' AS DateTime), CAST(N'2023-08-02T21:43:07.657' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (226, 1, CAST(N'2023-08-02T22:25:54.990' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (227, 1, CAST(N'2023-08-02T22:26:32.057' AS DateTime), CAST(N'2023-08-02T22:26:36.543' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (228, 1, CAST(N'2023-08-02T22:30:23.947' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (229, 1, CAST(N'2023-08-02T22:30:43.843' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (230, 1, CAST(N'2023-08-02T22:30:51.667' AS DateTime), NULL, N'Tìm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (231, 1, CAST(N'2023-08-02T22:31:06.127' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (232, 1, CAST(N'2023-08-02T22:31:14.073' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (233, 1, CAST(N'2023-08-02T22:31:32.837' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (234, 1, CAST(N'2023-08-02T22:33:22.107' AS DateTime), CAST(N'2023-08-02T22:34:30.787' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (235, 1, CAST(N'2023-08-03T10:37:08.287' AS DateTime), CAST(N'2023-08-03T10:37:54.037' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (236, 1, CAST(N'2023-08-03T11:03:42.183' AS DateTime), CAST(N'2023-08-03T11:03:47.893' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (237, 1, CAST(N'2023-08-03T11:05:56.510' AS DateTime), CAST(N'2023-08-03T11:07:38.167' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (238, 1, CAST(N'2023-08-03T11:12:00.017' AS DateTime), CAST(N'2023-08-03T11:12:18.967' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (239, 1, CAST(N'2023-08-03T12:38:30.257' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (240, 1, CAST(N'2023-08-03T12:38:54.497' AS DateTime), NULL, N'In hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (241, 1, CAST(N'2023-08-03T12:39:03.650' AS DateTime), CAST(N'2023-08-03T12:39:06.867' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (242, 1, CAST(N'2023-08-03T12:48:32.593' AS DateTime), CAST(N'2023-08-03T12:49:08.320' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (243, 1, CAST(N'2023-08-03T12:53:09.017' AS DateTime), CAST(N'2023-08-03T12:53:47.857' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (244, 1, CAST(N'2023-08-03T13:09:42.247' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (245, 1, CAST(N'2023-08-03T13:10:23.263' AS DateTime), CAST(N'2023-08-03T13:11:25.517' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (246, 1, CAST(N'2023-08-03T13:13:18.847' AS DateTime), CAST(N'2023-08-03T13:13:36.553' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (247, 1, CAST(N'2023-08-03T13:14:28.793' AS DateTime), CAST(N'2023-08-03T13:15:16.383' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (248, 1, CAST(N'2023-08-03T13:22:14.533' AS DateTime), CAST(N'2023-08-03T13:22:59.080' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (249, 1, CAST(N'2023-08-03T13:32:05.283' AS DateTime), CAST(N'2023-08-03T13:33:59.813' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (250, 1, CAST(N'2023-08-03T13:34:50.477' AS DateTime), CAST(N'2023-08-03T13:35:12.220' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (251, 1, CAST(N'2023-08-03T13:35:52.187' AS DateTime), CAST(N'2023-08-03T13:36:17.603' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (252, 1, CAST(N'2023-08-03T13:38:16.370' AS DateTime), CAST(N'2023-08-03T13:38:33.453' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (253, 1, CAST(N'2023-08-03T13:40:24.227' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (254, 1, CAST(N'2023-08-03T13:40:37.573' AS DateTime), CAST(N'2023-08-03T13:40:40.873' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (255, 1, CAST(N'2023-08-03T13:53:16.980' AS DateTime), CAST(N'2023-08-03T13:53:53.787' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (256, 22, CAST(N'2023-08-03T14:02:19.353' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (257, 22, CAST(N'2023-08-03T14:03:46.847' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (258, 1, CAST(N'2023-08-03T14:05:10.517' AS DateTime), CAST(N'2023-08-03T14:05:53.360' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (259, 1, CAST(N'2023-08-03T14:06:12.790' AS DateTime), CAST(N'2023-08-03T14:08:09.750' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (260, 1, CAST(N'2023-08-03T14:08:28.900' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (261, 1, CAST(N'2023-08-03T14:09:37.270' AS DateTime), NULL, N'Thêm hợp đồng')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (262, 1, CAST(N'2023-08-03T14:13:14.060' AS DateTime), NULL, N'Thêm hóa đơn')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (263, 1, CAST(N'2023-08-03T14:13:35.593' AS DateTime), CAST(N'2023-08-03T14:15:39.113' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (264, 23, CAST(N'2023-08-03T14:23:59.527' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (265, 1, CAST(N'2023-08-03T14:30:31.873' AS DateTime), CAST(N'2023-08-03T14:43:11.930' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (266, 1, CAST(N'2023-08-03T19:09:47.663' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (267, 1, CAST(N'2023-08-03T19:10:32.503' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (268, 1, CAST(N'2023-08-03T19:10:59.177' AS DateTime), NULL, N'Cập nhật phòng trọ')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (269, 1, CAST(N'2023-08-03T19:11:11.603' AS DateTime), CAST(N'2023-08-03T19:11:21.693' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (270, 1, CAST(N'2023-08-04T18:52:28.950' AS DateTime), CAST(N'2023-08-04T18:52:47.737' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (271, 1, CAST(N'2023-08-04T18:54:30.527' AS DateTime), CAST(N'2023-08-04T18:54:46.037' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (272, 1, CAST(N'2023-08-04T19:01:18.110' AS DateTime), CAST(N'2023-08-04T19:01:33.730' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (273, 1, CAST(N'2023-08-04T19:05:32.843' AS DateTime), CAST(N'2023-08-04T19:05:49.140' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (274, 1, CAST(N'2023-08-04T19:11:38.170' AS DateTime), CAST(N'2023-08-04T19:11:50.683' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (275, 1, CAST(N'2023-08-04T19:13:14.903' AS DateTime), CAST(N'2023-08-04T19:13:28.153' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (276, 1, CAST(N'2023-08-04T19:23:56.017' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (277, 1, CAST(N'2023-08-04T19:24:07.567' AS DateTime), CAST(N'2023-08-04T19:24:21.413' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (278, 1, CAST(N'2023-08-04T19:27:35.817' AS DateTime), CAST(N'2023-08-04T19:27:47.930' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (279, 1, CAST(N'2023-08-04T19:44:10.480' AS DateTime), CAST(N'2023-08-04T19:44:22.990' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (280, 1, CAST(N'2023-08-04T19:48:32.533' AS DateTime), CAST(N'2023-08-04T19:48:51.037' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (281, 1, CAST(N'2023-08-04T19:57:09.817' AS DateTime), CAST(N'2023-08-04T19:58:36.170' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (282, 1, CAST(N'2023-08-04T20:16:39.233' AS DateTime), CAST(N'2023-08-04T20:16:51.997' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (283, 1, CAST(N'2023-08-04T22:17:55.650' AS DateTime), CAST(N'2023-08-04T22:18:13.940' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (284, 1, CAST(N'2023-08-04T22:52:49.490' AS DateTime), CAST(N'2023-08-04T22:53:01.090' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (285, 1, CAST(N'2023-08-04T23:00:29.290' AS DateTime), CAST(N'2023-08-04T23:00:57.510' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (286, 1, CAST(N'2023-08-04T23:03:21.020' AS DateTime), CAST(N'2023-08-04T23:07:18.397' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (287, 1, CAST(N'2023-08-04T23:07:33.747' AS DateTime), CAST(N'2023-08-04T23:07:45.657' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (288, 1, CAST(N'2023-08-04T23:09:46.777' AS DateTime), CAST(N'2023-08-04T23:09:56.960' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (289, 1, CAST(N'2023-08-04T23:11:29.473' AS DateTime), CAST(N'2023-08-04T23:11:38.740' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (290, 1, CAST(N'2023-08-04T23:12:32.740' AS DateTime), CAST(N'2023-08-04T23:12:41.090' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (291, 1, CAST(N'2023-08-04T23:14:45.973' AS DateTime), CAST(N'2023-08-04T23:16:09.917' AS DateTime), N'logout')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (292, 1, CAST(N'2023-08-05T22:06:03.083' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (293, 1, CAST(N'2023-08-06T15:05:09.970' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (294, 1, CAST(N'2023-08-06T15:12:26.330' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (295, 1, CAST(N'2023-08-06T15:28:48.913' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (296, 1, CAST(N'2023-08-06T15:34:06.087' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (297, 1, CAST(N'2023-08-06T15:39:52.103' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (298, 1, CAST(N'2023-08-06T15:40:56.523' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (299, 1, CAST(N'2023-08-06T15:46:53.043' AS DateTime), NULL, N'login')
GO
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (300, 1, CAST(N'2023-08-06T15:48:33.877' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (301, 1, CAST(N'2023-08-06T15:49:43.843' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (302, 1, CAST(N'2023-08-06T15:51:16.897' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (303, 1, CAST(N'2023-08-06T15:56:41.157' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (304, 1, CAST(N'2023-08-06T22:30:14.850' AS DateTime), NULL, N'login')
INSERT [dbo].[Session] ([Id], [IdNguoiDung], [ThoiGianDangNhap], [ThoiGianDangXuat], [NoiDung]) VALUES (305, 1, CAST(N'2023-08-07T15:46:04.307' AS DateTime), NULL, N'login')
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiDun__1F0318761DC98D9F]    Script Date: 8/9/2023 9:31:04 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[DienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiDun__A9D10534B7527098]    Script Date: 8/9/2023 9:31:04 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((1)) FOR [Trash]
GO
ALTER TABLE [dbo].[HopDong] ADD  DEFAULT ((1)) FOR [Trash]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  DEFAULT ((1)) FOR [Trash]
GO
ALTER TABLE [dbo].[PhongTro] ADD  DEFAULT ((1)) FOR [Trash]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([IdMaPhongTro])
REFERENCES [dbo].[PhongTro] ([Id])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([IdHopDong])
REFERENCES [dbo].[HopDong] ([Id])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([IdMaPhongTro])
REFERENCES [dbo].[PhongTro] ([Id])
GO
ALTER TABLE [dbo].[PhongTro]  WITH CHECK ADD FOREIGN KEY([IdKhuVuc])
REFERENCES [dbo].[KhuVuc] ([Id])
GO
ALTER TABLE [dbo].[PhongTro]  WITH CHECK ADD FOREIGN KEY([IdMaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([Id])
GO
ALTER TABLE [dbo].[PhongTro]  WITH CHECK ADD FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[InsertHopDong]    Script Date: 8/9/2023 9:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHopDong]
	@IdMaPhongTro bigint,
    @IdNguoiDung bigint,
    @NgayBatDauThue datetime,
    @NgayKetThucThue datetime,
    @TienDatCoc float,
    @GiaPhong float,
    @GiaDien float,
    @GiaNuoc float,
    @GiaInternet float,
    @GiaRac float,
    @NgayTao datetime,
    @NguoiTao nvarchar(100),
    @NgaySua datetime,
    @NguoiSua nvarchar(100),
	 @Trash int,
	  @Status int
as
begin
	 INSERT INTO HopDong (IdMaPhongTro, IdNguoiDung, NgayBatDauThue, NgayKetThucThue, TienDatCoc, GiaPhong, GiaDien, GiaNuoc, GiaInternet, GiaRac, NgayTao, NguoiTao, NgaySua, NguoiSua,Trash,Status)
    VALUES (@IdMaPhongTro, @IdNguoiDung, @NgayBatDauThue, @NgayKetThucThue, @TienDatCoc, @GiaPhong, @GiaDien, @GiaNuoc, @GiaInternet, @GiaRac, @NgayTao, @NguoiTao, @NgaySua, @NguoiSua,@Trash,@Status)

	if @@ROWCOUNT > 0 return 1;
	else return 0;
end
GO
USE [master]
GO
ALTER DATABASE [TroViet] SET  READ_WRITE 
GO
