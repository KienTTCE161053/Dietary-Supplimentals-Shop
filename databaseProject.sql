USE [master]
GO
/****** Object:  Database [ProjectFinalPRJ]    Script Date: 11/10/2022 8:05:08 AM ******/
CREATE DATABASE [ProjectFinalPRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectFinalPRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectFinalPRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectFinalPRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectFinalPRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectFinalPRJ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectFinalPRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectFinalPRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectFinalPRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectFinalPRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectFinalPRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectFinalPRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectFinalPRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectFinalPRJ] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectFinalPRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectFinalPRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectFinalPRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectFinalPRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectFinalPRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectFinalPRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectFinalPRJ] SET QUERY_STORE = OFF
GO
USE [ProjectFinalPRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/10/2022 8:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[TypeAccount] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/10/2022 8:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](10) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[DeliveryAddress] [nvarchar](max) NOT NULL,
	[TotalBill] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderElement]    Script Date: 11/10/2022 8:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderElement](
	[OrderID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/10/2022 8:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[LinkPicture] [nvarchar](max) NULL,
	[TypeProduct] [nvarchar](20) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'admin', N'Admin123456', N'ADMIN', 945605514, N'Male', N'Can Tho', N'admin')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'chihung', N'Chihung123', N'Nguyen Chi Hung', 123456789, N'Male', N'Can Tho', N'customer')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'example', N'Qui23022003', N'Tran Van B', 123456789, N'Male', N'Can Tho', N'customer')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'LapQuan', N'Quan123456', N'Vo Lap Quan', 346225277, N'Male', N'Soc Trang', N'customer')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'quitqce160195', N'Qui23022003', N'Tran Quang Qui', 945605514, N'Male', N'Ca Mau', N'customer')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'quyleo', N'Quy123456', N'Le Phat Quy', 789112527, N'Male', N'Hau Giang', N'customer')
