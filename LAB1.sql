IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'Example5'
  DROP DATABASE Example5
  GO
  CREATE DATABASE Example5TE
  GO
  USE Example5
  GO
  --tạo bảng lớp học
  CREATE TABLE Lophoc(
       MaLopHoc INT PRIMARY KEY IDENTITY,
	   TenLopHoc VARCHAR(10)
	   )
	   GO
	   --TẠO bảng sinh viên có khóa ngoại Là cột malophoc, nối với bảng lophoc
	   CREATE TABLE SinhVien (
	   MaSV int PRIMARY KEY,
	   TenSV varchar (40),
	   MaLopHoc int,
	   CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc (MaLopHoc)
	   ) 
	   GO
	   --Tạo bảng sanpham với cột null, 1 cột not null
	   CREATE TABLE SanPham (
	   MaSP int NOT NULL,
	   TenSP varchar (40) NULL
	   )
	   GO
	   --Tạo bảng với thuộc tính default cho cột price
	   CREATE TABLE StoreProduct (
	   ProductID int NOT NULL,
	   Name varchar (40) NOT NULL,
	   Price money NOT NULL DEFAULT (100)
	   )
	   --thử kiểm tra gtri default có đc sử dụng hay không
	   INSERT INTO StoreProduct (ProductID, Name) VALUES (111, Rivets)
	   GO
	   --Tạo bảng ContactPhone với thuộc tính IDENTITY
        CREATE TABLE ContactPhone (
        Person_ID int IDENTITY(500,1) NOT NULL,
        MobileNumber bigint NOT NULL
        )
        GO
		--Tạo cột nhận dạng duy nhất tổng thể
CREATE TABLE CellularPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--Chèn một record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone
GO
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và
LanlieNumber để quan sát lỗi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
GO
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
(MobileNumber),
Amount bigint CHECK (Amount >0)
)
GO
--Chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone
ALTER COLUMN ServiceProvider varchar(45)
GO
--Xóa cột trong bảng
ALTER TABLE ContactPhone
DROP COLUMN ServiceProvider
GO
---Them một ràng buộc vào bảng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xóa một ràng buộc
ALTER TABLE Person.ContactPhone
DROP CONSTRAINT CHK_RC
