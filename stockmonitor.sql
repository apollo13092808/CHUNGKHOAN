--use master
--go
--create database STOCKMONITOR
--go
use STOCKMONITOR
go
create table LENHDAT
(
	ID int identity(1, 1) not null,
	MACP nvarchar(7) not null,
	NGAYDAT datetime not null,
	LOAIGD nchar(1) null,
	LOAILENH nvarchar(10) not null,
	SOLUONG int not null,
	GIADAT float not null,
	TRANGTHAILENH nvarchar(30) null,

	constraint PK_LENHDAT primary key (ID),
)

go
CREATE VIEW [dbo].[V_ALL_MACP]
AS
SELECT DISTINCT MACP
FROM            dbo.LENHDAT
--WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)


GO
go
create table LENHKHOP
(
	IDKHOP int identity(1, 1) not null,
	NGAYKHOP datetime not null,
	SOLUONGKHOP int not null,
	GIAKHOP float not null,
	IDLENHDAT int not null,

	constraint PK_LENHKHOP primary key (IDKHOP),
)
go
create table TRUCTUYEN
(
	MACP nvarchar(7) not null,
	GIAMUA3 float null constraint DF_TRUCTUYEN_GIAMUA3  default 0,
	KLMUA3 int null constraint DF_TRUCTUYEN_KLMUA3  default 0,
	GIAMUA2 float null constraint DF_TRUCTUYEN_GIAMUA2  default 0,
	KLMUA2 int null constraint DF_TRUCTUYEN_KLMUA2  default 0,
	GIAMUA1 float null constraint DF_TRUCTUYEN_GIAMUA1  default 0,
	KLMUA1 int null constraint DF_TRUCTUYEN_KLMUA1  default 0,
	GIAKHOP float null constraint DF_TRUCTUYEN_GIAKHOP  default 0,
	KLKHOP int null constraint DF_TRUCTUYEN_KLKHOP  default 0,
	GIABAN1 float null constraint DF_TRUCTUYEN_GIABAN1  default 0,
	KLBAN1 int null constraint DF_TRUCTUYEN_KLBAN1  default 0,
	GIABAN2 float null constraint DF_TRUCTUYEN_GIABAN2  default 0,
	KLBAN2 int null constraint DF_TRUCTUYEN_KLBAN2  default 0,
	GIABAN3 float null constraint DF_TRUCTUYEN_GIABAN3  default 0,
	KLBAN3 int null constraint DF_TRUCTUYEN_KLBAN3  default 0,

	constraint PK_GIATRUCTUYEN primary key (MACP),
)
go
alter table TRUCTUYEN  WITH CHECK ADD  CONSTRAINT CK_TRUCTUYEN CHECK  (GIAMUA3>=0 AND KLMUA3>=0 AND GIAMUA2>=0 AND KLMUA2>=0 AND GIAMUA1>=0 AND KLMUA1>=0 AND GIAKHOP>=0 AND KLKHOP>=0 AND GIABAN1>=0 AND KLBAN1>=0 AND GIABAN2>=0 AND KLBAN2>=0 AND GIABAN3>=0 AND KLBAN3>=0)
go
alter table TRUCTUYEN CHECK CONSTRAINT CK_TRUCTUYEN
go

GO

CREATE PROC SP_CLEAR_PRICETABLE
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


CREATE PROC CursorLoaiGD
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

GO
CREATE PROC SP_KHOPLENH_LO
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

CREATE PROCEDURE  SP_RESET_PRICETABLE
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