INSERT [dbo].[Account] ([Username], [Password], [FullName], [PhoneNumber], [Gender], [Address], [TypeAccount]) VALUES (N'thietbeo', N'Thiet123456', N'Truong Trong Thiet', 919723353, N'Male', N'An Giang', N'customer')
GO
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'197559433', N'quitqce160195', N'Ninh KieuViet NamViet Nam', 1168000)
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'741230766', N'embe', N'An Khanh Ninh KieuViet NamViet Nam', 210000)
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'789731978', N'example', N'Ninh KieuViet NamViet Nam', 210000)
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'80648085', N'quyleo', N'Ninh KieuViet NamViet Nam', 2547000)
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'835857360', N'example', N'Ninh KieuViet NamViet Nam', 3495000)
INSERT [dbo].[Order] ([OrderID], [Username], [DeliveryAddress], [TotalBill]) VALUES (N'842515939', N'quitqce160195', N'ctViet NamViet Nam', 1133000)
GO
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'925742013', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'925742013', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'611002605', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'611002605', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N't1', N'BM', 3, 20000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'377609663', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'377609663', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'789324811', N'Nam', 2, 4800000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'50783358', N'Nam', 2, 4800000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'237983116', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'237983116', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'237983116', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'989900984', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'989900984', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'989900984', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'606038718', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'606038718', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'606038718', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'842515939', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'842515939', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'842515939', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'741230766', N'AmitakaQY', 3, 210000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'80648085', N'DHC01', 2, 1698000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'80648085', N'DHCB', 1, 849000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'992356770', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'992356770', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'120542271', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'120542271', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'196705432', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'196705432', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'568548449', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'568548449', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'432064449', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'432064449', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'362646545', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'362646545', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'850931305', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'850931305', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'601940803', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'601940803', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'104507032', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'104507032', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'610417482', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'610417482', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'997790582', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'997790582', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'550791764', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'550791764', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'37870396', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'37870396', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'502308150', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'502308150', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'262387646', N'AmitakaQY', 1, 70000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'262387646', N'AnGiacQY', 1, 320000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'789731978', N'AmitakaQY', 3, 210000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'835857360', N'DHC01', 1, 849000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'197559433', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'197559433', N'BG', 1, 535000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'197559433', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'197559433', N'BogatraQY', 1, 45000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'752646226', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'752646226', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'443351083', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'443351083', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'99056060', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'99056060', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'634008148', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'634008148', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'634008148', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'49033626', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'49033626', N'BNGR', 1, 159000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'51760830', N'BM', 1, 429000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'51760830', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'51760830', N'DHC', 1, 205000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'835857360', N'CareRoyal', 1, 749000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'835857360', N'CNT', 1, 549000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'835857360', N'DHCFors', 1, 499000)
INSERT [dbo].[OrderElement] ([OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (N'835857360', N'DHCB', 1, 849000)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'AnGiacQY', N'An Giấc Học Viện Quân Y Hộp 30 viên ', N'<h3>Thông tin sản phẩm:</h3><br>
<p>Người hay căng thẳng, hồi hộp, lo âu, suy nhược thần kinh dẫn đến mất ngủ. Điều này ảnh hưởng rất nhiều đến sức khỏe cũng như công việc hằng ngày. Để cải thiện tình trạng này, nhiều người đã tìm đến thực phẩm bảo vệ sức khỏe – thực phẩm chức năng hỗ trợ mất ngủ. Một trong các sản phẩm hỗ trợ an thần, ngủ ngon được tin dùng là An Giấc Học Viện Quân Y.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ an thần, ngủ ngon.</li>
<li>Hỗ trợ cải thiện tình trạng hồi hộp, lo âu.</li>
<li>Hỗ trợ cải thiện chứng mất ngủ, ngủ không sâu giấc.</li>
<li>Cải thiện tình trạng suy nhược thần kinh.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người khó ngủ, mất ngủ, ngủ không sâu giấc.</li>
<li>Người bị suy nhược thần kinh gây mất ngủ.</li>
<li>Người căng thẳng, hồi hộp, lo âu dẫn đến mất ngủ.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul>
<li>An giấc được khuyến cáo sử dụng: Ngày uống 1 – 2 viên vào buổi tối trước khi đi ngủ 30 phút.</li>
<li>Bảo quản: nơi khô ráo, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Phụ nữ có thai, trẻ em dưới 10 tuổi hỏi ý kiến bác sĩ trước khi sử dụng.</li>
<li>Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
<li>Liệu trình khuyên dùng từ 1 – 3 tháng. Tránh sử dụng ngắt quãng để đạt hiệu quá tốt.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 320000, N'https://hvqy.vn/data/upload_file/Image/171/hop-10vien-an-giac-hvqy.jpg', N'Sleep')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'BG', N'Bổ Gan Orihiro Shijimi Nhật Bản 70 viên ', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Viên uống bổ gan Orihiro được điều chế từ nhiều thảo dược kết hợp với vitamin, dưỡng chất giúp bảo vệ và duy trì tế bào gan khỏe mạnh.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Cung cấp các dưỡng chất thiết yếu để duy trì tế bào gan khỏe mạnh.</li>
<li>Tăng cường chức năng gan, hỗ trợ thải độc tố ra ngoài cơ thể.</li>
<li>Bảo vệ tế bào gan trước tác động của rượu bia và thực phẩm độc hại.</li>
<li>Tăng cường hệ miễn dịch và sức đề kháng.</li>
<li>Hỗ trợ điều trị viêm gan, xơ gan.</li>
<li>Hỗ trợ giảm mụn nhọt, dị ứng do chức năng gan kém.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người thường xuyên sử dụng rượu bia, thuốc lá.</li>
<li>Người chức năng gan kém hay người vị viêm, xơ gan.</li>
<li>Người bị nóng trong, nổi mụn…</li>
<li>Người muốn bảo vệ và tăng cường chức năng gan.</li>
</ul><br>
<h3>Hướng dẫn sử dụng </h3><br>
<ul>
<li>Ngày 2 viên, uống trước hoặc sau ăn 30 phút.</li>
<li>Người hay sử dụng rượu bia nên kết hợp với bột nghệ giải rượu Orihiro.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Không dùng cho người dưới 18 tuổi, phụ nữ có thai và đang cho con bú.</li>
<li>Người đang điều trị bệnh hoặc sử dụng thuốc khác hỏi ý kiến bác sĩ trước khi sử dụng.</li>
<li>Bảo quản nơi khô ráo thoáng mát và để xa tầm tay trẻ em.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh</li>
</ul>
', 535000, N'https://th.bing.com/th/id/R.c6197307b8b7ed618712637e31bfc69b?rik=ZvWndjZcIw8RIw&pid=ImgRaw&r=0', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'BM', N'Viên uống hỗ trợ bổ mắt, DHC lutein Gói 90 Ngày', N'Thông tin sản phẩm
Lutein Blue Light Protection là viên uống chống ánh sáng xanh của DHC. Với thành phần được chiết xuất kết hợp hoàn hảo giúp bổ sung Lutein, anthocyanin hỗ trợ hạn chế lão hóa mắt và giảm nguy cơ đục thủy tinh thể.
Công dụng:Hỗ trợ và ngăn ngừa tổn thương mắt do ánh sáng xanh.
Duy trì và cải thiện độ nhạy tương phản của mắt.
Hỗ trợ hạn chế lão hóa mắt và giảm nguy cơ đục thủy tinh thể.
Đối tượng sử dụng: 
Người mắt hay mỏi, nhìn mờ, giảm thị lực.
Người làm việc nhiều với máy tính hay các thiết bị thông minh trong thời gian dài.
Người muốn hỗ trợ tăng cường sức khỏe mắt
Hướng dẫn sử dụng
Ngày uống 1 viên
Lưu ý: 
Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.
Người đang dùng thuốc khác hay phụ nữ có thai hoặc cho con bú cần hỏi ý kiến của bác sĩ trước khi sử dụng.
Ngưng sử dụng nếu có triệu chứng bất thường.
Bảo quản nói khô ráo, tránh ánh sáng trực tiếp để xa tầm tay trẻ.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh

', 429000, N'https://fanbi-store.jp/img/goods/L/43974_00.jpg', N'Eyes')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'BNGR', N'Bột Nghệ Giải Rượu Orihiro 20 gói Nhật Bản', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Bột nghệ giải rượu Orihiro là thực phẩm chức năng dành cho người hay sử dụng rượu bia. Với thành phần chính là nghệ mùa thu kết hợp với các vitamin giúp giải rượu, chống say và giảm mệt mỏi khi uống rượu bia.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ bảo vệ gan và cải thiện chức năng gan.</li>
<li>Hỗ trợ giải rượu, chống say và giảm mệt mỏi khi uống rượu bia.</li>
<li>Giải độc gan, giảm sức ép cho gan và hạn chế tác hại của rượu bia đối với sức khỏe.</li>
<li>Hỗ trợ gan và hệ thần kinh không bị ảnh hưởng bởi các độc tố trong rượu bia.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người trưởng thành thường xuyên sử dụng rượu bia.</li>
<li>Người cải thiện và tăng cường sức khỏe.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul> 
<li>Sử dụng 1 gói hòa tan với 200ml nước ấm, (có thể nuốt trực tiếp).</li>
<li>Uống trước hoặc sau khi uống rượu đều được.</li>
<li>Bảo quản: nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Người dưới 18 tuổi, phụ nữ mang thai và cho con bú không được sử dụng.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 159000, N'https://jcs.com.vn/wp-content/uploads/2021/05/Bot-Nghe-Ho-Tro-Giai-Ruou-Orihiro-Nhat-Ban-3.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'BogatraQY', N'Trà Bogatra Trà thảo dược Bổ Gan ', N'<h3>Thông tin sản phẩm</h3><br>
<p>Boga Tra hay Trà bổ gan Bogatra Học Viện Quân Y là sản phẩm trà hỗ trợ thanh nhiệt, giải độc gan được nghiên cứu và sản xuất bởi Trung tâm nghiên cứu ứng dụng sản xuất TPCN Học Viện Quân Y. Với thành phần 100% từ: Cà gai leo, Diệp hạ châu dằng, Actiso và Kim ngân hoa.<p><br>
<h3>Công dụng:</h3><br>
<ul>
<li>Hỗ trợ thanh nhiệt, giải độc hiệu quả gan.</li>
<li>Tăng cường các chức năng gan.</li>
<li>Giảm các triệu chứng thường gặp ở người suy giảm chức năng gan.</li>
<li>Cải thiện tiêu hóa và tăng cường sức khỏe.</li>
</ul>
<h3>Đối tượng sử dụng:<h3><br>
<ul>
<li>Người bị suy giảm chức năng gan.</li>
<li>Người gặp các triệu chứng: Mẩn ngứa, phát ban, nổi mề đay, rôm sảy, chán ăn.</li>
<li>Người bị vàng da và vàng mắt do gan.</li>
<li>Người sử dụng rượu bia, thuốc có hại cho gan.</li>
<li>Người có nhu cầu tăng cường sức khỏe.</li>
<h3>Hướng dẫn sử dụng:</h3><br>
<p>Cho túi trà vào cốc chứa 100-150ml nước sôi. Để từ 3-5 phút rồi sử dụng.
Ngày uống dưới 5 gói.<p><br>
<h3>Lưu ý:</h3> <br>
<ul>
<li>Bảo quản: Nơi khô mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.</li>
<li>Không dùng cho người mẫn cảm với thành phần nào của sản phẩm.</li>
<li>Phụ nữ có thai và trẻ em dưới 6 tuổi tham khảo ý kiến bác sỹ trước khi dùng.</li>
<li>Không sử dụng quá 5 gói trên ngày.</li>
<li>Hạn chế sử dụng các chất có hại cho gan như bia rượu,…</li>
<li>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 45000, N'https://hvqy.vn/data/upload_file/Image/tra-bogan/149169_150717_3_hop_tra_BogaTra_thanh_nhiet_giai_doc_gan_tri_man_ngua_2.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'BotOrihiro', N'Bột rau xanh Aojiru Orihiro Nhật Bản 30 gói', N'<h3>Thông tin sản phẩm:</h3><br>
<p>Bột rau xanh Aojiru Orihiro là thực phẩm chức năng dành cho người lười ăn rau hay gặp các vấn đề về đường tiêu hóa. Với thành phần được chiết xuất từ 6 loại rau hữu cơ giúp hỗ trợ bổ sung chất xơ và vitamin cần thiết hỗ trợ sức khỏe hằng ngày.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Bổ sung chất xơ, vitamin cần thiết trong các loại rau cho cơ thể.</li>
<li>Hỗ trợ cải thiện vấn đề về tiêu hóa như táo bón.</li>
<li>Hỗ trợ khử mùi hôi cơ thể, giảm hôi và nhiệt miệng.</li>
<li>Hỗ trợ giảm cân, ăn kiêng một cách khỏe mạnh và khoa học.</li>
<li>Hỗ trợ hạn chế calo và carbohydrate nạp vào cơ thể.</li>
<li>Thanh lọc, thải độc và ngăn ngừa mụn trứng cá.</li>
<li>Hỗ trợ chống lão hóa, tan nhan và giúp làn da luôn căng mịn và trẻ đẹp.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người gặp các vấn đề về tiêu hóa như táo bón.</li>
<li>Người lười ăn rau và hoa quả.</li>
<li>Người bị nóng trong hay bị kích ứng da.</li>
<li>Người hay mệt mỏi và kém tập trung.</li>
<li>Người muốn tăng cường sức khỏe.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Ngày sử dụng 1 gói.</li>
<li>Pha với 100ml nước nóng hoặc thức uống yêu thích của bạn như nước hoa quả….</li>
<li>Bột dễ chìm xuống nước, vì vậy hãy khuấy đều trước khi sử dụng.</li>
</ul><br>
<h3>Lưu ý:</h3><br> 
<li>Không dùng cho phụ nữ có thai, đang cho con bú và trẻ dưới 3 tuổi.</li>
<li>Không dùng cho người mẫn cảm với bất cứ thành phần nào sản phẩm.</li>
<li>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 475000, N'https://th.bing.com/th/id/OIP.JL1dR-tHchCfUlaJgaRhjgHaHa?pid=ImgDet&rs=1', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'CareRoyal', N'Sữa Ong Chúa Healthy Care Royal Jelly ', N'<h3>Thông tin sản phẩm</h3><br>
<p>Sữa Ong Chúa Healthy Care Royal Jelly 1000mg là thực phẩm chức năng bổ sung của Úc rất được ưa chuộng hiện nay. Với thành phần bổ sung 550mg sữa ong chúa tươi trong mỗi viên hỗ trợ tăng cường sức khỏe và phúc lợi nói chung.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ tăng cường sức khỏe, làm chậm các dấu hiệu tuổi tác trên da, cải thiện tình trạng tóc rụng, làm đẹp da, giúp kéo dài tuổi xuân.</li>
<li>Hỗ trợ dự phòng tiểu đường, béo phì, tim mạch, ổn định thần kinh.</li>
<li>Hỗ trợ bổ sung các dưỡng chất thiết yếu cho cơ thể, làm chậm và cải thiện các dấu hiệu của tuổi tác. Qua đó làm đẹp da, giúp làm mờ nám, tàn nhang, giữ độ ẩm cho da và làm săn chắc da.</li>
<li>Hỗ trợ cơ thể tăng cường sức đề kháng, nâng cao tuổi thọ.</li>
<li>Hỗ trợ bảo vệ da khỏi các tác động có hại từ bên ngoài như ánh nắng mặt trời, ô nhiễm…</li>
<li>Hỗ trợ cải thiện giấc ngủ và phòng mất ngủ.</li>
<li>Hỗ trợ tim mạch, huyết áp, tiểu đường và các vấn đề về gan.</li>
<li>Chất Pantothenic trong sữa ong chúa healthy care royal jelly 1000mg hỗ trợ ổn định hoạt động của hệ tiêu hóa, hỗ trợ giảm các biểu hiện đường ruột.</li>
<li>Hỗ trợ dự phòng phong thấp, viêm khớp.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người muốn có làn đẹp và phòng ngừa lão hóa da.</li>
<li>Người có nhu cầu bổi bổ cơ thể.</li>
<li>Người muốn tăng cường sức khỏe chung và phòng ngừa nhiều bệnh lý.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Uống 2 viên mỗi ngày hoặc theo chỉ dẫn của bác sĩ.</li>
<li>Liều lượng 2 viên mỗi ngày cung cấp khoảng 1000mg sữa ong chúa.</li>
<li>Viên sữa ong chúa Healthy Care là thực phẩm chức năng, không phải là thuốc nên tác dụng tùy thuộc vào cơ địa của mỗi người. Ngoài ra, nhà sản xuất khuyên cáo nên sử dụng từ 2 – 4 tuần để cảm nhận rõ hiệu quả của sản phẩm.</li>
<li>Bảo quản: Nơi khô ráo, thoáng mát và để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Sử dụng theo liều lượng khuyến cáo nhà sản xuất.</li>
<li>Không sử dụng cho người dưới 18 tuổi.</li>
<li>Phụ nữ mang thai, đang cho con bú và người đang dùng thuốc khác hỏi ý kiến của bác sĩ trước khi sử dụng.</li>
<li>Không sử dụng cho người hen suyễn, dị ứng hay mẫn cảm với bất cứ thàn phần nào của sản phẩm.</li>
<li>Sản phẩm có thể gây dị ứng nghiêm trọng đặc biệt với người hen huyễn và dị ứng.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 749000, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/433/153/products/sua-ong-chua-healthy-care-royal-jelly-1000mg-1.jpg?v=1628414702137', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'CNT', N'Collagen Nhau Thai Heo Orihiro 60000mg túi 120g', N'Thông tin sản phẩm: 
Collagen nhau thai heo Orihiro 60000mg là thực phẩm chức năng dành cho phụ nữ muốn có làn da khỏe đẹp. Với thành phần bổ sung 60000mg collagen hằng ngày giúp da săn chắc, đàn hồi, trắng sáng và chống lão hóa.
Công dụng: 
Bổ sung collagen giúp tăng sự đàn hồi da, làm giảm nếp nhăn.
Hỗ trợ sản sinh các tế bào mới giúp da hồi sinh nhanh chóng và làm giảm các vết thâm.
Chống lão hóa, kích thích sự tăng sinh tế bào sợi và biểu bì. Từ đó giúp làn da trẻ trung và mềm mại.
Ngăn chặn sự hình thành sắc tố melanin gây nám da.
Hỗ trợ xương chắc khỏe và phòng chống bệnh loãng xương.
Hỗ trợ phòng chống bệnh như: đau thắt lưng, thoát vị đĩa đệm…
Hỗ trợ tóc, móng tay, chân chắc khỏe.
Đối tượng sử dụng: 
Phụ nữ có nhu cầu làm đẹp da.
Người có nhu cầu phòng tránh lão hóa gây nám, tàn nhan.
Hướng dẫn sử dụng
Ngày uống 4g. Có thể sử dụng với thức uống yêu thích như: hoa quả, nước ép trái cây, sữa…
Nên uống từ 9 – 10 giờ sáng hoặc trước khi đi ngủ.
Lưu ý: 
Không dùng cho phụ nữ có thai, đang cho con bú và người dưới 18 tuổi.
Bảo quản nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 549000, N'https://cdn.shopify.com/s/files/1/0231/1294/1648/products/ORI1b_1024x1024.png?v=1583235916', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'CurcuminHP', N'Nano Curcumin HP Hộp 10 viên x 3 vỉ', N'<h3>Thông tin sản phẩm:</h3><br> 
<p>Người bị viêm loét dạ dày – hành tá tràng mà không biết đến Nano Curcumin HP thì thật đáng tiếc. Bởi Nano Curcumin HP HVQY được bào chế từ thảo dược tự nhiên. Trong đó, thành phần Nano Curcumin chiếm đến 25% trên mỗi viên – Đây là hoạt chất thiên nhiên giúp ức chế vi khuẩn HP, giảm viêm loét dạ dày.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ chống oxy hóa.</li>
<li>Hỗ trợ điều trị viêm loét dạ dày, hành tá tràng.</li>
<li>Giảm các cơn đau do viêm loét với các biểu hiện ợ hơi, ợ chua, đau rát thượng vị, đầy bụng.</li>
</ul><br>
<h3>Đối tượng sử dụng:</h3><br>
<ul>
<li>Người bị viêm loét dạ dày, hành tá tràng do HP.</li>
<li>Người có triệu chứng ợ hơi, ợ chua, đau rát thượng vị, đầy bụng, khó tiêu.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul> 
<li>Ngày uống 2 viên/lần, 1 – 2 lần/ngày.</li>
<li>Uống trước khi ăn 30 phút hoặc lúc đau.</li>
</ul><br>
<h3>Lưu ý:</h3><br>
<li>Lưu ý: mức độ hiệu quả nhanh hay chậm còn tùy thuộc vào mức độ nặng, nhẹ và cơ địa của mỗi người. Tuy nhiên, để đạt hiệu quả tốt nhất thì cần kết hợp với chế độ uống khoa học và luyện tập thể dục thể thao.</li>
<li>Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp.</li>
<li>Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>', 300000, N'https://cf.shopee.vn/file/461beba344733c15d8b40e461a22d846', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DetoxOri', N'Trà Detox Giảm Cân Orihiro Botanical Diet Tea', N'  <h3>Thông tin sản phẩm</h3><br>
    <p>Trà Detox giảm cân Orihiro Botanical Diet Tea là một sản phẩm detox giảm cân đến từ Nhật Bản. Với thành phần được
        bào chế từ thảo dược tự nhiên giúp thúc đẩy quá trình chuyển hóa chất béo, đốt cháy mỡ thừa và giảm cân hiệu
        quả.</p><br>
    <h3>Công Dụng</h3><br>
    <ul>
        <li>Thúc đẩy quá trình chuyển hóa chất béo, giúp giảm sự tích tụ của chất béo và mỡ thừa từ thức ăn. Từ đó hỗ trợ giảm cân an toàn và hiệu quả.</li>
        <li>Hỗ trợ thanh lọc và đào thải độc tố.</li>
        <li>Hỗ trợ giảm mụn nhọt do nóng trong và làm đẹp da.</li>    
    </ul><br>
    <h3>Đối tượng sử dụng</h3><br>
    <ul>
        <li> Người thừa cân, béo phì.</li>
        <li> Người bị nóng trong hay nổi mụn nhọt.</li>
        <li> Người có hệ tiêu hóa kém.</li>      
    </ul><br>
    <h3>Hướng dẫn sử dụng</h3><br>
    <ul>
        <li>Ngày dùng 1 – 2 gói.</li>
        <li>Cho 1 gói vào cốc đổ 250 – 300ml nước sôi.</li>
        <li>Chờ 3 – 5 phút có thể thưởng thức.</li>
        <li>Nên sử dụng trước khi đi ngủ 30 phút.</li>
        <li>Kết hợp với viên uống giấm đen giảm cân Orihiro để tăng cường hiệu quả.</li>
    </ul><br>
    <h3>Lưu ý</h3><br>
    <ul>
        <li>Bảo quản: nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
        <li>Không dùng cho người dưới 18 tuổi, phụ nữ có thai và đang cho con bú.</li>
        <li>Không sử dụng trà thay nước uống hằng ngày.</li>
        <li>Người đang điều trị bệnh lý cần hỏi ý kiến bác sĩ trước khi sử dụng.</li>
        <li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
    </ul>
', 400000, N'https://th.bing.com/th/id/OIP.OgCSUKPG2SCgy84GmDdk6wHaHa?pid=ImgDet&rs=1', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DHC', N'Viên Uống Rau Củ Quả DHC Perfect Vegetable 30 ngày', N'Thông tin sản phẩm: 
Viên uống rau củ DHC Perfect Vegetable là thực phẩm chức năng bảo vệ sức khỏe của Nhật. Với thành phần bào chế từ 32 loại rau củ giúp bổ sung chất xơ, chất dinh dưỡng cần thiết hằng ngày cho cơ thể. Từ đó hỗ trợ tốt cho hệ tiêu hóa và giảm tình trạng nóng trong hay táo bón.
Công dụng: 
Bổ sung chất xơ và vitamin cần thiết hằng ngày.
Hỗ trợ tốt cho hệ tiêu hóa.
Hỗ trợ giảm mụn và làm đẹp da.
Đối tượng sử dụng: 
Người lười hay không thích ăn rau.
Người bị nóng trong, nổi mụn hay táo bón.
Người bận rộn, chế độ ăn không đảm bảo.
Hướng dẫn sử dụng: 
Uống 4 viên/ngày, chia làm 2 lần sau ăn 30 phút.
Uống nhiều nước khi sử dụng sản phẩm.
Người mới hãy bắt đầu với liều lượng nhỏ.
Lưu ý: 
Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.
Dừng sử dụng khi thấy triệu chứng bất thường.
Sản phẩm điều chế nguyên liệu từ thiên nhiên và không sử dụng chất tạo màu, nên có thể có sự khác biệt màu sắc. Tuy nhiên chất lượng sản phẩm là như nhau.
Bảo quản nơi khô ráo, tránh ánh sáng trực tiếp.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 205000, N'https://cdn.shopify.com/s/files/1/0231/1294/1648/products/DHC3_db398d55-371b-499c-9c15-65152664f477_1024x1024.jpg?v=1583235911', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DHC01', N'DHC Collagen Hộp 10 chai ', N'Thông tin sản phẩm: 
DHC Collagen Beauty 7000 Plus là thực phẩm bảo vệ sức khỏe – chăm sóc da của Nhật. Với thành phần chính chứa 7000mg collagen kết hợp với các vitamin và khoáng chất giúp bổ sung hàm lượng collagen dồi dào duy trì độ ẩm cho da, nuôi dưỡng làn da căng mịn tràn đầy sức sống.
Công dụng: 
Bổ sung hàm lượng collagen giúp nuôi dưỡng làn da luôn căng mịn và nhanh chóng lấy lại vẻ trẻ trung, tươi mới.
Hỗ trợ và phòng ngừa chống lão hóa, tàn nhan, sạm da, nếp nhăn…
Duy trì độ ẩm cho da luôn mềm mại và tránh bị khô ráp.
Đối tượng sử dụng:
Người trên 18 tuổi.
Người có nhu cầu muốn làm đẹp da.
Người muốn hỗ trợ và phòng ngừa lão hóa ha.
Hướng dẫn sử dụng: 
Ngày uống 1 chai vào buổi tối trước khi đi ngủ.
Lắc đều và uống ngay sau khi mở lắp.
Có thể để trong tủ mát trước khi uống để tăng thêm hương vị.
Uống nhiều nước khi sử dụng sản phẩm.
Duy trì sử dụng từ 2 – 3 tuần để cảm nhận hiệu quả của sản phẩm.
Collagen DHC Dạng Nước Beauty 7000 Plus sử dụng từ nguyên liệu thiên nhiên và không sử dụng thêm chất điều chỉnh màu. Do đó, sản phẩm có khác nhau chút về màu sắc nhưng chất lượng vẫn như nhau.
Bảo quản: nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.
Lưu ý: 
Người dưới 18 tuổi, phụ nữ mang thai và cho con bú không nên sử dụng.
Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 849000, N'https://salt.tikicdn.com/ts/tmp/d6/e0/af/def0d916d727c8621db249c8ba6aeb16.jpg', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DHCB', N'Viên uống bổ mắt DHC Blubery Extract Gói 90 ngày', N'Thông tin sản phẩm
DHC Blubery Extract là thực phẩm bảo vệ sức khỏe được chiết xuất từ quả việt quất giàu anthocyanin kết hợp với vitamin giúp hỗ trợ mắt khỏe mạnh. Đặc biệt đối với người làm văn phòng thường xuyên sử dụng máy tính.
Công dụng: 
Bổ sung anthocyanin, vitamin và các dưỡng chất giúp hỗ trợ đôi mắt khỏe mạnh.
Hỗ trợ giảm mỏi mắt và giúp mắt hoạt động linh hoạt.
Hỗ trợ tổng hợp rhodopsin giúp mắt nhìn rõ hơn trong bóng tối.
Hỗ trợ giảm khô mắt và ngăn ngừa các bệnh lý về mắt.
Đối tượng sử dụng: 
Người thường xuyên làm việc với thiết bị điện tử.
Người hay mỏi mắt và mờ mắt.
Người có nhu cầu tăng cường thị lực mắt.
Hướng dẫn sử dụng: 
Người lớn uống 2 viên/ngày.
Kết hợp với viên uống chống ánh sáng xanh DHC (nếu bạn thường xuyên sử dụng thiết bị điện tử).
Hiệu quả sử dụng tùy vào cơ địa của mỗi người. Nhà sản xuất khuyến cáo sử dụng liều trình ít nhất 1 tháng và hạn chế sử dụng các thiết bị điện tử khi không cần thiết để thấy hiệu quả của sản phẩm tốt nhất.
Bảo quản: nơi khô ráo thoáng mát, tráng ánh sáng trực tiếp.
Lưu ý:
Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
Phụ nữ có thai, cho con bú và người dưới 18 tuổi hỏi ý kiến của bác sĩ trước khi sử dụng.
Hỏi ý kiến bác sĩ nếu bạn đang dùng thuốc khác.
', 849000, N'data:image/jpeg;base64,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', N'Eyes')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DHCFors', N'Viên giảm cân DHC Forskohlii Soft Capsule ', N'<h3>Thông tin sản phẩm </h3><br>
<p>Viên uống giảm cân DHC là một sản phẩm bảo vệ sức khỏe từ thương hiệu DHC. Sản phẩm được điều chế hoàn toàn từ thảo dược tự nhiên kết hợp với dầu dừa giúp thúc đẩy đốt cháy mỡ thừa trong cơ thể và giảm cân hiệu quả.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ giảm cảm giác thèm ăn và hấp thu chất béo.</li>
<li>Thúc đẩy quá trình đốt cháy mỡ thừa.</li>
<li>Hỗ trợ làn da mịn màng và ngăn tình trạng da chảy xệ khi giảm cân.</li>
</ul>
<h3>Đối tượng sử dụng: </h3>
<p>Người có nhu cầu giảm cân an toàn.</p><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Người lớn uống 1 – 2 viên/ngày.</li>
<li>Người mới nên sử dụng 1 viên/ngày để cơ thể thích nghi với sản phẩm.</li>
<li>Kết hợp với tập thể dục, thể thao để tăng hiệu quả sử dụng.</li>
</ul>
<h3>Lưu ý: </h3><br>
<ul>
<li>Phụ nữ mang thai, cho con bú và người dưới 18 tuổi không được sử dụng.</li>
<li>Tham khảo bác sĩ nếu dùng thuốc khác.</li>
<li>Bảo quản nơi khô ráo thoáng mát và để xa tầm tay trẻ em.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 499000, N'https://th.bing.com/th/id/R.a7711ece1fb22c61966832c324acddee?rik=6ZwHMl6oV1Ym1g&riu=http%3a%2f%2fwww.khoeaz.vn%2fpublic%2fupload%2fimages%2fsanpham%2fTPCN%2f03b9cb0f707b57831cfd357abd4017d0.jpg&ehk=Btw3rZcJbXmnXwMwTKr%2bXF2ClPqaHtFpY0LLdWZnHZw%3d&risl=&pid=ImgRaw&r=0', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'DTA', N'Định Tâm An Giấc Học Viên Quân Y 30 viên', N'Thông tin sản phẩm: 
Định Tâm An Giấc được điều chế hoàn toàn từ thảo dược tự nhiên. Với thành phần chính là nữ lang, lá vông, bình vôi kết hợp với 7 thảo dược chuyên về hỗ trợ mất ngủ. Giúp giảm căng thẳng mệt mỏi, hỗ trợ an thần, ngủ ngon giấc.
Công dụng: 
 Hỗ trợ an thần, ngủ ngon giấc.
 Hỗ trợ giảm tình trạng mệt mỏi, căng thẳng do mất ngủ, ngủ không sâu giấc.
Đối tượng sử dụng: 
Người mất ngủ dẫn đến mệt mỏi, căng thẳng.
 Người cao tuổi, người già bị mất ngủ, khó ngủ, ngủ không sâu giấc.
 Người bị rối loạn giấc ngủ, thường xuyên thức khuya.
Hướng dẫn sử dụng: 
Mỗi hộp Định Tâm An Giấc có 30 viên được khuyến cáo sử dụng theo: ngày uống 1 – 2 viên/lần, ngày uống 1 lần. Uống trước khi đi ngủ từ 30 – 60 phút.
Hiệu quả sử dụng nhanh hay chậm tùy vào mức độ nặng nhè và cơ địa của mỗi người. Thông thường, liệu trình sử dụng thường từ 1 – 3 tháng. Và để nâng cao hiệu quả sử dụng thì người bệnh cần ăn uống khoa học và tập thể dục thường xuyên.
Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.
Lưu ý:
Không sử dụng với những người mẫn cảm với bất cứ thành phần nào của sản phẩm.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 269000, N'https://hvqy.vn/images/product/dinh-tam-an-giac-hoc-vien-quan-y-hop-30-vien-196.jpg', N'Sleep')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Enzyme', N'Enzyme Thực Vật Orihiro 60 viên', N'Thông tin sản phẩm: 
Enzyme thực vật Orihiro là thực phẩm chức năng dành cho người muốn tăng cường hệ tiêu hóa. Với thành phần được chiết xuất thực vật lên men và vi khuẩn axit lactic hỗ trợ cải thiện môi trường đường ruột của bạn.
Công dụng:
Cải thiện môi trường đường ruột lành mạnh.
 Bổ sung các dưỡng chất giúp tăng cường sức đề kháng.
 Hỗ trợ làm đẹp da và chống lão hóa.
 Hỗ trợ thải độc cơ thể.
 Hỗ trợ phòng ngừa và điều trị triệu chứng như: mệt mỏi, sức tập trung kém…
 Hỗ trợ phòng tránh ốm vặt như: cảm cúm, đau đầu…
