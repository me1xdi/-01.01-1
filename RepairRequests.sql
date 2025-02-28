USE [master]
GO
/****** Object:  Database [RepairRequests]    Script Date: 05.11.2024 23:34:23 ******/
CREATE DATABASE [RepairRequests]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairRequests', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\RepairRequests.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RepairRequests_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER04\MSSQL\DATA\RepairRequests_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RepairRequests] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairRequests].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairRequests] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairRequests] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairRequests] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairRequests] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairRequests] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairRequests] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairRequests] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairRequests] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairRequests] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairRequests] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairRequests] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET  MULTI_USER 
GO
ALTER DATABASE [RepairRequests] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairRequests] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairRequests] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairRequests] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RepairRequests]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](100) NOT NULL,
	[phoneNumber] [nvarchar](20) NOT NULL,
	[email] [nvarchar](70) NULL,
 CONSTRAINT [PK__Clients__3213E83FF61B151B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[dateOfCreation] [datetime] NOT NULL,
	[comment] [nchar](255) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](100) NOT NULL,
	[roleId] [int] NOT NULL,
	[phoneNumber] [nvarchar](20) NOT NULL,
	[email] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK__Employee__3213E83FA3355959] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[serialNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK__Equipmen__3213E83F647D5656] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateOfCreation] [datetime] NOT NULL,
	[clientId] [int] NOT NULL,
	[equipmentId] [int] NOT NULL,
	[typeOfFaultId] [int] NOT NULL,
	[problemDescription] [nvarchar](255) NOT NULL,
	[employeeId] [int] NOT NULL,
	[statusId] [int] NOT NULL,
 CONSTRAINT [PK__Requests__3213E83F096B599F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK__Role__3213E83F6FDCF882] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Status__3213E83F99174534] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfFault]    Script Date: 05.11.2024 23:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfFault](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TypeOfFa__3213E83F9262C96D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (1, N'Мещерякова Аделина Артёмовна', N'+78957567676', N'gfhjk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (2, N'Медведев Александр Максимович', N'+78676565656', N'sdfghj@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (3, N'Соловьева Анастасия Марковна', N'+79875676565', N'gjhk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (4, N'Васильев Святослав Петрович', N'+79675677686', N'dfghjk@gmail.com')
INSERT [dbo].[Clients] ([id], [fio], [phoneNumber], [email]) VALUES (5, N'Иванова София Данииловна', N'+79876576575', N'dhsjafhk@gmail.com')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment]) VALUES (1, 1, 1, CAST(N'2024-04-15T13:09:00.000' AS DateTime), N'Обнаружена плюс одна царапина                                                                                                                                                                                                                                  ')
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment]) VALUES (2, 4, 1, CAST(N'2024-05-15T13:09:00.000' AS DateTime), N'Отсутствуют детали для сборки                                                                                                                                                                                                                                  ')
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment]) VALUES (3, 5, 3, CAST(N'2024-06-15T13:09:00.000' AS DateTime), N'Исправно работает                                                                                                                                                                                                                                              ')
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment]) VALUES (4, 6, 2, CAST(N'2024-07-15T13:09:00.000' AS DateTime), N'Начал работать 3 секунды после включения                                                                                                                                                                                                                       ')
INSERT [dbo].[Comments] ([id], [requestId], [employeeId], [dateOfCreation], [comment]) VALUES (5, 7, 4, CAST(N'2024-08-15T13:09:00.000' AS DateTime), N'Найдена лишняя деталь                                                                                                                                                                                                                                          ')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (1, N'Анохин Андрей Романович', 1, N'+79563456789', N'qwer@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (2, N'Крылова Есения Романовна', 2, N'+79675434343', N'rewq@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (3, N'Князева Элина Викторовна', 3, N'+79674565432', N'uyti@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (4, N'Кузнецов Александр Кириллович', 4, N'+79223124567', N'sjdh@gmail.com')
INSERT [dbo].[Employee] ([id], [fio], [roleId], [phoneNumber], [email]) VALUES (5, N'Климов Давид Артёмович', 5, N'+79456545454', N'ghjj@gmail.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (1, N'Кофемашинка', N'fg56-89')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (2, N'Мясорубка', N'127856CB')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (3, N'Соковыжималка', N'VB7898')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (4, N'Аэрогриль', N'678999')
INSERT [dbo].[Equipment] ([id], [title], [serialNumber]) VALUES (5, N'Тостер', N'UN8976I')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId]) VALUES (1, CAST(N'2024-04-14T13:09:00.000' AS DateTime), 5, 1, 1, N'Царапина на боковой панели', 1, 1)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId]) VALUES (4, CAST(N'2024-05-14T13:09:00.000' AS DateTime), 4, 2, 2, N'Вмятина', 1, 2)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId]) VALUES (5, CAST(N'2024-06-14T13:09:00.000' AS DateTime), 3, 3, 5, N'Пркеращает работу через 5 секунд после начала работы', 5, 3)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId]) VALUES (6, CAST(N'2024-07-14T13:09:00.000' AS DateTime), 2, 4, 4, N'При включении не начинает работу', 5, 2)
INSERT [dbo].[Requests] ([id], [dateOfCreation], [clientId], [equipmentId], [typeOfFaultId], [problemDescription], [employeeId], [statusId]) VALUES (7, CAST(N'2024-08-14T13:09:00.000' AS DateTime), 1, 5, 3, N'Не отключается автоматически', 2, 1)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [title]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([id], [title]) VALUES (2, N'Руководитель')
INSERT [dbo].[Role] ([id], [title]) VALUES (3, N'Заместитель генерального директора')
INSERT [dbo].[Role] ([id], [title]) VALUES (4, N'Генеральный директор')
INSERT [dbo].[Role] ([id], [title]) VALUES (5, N'Системный администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [title]) VALUES (1, N'В ожидании')
INSERT [dbo].[Status] ([id], [title]) VALUES (2, N'В работе')
INSERT [dbo].[Status] ([id], [title]) VALUES (3, N'Выполнено')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfFault] ON 

INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (1, N'Дефект')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (2, N'Повреждение')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (3, N'Нарушение функционирования')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (4, N'Отказ')
INSERT [dbo].[TypeOfFault] ([id], [title]) VALUES (5, N'Сбой')
SET IDENTITY_INSERT [dbo].[TypeOfFault] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Employee]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([requestId])
REFERENCES [dbo].[Requests] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__roleId__20C1E124] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__roleId__20C1E124]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__client__1BFD2C07] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__client__1BFD2C07]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__employ__1ED998B2] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__employ__1ED998B2]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__equipm__1CF15040] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__equipm__1CF15040]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__status__1FCDBCEB] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__status__1FCDBCEB]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__Requests__typeOf__1DE57479] FOREIGN KEY([typeOfFaultId])
REFERENCES [dbo].[TypeOfFault] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__Requests__typeOf__1DE57479]
GO
USE [master]
GO
ALTER DATABASE [RepairRequests] SET  READ_WRITE 
GO
