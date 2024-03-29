USE [master]
GO
/****** Object:  Database [STOCKMONITOR]    Script Date: 17-05-2021 16:27:47 ******/
CREATE DATABASE [STOCKMONITOR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STOCKMONITOR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\STOCKMONITOR.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STOCKMONITOR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\STOCKMONITOR_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STOCKMONITOR] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STOCKMONITOR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STOCKMONITOR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET ARITHABORT OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STOCKMONITOR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STOCKMONITOR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET  ENABLE_BROKER 
GO
ALTER DATABASE [STOCKMONITOR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STOCKMONITOR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET RECOVERY FULL 
GO
ALTER DATABASE [STOCKMONITOR] SET  MULTI_USER 
GO
ALTER DATABASE [STOCKMONITOR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STOCKMONITOR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STOCKMONITOR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STOCKMONITOR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STOCKMONITOR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STOCKMONITOR', N'ON'
GO
USE [STOCKMONITOR]
GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [nvarchar](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL,
	[LOAIGD] [nchar](1) NULL,
	[LOAILENH] [nvarchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NOT NULL,
	[SOLUONGKHOP] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[IDLENHDAT] [int] NOT NULL,
 CONSTRAINT [PK_LENHKHOP] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUCTUYEN]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUCTUYEN](
	[MACP] [nvarchar](7) NOT NULL,
	[GIAMUA3] [float] NULL,
	[KLMUA3] [int] NULL,
	[GIAMUA2] [float] NULL,
	[KLMUA2] [int] NULL,
	[GIAMUA1] [float] NULL,
	[KLMUA1] [int] NULL,
	[GIAKHOP] [float] NULL,
	[KLKHOP] [int] NULL,
	[GIABAN1] [float] NULL,
	[KLBAN1] [int] NULL,
	[GIABAN2] [float] NULL,
	[KLBAN2] [int] NULL,
	[GIABAN3] [float] NULL,
	[KLBAN3] [int] NULL,
 CONSTRAINT [PK_GIATRUCTUYEN] PRIMARY KEY CLUSTERED 
(
	[MACP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIAMUA3]  DEFAULT ((0)) FOR [GIAMUA3]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLMUA3]  DEFAULT ((0)) FOR [KLMUA3]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIAMUA2]  DEFAULT ((0)) FOR [GIAMUA2]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLMUA2]  DEFAULT ((0)) FOR [KLMUA2]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIAMUA1]  DEFAULT ((0)) FOR [GIAMUA1]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLMUA1]  DEFAULT ((0)) FOR [KLMUA1]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIAKHOP]  DEFAULT ((0)) FOR [GIAKHOP]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLKHOP]  DEFAULT ((0)) FOR [KLKHOP]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIABAN1]  DEFAULT ((0)) FOR [GIABAN1]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLBAN1]  DEFAULT ((0)) FOR [KLBAN1]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIABAN2]  DEFAULT ((0)) FOR [GIABAN2]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLBAN2]  DEFAULT ((0)) FOR [KLBAN2]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_GIABAN3]  DEFAULT ((0)) FOR [GIABAN3]
GO
ALTER TABLE [dbo].[TRUCTUYEN] ADD  CONSTRAINT [DF_TRUCTUYEN_KLBAN3]  DEFAULT ((0)) FOR [KLBAN3]
GO
ALTER TABLE [dbo].[TRUCTUYEN]  WITH CHECK ADD  CONSTRAINT [CK_TRUCTUYEN] CHECK  (([GIAMUA3]>=(0) AND [KLMUA3]>=(0) AND [GIAMUA2]>=(0) AND [KLMUA2]>=(0) AND [GIAMUA1]>=(0) AND [KLMUA1]>=(0) AND [GIAKHOP]>=(0) AND [KLKHOP]>=(0) AND [GIABAN1]>=(0) AND [KLBAN1]>=(0) AND [GIABAN2]>=(0) AND [KLBAN2]>=(0) AND [GIABAN3]>=(0) AND [KLBAN3]>=(0)))
GO
ALTER TABLE [dbo].[TRUCTUYEN] CHECK CONSTRAINT [CK_TRUCTUYEN]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CursorLoaiGD]
	@OutCrsr CURSOR VARYING	OUTPUT,
	@macp NVARCHAR(7), @Ngay DATETIME, @LoaiGD NCHAR(1)