Đối tượng sử dụng: 
Người có chế độ ăn uống không lành mạnh.
 Người có hệ tiêu hóa kém.
 Người hay ốm vặt.
 Người nóng trong, nổi mụn.
 Người thiếu hụt vitamin và khoáng chất.
 Người muốn tăng cường sức khỏe, tăng cường sức đề kháng.
Hướng dẫn sử dụng: 
Uống 1 viên/ngày sau ăn 30 phút.
Uống nhiều nước khi sử dụng sản phẩm để hấp thu tốt hơn.
Bảo quản: nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em
Lưu ý: 
Không dùng cho người dưới 7 tuổi, phụ nữ có thai và đang cho con bú.
 Người sử dụng thuốc khác hỏi ý kiến bác sĩ trước khi sử dụng.
 Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 379000, N'https://th.bing.com/th/id/R.572500010837b47ec846882a5a840775?rik=7IseatvDWNO%2fBw&pid=ImgRaw&r=0', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Fucoidan', N'Tảo Fucoidan Orihiro 90 viên Nhật Bản', N'Thông tin sản phẩm: 
Tảo Fucoidan Orihiro Nhật Bản là thực phẩm chức năng dành cho người muốn hỗ trợ tăng cường sức khỏe. Với thành phần chính là Fucoidan giúp hỗ trợ tăng cường sức khỏe và phòng chống ung thư hiệu quả.
Công dụng: 


