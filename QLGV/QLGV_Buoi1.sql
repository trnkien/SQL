Create database QLGV
use QLGV

----------- TẠO BẢNG -------------

Create table KHOA
(
	MAKHOA varchar(4),
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRNGKHOA char(4)
)

Create table MONHOC 
(
	MAMH varchar(10),
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA varchar(4),
)

Create table DIEUKIEN 
(
	MAMH varchar(10),
	MAMH_TRUOC varchar(10),
)

Create table GIAOVIEN
(
	MAGV char(4),
	HOTEN varchar(40),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO bit,
	MUCLUONG money,
	MAKHOA varchar(4),
)

Create table LOP 
(
	MALOP char(3),
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4),
)

Create table HOCVIEN
(
	MAHV char(5),
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3),
)

Create table GIANGDAY
(
	MALOP char(3),
	MAMH varchar(10),
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime,
)

Create table KETQUATHI
(
	MAHV char(5),
	MAMH varchar(10),
	LANTHI tinyint,
	NGTHI smalldatetime,
	DIEM numeric(4,2),
	KQUA varchar(10)
)

--------- TẠO KHOÁ CHÍNH ------------

Alter table KHOA Alter column MAKHOA varchar(4) Not null
Alter table KHOA Add constraint PK_KHOA Primary key (MAKHOA)

Alter table MONHOC Alter column MAMH varchar(10) Not null
Alter table MONHOC Add constraint PK_MH Primary key (MAMH)

Alter table DIEUKIEN Alter column MAMH varchar(10) Not null
Alter table DIEUKIEN Alter column MAMH_TRUOC varchar(10) Not null
Alter table DIEUKIEN Add constraint PK_DK Primary key (MAMH, MAMH_TRUOC)

Alter table GIAOVIEN Alter column MAGV char(4) Not null
Alter table GIAOVIEN Add constraint PK_GV Primary key (MAGV)

ALter table LOP Alter column MALOP char(3) Not null
Alter table LOP Add constraint PK_LOP Primary key (MALOP)

Alter table HOCVIEN Alter column MAHV char(5) Not null
Alter table HOCVIEN Add constraint PK_HV Primary key (MAHV)

Alter table GIANGDAY Alter column MALOP char(3) Not null
Alter table GIANGDAY Alter column MAMH varchar(10) Not null
Alter table GIANGDAY Add constraint PK_GD Primary key (MALOP,MAMH)

Alter table KETQUATHI Alter column MAHV char(5) Not null
Alter table KETQUATHI Alter column MAMH varchar(10) Not null
Alter table KETQUATHI Alter column LANTHI tinyint Not null
Alter table KETQUATHI Add constraint PK_KQ Primary key (MAHV,MAMH,LANTHI)

------ TẠO KHOÁ NGOẠI --------

Alter table HOCVIEN Alter column MALOP char(3) Not null
Alter table HOCVIEN Add constraint FK_ML_HOCVIEN foreign key (MALOP) references LOP (MALOP)

Alter table MONHOC Alter column MAKHOA varchar(4) Not null
Alter table MONHOC Add constraint FK_MK_MONHOC foreign key (MAKHOA) references KHOA (MAKHOA)

Alter table DIEUKIEN Alter column MAMH varchar(10) Not null
Alter table DIEUKIEN Add constraint FK_MM_DIEUKIEN foreign key (MAMH) references MONHOC (MAMH)

ALter table GIAOVIEN Alter column MAKHOA varchar(4) Not null
Alter table GIAOVIEN Add constraint FK_MK_GIAOVIEN foreign key (MAKHOA) references KHOA (MAKHOA)

ALter table GIANGDAY Alter column MALOP char(3) Not null
Alter table GIANGDAY Alter column MAMH varchar(10) Not null
ALter table GIANGDAY Alter column MAGV char(4) Not null
Alter table GIANGDAY Add
constraint KF_ML_GIANGDAY foreign key (MALOP) references LOP (MALOP),
constraint KF_MM_GIANGDAY foreign key (MAMH) references MONHOC (MAMH),
constraint FK_MGV_GIANGDAY foreign key (MAGV) references GIAOVIEN (MAGV)

Alter table KETQUATHI Alter column MAHV char(5) Not null
Alter table KETQUATHI Alter column MAMH varchar(10) Not null
Alter table KETQUATHI Add
constraint FK_MAHV_KQT foreign key (MAHV) references HOCVIEN (MAHV),
constraint FK_MAMH_KQT foreign key (MAMH) references MONHOC (MAMH)

--------- THÊM THUỘC TÍNH -----------

Alter table HOCVIEN Add GHICHU varchar(50), DIEMTB float, XEPLOAI int
--* CÂU 2 *--


--* CÂU 3 *--
Alter table GIAOVIEN Add constraint GIOITINH Check (GIOITINH = 'Nam' or GIOITINH = 'Nu')
Alter table HOCVIEN Add check (GIOITINH = 'Nam' or GIOITINH = 'Nu')
--* CÂU 4 *--
Alter table KETQUATHI Add Check(DIEM > 0 and DIEM < 10)
--* CÂU 5 *--

--* CÂU 6 *--
Alter table KETQUATHI Add Check(LANTHI < 3)
--* CÂU 7 *--
Alter table GIANGDAY Add Check (HOCKY > 1 and HOCKY < 3)
--* CÂU 8 *--
Alter table GIAOVIEN Add Check (HOCVI = 'CN' or HOCVI = 'KS' or HOCVI = 'Ths' or HOCVI = 'TS' or HOCVI = 'PTS')
