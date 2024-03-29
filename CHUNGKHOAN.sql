USE [CHUNGKHOAN]
GO
/****** Object:  Table [dbo].[BANGGIATRUCTUYEN]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANGGIATRUCTUYEN](
	[MACP] [char](7) NULL,
	[GIAMUA2] [float] NULL,
	[KLMUA2] [int] NULL,
	[GIAMUA1] [float] NULL,
	[KLMUA1] [int] NULL,
	[GIAKHOP] [float] NULL,
	[KLKHOP] [int] NULL,
	[GIABAN1] [float] NULL,
	[KLBAN1] [int] NULL,
	[GIABAN2] [float] NULL,
	[KLBAN2] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [char](7) NULL,
	[NGAYDAT] [datetime] NULL,
	[LOAIGD] [nchar](1) NULL,
	[LOAILENH] [nchar](10) NULL,
	[SOLUONG] [int] NULL,
	[GIADAT] [float] NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NULL,
	[SOLUONGKHOP] [int] NULL,
	[GIAKHOP] [float] NULL,
	[IDLENHDAT] [int] NOT NULL,
 CONSTRAINT [PK_LENHKHOP] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_ALL_MACP]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_ALL_MACP]
AS
SELECT DISTINCT MACP
FROM            dbo.LENHDAT
--WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)


GO
SET IDENTITY_INSERT [dbo].[LENHDAT] ON 

INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (1, N'ACB    ', CAST(N'2020-04-14 00:25:30.177' AS DateTime), N'M', N'LO        ', 0, 10000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (2, N'ACB    ', CAST(N'2020-04-14 00:27:20.620' AS DateTime), N'M', N'LO        ', 0, 10500, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (3, N'ACB    ', CAST(N'2020-04-14 00:30:12.127' AS DateTime), N'M', N'LO        ', 0, 9500, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (4, N'ACB    ', CAST(N'2020-04-14 00:31:17.813' AS DateTime), N'M', N'LO        ', 0, 11000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (5, N'MBB    ', CAST(N'2020-04-14 00:32:09.177' AS DateTime), N'M', N'LO        ', 0, 21000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (6, N'ACB    ', CAST(N'2020-04-14 00:32:16.980' AS DateTime), N'B', N'LO        ', 0, 9000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (7, N'MBB    ', CAST(N'2020-04-14 00:33:26.127' AS DateTime), N'B', N'LO        ', 0, 12000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (8, N'ACB    ', CAST(N'2020-04-14 00:36:53.620' AS DateTime), N'B', N'LO        ', 0, 9000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (10, N'MBB    ', CAST(N'2020-04-14 00:59:22.130' AS DateTime), N'M', N'LO        ', 0, 15000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (11, N'MBB    ', CAST(N'2020-04-14 07:57:07.400' AS DateTime), N'B', N'LO        ', 300, 8000, N'Khớp lệnh 1 phần')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (12, N'ACB    ', CAST(N'2020-04-14 08:40:21.650' AS DateTime), N'B', N'LO        ', 3000, 17000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (13, N'ACB    ', CAST(N'2020-04-14 08:45:07.447' AS DateTime), N'B', N'LO        ', 0, 9800, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (14, N'ACB    ', CAST(N'2020-04-14 09:43:28.993' AS DateTime), N'B', N'LO        ', 2500, 17000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (15, N'ACB    ', CAST(N'2020-04-14 09:45:37.550' AS DateTime), N'B', N'LO        ', 800, 17000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (16, N'ACB    ', CAST(N'2020-04-14 09:46:25.787' AS DateTime), N'B', N'LO        ', 400, 16000, N'Khớp lệnh 1 phần')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (17, N'ACB    ', CAST(N'2020-04-14 22:47:15.570' AS DateTime), N'M', N'LO        ', 2500, 15000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (18, N'ACB    ', CAST(N'2020-04-14 22:50:26.420' AS DateTime), N'M', N'LO        ', 1500, 14500, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (19, N'ACB    ', CAST(N'2020-04-16 08:52:39.600' AS DateTime), N'M', N'LO        ', 0, 16500, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (20, N'ACB    ', CAST(N'2020-04-16 08:57:25.513' AS DateTime), N'B', N'LO        ', 700, 10600, N'Khớp lệnh 1 phần')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (21, N'ACB    ', CAST(N'2020-04-16 08:58:33.060' AS DateTime), N'B', N'LO        ', 1200, 12600, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (22, N'ACB    ', CAST(N'2020-04-16 09:00:02.730' AS DateTime), N'B', N'LO        ', 700, 15600, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (23, N'ACB    ', CAST(N'2020-04-16 10:25:20.610' AS DateTime), N'M', N'LO        ', 1450, 10000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (24, N'ACB    ', CAST(N'2020-04-16 10:26:30.040' AS DateTime), N'M', N'LO        ', 1450, 10000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (25, N'ACB    ', CAST(N'2020-04-16 10:28:00.870' AS DateTime), N'M', N'LO        ', 1450, 10000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (26, N'ACB    ', CAST(N'2020-04-16 10:28:23.527' AS DateTime), N'M', N'LO        ', 170, 9500, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (27, N'MBB    ', CAST(N'2020-04-23 21:47:41.487' AS DateTime), N'M', N'LO        ', 0, 2000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (28, N'ACB    ', CAST(N'2020-04-27 09:12:48.623' AS DateTime), N'M', N'LO        ', 200, 10000, N'Chưa khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (29, N'ACB    ', CAST(N'2020-04-27 09:13:09.750' AS DateTime), N'M', N'LO        ', 300, 11000, N'Chưa khớp')
SET IDENTITY_INSERT [dbo].[LENHDAT] OFF
SET IDENTITY_INSERT [dbo].[LENHKHOP] ON 

INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (1, CAST(N'2020-04-14 00:48:46.030' AS DateTime), 1000, 11000, 4)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (2, CAST(N'2020-04-14 00:48:46.037' AS DateTime), 1000, 10500, 2)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (3, CAST(N'2020-04-14 00:48:46.040' AS DateTime), 700, 10000, 1)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (4, CAST(N'2020-04-14 00:49:27.087' AS DateTime), 1700, 9000, 6)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (5, CAST(N'2020-04-14 00:49:27.080' AS DateTime), 1000, 9000, 8)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (6, CAST(N'2020-04-14 00:59:22.180' AS DateTime), 500, 12000, 7)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (7, CAST(N'2020-04-14 07:57:07.467' AS DateTime), 1000, 21000, 5)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (8, CAST(N'2020-04-14 07:57:07.477' AS DateTime), 200, 15000, 10)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (9, CAST(N'2020-04-14 08:38:42.977' AS DateTime), 150, 10000, 1)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (10, CAST(N'2020-04-14 08:45:07.510' AS DateTime), 150, 10000, 1)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (11, CAST(N'2020-04-14 09:50:04.430' AS DateTime), 700, 9000, 8)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (12, CAST(N'2020-04-14 09:50:04.443' AS DateTime), 200, 9800, 13)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (13, CAST(N'2020-04-14 09:51:41.567' AS DateTime), 1000, 9500, 3)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (14, CAST(N'2020-04-14 15:44:24.033' AS DateTime), 1150, 9800, 13)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (15, CAST(N'2020-04-14 22:24:43.417' AS DateTime), 500, 16000, 16)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (16, CAST(N'2020-04-16 08:57:25.540' AS DateTime), 500, 16500, 19)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (17, CAST(N'2020-04-23 21:47:49.147' AS DateTime), 20, 2000, 27)
SET IDENTITY_INSERT [dbo].[LENHKHOP] OFF
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CursorLoaiGD]
	@OutCrsr CURSOR VARYING	OUTPUT,
	@macp NVARCHAR(10), @Ngay DATETIME, @LoaiGD CHAR(1)
AS
	SET DATEFORMAT DMY
	IF (@LoaiGD = 'M')
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
		WHERE MACP = @macp
			AND CAST(NGAYDAT AS DATE) = CAST(@Ngay AS DATE)--DAY(NGAYDAT) = DAY(@Ngay) AND MONTH(NGAYDAT) = MONTH(@Ngay) AND YEAR(NGAYDAT) = YEAR(@Ngay)
			AND LOAIGD = @LoaiGD AND SOLUONG > 0
			ORDER BY GIADAT DESC, NGAYDAT --Sắp xếp giá đặt từ cao xuống, Time tu nhanh den cham
	ELSE 
		SET @OutCrsr = CURSOR KEYSET FOR 
		SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
		WHERE MACP = @macp
			AND CAST(NGAYDAT AS DATE) = CAST(@Ngay AS DATE)--DAY(NGAYDAT) = DAY(@Ngay) AND MONTH(NGAYDAT) = MONTH(@Ngay) AND YEAR(NGAYDAT) = YEAR(@Ngay)
			AND LOAIGD = @LoaiGD AND SOLUONG > 0
			ORDER BY GIADAT, NGAYDAT
	OPEN @OutCrsr 




GO
/****** Object:  StoredProcedure [dbo].[SP_CLEAR_BANGGIA]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CLEAR_BANGGIA]
AS
	BEGIN
	TRUNCATE TABLE dbo.BANGGIATRUCTUYEN
	DECLARE @MACP CHAR(7)

	DECLARE CurVar CURSOR FOR (SELECT DISTINCT MACP FROM dbo.LENHDAT WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	OPEN CurVar

	FETCH NEXT FROM CurVar INTO @MACP
	WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			INSERT INTO dbo.BANGGIATRUCTUYEN
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

			--đổi sang insert nó bị sai :(
			UPDATE dbo.BANGGIATRUCTUYEN 
			SET GIAKHOP = @GIAKHOP, KLKHOP = @KLKHOP
			WHERE MACP = @MACP
			--JUMP
			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
	@macp NVARCHAR(10), @Ngay DATETIME, @LoaiGD CHAR(1),
	@soluongMB INT, @giadatMB FLOAT 
AS
	SET DATEFORMAT DMY
	DECLARE @CrsrVar CURSOR, @ngaydat DATETIME, @soluong INT,
	@giadat	FLOAT, @soluongkhop INT, @giakhop FLOAT, @ID INT, @sumsoluongkhop INT, @khoped BIT

	SET @sumsoluongkhop = 0
	SET @khoped = 0

	IF(@LoaiGD = 'B')--Nếu bán thì nó sẽ chạy sp và xem thằng mua nào đặt trước với giá cao nhất 
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
	ELSE --còn mua thì ngược lại
		EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'
	FETCH NEXT FROM @CrsrVar INTO @ID, @ngaydat, @soluong, @giadat
	--select @ID, @ngaydat, @soluong, @giadat cua bang lenhdat tao thanh 1 bang roi dua con tro vao bang do
	WHILE(@@FETCH_STATUS <>-1 AND @soluongMB > 0)
	BEGIN
		IF(@LoaiGD = 'B')--nếu gia dịch là bán
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
/****** Object:  StoredProcedure [dbo].[SP_REFRESH_BANGGIA_WITHOUT_DATA_CHANGE]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REFRESH_BANGGIA_WITHOUT_DATA_CHANGE]
AS
BEGIN
	--update trạng thái cho lệnh đặt 'chờ khớp' khác phiên
	UPDATE dbo.LENHDAT 
	SET TRANGTHAILENH = N'Chưa khớp' 
	WHERE TRANGTHAILENH = N'Chờ khớp' AND CAST(NGAYDAT AS DATE) <> CAST(GETDATE() AS DATE)

	--chạy trigger AfterModify_LENHDAT
	UPDATE dbo.LENHDAT 
	SET LOAILENH = LOAILENH 
	WHERE 1 = 1
END

GO
/****** Object:  Trigger [dbo].[TR_AfterModify_LENHDAT]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER  [dbo].[TR_AfterModify_LENHDAT] 
   ON  [dbo].[LENHDAT] 
   AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
	EXEC SP_CLEAR_BANGGIA --xoá hết BANGGIATRUCTUYEN, insert MACP, update GIAKHOP, KLKHOP

	DECLARE @MACP CHAR(7)

	DECLARE CurVar CURSOR FOR (SELECT DISTINCT MACP FROM dbo.LENHDAT WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	OPEN CurVar

	FETCH NEXT FROM CurVar INTO @MACP
	WHILE (@@FETCH_STATUS <> -1)
		BEGIN			
			--MUA1
			DECLARE @GIAMUA1 FLOAT, @KLMUA1 INT
			SET @GIAMUA1 = 0
			SET @KLMUA1 = 0
			--tìm ra giá mua cao nhất trong bảng lệnh đặt
			SET @GIAMUA1 = (SELECT MAX(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T)
			
			--cộng dồn số lượng mua nếu có giá mua trùng nhau
			SELECT @GIAMUA1 = TOPGIA.GIADAT ,@KLMUA1 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIAMUA1) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.BANGGIATRUCTUYEN 
			SET GIAMUA1 = @GIAMUA1, KLMUA1 = @KLMUA1 
			WHERE MACP = @MACP AND @GIAMUA1 > 0 AND @KLMUA1 > 0

			--MUA2
			DECLARE @GIAMUA2 FLOAT, @KLMUA2 INT
			SET @GIAMUA2 = 0
			SET @KLMUA2 = 0
			--tìm ra giá mua cao thứ 2 trong bảng lệnh đặt
			SET @GIAMUA2 = (SELECT MAX(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
							WHERE T.GIADAT < (SELECT MAX(T.GIADAT)
											FROM (SELECT *
												FROM dbo.LENHDAT 
												WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T))
			--cộng dồn số lượng mua nếu có giá mua trùng nhau
			SELECT @GIAMUA2 = TOPGIA.GIADAT, @KLMUA2 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIAMUA2) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.BANGGIATRUCTUYEN 
			SET GIAMUA2 = @GIAMUA2, KLMUA2 = @KLMUA2
			WHERE MACP = @MACP AND @GIAMUA2 > 0 AND @KLMUA2 > 0

			--BAN1
			DECLARE @GIABAN1 FLOAT, @KLBAN1 INT
			SET @GIABAN1 = 0
			SET @KLBAN1 = 0
			--tìm ra giá bán thấp nhất trong bảng lệnh đặt
			SET @GIABAN1 = (SELECT MIN(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T)
			--cộng dồn số lượng bán nếu có giá mua trùng nhau
			SELECT @GIABAN1 = TOPGIA.GIADAT ,@KLBAN1 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIABAN1) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.BANGGIATRUCTUYEN 
			SET GIABAN1 = @GIABAN1, KLBAN1 = @KLBAN1 
			WHERE MACP = @MACP AND @GIABAN1 > 0 AND @KLBAN1 > 0

			--BAN2
			DECLARE @GIABAN2 FLOAT, @KLBAN2 INT
			SET @GIABAN2 = 0
			SET @KLBAN2 = 0
			--tìm ra giá bán thấp thứ 2 trong bảng lệnh đặt
			SET @GIABAN2 = (SELECT MIN(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
							WHERE T.GIADAT > (SELECT MIN(T.GIADAT)
											FROM (SELECT *
												FROM dbo.LENHDAT 
												WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T))
			--cộng dồn số lượng mua nếu có giá mua trùng nhau
			SELECT @GIABAN2 = TOPGIA.GIADAT, @KLBAN2 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIABAN2) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.BANGGIATRUCTUYEN 
			SET GIABAN2 = @GIABAN2, KLBAN2 = @KLBAN2
			WHERE MACP = @MACP AND @GIABAN2 > 0 AND @KLBAN2 > 0
			--JUMP
			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
END

GO
/****** Object:  Trigger [dbo].[TR_AfterModify_LENHKHOP]    Script Date: 4/28/2020 9:45:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER  [dbo].[TR_AfterModify_LENHKHOP] 
   ON  [dbo].[LENHKHOP] 
   AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
	DECLARE @MACP CHAR(7)

	DECLARE CurVar CURSOR FOR (SELECT DISTINCT MACP FROM dbo.LENHDAT WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	OPEN CurVar

	FETCH NEXT FROM CurVar INTO @MACP
	WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			DECLARE @GIAKHOP FLOAT, @KLKHOP INT
			SET @GIAKHOP = (SELECT TOP(1) LK.GIAKHOP
						FROM dbo.LENHKHOP LK INNER JOIN dbo.LENHDAT LD ON LK.IDLENHDAT = LD.ID
						WHERE LD.MACP = @MACP AND CAST(LK.NGAYKHOP AS DATE) = CAST(GETDATE() AS	DATE)
						ORDER BY LK.IDKHOP DESC)
			SET @KLKHOP = (SELECT TOP(1) LK.SOLUONGKHOP
						FROM dbo.LENHKHOP LK INNER JOIN dbo.LENHDAT LD ON LK.IDLENHDAT = LD.ID
						WHERE LD.MACP = @MACP AND CAST(LK.NGAYKHOP AS DATE) = CAST(GETDATE() AS	DATE)
						ORDER BY LK.IDKHOP DESC)

			UPDATE dbo.BANGGIATRUCTUYEN
			SET GIAKHOP = @GIAKHOP, KLKHOP = @KLKHOP
			WHERE MACP = @MACP	
			--JUMP
			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
END

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