Tăng cường hệ miễn dịch và sức đề kháng.
Ngăn chăn sự hình thành và phát triển của tế bào ung thư.
Hỗ trợ tiêu diệt hoàn toàn những tế bào ung thư mới hình thành ở giai đoạn đầu.
Chống oxy hóa và ngăn ngừa quá trình lão hóa.
Hỗ trợ giảm tác dụng phụ khi điều trị và xạ trị ung thư.
Đối tượng sử dụng: 
Người muốn tăng cường sức khỏe và tăng cường sức đề kháng.
Người có hệ miễn dịch kém.
Người muốn phòng ngừa ung thư.
Người đang trong quá trình hóa trị, xạ trị.
Hướng dẫn sử dụng: 
Ngày uống 3 viên với nước hoặc nước ấm.
Nên uống sau ăn 30 phút.
Uống nhiều nước khi sử dụng sản phẩm.
Người mới hãy bắt đầu với liều lượng nhỏ.
Vui lòng tuân theo liều lượng hằng ngày.
Lưu ý: 
Không dùng cho phụ nữ có thai, cho con bú và trẻ em dưới 3 tuổi.
Bảo quản nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chứa bệnh.
', 749000, N'https://mypham-nhatban.com/media/catalog/product/cache/1/thumbnail/600x600/9df78eab33525d08d6e5fb8d27136e95/1/5/1500.jpg', N'Resistance')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Gamosa', N'Thanh Đường Gamosa HVQY Lọ 60 viên', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Thanh Đường Gamosa là sản phẩm Thực phẩm bảo vệ sức khỏe do Học Viện Quân Y nghiên cứu và sản xuất. Với 100% thành phần các dược liệu quý từ thiên nhiên, Thanh Đường Gamosa được chỉ định dành cho các đối tượng đang mắc bệnh tiền tiều đường, bệnh tiểu đường cùng và những người có nguy cơ gặp các biến chứng đái tháo đường, mà không gây tác dụng phụ.</P><br>
<h3>Công dụng:</h3><br>
<ul>
<li>Hỗ trợ giảm đường huyết.</li>
<li>Giảm các biến chứng do đái tháo đường.</li>
<li>Hỗ trợ điều trị, phòng ngừa bệnh tiểu đường.</li>
<li>Các lợi ích khác cho sức khỏe từ tác dụng dược lý của các dược liệu thành phần.</li>
</ul><br>
<h3>Đối tượng sử dụng:</h3><br> 
<ul>
<li>Người bệnh tiền tiểu đường, người có nguy cơ mắc bệnh tiểu đường.</li>
<li>Người mắc bệnh tiểu đường.</li>
<li>Người có nguy cơ gặp các biến chứng bệnh tiểu đường.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul>
<li>Người bệnh tiểu đường: Ngày uống 2 lần, mỗi lần 2 viên, uống trước bữa ăn 15 – 20 phút.</li>
<li>Người bệnh tiền tiểu đường hoặc uống duy trì: Ngày uống 2 lần, mỗi lần 1 viên.</li>
<li>Khuyến cáo: Thanh Đường Gamosa là thực phẩm chức năng, hướng tới tác dụng bền vững, lâu dài. Vì vậy người bệnh nên kiên trì sử dụng để ổn định đường huyết một cách tốt nhất. Các chuyên gia khuyến cáo nên dùng Thanh Đường Gamosa hàng ngày trong ít nhất từ 6-8 tuần liên tục. Mỗi năm dùng từ 3-4 đợt.</li>
<li>Bảo quản: Nơi khô mát, tránh ánh nắng trực tiếp. Để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý:</h3><br>
<ul>
<li>Không sử dụng khi mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
<li>Người bị huyết áp thấp không nên sử dụng do thành phần chứa mướp đắng, dây thìa canh, thiên hoa phấn.</li>
<li>Có thể gây mất ngủ nhẹ nếu uống trước khi ngủ bởi tác dụng phụ của giảo cổ lam.</li>
<li>Phụ nữ mang thai hoặc cho con bú không nên sử dụng, nếu bắt buộc sử dụng phải tham khảo ý kiến bác sỹ.</li>
<li>Kết hợp chế độ ăn uống, tập luyện khoa học để tăng cường thể chất và hiệu quả điều trị.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>', 199000, N'https://thanhduonggamosa.com/images/photo/news/phan-phoi-thanh-duong-gamosa-hvqy-o-vinh-phuc.jpg', N'HighBlood')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'GR', N'Viên uống giải rượu 90 ngày', N'Thông tin sản phẩm: 
DHC Concentrated Turmeric là viên uống hỗ trợ thải độc gan và giải rượu đến từ Nhật Bản. Với thành phần được chiết xuất từ nghệ cô đặc giúp hỗ trợ giải độc gan và bảo vệ sức khỏe khỏi tác hại của rượu bia.
Công dụng: 
Hỗ trợ chống oxy hóa và hỗ trợ giải độc gan.
 Hỗ trợ và bảo vệ sức khỏe khỏi tác hại của rượu bia.
Đối tượng sử dụng: 
 Người trưởng thành thường xuyên sử dụng rượu bia.
 Người hay bị mệt và dễ say.
 Người có chế độ sinh hoạt đảo lộn.
Hướng dẫn sử dụng:
Cách dùng: người lớn uống 2 viên/ngày
 Bảo quản: nơi khô ráo, thoáng mát và để xa tầm tay trẻ em.
Lưu ý: 
Sản phẩm được sử dụng từ nguyên liệu thiên nhiên và không sử dụng chất tạo màu. Do đó có đôi chút khác biệt về màu sắc nhưng không ảnh hưởng đến chất lượng.
 Thao khảo ý kiến bác sĩ nếu bạn đang sử dụng sản phẩm khác.
 Không dùng cho người dười 18 tuổi, phụ nữ có thai và đang cho con bú.
 Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 799000, N'https://nhathuoc365.vn/upload_images/images/vien-uong-chong-say-ruou-giai-doc-gan-cua-dhc.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'KidDHA', N'Viên Uống DHA Healthy Care Kids High Strength ', N'<h3>Thông tin sản phẩm:</h3><br> 