CREATE TRIGGER   TR_AfterModify_LENHDAT
   ON  [dbo].[LENHDAT] 
   AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
	EXEC SP_CLEAR_PRICETABLE --xoá hết table TRUCTUYEN, insert MACP, update GIAKHOP, KLKHOP

	DECLARE @MACP CHAR(7)

	DECLARE CurVar CURSOR FOR (SELECT DISTINCT MACP FROM dbo.LENHDAT WHERE CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE))

	OPEN CurVar

	FETCH NEXT FROM CurVar INTO @MACP
	WHILE (@@FETCH_STATUS <> -1)
		BEGIN			
			---------------------------------------- MUA1
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

			UPDATE dbo.TRUCTUYEN 
			SET GIAMUA1 = @GIAMUA1, KLMUA1 = @KLMUA1 
			WHERE MACP = @MACP AND @GIAMUA1 > 0 AND @KLMUA1 > 0

			---------------------------------------- MUA2
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

			UPDATE dbo.TRUCTUYEN 
			SET GIAMUA2 = @GIAMUA2, KLMUA2 = @KLMUA2
			WHERE MACP = @MACP AND @GIAMUA2 > 0 AND @KLMUA2 > 0
			
			---------------------------------------- MUA3
			DECLARE @GIAMUA3 FLOAT, @KLMUA3 INT
			SET @GIAMUA3 = 0
			SET @KLMUA3 = 0
			--tìm ra giá mua cao thứ 3 trong bảng lệnh đặt
			SET @GIAMUA3 = (SELECT MAX(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
								WHERE T.GIADAT < (SELECT MAX(T.GIADAT)
												FROM (SELECT *
													FROM dbo.LENHDAT 
													WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
													WHERE T.GIADAT < (SELECT MAX(T.GIADAT)
																FROM (SELECT *
																	FROM dbo.LENHDAT 
																	WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T))) 
															
			--cộng dồn số lượng mua nếu có giá mua trùng nhau
			SELECT @GIAMUA3 = TOPGIA.GIADAT, @KLMUA3 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'M' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIAMUA3) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.TRUCTUYEN 
			SET GIAMUA3 = @GIAMUA3, KLMUA3 = @KLMUA3
			WHERE MACP = @MACP AND @GIAMUA3 > 0 AND @KLMUA3 > 0

			---------------------------------------- BAN1
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

			UPDATE dbo.TRUCTUYEN 
			SET GIABAN1 = @GIABAN1, KLBAN1 = @KLBAN1 
			WHERE MACP = @MACP AND @GIABAN1 > 0 AND @KLBAN1 > 0

			---------------------------------------- BAN2
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

			UPDATE dbo.TRUCTUYEN 
			SET GIABAN2 = @GIABAN2, KLBAN2 = @KLBAN2
			WHERE MACP = @MACP AND @GIABAN2 > 0 AND @KLBAN2 > 0
			
			--------------------------------------- BAN3
			DECLARE @GIABAN3 FLOAT, @KLBAN3 INT
			SET @GIABAN3 = 0
			SET @KLBAN3 = 0
			--tìm ra giá bán thấp thứ 3 trong bảng lệnh đặt
			SET @GIABAN3 = (SELECT MIN(T.GIADAT)
							FROM (SELECT *
								FROM dbo.LENHDAT 
								WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
								WHERE T.GIADAT > (SELECT MIN(T.GIADAT)
											FROM (SELECT *
												FROM dbo.LENHDAT 
												WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
												WHERE T.GIADAT > (SELECT MIN(T.GIADAT)
													FROM (SELECT *
														FROM dbo.LENHDAT 
														WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T)))
			--cộng dồn số lượng mua nếu có giá mua trùng nhau
			SELECT @GIABAN3 = TOPGIA.GIADAT, @KLBAN3 = SUM(TOPGIA.SOLUONG)
			FROM(SELECT  *
				FROM (SELECT *
					FROM dbo.LENHDAT 
					WHERE LOAIGD = 'B' AND SOLUONG > 0 AND MACP = @MACP AND CAST(NGAYDAT AS DATE) = CAST(GETDATE() AS DATE)) T
				WHERE T.GIADAT = @GIABAN3) TOPGIA
			GROUP BY TOPGIA.GIADAT

			UPDATE dbo.TRUCTUYEN 
			SET GIABAN3 = @GIABAN3, KLBAN3 = @KLBAN3
			WHERE MACP = @MACP AND @GIABAN3 > 0 AND @KLBAN3 > 0
			--JUMP
			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
END
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

			UPDATE dbo.TRUCTUYEN
			SET GIAKHOP = @GIAKHOP, KLKHOP = @KLKHOP
			WHERE MACP = @MACP	
			--JUMP
			FETCH NEXT FROM CurVar INTO @MACP
		END
	CLOSE CurVar
	DEALLOCATE CurVar
END

GO

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


--USE master ;
--GO
--ALTER DATABASE STOCKMONITOR SET ENABLE_BROKER with rollback immediate

--SELECT NAME , is_broker_enabled, service_broker_guid
--FROM SYS.DATABASES

INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (1, N'ACB    ', CAST(N'2020-04-14 00:25:30.177' AS DateTime), N'M', N'LO        ', 0, 10000, N'Khớp hết')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (2, N'ACB    ', CAST(N'2020-04-14 00:27:20.620' AS DateTime), N'M', N'LO        ', 0, 10500, N'Khớp hết')


