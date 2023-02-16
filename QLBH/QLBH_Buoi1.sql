Create database QLBH
use QLBH

--* CÂU 1 * --

----------- TẠO BẢNG ---------------

Create table KHACHHANG
(
	MAKH char(4),
	HOTEN varchar(40),
	DCHI varchar(40),
	SODT varchar(11),
	NGSINH smalldatetime,
	NGDK smalldatetime,
	DOANHSO money,
)

Create table NHANVIEN
(
	MANV char(4),
	HOTEN varchar(40),
	NGLV smalldatetime,
	SODT varchar(11),
)

Create table SANPHAM
(
	MASP char(4),
	TENSP varchar(40),
	DVT char(10),
	NUOCSX varchar(40),
	GIA money,
)

Create table HOADON
(
	SOHD varchar(20),
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money,
)

Create table CTHD 
(
	SOHD varchar(20),
	MASP char(4),
	SL int,
)

------ TẠO KHOÁ CHÍNH --------
ALter table KHACHHANG Alter column MAKH char(4) Not null
Alter table KHACHHANG Add constraint PK_KH Primary key (MAKH)

ALter table NHANVIEN Alter column MANV char(4) Not null
Alter table NHANVIEN Add constraint PK_NV Primary key (MANV)

Alter table SANPHAM Alter column MASP char(4) Not null
Alter table SANPHAM Add constraint PK_SP Primary key (MASP)

Alter table HOADON Alter column SOHD varchar(20) Not null
Alter table HOADON Add constraint PK_HD Primary key (SOHD)

ALter table CTHD Alter column SOHD varchar(20) Not null
Alter table CTHD Alter column MASP char(4) Not null
Alter table CTHD Add constraint PK_CTHD primary key (SOHD,MASP)

----- TẠO KHOÁ NGOẠI --------

Alter table HOADON Alter column MAKH char(4) Not null
Alter table HOADON Alter column MANV char(4) Not null
Alter table HOADON Add constraint FK_KH_HOADON foreign key (MAKH) references KHACHHANG(MAKH)
Alter table HOADON Add constraint FK_NV_HOADON foreign key (MANV) references NHANVIEN(MANV)

Alter table CTHD Add
constraint FK_HD_CTHD foreign key (SOHD) references HOADON(SOHD),
constraint FK_SP_CTHD foreign key (MASP) references SANPHAM(MASP)


--*CÂU 2*--
Alter table SANPHAM Add GHICHU varchar(20)
--*CÂU 3*--
Alter table KHACHHANG Add LOAIKH tinyint
--*CÂU 4*--
ALter table SANPHAM ALter column GHICHU varchar(100)
--*CÂU 5*--
Alter table SANPHAM Drop column GHICHU
--*CÂU 6*--
-- Đổi kiểu dữ liệu LOAIKH sang varchar / char
Alter table SANPHAM Alter column LOAIKH varchar(20)
--*CÂU 7*--
Alter table SANPHAM Add constraint DVT check(DVT='cay' or DVT='hop' or DVT='cai' or DVT='quyen' or DVT='chuc')
--*CÂU 8*--
Alter table SANPHAM Add constraint GIA check(GIA>=500)
--*CÂU 9*--
Alter table HOADON Add constraint SOHD check(SOHD>=1)
--*CÂU 10*--
Alter table KHACHHANG Add constraint NGDK check (NGDK > NGSINH)