<p>DHA Healthy Care Kids High Strength là thực phẩm chức năng bổ sung DHA cho bé có nguồn gốc từ tảo. Với công thức bổ sung 100mg DHA giúp duy trì sự tăng trưởng và phát triển khỏe mạnh cho trẻ sơ sinh và trẻ em có chế độ ăn uống không đủ chất.</p><br>
<h3>Công dụng:</h3><br>
<ul> 
<li>Hỗ trợ tăng cường phát triển não, thị lực và hệ thần kinh của trẻ.</li>
<li>Hỗ trợ tăng cường khả năng tư duy sáng tạo và độ nhạy bén của trẻ.</li>
<li>Hỗ trợ sự phát triển và sinh trưởng khỏe mạnh.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Trẻ từ 4 tháng đến 6 tuổi: uống 1 viên mỗi ngày.</li>
<li>Trẻ từ 7 – 12 tuổi: uống 2 viên uống ngày hoặc theo chỉ dẫn của bác sĩ.</li>
<li>Trẻ trên 12 tuổi: uống 3 viên mỗi ngày.</li>
<li>Với trẻ nhỏ thì có thể xoắn hoặc cắt viên nang đút cho trẻ hoắc cho vào thức ăn.</li>
</ul><br>
<h3>Lưu ý:</h3><br> 
<ul>
<li>Bảo quản: nơi khô ráo thoáng mát và tránh ánh sáng trực tiếp.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 255000, N'https://healthstore.vn/wp-content/uploads/2021/06/Vien-uong-bo-sung-DHA-Healthy-Care-Kids-high-strength-DHA-1.png', N'Eyes')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'KQR', N'Viên Uống Khổ Qua Rừng Mudaru', N'Thông tin sản phẩm: 
Viên Uống Khổ Qua Rừng Mudaru là thực phẩm chức năng, được sản xuất tại Việt Nam –  Đạt rất nhiêu chứng nhận, tiêu chuẩn trước khi phân phối ra thị trường. Giúp người bị tiểu đường, mỡ máu, huyết áp cao an tâm lựa chọn, sử dụng – không lo tác dụng phụ.
Công dụng: 
Giảm đường huyết, kiểm soát glucose trong máu tốt cho người bệnh tiểu đường.
Thanh nhiệt giải độc.
Tăng cường sức khỏe
Phòng ngừa và giảm nguy cơ biến chứng bệnh đái tháo đường.
Hỗ trợ hạ và ổn định huyết áp,…
Đối tượng sử dụng: 
Người mắc bệnh tiểu đường và có nguy cơ mắc tiểu đường tuýp 2.
Người bị nóng, nhiệt.
Người có nhu cầu giảm cân.
Người cao huyết áp.
Người muốn chăm sóc sức khỏe,…
Hướng dẫn sử dụng: 
Ngày uống 2 lần, mỗi lần 1-2 viên trước khi ăn.
Bảo quản: Nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.
Kết hợp với chế độ ăn uống, dinh dưỡng và tập luyện khoa học.
Người tì vị hư hàn, phụ nữ trong thời kỳ thụ thai, phụ nữ đang cho con bú không nên sử dụng.
Chống chỉ định cho người bị huyết áp thấp và người đường huyết thấp.
Người thiếu máu và thực nhiệt không nên sử dụng thường xuyên.
Sản phẩm không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh
Nên sử dụng kết hợp thêm sản phẩm Trà Khổ Qua Rừng Mudaru để đạt hiệu quả cao nhất
', 349000, N'https://cdn.chiaki.vn/unsafe/0x900/left/top/smart/filters:quality(90)/https://chiaki.vn/upload/seller/1609344108-dsc-7613-2.jpg', N'HighBlood')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'LaroxenQY', N'Siro Laroxen Học Viện Quân Y hộp 100ml', N'<h3>Thông tin sản phẩm </h3><br>
<p>Siro Laroxen Học Viện Quân Y được điều chế từ 3 dược liệu chuyên hỗ trợ mất ngủ như: lạc tiên, bình vôi, vông nem. Sản phẩm có tác dụng cải thiện suy nhược thần kinh, giúp an thần, ngủ ngon. Đặc biệt, Laroxen được điều chế dạng Siro có vị ngọt, dễ uống phù hợp với nhiều đối tượng từ người già đến trẻ em.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Giúp giảm hồi hộp, lo âu, mất ngủ, giấc ngủ chập chờn, ngủ không sâu giấc.</li>
<li>Giúp an thần, ngủ ngon.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người khó ngủ, mất ngủ, ngủ không sâu giấc.</li>
<li>Người suy nhược thần kinh, lo âu, hồi hộp gây mất ngủ.</li>
<li>Người muốn phòng tránh các triệu chứng mất ngủ.</li>
<li>Trẻ em quấy khóc mất ngủ.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br> 
<ul>
<li>Người lớn và trẻ em trên 12 tuổi uống 15ml.</li>
<li>Trẻ em 2 – 12 tuổi uống 5 – 10ml.</li>
<li>Uống trước khi đi ngủ 30 phút.</li>
</ul><br>
<h3>Lưu ý:</h3><br>
<ul> 
<li>Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.</li>
<li>Phụ nữ có thai, người mắc chứng trầm cảm không nên sử dụng.</li>
<li>Không sử dụng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 120000, N'https://th.bing.com/th/id/OIP.sgauQFnBypkAKUt3Ww6mGwHaHa?pid=ImgDet&rs=1', N'Sleep')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Lecithin', N'Viên Uống Mầm Đậu Nành Healthy Care Super Lecithin', N'Thông tin sản phẩm
Mầm đậu nành Healthy Care Super Lecithin 1200mg là thực phẩm chức năng hỗ trợ duy trì sức khỏe và chức năng gan. Với thành phần bổ sung lecithin tự nhiên chứa các chất dinh dưỡng hỗ trợ phân hủy chất béo trong chế độ ăn uống và giúp duy trì chức năng gan khỏe mạnh.
Công dụng: 
Hỗ trợ duy trì sức khỏe và phúc lợi chung.
Hỗ trợ duy trì hệ tiêu hóa khỏe mạnh.
Hỗ trợ chuyển hóa chất béo giúp giảm cholesterol.
Hỗ trợ duy trì chức năng và sức khỏe gan.
Đối tượng sử dụng: 
Người có chức năng gan kém và muốn tăng cường chức năng gan.
Người có cholesterol trong máu cao.
Người muốn duy trì và tăng cường hệ tiêu hóa.
Hướng dẫn sử dụng: 
Người lớn: uống 1 – 3 viên mỗi ngày cùng với bữa ăn hoặc theo chỉ dẫn của bác sĩ.
Trẻ em dưới 12 tuổi: chỉ sử dụng theo hướng dẫn của chuyên gia y tế.
Bảo quản: nơi khô ráo dưới 30 độ C và tránh ánh sáng trực tiếp.
Lưu ý: 
Không dùng cho người mẫn cảm với thành phần nào của sản phẩm.
Sản phẩm có chứa đậu nành.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 259000, N'https://product.hstatic.net/200000159119/product/4f14ea07-5b13-4a0e-b372-58dc16945c0f_2cec018549494a54a192a1482678495f_grande.jpg', N'Resistance')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'LipoWhite', N'Trị nám Lipo White Plus 30ml', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Kem Lipo White Plus là sản phẩm trị nám cao cấp của Học Viện Quân Y. Với thành phần được chiết xuất từ thiên nhiên giúp sáng da và làm mờ các vùng da bị thâm, nám, tàn nhang…</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ dưỡng và làm sáng da.</li>
<li>Giảm mờ các vùng da bị: thâm, nám, sạm, tàn nhang, nhiều đốm đồi mồi.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<li>Phụ nữ bị nám, sạm da, tàn nhang sau khi sinh, do di truyền.</li>
<li>Phụ nữ bị nám, sạm da do rối loạn nội tiết tố, bị lão hóa da do tuổi tác.</li>
<li>Người bị nám do sử dụng mỹ phẩm và dó tác hại của tia UV.</li>
</ul><br>
<h3>Hướng dẫn sử dụng</h3><br>
<ul>
<li>Sử dụng sản phẩm vào ban ngày hoặc tối đều được.</li>
<li>Rửa sạch vùng da trước khi dùng.</li>
<li>Kết hợp với viên uống sáng da sương mai để đạt hiệu quả tốt nhất.</li>
</ul><br>
<h3>Lưu ý:</h3><br> 
<ul>
<li>Sản phẩm dùng ngoài da, để xa tầm tay trẻ em.</li>
<li>Không sử dụng trên vùng da bị tổn thương.</li>
<li>Ngưng sử dụng nếu thấy dấu hiệu phát ban hay kích ứng trên da.</li>
</ul>
', 320000, N'https://hvqy1.com/wp-content/uploads/2019/06/kem-tri-nam-lipo-white-cho-da-trang-min-2.jpg', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'LLP', N'Liver Life Plus Viên Uống Bổ Gan', N'<h3> Thông tin sản phẩm </h3><br>
<p>Viên uống bổ gan Liver Life Plus là sản phẩm thực phẩm bảo vệ sức khỏe từ 100% thành phần dược liệu tự nhiên. Với công dụng nổi bật trong: hỗ trợ giải độc gan, bảo vệ gan, tăng cường chức năng gan. Đồng thời hỗ trợ giảm nguy cơ tổn thương gan do rượu bia hoặc các chất độc hại gây nên.</p><br>
<h3>Công dụng</h3><br>
<ul>
<li>Hỗ trợ giải độc </li>
<li>Bảo vệ gan, tăng cường chức năng gan.</li>
<li>Hỗ trợ giảm nguy cơ tổn thương gan do uống nhiều rượu, bia.</li>
<li>Giảm ảnh hưởng của các chất độc hại gây ra cho gan.</li>
</ul><br>
<h3>Đối tượng sử dụng</h3><br>
<ul>
<li>Người bị suy gan, viêm gan, xơ gan,…</li>
<li>Người bị suy giảm chức năng gan.</li>
<li>Người có các biểu hiện: men gan cao, mệt mỏi, khó tiêu vàng da, táo bón, mẩn ngứa, mề đay,…</li>
<li>Người thường xuyên uống rượu bia và sử dụng các loại thuốc có hại cho gan.</li>
<li>Người có nhu cầu cải thiện sức khỏe.</li>
</ul><br>
<h3>Hướng dẫn sử dụng </h3><br>
<ul>
<li>Uống 1-2 viên/lần x 2-3 lần/ngày, sau bữa ăn từ 30 phút – đến 1 giờ.</li>
</ul><br>
<h3>Lưu ý</h3><br>
<ul>
<li>Nơi khô mát, tránh ánh nắng trực tiếp. Để xa tầm tay trẻ em.</li>
<li>Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
<li>Phụ nữ có thai hoặc trẻ em dưới 10 tuổi nên tham khảo ý kiến bác sỹ trước khi sử dụng. <./li>
<li>Không sử dụng quá liều lượng hoặc tự ý thay đổi liều sử dụng.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>', 80000, N'https://thuockedon24h.vn/images/products/2020/07/20/132397058203862875.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'MenBM', N'Men Sống Bạch Mai Hộp 20 ống', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Ngày nay, thói quen ăn uống thiếu khoa học gây ra rối loạn tiêu hóa ở mọi lứa tuổi. Đặc biệt là trẻ em. Bệnh lý này tuy không dẫn đến tử vong, nhưng ảnh hưởng nhiều đến phát triển cơ thể. Để giải quyết vấn đề này, Healthy CT xin chia sẻ với bạn sản phẩm Men Sống Bạch Mai – hỗ trợ cải thiện rối loạn đường ruột.</p><br>
<h3>Công dụng:</h3><br>
<ul>
<li>Bổ sung lợi khuẩn cho đường tiêu hóa, hỗ trợ cân bằng hệ vi sinh đường ruột.</li>
<li>Giúp tăng cường sức đề kháng, tăng cường tiêu hóa.</li>
<li>Kích thích ăn ngon miệng ở trẻ nhỏ, tăng cường khả năng hấp thụ chất dinh dưỡng.</li>
<li>Phòng chống và hỗ trợ giảm các triệu chứng rối loạn tiêu hóa như: tiêu chảy, táo bón, phân sống…</li>
<li>Phòng chống và hỗ trợ hiệu quả rối loạn tiêu hóa do dùng kháng sinh dài ngày.</li>
<li>Đảm bảo hấp thu, phát triển bình thường và ổn định của bé.</li>
<li>Cải thiện tình trạng táo bón, giảm nguy cơ mắc bệnh trĩ.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Trẻ em suy dinh dưỡng, biếng ăn, chậm lớn.</li>
<li>Người bị rối loạn tiêu hóa như: đầy hơi, đau bụng, tiêu chảy, táo bón…</li>
<li>Người bị rối loạn tiêu hóa do dùng kháng sinh kéo dài.</li>
<li>Người muốn tăng cường sức khỏe, tăng cường hệ tiêu hóa.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul>
<li>Trẻ em trên 2 tuổi: Dùng ngày 2 ống, chia làm 2 lần sử dụng sáng, tối.</li>
<li>Người lớn: Dùng 4 ống/ngày chia làm 2 lần sử dụng sáng, tối.</li>
<li>Trẻ em dưới 2 tuổi: Liên hệ hotline để được tư vấn.</li>
<ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Sản phẩm dưới dạng men sống, dùng sau khi ăn từ 5 – 10 phút để có hiệu quả tốt nhất. Ngoài ra, sản phẩm được khuyến cáo sử dụng hằng ngày cho đến khi hệ tiêu hóa được cân bằng. Tránh ngắt quãng để đạt hiệu quả tốt.</li>
<li>Bảo quản: Nơi khô mát, tránh ánh sáng trực tiếp, để xa tầm tay trẻ em.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
<li>Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
<li>Hiệu quả sử dụng sản phẩm tùy vào mức độ của mỗi người. Để nâng cao hiệu quả sử dụng, cần kết hợp với chế độ ăn uống, sinh hoạt khoa học và luyện tập thể dục thường xuyên.</li>
</ul>', 160000, N'https://th.bing.com/th/id/R.b7698235b332db53debb586f8720eb70?rik=pVvZAhyf0aHSkg&pid=ImgRaw&r=0', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'MenOrihiro', N'Men vi sinh Orihiro 16 gói Nhật Bản', N'<h3>Thông tin sản phẩm</h3><br>
<p>Men vi sinh Orihiro là thực phẩm chức năng hỗ trợ tăng cường hệ tiêu hóa từ Nhật. Với thành phần bổ sung lợi khuẩn axit lactic, lactobaccilus, lactoferrin giúp hỗ trợ tạo môi trường đường ruột khỏe mạnh và ngăn ngừa các bệnh về tiêu hóa, đại tràng.</p><br>
<h3>Công dụng:</h3><br>
<ul>
<li>Hỗ trợ điều trị viêm đại tràng, hội chứng ruột kích thích.</li>
<li>Giúp cân bằng hệ vi sinh đường ruột, kích thích sự phát triển của các lợi khuẩn giúp đường ruột khỏe mạnh.</li>
<li>Hỗ trợ giảm các rối loạn ở đường ruột.</li>
<li>Tăng cường chức năng tiêu hóa. Hỗ trợ phòng ngừa các trường hợp táo bón, viêm đại tràng, ăn không tiêu…</li>
<li>Hỗ trợ tăng khả năng hấp thu dinh dưỡng nhằm nâng cao sức khỏe.</li>
</ul><br>
<h3>Đối tượng sử dụng:</h3><br>
<ul>
<li>Người hay bị rối loạn tiêu hóa như: chướng bụng, đầy hơi, táo bón, tiêu chảy…</li>
<li>Người bị viêm đại tràng cấp và mãn tính.</li>
<li>Người lười ăn và hấp thu kém.</li>
<li>Người bị chứng bất dung nạp đường lactose.</li>
<li>Người ăn uống thất thường, thiếu chất xơ.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Ngày uống 1 gói với nước ấm (không dùng với nước nóng).</li>
<li>Sử dụng đều đặn giúp tăng cường sức khỏe đường ruột.</li>
<li>Dùng được cho trẻ từ 3 tuổi trở lên.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<li>Phụ nữ có thai, đang cho con bú hỏi ý kiến bác sĩ trước khi sử dụng.</li>
<li>Bảo quản nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 269000, N'https://th.bing.com/th/id/OIP.eUpO4LpiyIo5BOILBE9dAwHaHa?pid=ImgDet&rs=1', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Mudaru', N'Trà Khổ Qua Rừng Mudaru Hộp 50 túi', N'<h3>Thông tin sản phẩm:</h3>
<br>
<p> Trà Khổ Qua Rừng Mudaru là dạng túi lọc, kết hợp giữa Khổ Qua Rừng (với 90%) và cỏ ngọt (10%). Sử dụng hằng ngày giúp: ổn định đường huyết, hạ mỡ máu, huyết áp. Giúp bảo vệ sức khỏe dành cho bạn và người thân trong gia đình.</p><br>
<h3>Công dụng:</h3>
<br>
<ul> 
<li>Thanh nhiệt giải độc.</li>
<li>Hạ đường huyết, hỗ trợ phòng ngừa, điều trị bệnh tiểu đường.</li>
<li>Giảm nguy cơ biến chứng tiểu đường.</li>
<li>Giảm cholesterol, bảo vệ sức khỏe tim mạch.</li>
<li>Ngăn ngừa oxi hóa, phòng ngừa bệnh ung thư.</li>
<li>Hạ huyết áp, tăng cường sức khỏe.</li>
</ul> <br>
<h3>Đối tượng sử dụng:</h3><br>
<ul>
<li>Người mắc bệnh tiền tiểu đường, đái tháo đường.</li>
<li>Người bị nóng, nhiệt.</li>
<li>Người béo phì, thừa cân.</li>
<li>Người cao huyết áp.</li>
<li>Người có nhu cầu chăm sóc sức khỏe,…</li>
</ul><br>
<h3> Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Lấy 1 gói trà cho vào tách, chế thêm 120ml nước sôi và chờ từ 3-5 phút là có thể dùng.</li>
<li>Có thể thêm 1 chút đường cỏ ngọt hoặc mật ong tùy khẩu vị.</li>
<li>Bảo quản: Nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em. </li>
</ul><br>
<h3> Lưu ý: </h3><br>
<ul> 
<li>Sử dụng từ 3-5 lần/ngày.</li>
<li>Kết hợp ăn uống, tập luyện khoa học.</li>
<li>Không sử dụng cho người tì vị hư hàn, phụ nữ muốn sinh con, phụ nữ có thai hoặc đang cho con bú.</li>
<li>Người huyết áp thấp và người đường huyết thấp không nên sử dụng.</li>
<li>Nên sử dụng kết hợp thêm Viên Uống Khổ Qua Rừng Mudaru để tăng hiệu quả.</li>
</ul>
', 229000, N'https://toicanban.net/product/combo-3-tra-tui-loc-kho-qua-rung-mudaru-25-tui-hop/058f70d9ebd4d52b0285d278faac670b.jpg
', N'HighBlood')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'MVS', N'Men Vi Sinh Tiêu Hóa 1 Hộp 30 gói', N'Thông tin sản phẩm: 
Men Vi Sinh 11 – 1 Nhật Bản chứa lợi khuẩn Lactobacillus Paraplantarum với ưu điểm vượt trội như cân bằng hệ vi sinh đường ruột, ngăn ngừa nhiễm trùng, an toàn đối với mọi người và giúp tăng cường đường tiêu hóa.
Công dụng: 
Bổ sung hệ vi sinh đường ruột, kích thích các vi khuẩn có lợi.
Cải thiện chức năng hệ tiêu hóa, tăng khả năng hấp thụ chất dinh dưỡng.
Hỗ trợ điều trị các bệnh liên quan đến hệ tiêu hóa, đường ruột và dạ dày.
Tăng cường sức đề kháng của cơ thể.
Đối tượng sử dụng: 
Người bị rối loạn tiêu hóa, chướng bụng, đầy hơi.
Người hấp thu thức ăn kém, táo bón.
Người bị rối loạn hệ vi sinh đường ruột do sử dụng kháng sinh nhiều ngày.
Người có sức đề kháng kém.
Người muốn phòng chống các bệnh về tiêu hóa.
Hướng dẫn sử dụng
Trẻ em: 1 gói/ngày.
Người lớn: 1 – 3 gói/ngày.
Pha với nước uống trong hoặc sau bữa ăn, có thể trộn cùng thức ăn đã được chế biến.
Lưu ý: 
Hiệu quả sử dụng sản phẩm tùy vào mức độ nặng, nhẹ và cơ địa của mỗi người. Để nâng cao hiệu quả cần kết hợp với chế độ ăn uống khoa học và luyện tập thể dục thường xuyên.
Ngoài ra, sản phẩm khuyến cáo sử dụng hằng ngày cho đến khi hệ tiêu hóa được cân bằng. Tránh ngắt quãng nếu bạn có điều kiện để đạt hiệu quả tốt nhất.
Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
', 2250000, N'https://healthyct.vn/wp-content/uploads/2021/01/men-vi-sinh-cao-cap-11-1-nhat-ban-2.jpg', N'Digestion')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Nam', N'Nấm đông trùng hạ thảo khô Tâm An (50g)', N'* Thông tin sản phẩm: 
Nấm Đông Trùng Hạ Thảo Khô Tâm An là sản phẩm sản xuất từ trùng thảo của chủng nấm Cordyceps Militaris được nuôi trồng trên sinh khối hỗn hợp của ấu trùng nhộng tằm tươi kết hợp bột đậu xanh và gạo lứt,… Sau đó được xử lý bằng công nghệ sấy thăng hoa – Công nghệ sấy tiên tiến nhất hiện nay. Cho ra các quả thể đông trùng hạ thảo khô chất lượng cao nhất – Món quà vô giá cho bạn và người thân.
Công dụng: Tăng cường hệ miễn dịch, nâng cao sức đề kháng.
Hỗ trợ giảm cholesterol máu, giảm mỡ máu, phòng ngừa hiệu quả các bệnh về tim mạch.
Điều hòa nội tiết, cải thiện chứng lạnh tử cung, ngăn ngừa lão hóa.
Bổ sung dưỡng chất cần thiết, giảm thời gian phục hồi của cơ thể.
Tăng cường sinh lý, tăng ham muốn tình dục ở nam giới.
Đối tượng sử dụng: 
Người già có các biểu hiện như: hoa mắt, mệt mỏi, trí nhớ kém.
Người ốm, hấp thu dinh dưỡng kém, gầy yếu, suy dinh dưỡng,…
Phụ nữ da xấu, mắc một số bệnh về sinh lý và sức khỏe yếu sau sinh.
Đàn ông thường xuyên sử dụng bia rượu, thuốc lá, chức năng sinh lý kém.
Người đang mắc các bệnh mãn tính: tiểu đường, ung thư, u bướu trong cơ thể.
-  Lưu ý: 
Trẻ em dưới 12 tuổi.
Phụ nữ đang trong thời gian mang thai, hành kinh. Nếu cần sử dụng hãy xin ý kiến của bác sỹ.
Người trước hoặc sau phẫu thuật.
-  Cách sử dụng :
Ăn trực tiếp: Các bạn có thể lấy từ 3 – 5 quả thể khô và ăn trực tiếp. Khác với các sản phẩm khô khác trên thị trường, nấm đông trùng hạ thảo khô Tâm An giữ nguyên dạng quả thể tươi nên rất giòn và mềm. Gần như tan trong miệng, hương vị rất bùi, có thể có cảm giác tanh tanh vị nấm rơm.
Pha trà: Đây là cách sử dụng tương đối phổ biến, dùng 3 – 5 quả thể khô cho vào cốc. Chế 1 chút nước ấm để tráng và làm sạch sau đó thêm nước nóng. Để từ 10 – 15 phút rồi sử dụng, uống hết nước sau đó ăn cả cái là được.
Ngâm rượu: Đây là cách dùng ngày càng phổ biến. Các bạn cho quả thể đông trùng hạ thảo khô vào bình sau đó đổ rượu trắng vào theo tỉ lệ 10g quả thể khô ngâm với 1 lít rượu. Các bạn có thể ngâm cùng 1 số dược liệu khác để tăng hiệu quả sử dụng.
Chế biến trong món ăn: Sử dụng nấm đông trùng hạ thảo khô trong chế biến một số món ăn bổ dưỡng như cháo gà, canh cá, thịt hầm,… Tuy nhiên nên sử dụng dụng cụ bằng sành, sứ vì đông trùng kỵ kim loại.
', 2400000, N'https://thaotaman.vn/wp-content/uploads/2020/10/hu-dong-trung-ha-thao-20-gram-1.jpg', N'Resistance')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'NDO', N'Viên uống giảm cân Night Dite Orihiro 60 gói ', N'Thông tin sản phẩm: 
Night Dite là viên uống giảm cân đến từ Nhật Bản. Với thành phần chứa ba loại axit amin và vitamin giúp hỗ trợ đốt cháy lượng mỡ thừa và giảm cân hiệu quả.
Công dụng: 
Hỗ trợ đốt cháy lượng mỡ thừa tại vùng bụng, đùi, bắp tay/chân…
Thúc đẩy chuyển hóa chất béo, giải phóng năng lượng ngay lúc ngủ. Từ đó giúp tiêu hao lượng chất béo dưa thừa sau mỗi bữa ăn.
Thúc đẩy giải phóng năng lượng tối đa trong lúc vận động và tập luyện.
Hỗ trợ giảm cân an toàn hiệu quả, không gây mất nước hay rối loạn tiêu hóa.
Bổ sung dưỡng chất giúp không mệt mỏi trong quá trình ăn kiêng.
Hỗ trợ ngủ ngon giấc.
Hỗ trợ làn da căng mịn và làm đẹp da.
Đối tượng sử dụng: 
Người muốn giảm cân an toàn.
Phụ nữ muốn giữ dáng đẹp.
Hướng dẫn sử dụng
Ngày uống 2 gói.
Nên uống trước lúc tập hay nghỉ ngơi hoặc trước khi ngủ.
Nó có vị đắng nên bạn không nên nhai.
Người mới sử dụng nên sử dụng với liều lượng nhỏ để cơ thể thích nghi
Lưu ý: 
Không dùng cho phụ nữ có thai hoặc đang cho con bú.
Dùng thuốc khác tham khảo ý kiến bác sĩ trước khi sử dụng.
Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 599000, N'https://toibanhanghieu.com/wp-content/uploads/2020/09/Vien-uong-Night-Diet-Orihiro-Nhat-Ban-giup-giam-can-ban-dem-ho-tro-lam-dep-da-ngu-ngon-60-goi-x-6-vienhop-1.100.000-VND.jpg', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'OGC', N'Giấm đen giảm cân Orihiro Nhật Bản 216 viên', N'Thông tin sản phẩm: 
Viên uống giấm đen giảm cân Orihiro là thực phẩm chức năng cho dành cho người thừa cân, béo phì. Với thành phần được điều chế từ gạo lứt đỏ lên men theo công thức cổ truyền giúp hỗ trợ giảm cân an toàn và nhiều tác dụng tốt cho sức khỏe.
Công dụng: 
Hỗ trợ hạn chế hấp thu chất béo và giảm cân hiệu quả.
Bổ sung vitamin hỗ trợ duy trì sắc đẹp và chống lão hóa.
Ngăn chặn hình thành cục máu đông và cải thiện sức khỏe tim mạch.
Hỗ trợ giảm nguy cơ mắc bệnh tiểu đường.
Hỗ trợ chống oxy hóa và ổn định huyết áp.
Hỗ trợ tăng cường tiêu hóa. Hỗ trợ đào thải độc ra ngoài cơ thể và giảm táo bón.
Đối tượng sử dụng: 
Người thừa cân, béo bụng.
Người muốn giảm cân an toàn và hiệu quả.
Người muốn giữ cân và ngăn ngừa nhiều bệnh lý.
Hướng dẫn sử dụng: 
Ngày uống 4 viên chia làm 2 lần trước hoặc sau ăn.
Kết hợp với trà giảm cân Night Diet Tea hoặc trà Beauty Collagen Orihiro.
Nên uống nhiều nước khi sử dụng sản phẩm.
Do là thực phẩm bổ sung nên bạn cần sử dụng thường xuyên, tránh ngắt quãng để cảm nhận hiệu quả sản phẩm. Ngoài ra, bạn cũng cần kết hợp với chế độ ăn uống và luyện tập thể dục giúp hỗ trợ giảm cân.
Lưu ý: 
Phụ nữ có thai và đang cho con bú không được sử dụng.
Không dùng cho người mẫn cảm với thành phần của sản phẩm.
Tham khảo ý kiến của bác sĩ nếu đang dùng thuốc khác.
Người vị viêm loét dạ dày hay viên đại tràng không nên sử dụng.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 199000, N'https://misashop.vn/public/images/products/MS00283-1.jpg', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Omega', N'Dầu cá Healthy Care Fish Lọ 400 viên', N'Thông tin sản phẩm 
Fish Oil 1000mg Omega-3 là thực phẩm hỗ trợ bổ sung Omega-3 của Úc. Với thành phần được chiết xuất từ cá nước lạnh chất lượng cao hỗ trợ tăng cường sức khỏe khớp và khả năng vận động linh hoạt. Trong Omega-3 Healthy Care có chứa EPA và DHA hỗ trợ sức khỏe tim, mắt, não và hệ thần kinh.
Công dụng: 
Bổ sung Omega-3 (DHA & EPA) thiết yếu cho sức khỏe hằng ngày.
Hỗ trợ tăng cường và duy trì sức khỏe tim, mắt, não và hệ thần kinh.
Hỗ trợ chống viêm mạnh mẽ giúp giảm sưng khớp và các triệu chứng của bệnh viêm khớp nhẹ.
Hỗ trợ tăng cường sức khỏe khớp cũng như khả năng vận động và tính linh hoạt.
Hỗ trợ tăng cường sức khỏe thể chất chung và phòng ngừa nhiều bệnh lý.
Đối tượng sử dụng 
Người lười ăn cá hoặc không ăn đủ 2 – 3 khẩu phần cá mỗi tuần.
Người bị đau nhức hoặc gặp các vấn đề về xương khớp.
Người muốn hỗ trợ và phòng ngừa bệnh lý liên quan đến tim, mắt và não.
Người muốn tăng cường sức khỏe và phúc lợi chung.
Hướng dẫn sử dụng 
Trẻ từ 6 – 12 tuổi: uống 1 – 2 viên một ngày.
Người lớn: uống 1 – 3 viên một ngày cùng với thức ăn.
Đối với bệnh viêm khớp nhẹ: uống tối đa 4 viên x 3 lần một ngày hoặc theo chỉ dẫn của bác sĩ.
Bảo quản: nơi khô ráo thoáng mát và tránh ánh sáng trực tiếp.
Lưu ý: 
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh
', 449000, N'https://heluva.vn/wp-content/uploads/2020/03/healthycare-fish-oil.jpg', N'Eyes')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'OriBluDiet', N'Trà giảm cân Night Diet Tea Orihiro Nhật Bản ', N'<h3>Thông tin sản phẩm</h3><br>
    <p>Trà giảm cân Orihiro Night Diet Tea là trà được nhiều người yêu thích sử dụng nổi tiếng tại Nhật. Bởi trà được
        điều chế từ 100% thảo dược thiên nhiên giúp hỗ trợ giảm cân trong khi ngủ. Đặc biệt, trà không chứa caffein nên
        bạn có thể hoàn toàn yên tâm sử dụng mà không ảnh hưởng đến giấc ngủ.</p><br>
    <h3>Công Dụng</h3><br>
    <ul>
        <li>Thúc đẩy quá trình đốt cháy mỡ thừa và hỗ trợ giảm cân một cách an toàn và hiệu quả.</li>
        <li>Hỗ trợ thanh nhiệt, giải độc và giúp giảm mỡ bụng nhanh chóng.</li>
        <li>Hỗ trợ nhuận tràng, tăng cường đường tiêu hóa.</li>
        <li>Giúp tinh thần thoải mái và ngủ sâu giấc.</li>
    </ul><br>
    <h3>Đối tượng sử dụng</h3><br>
    <ul>
        <li>Người thừa cân muốn giảm cân một cách lành mạnh, không gây tác dụng phụ.</li>
        <li>Người có hệ tiêu hóa kém và hay bị táo bón.</li>
        <li>Người muốn thư giãn hệ thần kinh và ngủ ngon hơn mỗi đêm.</li>
        <li>Người trên 18 tuổi.</li>
    </ul><br>
    <h3>Hướng dẫn sử dụng</h3><br>
    <ul>
        <li>Cho một túi trà vào cốc 150 – 300ml nước sôi.</li>
        <li>Chờ mất phút cho trà ngấm có thể sử dụng được.</li>
        <li>Nên uống trước khi đi ngủ 30 phút giúp bạn kiểm soát cân nặng hiệu quả.</li>
        <li>Kết hợp với viên uống giấm đen giảm cân Orihiro để tăng hiệu quả.</li>
    </ul><br>
    <h3>Lưu ý</h3><br>
    <ul>
        <li>Chống chỉ định: phụ nữ mang thai và cho con bú không được sử dụng</li>        
    </ul>