AS
	SET DATEFORMAT DMY
	IF (@LoaiGD = 'M')
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
		WHERE MACP = @macp
			AND CAST(NGAYDAT AS DATE) = CAST(@Ngay AS DATE) --DAY(NGAYDAT) = DAY(@Ngay) AND MONTH(NGAYDAT) = MONTH(@Ngay) AND YEAR(NGAYDAT) = YEAR(@Ngay)
			AND LOAIGD = @LoaiGD AND SOLUONG > 0
			ORDER BY GIADAT DESC, NGAYDAT --Sắp xếp giá đặt từ cao xuống, Time tu nhanh den cham
	ELSE 
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
		WHERE MACP = @macp
			AND CAST(NGAYDAT AS DATE) = CAST(@Ngay AS DATE) --DAY(NGAYDAT) = DAY(@Ngay) AND MONTH(NGAYDAT) = MONTH(@Ngay) AND YEAR(NGAYDAT) = YEAR(@Ngay)
			AND LOAIGD = @LoaiGD AND SOLUONG > 0
			ORDER BY GIADAT, NGAYDAT
	OPEN @OutCrsr 


GO
/****** Object:  StoredProcedure [dbo].[SP_CLEAR_GIATRUCTUYEN]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CLEAR_GIATRUCTUYEN]
AS
	BEGIN
	TRUNCATE TABLE dbo.TRUCTUYEN
	DECLARE @MACP NVARCHAR(7)

	DECLARE CurVar CURSOR FOR (SELECT DISTINCT MACP FROM dbo.LENHDAT WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	OPEN CurVar

	FETCH NEXT FROM CurVar INTO @MACP
	WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			INSERT INTO dbo.TRUCTUYEN
			        (MACP)
			VALUES (@MACP)

			DECLARE @GIAKHOP FLOAT, @KLKHOP INT
			SET @GIAKHOP = (SELECT TOP(1) LK.GIAKHOP
						FROM dbo.LENHKHOP LK INNER JOIN dbo.LENHDAT LD ON LK.IDLENHDAT = LD.ID
						WHERE LD.MACP = @MACP AND CAST(LK.NGAYKHOP AS DATE) = CAST(GETDATE() AS	DATE)
						ORDER BY LK.IDKHOP DESC)
			SET @KLKHOP = (SELECT TOP(1) LK.SOLUONGKHOP
						FROM dbo.LENHKHOP LK INNER JOIN dbo.LENHDAT LD ON LK.IDLENHDAT = LD.ID
						WHERE LD.MACP = @MACP AND CAST(LK.NGAYKHOP AS DATE) = CAST(GETDATE() AS	DATE)
						ORDER BY LK.IDKHOP DESC)

			UPDATE dbo.TRUCTUYEN 
			SET GIAKHOP = @GIAKHOP, KLKHOP = @KLKHOP
			WHERE MACP = @MACP

			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
	@macp NVARCHAR(7), @Ngay DATETIME, @LoaiGD NCHAR(1),
	@soluongMB INT, @giadatMB FLOAT 
AS
	SET DATEFORMAT DMY
	DECLARE @CrsrVar CURSOR, @ngaydat DATETIME, @soluong INT,
	@giadat	FLOAT, @soluongkhop INT, @giakhop FLOAT, @ID INT, @sumsoluongkhop INT, @khoped BIT

	SET @sumsoluongkhop = 0
	SET @khoped = 0

	IF(@LoaiGD = 'B')--Nếu bán thì sẽ chạy sp và xem bên mua nào đặt trước với giá cao nhất 
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
	ELSE --còn mua thì ngược lại
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'
	FETCH NEXT FROM @CrsrVar INTO @ID, @ngaydat, @soluong, @giadat
	--select @ID, @ngaydat, @soluong, @giadat cua bang lenhdat tao thanh 1 bang roi dua con tro vao bang do
	WHILE(@@FETCH_STATUS <>-1 AND @soluongMB > 0)
	BEGIN
		IF(@LoaiGD = 'B')--nếu giao dịch là bán
			BEGIN
				IF(@giadatMB <= @giadat)
					BEGIN
						IF(@soluongMB >= @soluong)
							BEGIN
								SET @soluongkhop = @soluong
								SET @giakhop = @giadat
								SET @soluongMB = @soluongMB - @soluong
								UPDATE dbo.LENHDAT 
									SET SOLUONG = 0,TRANGTHAILENH = N'Khớp hết'
									WHERE CURRENT OF @CrsrVar
								SET @khoped = 1
							END
						ELSE
							BEGIN
								SET @soluongkhop = @soluongMB
								SET @giakhop = @giadat
								UPDATE dbo.LENHDAT
									SET SOLUONG = SOLUONG - @soluongMB,TRANGTHAILENH = N'Khớp lệnh 1 phần'
									WHERE CURRENT OF @CrsrVar
									SET @soluongMB = 0
								SET @khoped = 1
							END
						--SELECT @soluongkhop, @giakhop
						SET @sumsoluongkhop = @sumsoluongkhop + @soluongkhop
						--Update table LENHKHOP
						INSERT INTO LENHKHOP(NGAYKHOP, SOLUONGKHOP, GIAKHOP, IDLENHDAT)
								VALUES (GETDATE(),@soluongkhop, @giakhop, @ID)
				
					END
				ELSE
					GOTO THOAT
				END
			
		-- Còn Trường hợp lệnh gởi vào là lệnh MUA
		ELSE
			BEGIN
				IF(@giadatMB >= @giadat)
					BEGIN
						IF(@soluongMB >= @soluong)
							BEGIN
								SET @soluongkhop = @soluong
								SET @giakhop = @giadat
								SET @soluongMB = @soluongMB - @soluong
								UPDATE dbo.LENHDAT 
									SET SOLUONG = 0,TRANGTHAILENH = N'Khớp hết'
									WHERE CURRENT OF @CrsrVar
								SET @khoped = 1
							END
						ELSE
							BEGIN
								SET @soluongkhop = @soluongMB
								SET @giakhop = @giadat
								UPDATE dbo.LENHDAT
									SET SOLUONG = SOLUONG - @soluongMB,TRANGTHAILENH = N'Khớp lệnh 1 phần'
									WHERE CURRENT OF @CrsrVar
									SET @soluongMB = 0
								SET @khoped = 1
							END
						--SELECT @soluongkhop, @giakhop
						SET @sumsoluongkhop = @sumsoluongkhop + @soluongkhop
						--Update table LENHKHOP
						INSERT INTO LENHKHOP(NGAYKHOP, SOLUONGKHOP, GIAKHOP, IDLENHDAT)
								VALUES (GETDATE(),@soluongkhop, @giakhop, @ID)
				
					END
				ELSE
					GOTO THOAT
				END
			
		FETCH NEXT FROM @CrsrVar INTO @ID, @ngaydat, @soluong, @giadat
	END
	
	THOAT:
	--Cập nhật table LENHDAT nếu số lượng mua bán > 0
	IF(@soluongMB>0)
	BEGIN
		IF(@khoped = 1)
			BEGIN
				INSERT INTO LENHDAT(MACP, NGAYDAT, LOAIGD, LOAILENH, SOLUONG, GIADAT, TRANGTHAILENH)
				VALUES(@macp, @Ngay, @LoaiGD, 'LO', @soluongMB, @giadatMB, N'Khớp lệnh 1 phần')
			END
		ELSE
			BEGIN
				INSERT INTO LENHDAT(MACP, NGAYDAT, LOAIGD, LOAILENH, SOLUONG, GIADAT, TRANGTHAILENH)
				VALUES(@macp, @Ngay, @LoaiGD, 'LO', @soluongMB, @giadatMB, N'Chờ khớp')
			END
	END
		RETURN @sumsoluongkhop
		CLOSE @CrsrVar 
		DEALLOCATE @CrsrVar
		

GO
/****** Object:  StoredProcedure [dbo].[SP_REFRESH_GIATRUCTUYEN]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_REFRESH_GIATRUCTUYEN]
AS
BEGIN
	--update trạng thái cho lệnh đặt 'chờ khớp' khác phiên
	UPDATE dbo.LENHDAT 
	SET TRANGTHAILENH = N'Chưa khớp' 
	WHERE TRANGTHAILENH = N'Chờ khớp' AND CAST(NGAYDAT AS DATE) <> CAST(GETDATE() AS DATE)

	
	UPDATE dbo.LENHDAT 
	SET LOAILENH = LOAILENH 
	WHERE 1 = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ResetLenhDat]    Script Date: 17-05-2021 16:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ResetLenhDat]
AS
SET DATEFORMAT DMY
DECLARE @Ngay as NVARCHAR(50) = (SELECT CONVERT(nvarchar(50), getdate(), 103))--lấy thời điểm hiện tại
UPDATE dbo.LENHDAT SET TRANGTHAILENH=N'Huỷ'
				  WHERE DATEDIFF(day, @Ngay, NGAYDAT) < 0
					   and SOLUONG > 0 
					   and TRANGTHAILENH <> N'Huỷ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LENHDAT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ALL_MACP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ALL_MACP'
GO
USE [master]
GO
ALTER DATABASE [STOCKMONITOR] SET  READ_WRITE 
GO
