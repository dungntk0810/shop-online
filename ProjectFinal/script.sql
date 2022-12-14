USE [master]
GO
/****** Object:  Database [Wish]    Script Date: 11/8/2022 12:00:21 PM ******/
CREATE DATABASE [Wish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wish', FILENAME = N'F:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wish_log', FILENAME = N'F:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wish] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wish] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Wish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wish] SET  MULTI_USER 
GO
ALTER DATABASE [Wish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wish] SET QUERY_STORE = OFF
GO
USE [Wish]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isAdmin] [int] NULL,
	[Customer_name] [nvarchar](50) NULL,
	[phone_number] [int] NULL,
	[address] [nvarchar](50) NULL,
	[Country] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[amount] [int] NULL,
	[pid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[oid] [int] NOT NULL,
	[uid] [int] NULL,
	[pid] [int] NULL,
	[quantity] [int] NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[price] [int] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_OrdersDetail_1] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[uID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productreviews]    Script Date: 11/8/2022 12:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productreviews](
	[pid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[comment] [nvarchar](200) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Chuột')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Tai Nghe')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Bàn Phím')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Màn Hình')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (1, N'dungntk', N'1234', 9, N'Nguyễn Trần Khắc Dũng', 923423888, N'282 Nguyễn Huy Tưởng Quận Thanh Xuân', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (2, N'trungnq', N'123456', 1, N'Ngô Quang Trung', 722999135, N'283 Wall', N'Ameria')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (3, N'minhnt', N'123', 1, N'Tạ Nhật Minh', 932786451, N'29 Nguyễn Trãi Quận 1', N'Ho CHI MINH')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (4, N'dung', N'12345', 1, N'Nguyễn Khắc Dũng', 922789472, N'321 Xã Đàn QUận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (31, N'manh', N'123', 0, N'Mạnh', 933299543, N'22A Xã Đàn QUận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (32, N'hieu', N'123', 0, N'Phạm Khắc Hiếu', 777766241, N'30 Lý THường Kiệt Huyện Xuân Mai', N'Yên Bái')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (33, N'ducngoo', N'123', 0, N'Tô Hoàng Đức', 982441728, N'11a Mai Dịch', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (34, N'duy', N'123', 0, N'Phạm Quang Duy', 765432189, N'39 Thạch Thất ', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (35, N'nick', N'123', 0, N'Trần Hà My', 999999999, N'256 KHương Đình QUận Thanh Xuân', N'Hà Nội')
INSERT [dbo].[Customers] ([uID], [user], [pass], [isAdmin], [Customer_name], [phone_number], [address], [Country]) VALUES (36, N'ech', N'123', 0, N'Nguyễn Khánh Hòa', 88888888, N'23 Phạm Trọn Yên', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (71, CAST(N'2022-11-04' AS Date), 1, 1)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (72, CAST(N'2022-11-05' AS Date), 2, 1)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (73, CAST(N'2022-11-05' AS Date), 1, 3)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (74, CAST(N'2022-11-06' AS Date), 1, 11)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (76, CAST(N'2022-11-04' AS Date), 4, 3)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (77, CAST(N'2022-11-07' AS Date), 1, 8)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (78, CAST(N'2022-11-07' AS Date), 1, 1)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (79, CAST(N'2022-11-07' AS Date), 1, 36)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (80, CAST(N'2022-11-07' AS Date), 1, 29)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (81, CAST(N'2022-11-07' AS Date), 1, 1)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (82, CAST(N'2022-11-07' AS Date), 1, 4)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (83, CAST(N'2022-11-07' AS Date), 1, 6)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (84, CAST(N'2022-11-07' AS Date), 1, 16)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (85, CAST(N'2022-11-07' AS Date), 1, 11)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (86, CAST(N'2022-11-07' AS Date), 1, 30)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (87, CAST(N'2022-11-07' AS Date), 1, 6)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (88, CAST(N'2022-11-07' AS Date), 1, 29)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (89, CAST(N'2022-11-07' AS Date), 1, 33)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (90, CAST(N'2022-11-07' AS Date), 1, 34)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (91, CAST(N'2022-11-08' AS Date), 3, 33)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (92, CAST(N'2022-11-08' AS Date), 1, 1)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (93, CAST(N'2022-11-08' AS Date), 1, 34)
INSERT [dbo].[Orders] ([Oid], [date], [amount], [pid]) VALUES (94, CAST(N'2022-11-08' AS Date), 1, 17)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (71, 1, 1, 1, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (72, 31, 1, 2, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150, CAST(N'2022-11-05' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (73, 31, 3, 1, N'Chuột Game Thủ Có Dây YINOIAO G5 Và G15', N'Screenshot 2022-11-01 084158.jpg', 129, CAST(N'2022-11-05' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (74, 31, 11, 1, N'Logitech G335 ', N'Screenshot 2022-11-01 090836.jpg', 1300, CAST(N'2022-11-06' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (76, 31, 3, 4, N'Chuột Game Thủ Có Dây YINOIAO G5 Và G15', N'Screenshot 2022-11-01 084158.jpg', 129, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (77, 31, 8, 1, N'Tai Nghe HOCO W21', N'Screenshot 2022-11-01 090632.jpg', 300, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (78, 31, 1, 1, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (79, 32, 36, 1, N'Bàn phím không dây Bluetooth Logitech K380', N'Screenshot 2022-11-07 210657.jpg', 639, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (80, 32, 29, 1, N'Màn hình máy tính HKC MB21V13', N'Screenshot 2022-11-07 192626.jpg', 1870, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (81, 32, 1, 1, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (82, 32, 4, 1, N'Logitech Mx Master 3S', N'Screenshot 2022-11-01 084429.jpg', 500, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (83, 32, 6, 1, N' Razer Deathadder Essential ', N'Screenshot 2022-11-01 084643.jpg', 350, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (84, 33, 16, 1, N'FL-Esports FL680SAM', N'Screenshot 2022-11-01 091154.jpg', 1000, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (85, 33, 11, 1, N'Logitech G335 ', N'Screenshot 2022-11-01 090836.jpg', 1300, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (86, 33, 30, 1, N'Màn hình HKC MB24V9', N'Screenshot 2022-11-07 192822.jpg', 1750, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (87, 36, 6, 1, N' Razer Deathadder Essential ', N'Screenshot 2022-11-01 084643.jpg', 350, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (88, 36, 29, 1, N'Màn hình máy tính HKC MB21V13', N'Screenshot 2022-11-07 192626.jpg', 1870, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (89, 36, 33, 1, N'Vinetteam FREE WOLF K15 ', N'Screenshot 2022-11-07 193846.jpg', 179, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (90, 36, 34, 1, N'Tai nghe gaming Logitech G333 Black', N'Screenshot 2022-11-07 194030.jpg', 768, CAST(N'2022-11-07' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (91, 36, 33, 3, N'Vinetteam FREE WOLF K15 ', N'Screenshot 2022-11-07 193846.jpg', 179, CAST(N'2022-11-08' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (92, 33, 1, 1, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150, CAST(N'2022-11-08' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (93, 33, 34, 1, N'Tai nghe gaming Logitech G333 Black', N'Screenshot 2022-11-07 194030.jpg', 768, CAST(N'2022-11-08' AS Date))
INSERT [dbo].[OrdersDetail] ([oid], [uid], [pid], [quantity], [name], [image], [price], [date]) VALUES (94, 31, 17, 1, N'Màn Hình Cong HKC 27 Inch ANTTEQ ANT-27F272', N'Screenshot 2022-11-01 091334.jpg', 1100, CAST(N'2022-11-08' AS Date))
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (1, N'Chuột Không Dây S88 Pro 1', N'Screenshot 2022-11-01 083817.jpg', 150.0000, N'Chuột Không Dây Sạc Pin S88 Pro 1 | Chuột Không Dây Deino OFi 1', N'CHUỘT KHÔNG DÂY SẠC PIN S88 được thiết kế đặc biệt với kiểu dáng trẻ trung, thời trang, thon gọn hiện đại dễ dàng di chuyển phù hợp tất cả người dùng. Click chuột siêu nhạy bén, di chuột mượt mà, chính xác, linh hoạt trong từng click. Độ bền cao cùng với pin trâu lên đến 1 tuần làm việc không sợ hết pin làm gián đoạn công việc. Điểm nổi bật nhất chuột không dây S88| Deino chính là hết pin chỉ cần sạc là bạn có thể dùng lại được ngay không cần thay pin vô cùng tiện lợi.', 1, 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (3, N'Chuột Game Thủ Có Dây YINOIAO G5 Và G15', N'Screenshot 2022-11-01 084158.jpg', 129.0000, N'Chuột Game Thủ Có Dây YINOIAO G5 Và G15 Cực Bền Thiết Kế Độc Lạ Có LED Nhiều Màu Trắng Đen Hồng Xanh Bạc', N'	Thiết kế cực độc lạ

✅	Nhựa an toàn ABS và thép không gỉ

✅	LED nhiều màu

✅	Độ phân giải quang học 3600 (dpi)

✅	Giao diện kết nối: cổng USB

✅	Thiết kế ốp lòng tay chống mỏi

✅	Dễ sử dụng, tương thích mọi loại máy tính

✅	Phù hợp cho văn phòng, chơi game, làm quà tặng hoặc kinh doanh

✅	Thiết kế tinh xảo từng góc cạnh, đẹp từng centimet (cầm là mê ngay),Bền, dùng nhiều năm vẫn tốt

✅	Độ phân giải quang học cao, bấm nhạy

✅	Có LED tự động đổi màu rất đẹp

✅	Đầm tay chắc chắn

✅	Thiết kế cực kỳ ấn tượng', 1, 2, 20)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (4, N'Logitech Mx Master 3S', N'Screenshot 2022-11-01 084429.jpg', 500.0000, N'Chuột không dây Logitech Mx Master 3S kết nối bluetooth, sạc type c', N'Một con chuột không dây mang tính biểu tượng với khả năng điều khiển và phản hồi ở tầm cao mới - giờ đây với tính năng theo dõi trên mọi bề mặt 8K và Các cú nhấp yên tĩnh giảm ồn để bạn cảm thấy nhưng không nghe thấy mọi  khoảnh khắc trong quy trình làm việc của mình.

- Theo dõi trên mọi bề mặt - giờ đây với 8K DPI: Sử dụng con chuột máy tính không dây MX Master 3S để làm việc trên mọi bề mặt - ngay cả trên kính (1) - cùng cảm biến 8000 DPI với độ nhạy có thể tùy chỉnh

- Sở hữu các cú nhấp yên tĩnh: Chuột Bluetooth MX Master 3S đem lại các cú nhấp Yên tĩnh - cho cảm giác thỏa mãn tương tự nhưng tạo ít tiếng ồn khi nhấp hơn 90% (2)

- Cuộn Magspeed: Một con chuột máy tính với tốc độ, độ chính xác đáng ngạc nhiên và sự yên tĩnh gần như tuyệt đối, với khả năng cuộn 1.000 dòng một giây - khả năng cuộn MagSpeed nhanh hơn 90% (3), chính xác hơn 87% (4) và siêu yên lặng. 

- Được thiết kế công thái học, Ergo: Làm việc thoải mái với con chuột chính xác có hình dáng được chế tạo để đem lại tư thế cổ tay tự nhiên hơn và đặt tối ưu trên các nút điều khiển bằng ngón tay cái

- Phần mềm tùy chỉnh được nâng cấp: Tùy chỉnh các nút và tối ưu hóa luồng công việc của bạn với các cấu hình cụ thể cho Ứng dụng trong Logi Options+ đã được cải tiến (5)

- Điều khiển Flow trên nhiều máy tính: Làm việc liền mạch trên nhiều máy tính hoặc máy tính xách tay, đồng thời chuyển văn bản, hình ảnh và tệp - giữa Windows & macOS (5) 

- Đa thiết bị và nhiều hệ điều hành: Kết nối con chuột thoải mái với tối đa 3 thiết bị thông qua Bluetooth hoặc đầu thu USB Logi Bolt đi kèm (6) trên Windows, macOS, Chrome OS hoặc Linux

- MX Master 3S giữ được năng lượng lên tới 70 ngày trong một lần sạc đầy(7) - và đem lại 3 giờ sử dụng sau 1 phút sạc nhanh.', 1, 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (6, N' Razer Deathadder Essential ', N'Screenshot 2022-11-01 084643.jpg', 350.0000, N'Chuột Gaming Có Dây Razer Deathadder Essential - Chỉnh DPI/Màu bằng App', N' Đặc điểm kỹ thuật: 
-	Tên sản phẩm: Razer DeathAdder Essential
-	Thông tin chi tiết: Độ nhạy cao
-	Cảm biến quang: 6.400 DPI 
-	Số nút bấm: 5 nút
-	Tuổi thọ: 10 triệu lần nhấp
-	Kích thước: 127.0 mm / 5.0 in (Chiều dài) X 73.0 mm / 2.90 in (Chiều rộng) X 43.0 mm / 1.70 in (Chiều cao)
-	Trọng lượng: 96 g
-	Phần mềm: Hỗ trợ phần mềm Razer Synapse 3
-	Chiều dài cáp: 1.8m
-	Tương thích với Xbox One đầu vào cơ bản
____________________________________
💥 Đặc điểm nổi bật

 -	Thiết kế công thái học vừa vặn tay cầm, dùng cho tay phải.
 -	Di chuyển nhanh nhạy với cảm biến quang học độ phân giải 6400 DPI.
 -	Nút cơ học độ bền đến 10 triệu lần bấm nhờ công nghệ Razer Mechanical.
 -	5 nút bấm dễ dàng gắn chức năng, quản lý hoạt động chuột qua phần mềm Razer Synapse 3.
 -	Hiệu ứng đèn LED màu xanh lá cây đơn sắc họa tiết logo Razer.', 1, 3, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (8, N'Tai Nghe HOCO W21', N'Screenshot 2022-11-01 090632.jpg', 300.0000, N'Tai Nghe headphone Chơi Game HOCO W21, Tai Nghe Chụp Tai Có Dây, Có Micro Và Xbox PS4, Máy tính', N'                                                                               ĐẶC ĐIỂM SẢN PHẨM
W21 Tai nghe có dây quyến rũ duyên dáng với cáp cắm âm thanh mic 3,5mm Điều khiển một nút 1,2m
1. Loa: 40mm.
2. Công suất định mức: 10mW. Công suất đầu vào tối đa: 50mW.
3. Cắm âm thanh: Ø3,5mm.
4. Cáp tai nghe: dây bện cao.
5. Chiều dài cáp: 1,2m.
6. Micrô: bộ điều khiển có mic.
7. Điều khiển dây: điều khiển hoạt động bằng một nút bấm.', 2, 2, 20)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (11, N'Logitech G335 ', N'Screenshot 2022-11-01 090836.jpg', 1300.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'Tai nghe game có dây Logitech G335 - Jack 3.5mm, Nhẹ 240g, Tương thích PC, PS5, Xbox', 2, 3, 19)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (16, N'FL-Esports FL680SAM', N'Screenshot 2022-11-01 091154.jpg', 1000.0000, N'Bàn Phím Cơ FL-Esports FL680SAM Peach - Led RGB-Hot Swap có 3 chế độ kết nối: USB / 2.4 / Bluetooth - Pin 2000 mAh', N'FL-Esports FL680SAM Peach

Thông tin sản phẩm:

– 3 chế độ kết nối: USB/2.4/Bluetooth

– FSA Keycap

– Tính năng Hot Swap thay switch dễ dàng

– Led RGB

– Pin 2000 mAh

– Trang bị sẵn đệm tiêu âm

– Phụ kiện: 1 cáp USB A-C

– Switch Gateron Cap: White, Yellow, Brown, Silver

– Hỗ trợ hệ điều hành: Windows, MacOS

FL-Esports FL680SAM Peach là chiếc bàn phím cơ 3 chế độ kết nối (3 Mode), Keycap FSA Hotswap thiết kế dựa trên layout 68 phím.', 3, 3, 11)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (17, N'Màn Hình Cong HKC 27 Inch ANTTEQ ANT-27F272', N'Screenshot 2022-11-01 091334.jpg', 1100.0000, N'Màn Hình Cong HKC 27 Inch ANTTEQ ANT-27F272 Màn Hình LED VA Full HD – Màn Hình Cong Tần Số 75Hz Chính Hãng', N'àn Hình Cong HKC 27 Inch ANTTEQ ANT-27F272 Màn Hình LED VA Full HD – Màn Hình Cong Tần Số 75Hz Chính Hãng (BH 24 Tháng)

THÔNG SỐ KỸ THUẬT
- Thương hiệu: HKC
- Model: ANTTEQ ANT-27F272
- Kích thước: 27 inch
- Cổng kết nối: VGA | HDMI | Audio out 
- Tỷ lệ màn hình: 16:9
- Thời gian đáp ứng: 8ms (GTG)
- Độ phân giải: FHD 1920x1080
- Tấm nền: VA
- Tần số quét: 75Hz
- Độ tương phản: 3000:1
- Màu sắc màn hình: 16.7 triệu màu
- Góc Nhìn: 178°(H)/178°(V)
- Công suất: 36W | 0.5W (nghỉ)
- Phụ kiện: Adapter | HDMI cable | Power cable

BẢO HÀNH: 24 tháng

TÍNH NĂNG NỔI BẬT
- Màn Hình Cong HKC ANTTEQ ANT thuộc dòng màn hình LED VA cong với góc nhìn 178º, mang lại cho màn hình máy tính chất lượng cao.
- Khả năng hiển thị màu sắc lên tới 16,7 triệu màu cùng độ tương phản 3000:1 mang tới hình ảnh có chiều sâu, sống động.
- Màn hình có tốc độ làm mới 75Hz. Đó là 75 lần mỗi giây mà hình ảnh được thay thế, đảm bảo rằng các chuyển động nhanh trong ảnh sẽ tiếp tục trông mượt mà, không bị giật lag.
', 4, 2, 11)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (18, N'Lenovo D24-20 66AEKAC1VN', N'Screenshot 2022-11-01 091445.jpg', 1157.0000, N'Màn hình Lenovo D24-20 66AEKAC1VN 23.8Inch 75HZ', N'Sản phẩm : Màn hình

Tên Hãng : Lenovo

Model : D24-20 66AEKAC1VN 75Hz

Kiểu màn hình : Màn hình văn phòng 

Kích thước màn hình : 23.8Inch 

Độ sáng : 250cd/m2

Tỷ lệ tương phản : 1000:1

Độ phân giải : Full HD (1920x1080)

Thời gian đáp ứng : 4ms

Góc nhìn : 178°(H) / 178°(V)/

Tần số quét : 75HZ

Cổng giao tiếp : HDMI, VGA

Phụ kiện đi kèm : Cáp điện, Cáp HDMI

Tính năng khác : Đang cập nhật

Xuất xứ : Chính hãng', 4, 3, 12)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (29, N'Màn hình máy tính HKC MB21V13', N'Screenshot 2022-11-07 192626.jpg', 1870.0000, N'Màn hình máy tính HKC MB21V13 21.5 inch FHD VA 60Hz - Hàng chính hãng ( BH 24T )', N'Mô tả sản phẩm:

Kích thước màn hình: 21.5 inch
Tỷ lệ màn hình: 16:9
Độ phân giải: Full HD (1920 x 1080)
Tần số quét: 60Hz
Độ sáng: 250 cd/m2
Tốc độ phản hồi: 7ms
Công nghệ tấm nền: VA 
Công nghệ đồng bộ hình ảnh: N/A

Thông tin sản phẩm Màn hình HKC MB21V13 (21.5inch | FHD | VA | 60Hz | Flat)

Màn hình máy tính HKC MB21V13 một trong những mẫu thuộc phân khúc màn hình máy tính giá rẻ được nhiều người dùng ưa chuộng. Với thiết kế đơn giản cùng khả năng hiện thỉ hoàn hảo trong mức giá, đây sẽ là chiếc màn hình máy tính đáng để bạn lựa chọn.

Thiết kế nhỏ gọn, tiện ích
Màn hình máy tính HKC MB21V13 không chỉ là một màn hình nhỏ gọn cưc kỳ lý tưởng để trên bàn làm việc trong quá trình học tập hay chơi game. Với ngoại hình một màu đen sang trọng, bạn hoàn toàn có thể đặt màn hình ở bất kỳ không gian nào cũng đều phù hợp. Màn hìnhcòn được trang bị nhiều tiện ích đặc biệt kèm theo khả năng chống chói ấn tượng, bạn có thể đặt cạnh cửa sổ, nơi có nhiều ánh sáng mà không bị phản chiếu bên ngoài.', 4, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (30, N'Màn hình HKC MB24V9', N'Screenshot 2022-11-07 192822.jpg', 1750.0000, N'Màn hình HKC MB24V9 23.8inch 75Hz FHD IPS - chính hãng BH 24T', N'Màn hình HKC MB24V9 23.8inch 75Hz FHD IPS - chính hãng BH 24T

Màn hình HKC MB24V9 23.8inch – Hiển thị sắc nét
Màn hình HKC MB24V9 23.8inch với nhiều tính năng nổi trội, ưu việt được đánh giá cao. Đây hứa hẹn sẽ là sản phẩm mang đến trải nghiệm tốt so với tầm giá. Tìm hiểu rõ hơn về màn hình HKC thông qua các thông tin dưới đây!

Thiết kế tinh tế, hiện đại, kết nối đa dạng
Màn hình HKC MB24V9 23.8inch có thiết kế viền mỏng bao quanh, nâng cao diện tích hiển thị, cho cảm giác rộng hơn. Trọng lượng chỉ khoảng 4.1kg, mỏng nhẹ phù hợp với mọi không gian.

Tính tiện lợi của HKC MB24V9 23.8inch còn nằm ở cổng kết nối VGA và HDMI. Do đó, chất lượng hình ảnh, độ phân giải hoặc thông số video sẽ được truyền tải một cách dễ dàng, nhanh chóng nhất.

Độ phân giải cao, hình ảnh sắc nét
Thiết bị sử dụng công nghệ tiên tiến với tỷ lệ ảnh tương phản tĩnh khá cao, đồng thời trang bị tấm nền IPS bền bỉ. Nhờ vậy, các hình ảnh được hiển thị rực rỡ, sống động, sắc nét khi xem phim, chơi game đồ họa cao. Thêm vào đó, độ phân giải Full HD (1920x1080 pixel) đem đến chi tiết hình ảnh sinh động, độ sáng cao, màu sắc chân thực. Hình ảnh rõ ràng, không bị nhòe khi load với tốc độ cao.', 4, 1, -1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (31, N'Bàn phím game thủ K620', N'Screenshot 2022-11-07 193551.jpg', 329.0000, N'Bàn phím game thủ K620 (Phiên bản nâng cấp của K100) phím tròn tích hợp LED', N'THÔNG SỐ KỸ THUẬT :
• Thương hiệu: Technology 
• Dòng: K620
•Trạng thái: Còn mới
• Loại giao diện: USB
• Phân loại màu sắc: Đen – Trắng
• Chế độ kết nối: có dây
• Có các phím chức năng đa phương tiện hay không: Có
• Có hỗ trợ công thái học hay không: Hỗ trợ
• Bàn phím không cơ học
• XUẤT XỨ : TRUNG QUỐC
-------------------------------------------------- 
• Giao hàng toàn quốc 
• Giữ vỏ hộp và tem bảo hành nguyên vẹn trong thời gian bảo hành 
• Bảo hành kể từ ngày nhận hàng
• Lỗi 1 đổi 1 trong 7 ngày nếu phát sinh lỗi từ nhà sản xuất', 3, 1, 22)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (32, N'GOOJODOQ 10 inch', N'Screenshot 2022-11-07 193633.jpg', 269.0000, N'GOOJODOQ 10 inch Đèn nền có đèn nền Bàn phím và chuột không dây LED Bàn phím Bluetooth đầy màu sắc cho máy tính xách tay', N'Vui lòng đọc trước khi mua !!!

1. Do độ sáng của ánh sáng và độ sáng của màn hình, cũng như việc điều chỉnh màu sơn mỗi lần trong quá trình sản xuất, nó không thể được đảm bảo hoàn toàn khớp 100% với bức tranh. Màu sắc thực tế và hình ảnh nhận được có thể khác nhau. Vui lòng tham khảo màu thực tế nhận được. Cảm ơn bạn! !
2 Sau khi kết nối với Bluetooth, trước tiên hãy chuyển sang hệ thống thích hợp.
3. Nếu bạn gặp bất kỳ vấn đề gì, vui lòng liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi để giúp bạn.

Chuột tương thích Bluetooth với đèn nền

Thích hợp cho hệ thống Android / iOS / Windows Máy tính bảng / Điện thoại thông minh / Máy tính xách tay


Bàn phím đèn nền RGB màu Gradient

Hiệu ứng ánh sáng RBG màu gradient mới, trải nghiệm đánh máy thoải mái.


2 chế độ ánh sáng 7 màu ánh sáng

() nút vặn
Nhấn một lần: bật đèn nền,
Nhấn hai lần: chuyển sang đèn thở,
Nhấn ba lần: tắt tất cả đèn nền.

Nút (RGB)
Điều chỉnh màu ánh sáng. (Chế độ đèn thở không hỗ trợ điều chỉnh.)

Thích hợp cho nhiều hệ điều hành

Hỗ trợ Hệ thống Android / Windows / iOS / Mac OS ... vv. Điện thoại thông minh, Máy tính bảng, Máy tính xách tay.


Thời gian sử dụng rất dài

Ngay cả khi bạn đang ở ngoài trời hoặc đi du lịch, bạn không phải lo lắng về các vấn đề điện.


Nhập bình tĩnh và thoải mái

Phím tắt tiếng, Đánh máy thoải mái, Hoàn hảo cho học tập hoặc văn phòng.



Rất mỏng và dễ mang theo

So với bàn phím và chuột thông thường, bàn phím và chuột của chúng tôi mỏng hơn và chiếm ít không gian hơn trong ba lô / túi xách, giúp bạn dễ dàng mang theo.


Thông số sản phẩm


3 Công tắc hệ thống

(Vui lòng thay đổi hệ thống cần thiết trước khi kết nối bàn phím)


Thích hợp sử dụng trong môi trường thiếu sáng

Khi thiếu ánh sáng hoặc trong môi trường thiếu sáng, hãy bật chế độ đèn nền, như vậy bạn không sợ môi trường thiếu sáng.



Kết nối tương thích Bluetooth

Kết nối bất kỳ Bluetooth tương thích nào để bắt đầu một cách làm việc mới trên iPad.', 3, 3, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (33, N'Vinetteam FREE WOLF K15 ', N'Screenshot 2022-11-07 193846.jpg', 179.0000, N'Vinetteam FREE WOLF K15 | Bàn phím giả cơ 1 tay chơi game Pubg Mobile, Free Fire trên điện thoại, máy tính bảng, Laptop
', N'Vinetteam FREE WOLF K15 | Bàn phím giả cơ 1 tay chơi game Pubg Mobile, Free Fire trên điện thoại, máy tính bảng, Laptop
Model: FREE WOLF K15
Loại: Bàn phím giả cơ
Kết nối: Cổng USB
Tương thích: Điện thoại, Máy tính bảng, Laptop, PC
Hệ điều hành: Android, iOs, Windows
Kích thước: 170mm x 260 mm x 35 mm

Bạn đang cần một chiếc bàn phím có thể vừa kết nối trên điện thoại, máy tính bảng và laptop, PC,... tức là có thể All In One nhưng giá phải chăng, lại giúp chơi tốt các thể loại game hot nhất thị trường như Pubg Mobile, Rules of Survival, Free Fire như trên PC? Vậy thì sản phẩm mới - Chiếc bàn phím giả cơ FREE WOLF K15 sẽ là vị chiến hữu tốt nhất dành cho bạn.

Thiết kế độc đáo
Chiếc bàn phím giả cơ FREE WOLF K15 được làm từ vật liệu ABS bền bỉ cùng phím cắt Lazer nên có độ bền cực cao, thêm chế độ bán cơ nên khi gõ phím tạo cảm giác khá "phê" không khác gì trên chiếc bàn phím cơ đắt tiền thông thường. 

Hơn thế nữa trên chiếc bàn phím bán cơ bàn tay được thiết kế một tay với phần bố trí vị trí phù hợp cho sự di chuyển linh hoạt ở các ngón tay nên tạo điều kiện thuận tiện cho bạn chơi thoải mái với các game hot nhất thị trường. 

Hơn thế nữa trên chiếc bàn phím bán cơ FREE WOLF K15 còn trang bị thêm LED background giúp làm nổi bật hệ thống bàn phím khi chơi trong điều kiện thiếu ánh sáng và tốt cho đôi mắt của người chơi trong thời gian lâu dài.

Hỗ trợ chơi tốt với các game hot nhất thị trường
Các phím phản hồi cực nhanh và cực kì chuẩn xác hoàn toàn phù hợp với bất kì thể loại game yêu thích của bạn mà không cần phải mất nhiều thời gian thiết lập.

Hỗ trợ nhiều phím chức năng
Trên chiếc Bàn phím giả cơ FREE WOLF K15 đã tích hợp đầy đủ hệ thống các phím chức năng giúp bạn tiết kiệm thời gian trong việc xử lí các thao tác điều khiển nhân vật, xoay chiêu, hạ gục đối thủ,... Đồng thời sự có mặt của các phím chức năng này giúp bạn linh hoạt hơn trong việc nâng cao level khi chơi game của mình.

Khả năng tương thích với Laptop, PC
Chiếc Bàn phím giả cơ FREE WOLF K15 tương thích cực kì tốt với Laptop, PC khi cổng kết nối bằng USB cáp. Việc sử dụng loại bàn phím hỗ trợ này giúp bạn trông bro hơn rất nhiều và hơn thế nữa là tha hồ tận hưởng các thể loại Game PC cực dã', 3, 3, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (34, N'Tai nghe gaming Logitech G333 Black', N'Screenshot 2022-11-07 194030.jpg', 768.0000, N'Tai nghe gaming Logitech G333 Black Cản tiếng ồn, Chống ồn, Điều chỉnh âm lượng', N'Thông số sản phẩm
Tai nghe Logitech G333 Black
Kết nối: 3.5mm, đi kèm cổng chuyển type-C
Màng loa dynamic kép mang lại âm thanh chi tiết
Thiết kế vỏ nhôm sang trọng, siêu nhẹ
Tương thích PC, mobile, Xbox, PlayStation, Nintendo... G333 được thiết kế đặc biệt dành cho trải nghiệm chơi game tối ưu. Các màng loa âm thanh kép chuyên dụng, một cho âm mid/treble và một cho âm bass, cung cấp âm thanh phong phú chi tiết để tái tạo chính xác thế giới game.', 2, 3, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (35, N'Chuột game có dây Logitech G502 Hero', N'Screenshot 2022-11-07 210524.jpg', 931.0000, N'Chuột game có dây Logitech G502 Hero - Cảm biến Hero 25k, RGB, 11 nút lập trình', N'Chuột game hiệu suất cao Logitech G502 Hero - Cảm biến Hero 25k, RGB, 11 nút  lập trình

Cảm biến Logitech HERO 25K

DPI: 100 – 16000

Kết nối: USB 2.0/3.0

Thiết kế bất đối xứng dành cho người dùng thuận tay phải

LED RGB 16.8 triệu màu

Chip xử lý ARM 32-bit

11 nút lập trình được

Bộ nhớ có thể lưu trữ 5 chế độ

Kích thước: 132mm x 75mm x 40mm

Trọng lượng: 121g (đi kèm bộ 5 tạ với 3.6g mỗi tạ)

Phần mềm hỗ trợ: Logitech Gaming Software

Thời gian sử dụng: 50 triệu lần click.. CẢM BIẾN HERO 25K

HERO là cảm biến chơi game chính xác nhất từ trước tới nay của chúng tôi với độ chính xác thế hệ tiếp theo và cấu trúc toàn diện. Với khả năng xử lý tốc độ khung hình nhanh nhất, HERO có khả năng tạo ra 400+ IPS trong dải DPI 100 - 25.000 với khả năng làm mịn, lọc hay tăng tốc. HERO đạt được độ chính xác cấp độ thi đấu và độ nhạy ổn định nhất từ trước tới nay. Hãy chắc chắn tùy chỉnh và sửa các cài đặt DPI của bạn bằng HUB G của Logitech.

11 NÚT CÓ THỂ LẬP TRÌNH

Sử dụng HUB G của Logitech để lập trình các lệnh và macro ưa thích của bạn cho tối đa 11 nút. Thiết kế, di chuyển, sửa chữa... hãy để sức mạnh di chuyển dưới ngón tay bạn. Lưu các cấu hình sẵn sàng để phát trực tiếp đến chuột để mang cài đặt của bạn đi khắp mọi nơi.

TRỌNG LƯỢNG CÓ THỂ ĐIỀU CHỈNH

Tinh chỉnh cảm giác chuột và hành vi trượt theo sở thích của bạn. Năm khối nặng 3,6 g đi kèm với HERO G502 đều có thể điều chỉnh theo nhiều cách: ở phía trước, phía sau, trái, phải và trung tâm. Thử nghiệm với sự liên kết và cân bằng để tìm ra vị trí phù hợp nhằm tối ưu hóa hiệu suất chơi game của bạn.', 1, 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [uID], [quantity]) VALUES (36, N'Bàn phím không dây Bluetooth Logitech K380', N'Screenshot 2022-11-07 210657.jpg', 639.0000, N'Bàn phím không dây Bluetooth Logitech K380 - giảm ồn, gọn nhẹ, đa thiết bị, Mac/ PC', N'THÔNG TIN CHI TIẾT

Loại kết nối: Bluetooth Cổ điển (3.0)

Phạm vi không dây: 10 m (33 ft) - 1 Phạm vi không dây có thể thay đổi tùy theo điều kiện môi trường và sử dụng máy tính

Hỗ trợ phần mềm:

- Logitech Options dành cho Windows 10 trở lên

- Logitech Options dành cho Mac (OS X 10.8 trở lên)

- Logitech Flow

Pin: 2 x AAA

Tuổi thọ pin: 12 tháng

Đèn chỉ báo (LED): LED pin, 3 LED kênh Bluetooth

Các phím đặc biệt: Các phím nóng (Home, Back, Công tắc ứng dụng, Menu theo ứng dụng cụ thể), Easy-Switch™

Kết nối / Nguồn: Công tắc bật/tắt

Thương hiệu Logitech Thụy Sỹ

Sản xuất tại Trung Quốc

Bảo hành chính hãng 12 tháng Giới thiệu Bàn phím Bluetooth đa thiết bị Logitech K380 

GÕ TRÊN MỌI THIẾT BỊ

Tận hưởng sự thoải mái và tiện dụng khi gõ trên điện thoại thông minh và máy tính bảng bằng bàn phím di động này.

K380 Multi-Device là bàn phím không dây kết nối với tất cả thiết bị Bluetooth® không dây hỗ trợ bàn phím ngoài.

- Bluetooth không dây

- Đa nền tảng/nền tảng chéo

- Windows®, Mac, Chrome OS™, Android™, iOS

PHONG CÁCH DI ĐỘNG TIỆN DỤNG

Hãy mang bàn phím Bluetooth nhỏ gọn, trọng lượng nhẹ này tới bất kỳ nơi nào trong nhà bạn. Gõ bàn phím ở bất kỳ nơi nào bạn thích, trên bất kỳ máy tính, điện thoại hay máy tính bảng tương thích nào.

DỄ CHUYỂN ĐỔI

Kết nối tới ba thiết bị cùng lúc, chẳng hạn một máy tính Windows, iPhone và máy tính bảng chạy Android. Chỉ cần chạm vào một nút và bắt đầu gõ trên một thiết bị khác.

BỐ CỤC TƯƠNG TỰ

K380 Multi-Device nhận ra từng thiết bị và tự động ánh xạ các phím để cho bạn bố cục tương tự với các phím tắt ưa thích của mình.

Bằng cách nhận ra thiết bị cụ thể của bạn—ví dụ, máy tính Apple hoặc máy tính Windows—bàn phím phổ dụng này sẽ gửi mã phím chính xác

TUỔI THỌ PIN 2 NĂM

K380 Multi-Device có tuổi thọ dài lâu với hai pin kiềm AAA được lắp sẵn. Bạn thậm chí có thể quên rằng bàn phím này sử dụng pin.

Tuổi thọ pin bàn phím được tính toán dựa trên mức ước tính 2 triệu lần nhấn phím/năm trong môi trường công sở. Trải nghiệm người dùng có thể khác nhau.', 1, 1, 6)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (1, 1, N'<p>X&agrave;i tốt , đầm tay c&ograve;n bền hay kh&ocirc;ng th&igrave; để thời gian trả lời ạ :))))</p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (3, 1, N'<p>Như m&ocirc; tả, sản phẩm như h&igrave;nh</p>

<p>Shop giao đ&uacute;ng mẫu m&atilde;, đ&oacute;ng g&oacute;i kĩ, giao h&agrave;ng rất nhanh. Sẽ mua lại v&agrave;o lần sau</p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (4, 31, N'<p>Gi&aacute; ph&ugrave; hợp va chất lượng, ae n&ecirc;n mua trải nghiệm gi&aacute; rẻ nh&eacute;</p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (6, 36, N'Chuột đầm tay, tiếng click đều và đanh, rất nhạy, vỏ ngoài hình thức mới cứng, đẹp')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (1, 1, N'Chuột ấn click nghe sướng lắm. Không biết có bền k nhưh giá cũng rẻ. Giao hàng 2 ngày đã nhận được rồi ạ. 😛😛😘. Qlq ncao mkas cm')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (6, 36, N'<p>Sản phẩm d&ugrave;ng kh&aacute; l&agrave; tốt&nbsp;</p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (30, 31, N'<p>Sản phẩm chất lượng tooif</p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (6, 36, N'<p><strong>sản phẩm tốt&nbsp;</strong></p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (4, 31, N'<p><strong>Sản phẩm tốt</strong></p>
')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (1, 34, N'Hàng xịn và đẹp với giá , nên mua nha mọi người chơi game thì còn gì bằng, mỗi tội là hộp hàng hơi móp')
INSERT [dbo].[Productreviews] ([pid], [uid], [comment]) VALUES (1, 31, N'<p>sản phẩm d&ugrave;ng kh&aacute; thoải m&aacute;i v&agrave; vừa tay&nbsp;</p>
')
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_PersonOrder] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_PersonOrder]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail] FOREIGN KEY([oid])
REFERENCES [dbo].[Orders] ([Oid])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrderDetail]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailProduct] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrderDetailProduct]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetailOrder] FOREIGN KEY([uid])
REFERENCES [dbo].[Customers] ([uID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_UserDetailOrder]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_cateId] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_cateId]
GO
ALTER TABLE [dbo].[Productreviews]  WITH CHECK ADD  CONSTRAINT [FK_Personreview] FOREIGN KEY([uid])
REFERENCES [dbo].[Customers] ([uID])
GO
ALTER TABLE [dbo].[Productreviews] CHECK CONSTRAINT [FK_Personreview]
GO
ALTER TABLE [dbo].[Productreviews]  WITH CHECK ADD  CONSTRAINT [FK_Productreview] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Productreviews] CHECK CONSTRAINT [FK_Productreview]
GO
USE [master]
GO
ALTER DATABASE [Wish] SET  READ_WRITE 
GO