', 170000, N'https://myphambo.com/wp-content/uploads/2019/03/Tra-Ho-Tro-Giam-Can-Orihiro-Ban-Dem-Night-Diet-Tea-Nhat-Ban-7.jpg', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Orihiro', N'Bột ngủ ngon Orihiro 14 gói (Nhập Khẩu)', N'Thông tin sản phẩm :
Bột ngủ ngon Orihiro là thực phẩm chức năng dành cho người mất ngủ. Với thành phần chính là theanine giúp hỗ trợ tăng chất lượng giấc ngủ và hạn chế tối đa tình trạng thức giấc giữa đêm.
Công dụng
 Giải tỏa căng thẳng, lo lắng giúp hệ thần kinh được thư giãn.
 Tăng chất lượng giấc ngủ. Hỗ trợ ngủ ngon và sâu, hạn chế tình trạng thức giấc giữa đêm.
 Hỗ trợ giải tỏa stress hệ thần kinh và giúp cơ thể nhanh chóng chìm vào giấc ngủ.
 Cải thiện chức năng não, tăng cường trí nhớ và khả năng tập trung.
 Bổ sung axit amin giúp giảm tốc độ oxy hóa, chống lão hóa và trẻ hóa làn da.
Đối tượng: 
Người bị căng thẳng và áp lực do công việc.
 Người mất ngủ, ngủ không sâu giấc.
Cách sử dụng: 
Uống 1 gói trước khi đi ngủ 30 phút.
Kết hợp với thể dục nhẹ nhàng hằng ngày để tằng cường chất lượng giấc ngủ.
Lưu ý:
Hỏi ý kiến bác sĩ nếu bạn đang sử dụng thuốc khác.
 Có thể có sự khác biệt về màu sắc và hương vị nhưng không có vấn đề gì về chất lượng.
 Bảo quản nơi thoáng mát, tránh ánh sáng trực tiếp.
 Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 400000, N'https://th.bing.com/th/id/OIP.J_4VylGpmZ2WSdCZp_bYRAHaHa?pid=ImgDet&rs=1', N'Sleep')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'OrihiroBB', N'Viên uống bổ mắt Việt Quất Blueberry Orihiro ', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Trong các sản phẩm hỗ trợ và tăng cường sức khỏe mắt thì viên uống bổ mắt Việt Quất Blueberry Orihiro là một trong những sản phẩm tuyệt vời vì là thực phẩm chức năng của thương hiệu Orihiro. Với thành phần bổ sung các vitamin và dưỡng chất giúp hỗ trợ tăng cường sức khỏe mắt.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Bổ sung vitamin A dồi dào giúp tăng cường thị lực.</li>
<li>Bổ sung vitamin B2 giúp ngăn ngừa rối loạn về mắt như bệnh tăng nhãn áp, keratoconus.</li>
<li>Hỗ trợ tăng cường giúp mắt thích ứng với những thay đổi ánh sáng.</li>
<li>Hỗ trợ chữa bệnh liên quan đến mắt như đục thủy tinh thể hay mù lòa.</li>
<li>Hỗ trợ và bảo vệ mắt chống lại rối loạn mắt và thoái hóa điểm vàng.</li>
</ul><br>
<h3>Đối tượng sử dụng:</h3><br> 
<ul>
<li>Người muốn tăng cường sức khỏe mắt.</li>
<li>Người muốn hỗ trợ và phòng ngừa các bệnh lý về mắt.</li>
<li>Người làm việc với máy tính và thiết bị điện tử thường xuyên.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Uống 4 viên mỗi ngày sau ăn 30 phút với nước lọc hoặc nước ấm. </li>
<li>Uống nhiều nước khi sử dụng sản phẩm.</li>
<li>Kết hợp với viên uống bổ mắt Lutein Plus Orihiro để tăng cường hiệu quả.</li>
<li>Bảo quản: nơi thoáng mát, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Không dùng cho người dưới 18 tuổi, phụ nữ có thai và đang cho con bú.</li>
<li>Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.</li>
<li>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 888000, N'data:image/jpeg;base64,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', N'Eyes')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'OrihiroGen', N'Trà giảm mỡ bụng Orihiro Genpi 60 gói', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Trà giảm mỡ bụng Orihiro Genpi được điều chế từ 100% thảo dược tự nhiên giúp tăng cường quá trình trao đổi chất, thúc đẩy quá trình đốt cháy mỡ thừa và tiêu hao nhiều năng lượng hơn trong các hoạt động hằng ngày.</p><br>
<h3>Công dụng: <h3><br>
<ul>
<li>Hỗ trợ giảm mỡ bụng và đốt cháy mỡ thừa ở những vùng khó giảm mỡ như: bụng dưới, bắp tay.</li>
<li>Tăng cường sự trao đổi chất béo. Giúp giảm cân bằng cách thúc đẩy quá trình phân giải lipid giúp cơ thể đốt cháy nhiều chất béo.</li>
<li>Giảm lượng cholesterol trong máu và hỗ trợ lưu thông khí huyết trong máu.</li>
 <li>Hỗ trợ ngăn ngừa hình thành cục máu đông và phòng chống tai đột quỵ và bệnh tai biến.</li>
 <li>Thanh lọc cơ thể, hạn chế nổi mụn nhọt trên da và kháng viêm.</li>
</ul>
<h3>Đối tượng sử dụng:</h3><br>
<ul>
<li>Người muốn hỗ trợ giảm cân theo cách tự nhiên và không gây tác dụng phụ.</li>
<li>Người vừa muốn giảm béo, vừa muốn giảm mụn đẹp da và phòng chống lão hóa.</li>
<li>Người béo lâu năm chủ yếu do mỡ mềm tập trung ở bụng và lưng.</li>
<li>Người muốn tăng cường sức khỏe.</li>
</ul>
<h3>Hướng dẫn sử dụng:</h3><br>
<li>Cho gói trà vào cốc tráng qua một lần nước sôi.</li>
<li>Sau đó đổ nước vào cho trà ngấm có thể thưởng thức. Mỗi gói có thể dùng được nhiều lần nước, tùy vào sở thích uống đặc hay loãng của mỗi người.</li>
<li>Có thể uống trà bất cứ thời điểm nào trong ngày.</li>
<li>Trà có thể sử dụng nóng hoặc lạnh theo tùy sở thích.</li>
</ul>
<h3>Lưu ý: </h3><br>
<p>Phụ nữ mang thai hoặc đang cho con bú cần hỏi ý kiến bác sĩ trước khi sử dụng.</p>
', 169000, N'https://th.bing.com/th/id/OIP.g6Tr4V190HW-9UJOf4itZQHaH1?pid=ImgDet&rs=1', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'OriTeaDiet', N'Trà Orihiro Night Diet Tea Beauty Collagen', N'<h3>Thông tin sản phẩm</h3><br>
    <p>Trà giảm cân Orihiro Night Diet Tea Beauty Collagen là thực phẩm hỗ trợ giảm cân Nhật Bản. Với thành phần như trà
        giảm cân Orihiro Night Diet Tea nhưng được bổ sung thêm collagen, hoa hồng, xô thơm… Giúp hỗ trợ đốt cháy mỡ
        thừa và giảm cân hiệu quả.</p><br>
    <h3>Công Dụng</h3><br>
    <ul>
        <li>Hỗ trợ giải phóng năng lượng dư thừa, ngăn ngừa béo phì.</li>
        <li>Tăng cường chuyển hóa trao đổi chấy và tiêu hao lượng mỡ trong thức ăn.</li>
        <li>Giảm hấp thu chất béo và đốt cháy mỡ thừa.</li>
        <li>Hỗ trợ chống oxy hóa, chống lão hóa. Từ đó giúp làn da căng bóng, mịn màng trong quá trình giảm cân.</li>       
    </ul><br>
    <h3>Đối tượng sử dụng</h3><br>
    <ul>
        <li>Người trưởng thành có nhu cầu giảm cân và cải thiện vóc dáng.</li>
        <li>Người muốn cải thiện làn da.</li>
    </ul><br>
    <h3>Hướng dẫn sử dụng</h3><br>
    <ul>
        <li>Cho 1 túi trà với 250 – 300ml nước sôi.</li>
        <li>Chờ 3 – 5 phút có thể thưởng thức.</li>
        <li>Mỗi túi có thể châm 3 lần nước.</li>
        <li>Có thể uống lạnh tùy sở thích mỗi người.</li>
        <li>Nên kết hợp với viên uống giấm đen giảm cân Orihiro giúp tăng cường hiệu quả</li>
    </ul><br>
    <h3>Lưu ý</h3><br>
    <ul>
        <li>Bảo quản: nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em</li>
        <li>Người dưới 18 tuổi, phụ nữ có thai và cho co bú không nên sử dụng.</li>
        <li>Hỏi ý kiến nếu bạn đang dùng thuốc khác.</li>
        <li>Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.</li>
        <li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li> 
    </ul>
', 212000, N'https://th.bing.com/th/id/OIP.NpzwAu4tkB2Z997ih6vDJAHaHa?pid=ImgDet&rs=1', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'SheepPlac', N'Viên Nhau Thai Cừu Healthy Care Sheep Placenta  ', N'<h3>Thông tin sản phẩm: </h3><br>
<p>Healthy Care Sheep Placenta là viên uống nhau thai cừu của Úc được điều chế từ nguyên liệu chất lượng cao hỗ trợ phòng chống lão hóa. Trong nhau thai cừu Healthy Care cung cấp một nguồn giàu protein và hơn 30 axit amin hỗ trợ cải thiện sức sống thể chất hay tăng cường sức khỏe nói chung.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Hỗ trợ cải thiện sức sống và tăng cường sức khỏe chung.</li>
<li>Hỗ trợ phòng chống lão hóa và tăng tái tạo trẻ hóa làn da.</li>
<li>Hỗ trợ làn da đẹp mịn màng.</li>
<li>Hỗ trợ giảm nám, thâm, tàn nhan và làm chậm quá trình lão hóa.</li>
</ul><br>
<h3>Đối tượng sử dụng:</h3><br>
<ul> 
<li>Người muốn làn da đẹp và phòng ngừa lão hóa.</li>
<li>Người muốn tăng cường sức khỏe chung.</li>
</ul><br>
<h3>Hướng dẫn sử dụng:</h3><br>
<ul>
<li>Liều lượng sử dụng hằng ngày với người lớn là: uống 1 – 3 viên mỗi ngày.</li>
<li>Hiệu quả sử dụng của sản phẩm nhanh hay chậm tùy thuộc vào cơ địa của mỗi người. Nhà sản xuất khuyến cáo lên sử dụng đều đặn từ 2 – 4 tuần để cảm nhận tác dụng của sản phẩm</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Bảo quản: Nơi khô ráo dưới 30 độ C, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
<li>Chú ý: Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 599000, N'https://th.bing.com/th/id/OIP.QhnWOJFiKJhTgDqcoj0FYgHaHa?pid=ImgDet&rs=1', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'Slimtosen', N'Viên Uống Giảm Cân Slimtosen Extra ', N'<h3>Thông tin sản phẩm</h3><br>
<p>Người thừa cân, người béo phì, người mỡ máu cao,… muốn giảm cân cải thiện tình trạng cơ thể không thể bỏ qua sản phẩm Slimtosen Extra – Viên uống giảm cân Học Viện Quân Y. Sản phẩm là sự kết hợp giữa các dược liệu tự nhiên với thành phần chính từ lá sen, trạch tả, chitosan, bứa,… giúp giảm cân một cách hiệu quả, an toàn và không gây tác dụng phụ cho cơ thể.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Giảm hấp thu carbohydrate và chất béo vào cơ thể.</li>
<li>Giảm cholesterol và triglyceride trong máu, giúp giảm mỡ máu.</li>
<li>Hỗ trợ giảm hiệu quả tình trạng béo phì.</li>
<li>Hỗ trợ giảm cân hiệu quả sau thời gian ngắn sử dụng.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người thừa cân, béo phì.</li>
<li>Người mỡ máu cao.</li>
<li>Người muốn giảm cân, có nhu cầu tăng cường sức khỏe.</li>
</ul><br>
<h3>Hướng dẫn sử dụng</h3><br> 
<ul>
<li>Uống 2 viên/lần x2 lần/ngày, uống trước bữa ăn ít nhất 30 phút.</li>
<li>Sử dụng trước bữa sáng và bữa trưa.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.</li>
<li>Sử dụng liên tục theo liệu trình, không uống ngắt quãng sẽ làm giảm hiệu quả.</li>
<li>Sử dụng kết hợp thêm 1 số sản phẩm dạng khác để bổ trợ giảm cân như trà giảm béo Slimutea HVQY.</li>
<li>Xây dựng chế độ ăn uống tập luyện khoa học để nâng cao thể chất và hạn chế chất béo.</li>
<li>Nên sử dụng theo đợt ít nhất từ 30-90 ngày tùy trọng lượng muốn giảm.</li>
<li>Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 249000, N'https://salt.tikicdn.com/cache/w444/ts/product/b8/b4/f5/1f9e182a2aa23416da65d471b09ea498.jpg', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'SlimuteaQY', N'Trà giảm cân Slimutea Học Viện Quân Y', N'<h3>Thông tin sản phẩm</h3><br>
    <p>Trà giảm cân Slimutea được sản xuất bởi Học Viện Quân Y. Với thành phần từ lá sen, hoàng cầm, thảo quyết minh, đinh hương giúp hạ mỡ máu, hỗ trợ giảm cân hiệu quả.</p><br>
<h3>Công Dụng</h3><br>
    <ul>
        <li>Giúp hạ mỡ máu.</li>
        <li>Hỗ trợ giảm cân kết hợp với tập luyện và ăn uống hợp lý</li>    
    </ul><br>
<h3>Đối tượng sử dụng</h3><br>
    <ul>
        <li>Người mỡ máu cao</li>
        <li>Người có nhu cầu giảm cân</li>
        <li>Người muốn thưởng thức trà và phòng ngừa bệnh thừa cân.</li>     
    </ul><br>
<h3>Hướng dẫn sử dụng</h3><br>
    <ul>
        <li>Cho túi trà vào cốc hãm với 100 – 150 ml nước sôi.</li>
        <li>Chờ 3 – 5 phút có thể sử dụng.</li>
        <li>Ngày sử dụng 4 – 6 túi.</li>
    </ul><br>
<h3>Lưu ý</h3><br>
    <ul>
        <li>Bảo quản: Nơi khô mát, tránh ánh sáng trực tiếp.</li>
        <li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
        <li>Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
    </ul>
', 50000, N'https://th.bing.com/th/id/R.54184ac4c3f8092f9b158bfc58eebb68?rik=pi0yFgSP5SK2rw&riu=http%3a%2f%2fslimbody.vn%2fuploads%2fnoidung%2ftra-giam-can-hoc-vien-quan-y-slimutea-135.jpg&ehk=a7i%2bIhknwnvF1JeR9ujFBHCc47DvTIuUrUuS2retGnQ%3d&risl=&pid=ImgRaw&r=0', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'TCBM', N'Cốm Tăng Cân Bạch Mai Giúp Bé Ăn Ngon 120g', N'Thông tin sản phẩm:
Cốm Tăng Cân Bạch Mai là thực phẩm bảo vệ sức khỏe ứng dụng công nghệ BIO Organic giúp kích thích ăn ngon, tăng khả năng hấp thu và tăng cường sức khỏe.
Công dụng: 
Kích thích ăn ngon, ngủ ngon, cân bằng dinh dưỡng, thải độc cơ thể.
Tăng cường sức khỏe, tăng cường tiêu hóa.
Cải thiện rối loạn tiêu hóa, tăng cường hấp thu, dinh dưỡng.
Tăng khả năng hấp thu, cung cấp thêm vi dưỡng chất cho cơ thể.
Đối tượng sử dụng:
Trẻ em và người lớn gầy yếu, kém ăn, chậm lớn, sút cân.
Người mới ốm dậy, đang trong thời kỳ hồi phục, cần tăng cường sức khỏe.
Hỗ trợ trẻ em, người lớn ăn ngon miệng, ngủ tốt, cải thiện cân nặng.
Người lớn và trẻ nhỏ rối loạn tiêu hóa cần tăng cân.
Người ăn không ngon, hấp thu kém.
Người có nhu cầu nâng cao hệ tiêu hóa và sức khỏe.
Hướng dẫn sử dụng: 
Trẻ em dưới 2 tuổi: Ngày 1 thìa sau ăn.
Trẻ em trên 2 tuổi: Ngày 1 – 2 thìa x 3g sau ăn.
Người lớn: ngày 2 – 4 thìa x 3g sau ăn.
Pha vào sữa, nước ấm (37 – 40 độ), nước hoa quả, cháo hoặc phô mai.
Lưu ý: 
Hiệu quả sử dụng tùy thuộc vào mức độ nặng, nhẹ và cơ địa của mỗi người. Tuy nhiên, để nâng cao hiệu quả sự dụng người bệnh cần có chế độ ăn uống hợp lý và tập thể dục thường xuyên.
Bảo quản: Nơi khô ráo, thoáng mát, nhiệt độ dưới 30 độ C, tránh ánh nắng mặt trời.
Không sử dụng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.
Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 250000, N'https://th.bing.com/th/id/OIP.R1AGPeM2JDXjqZMtIitb5gHaHa?pid=ImgDet&rs=1', N'Weight')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'TDC', N'Trà diếp cá Orihiro 60 gói ', N'<h3>Thông tin sản phẩm</h3><br>
<p>Trà diếp cá Orihiro là một thức uống khá được ưa chuộng và phổ biết tại Nhật và các nước Châu Á. Với thành phần 100% từ diếp cá tự nhiên giúp cơ thể thanh lọc cơ thể, đào thải độc tố và làm mát gan. Ngoài ra, trà còn giúp kích thích hệ tiêu hóa, làm chậm quá trình lão hóa và duy trì sức khỏe và sắc đẹp.</p><br>
<h3>Công dụng: </h3><br>
<ul>
<li>Đào thải độc tố ra khỏi cơ thể. Giúp thanh lọc, mát gan, giảm sự hình thành mụn nhọt và mẩn đỏ trên da.</li>
<li> Hỗ trợ tiêu diệt ký sinh trùng, hỗ trợ điều trị người mắc bệnh trĩ.</li>
<li>Kháng khuẩn, chống ung thư.</li>
<li>Hỗ trợ và điều trị sỏi thận, viêm phế quản, kinh nguyệt không đều, sốt ở trẻ em.</li>
<li>Hỗ trợ làm chậm quá trình lão hóa, giảm sắc tố melanin giúp da sáng mịn hơn.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Trẻ em từ 2 tuổi trở lên.</li>
 <li>Người nóng trong, nổi mụn, mề đay.</li>
 <li>Người bị bệnh táo bón, trĩ, sỏi thận.</li>
 <li>Phụ nữ rối loạn nội tiết tố, kinh nguyệt không đều.</li>
</ul><br>
<h3> Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Cho một túi lọc vào cốc 250 – 500ml nước sôi. Chờ 1 – 3 phút cho trà ngấm có thể thưởng thức.</li>
<li>Có thể uống được đến 3 lần nước, tùy vào sở thích mỗi người.</li>
<li>Trà có thể sử dụng nóng hoặc lạnh đều được.</li>
<li>Nên sử dụng trà đã pha trong 24h.</li>
</ul><br>
<h3> Lưu ý: </h3><br>
<ul>
<li>trà được sản xuất từ nguyên liệu tự nhiên, vì thế nhà sản xuất có giải thích là màu sắc và hương vị các gói có khác nhau đôi chút. Tuy nhiên chất lượng sản phẩm vẫn như nhau.</li>
<li>Chống chỉ định: phụ nữ mang thai, đang cho con bú hoặc người đang điều trị bệnh cần hỏi ý kiến bác sĩ trước khi sử dụng.</li>
</ul>
', 149000, N'https://vanshop.com.vn/wp-content/uploads/2019/06/tr%C3%A0-di%E1%BA%BFp-c%C3%A1-510x510.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'TDG', N'Viên uống thải độc Gan 42 viên', N'Thông tin sản phẩm: 
Bạn đang cần một loại thực phẩm chức năng tốt cho Gan để thanh lọc và bảo vệ chức năng hiệu quả. Hôm nay bên mình sẽ giới thiệu đến viên uống thải độc Gan Blackmores Milk Thistle – Một loại thực phẩm chức năng cho Gan cực chất lượng đến từ Úc.
Công dụng: 
Hỗ trợ bảo vệ lá Gan trước các chất độc hại.
 Hỗ trợ quá trình hồi phục tế bào gan.
Đối tượng sử dụng: 
Người lớn cần hỗ trợ chức năng gan.
 Người có chức năng gan kém.
Hướng dẫn sử dụng:
Nhà sản xuất khuyến cáo: sử dụng ngày 3 lần, mỗi lần 1 viên trước bữa ăn.
Bảo quản: nhiệt độ dưới 30 độ C, để nơi khô ráo, tránh ánh sáng trực tiếp.
Lưu ý:
Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 429000, N'https://drvitamin.vn/wp-content/uploads/2021/04/blackmores-milk-thistle-500-500-4.jpg', N'Liver')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'TDNB', N'Viên Uống Tiểu Đường Kikuimo Seikatsu 450v', N'Thông tin sản phẩm: 
Viên uống Kikuimo Seikatsu là thực phẩm chức năng cho người tiểu đường của Nhật Bản. Với thành phần chiết xuất củ cây cúc vu chứa hoạt chất giúp hỗ trợ cải thiện và giảm các biến chứng của bệnh tiểu đường.
Công dụng: 
Hỗ trợ ức chế hấp thu đường và carbohydrate.
Hỗ trợ cân bằng đường huyết và cải thiện tình trạng mỡ máu, béo phì.
Hỗ trợ chuyển hóa năng lượng thay thế cho đường glucose.
Hỗ trợ hồi phục tuyến tụy và giảm các biến chứng của bệnh tiểu đường.
Hỗ trợ cải thiện đường ruột và ngăn ngừa táo bón.
Thúc đẩy ruột non tiết hormone GLP-1 giúp thúc đẩy việc tiết insulin.
Đối tượng sử dụng: 
Người có nguy cơ bị bệnh tiểu đường.
Người bị tiểu đường tuýp I, II và tiểu đường thai kỳ.
Người muốn ngăn ngừa bệnh tiểu đường.
Người béo phì, cholesterol cao và gan nhiễm mỡ.
Hướng dẫn sử dụng
Uống 15 viên/ngày, chia làm 2 lần uống trước khi ăn.
Nên sử dụng liệu trình từ 3 – 6 tháng.
Lưu ý: 
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 1419000, N'https://storage.googleapis.com/jagodo/jagodo/2020/10/92b00ca2-6c9d96358f1027df5e7c3d83f4dbead7.jpg', N'HighBlood')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'UCN', N'Viên Uống Cấp Nước DHC Hyaluronic Acid 30 Ngày', N'Thông tin sản phẩm
DHC Hyaluronic Acid là viên uống cấp nước nổi tiếng tại Nhật. Với thành phần chính acid hyaluronic giúp hỗ trợ duy trì độ ẩm cho da và hạn chế khô da.
Công dụng: 
 Hỗ trợ duy trì độ ẩm và đàn hồi da.
 Hỗ trợ hạn chế khô kha và bảo vệ da khỏi các yếu tố bên ngoài.
 Hỗ trợ chống lão hóa, giảm hình thành nếp nhăn.
 Nuôi dưỡng làn da chắc khỏe, căng mọng rạng rỡ.
Đối tượng sử dụng; 
Người bị khô da, muốn giữ ẩm cho da.
 Người hay làm việc trong máy lạnh thường xuyên.
 Người muốn làn da khỏe mạnh và giảm tình trạng lão hóa da.
Hướng dẫn sử dụng: 
Mối túi chứa 60 viên sử dụng như sau: ngày uống 2 viên.
Hiệu quả sử dụng sản phẩm còn tùy thuộc vào cơ địa của mỗi người. Nhà sản xuất khuyến cáo nên sử dụng thường xuyên từ 2 – 3 tháng để thấy tác dụng hiệu quả nhất.
Lưu ý: 
Không sử dụng cho phụ nữ có thai và đang cho con bú.
 Bảo quản nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.
 Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
', 395000, N'https://eatnmore.com/wp-content/uploads/2021/04/vien-uong-cap-nuoc-dhc-hyaluronic-acid-20-days-620273.jpg', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'WhiteOri', N'Viên uống Orihiro Natural White Premium 300 viên', N'<h3>Thông tin sản phẩm</h3><br>
<p>Natural White Premium là viên uống trắng da Orihiro danh cho người muốn có làn da sáng đẹp, mịn màng. Với thành phần chứa các axit amin liên kết với nhau cùng với vitamin giúp hỗ trợ cải thiện tình trạng nám, tàn nhan. Từ đó giúp da trắng mịn màng.</p><br>
<h3>Công dụng:</h3><br> 
<ul>
<li>Cung cấp độ ẩm cho da, giúp da đàn hồi và mịn màng.</li>
<li>Hỗ trợ cải thiện tình trạng nám, tàn nhan, da xỉn màu. Từ đó giúp da luôn trắng sáng.</li>
<li>Hỗ trợ giảm mụn và cải thiện làn da khô.</li>
<li>Hỗ trợ bảo vệ da khỏi các tổn thương và tác hại của môi trường bên ngoài.</li>
</ul><br>
<h3>Đối tượng sử dụng :</h3><br>
<ul>
<li>Người muốn là da trắng sáng, mềm mịn.</li>
<li>Người muốn hỗ trợ giảm tình trạng nám, tan nhan…</li>
<li>Người muốn phòng ngừa lão hóa da và bảo vệ da khỏi tác hại môi trường.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<ul>
<li>Ngày uống 10 viên chia làm 2 – 3 lần.</li>
<li>Uống sau ăn khoảng 30 phút để đạt hiệu quả tốt nhất.</li>
<li>Hãy uống nhiều nước khi sử dụng sản phẩm.</li>
<li>Người mới sử dụng hãy bắt đầu với liều lượng nhỏ.</li>
<li>Bảo quản nơi khô ráo, tránh ánh sáng trực tiếp và để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Không dùng cho người dưới 18 tuổi, phụ nữ mang thai và đang cho con bú.</li>
<li>Đang dùng thuốc khác hỏi ý kiến bác sĩ trước khi sử dụng.</li>
<li>Không dùng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 565000, N'https://cdn.chiaki.vn/unsafe/0x900/left/top/smart/filters:quality(90)/https://chiaki.vn/upload/product/2020/07/vien-uong-trang-da-tri-nam-natural-white-premium-orihiro-5f17f27b2faee-22072020150203.png', N'Skin')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [Price], [LinkPicture], [TypeProduct]) VALUES (N'WhiteSM', N'Viên Uống Sáng Da Sương Mai', N'<h3>Thông tin sản phẩm: </h3> <br>
<p>Viên uống Sáng Da Sương Mai của Học Viện Quân Y được điều chế từ các loại thảo dược quý hiếm, kết hợp với các loại vitamin, collagen tuýp I, nano curcumin. Có công dụng giúp bổ sung collagen, vitamin và chất chống oxy hóa giúp hạn chế lão hóa da, hỗ trợ tăng đàn hồi và làm đẹp da.</p><br>
<h3>Công dụng:</h3> <br>
<ul>
<li>Giúp bổ sung collagen, vitamin E.</li>
<li>Bổ sung chất chống oxy hóa, giúp hạn chế lão hóa da.</li>
<li>Hỗ trợ tăng đàn hồi cho da, giúp làm đẹp da.</li>
</ul><br>
<h3>Đối tượng sử dụng: </h3><br>
<ul>
<li>Người bị lão hóa da, nám da, da nhăn, khô sạm.</li>
<li>Người hay tiếp xúc với các yếu tố oxy hóa (UV, hóa chất) gây hại cho da.</li>
<li>Phụ nữ cần chăm sóc, làm đẹp da.</li>
<li>Phụ nữ cần phòng chống lão hóa da, sạm da.</li>
</ul><br>
<h3>Hướng dẫn sử dụng: </h3><br>
<li>Ngày uống 2 lần, mỗi lần 2 viên sau bữa ăn.</li>
<li>Liệu trình sử dụng từ 1 – 3 tháng.</li>
<li>Tránh sử dụng ngắt quãng. Nên kết hợp với thể dục hằng ngày để đạt hiệu quả tốt nhất.</li>
<li>Bảo quản: Nơi khô mát, tránh ánh sáng trực tiếp. Để xa tầm tay trẻ em.</li>
</ul><br>
<h3>Lưu ý: </h3><br>
<ul>
<li>Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.</li>
<li>Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.</li>
</ul>
', 200000, N'https://th.bing.com/th/id/R.bcc8e57fdaa70cef4e7401a739efcc75?rik=Nt8u3DgROzWwww&pid=ImgRaw&r=0', N'Skin')
GO
USE [master]
GO
ALTER DATABASE [ProjectFinalPRJ] SET  READ_WRITE 
GO
