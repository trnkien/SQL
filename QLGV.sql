create database QLGV

--- BUỔI 1

create table HOCVIEN
(
	MAHV char(5) NOT NULL,
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3)
	constraint PK_HV primary key (MAHV)
)

create table KHOA
(
	MAKHOA varchar(4) NOT NULL,
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRGKHOA char(4)
	constraint PK_KHOA primary key (MAKHOA)
)

create table GIAOVIEN
(
	MAGV char(4) NOT NULL,
	HOTEN varchar(40),
	HOCVI varchar(10), 
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO numeric(4,2),
	MUCLUONG money,
	MAKHOA varchar(4),
	constraint PK_GV primary key (MAGV)
)

create table MONHOC
(
	MAMH varchar(10) NOT NULL,
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA varchar(4)
	constraint PK_MH primary key (MAMH)
)

create table LOP
(
	MALOP char(3) NOT NULL,
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4)
	constraint PK_LOP primary key (MALOP)
)

create table GIANGDAY
(
	MALOP char(3),
	MAMH varchar(10),
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime
	constraint PK_GD primary key (MALOP, MAMH)
)

create table KETQUATHI
(
	MAHV char(5),
	MAMH varchar(10),
	LANTHI tinyint,
	NGTHI smalldatetime,
	DIEM numeric(4,2),
	KQUA varchar(10)
	constraint PK_KQT primary key (MAHV, MAMH, LANTHI)
)

create table DIEUKIEN
(
	MAMH varchar(10),
	MAMH_TRUOC varchar(10)
	constraint PK_DK primary key (MAMH, MAMH_TRUOC)
)

--- Tạo khoá ngoại

alter table GIAOVIEN add
constraint FK_GV_KH foreign key (MAKHOA) references KHOA (MAKHOA)

alter table LOP add
constraint FK_LOP_TRGLOP foreign key (TRGLOP) references HOCVIEN(MAHV),
constraint FK_LOP_GV foreign key (MAGVCN) references GIAOVIEN (MAGV)

alter table MONHOC add
constraint FK_MH_KHOA foreign key (MAKHOA) references KHOA (MAKHOA)

alter table HOCVIEN add
constraint FK_HV_LOP foreign key (MALOP) references LOP (MALOP)

alter table GIANGDAY add
constraint FK_GD_LOP foreign key (MALOP) references LOP (MALOP),
constraint FK_GD_MAMH foreign key (MAMH) references MONHOC (MAMH),
constraint FK_GD_GV foreign key (MAGV) references GIAOVIEN (MAGV)

alter table KETQUATHI add
constraint FK_KQT_MH foreign key (MAMH) references MONHOC (MAMH)

--- Câu 1 
alter table HOCVIEN
add	GHICHU varchar(50),
	DIEMTB float(2),
	XEPLOAI varchar(10)

--- Câu 3 
alter table HOCVIEN
add constraint CHECK_GT CHECK(GIOITINH='Nam' OR GIOITINH='Nu')

--- Câu 4
Alter table KETQUATHI Add Check(DIEM > 0 and DIEM < 10)

--- Câu 5
alter table KETQUATHI
add constraint CHECK_KQ CHECK((DIEM < 5 AND KQUA = 'Khong dat') OR (DIEM >= 5 AND DIEM <= 10 AND KQUA = 'Dat') )

--- Câu 6
alter table KETQUATHI
add constraint CHECK_LANTHI CHECK(LANTHI <= 3)

--- Câu 7
alter table GIANGDAY
add constraint CHK_HOCKY CHECK(HOCKY >= 1 AND HOCKY <= 3)

--- Câu 8
alter table GIAOVIEN
add constraint CHK_HOCVI CHECK(HOCVI IN('CN', 'KS', 'Ths', 'TS', 'PTS'))

--- Câu 9
alter table LOP 
add constraint CHK_TRGLOP CHECK(TRGLOP = HOCVIEN(MAHV))

--- Câu 10
alter table KHOA
add constraint CHK_TRGKHOA CHECK(MAKHOA = GIAOVIEN(MAKHOA) AND GIAOVIEN(HOCVI) IN('TS', 'PTS'))

--- BUỔI 2
set dateformat dmy

insert into KHOA values ('KHMT', 'Khoa hoc may tinh', '7/6/2005', 'GV01')
insert into KHOA values ('HTTT', 'He thong thong tin', '7/6/2005', 'GV02')
insert into KHOA values ('CNPM', 'Cong nghe phan mem', '7/6/2005', 'GV04')
insert into KHOA values ('MTT', 'Mang may tinh', '20/10/2005', 'GV03')
insert into KHOA values ('KTMT', 'Ky thuat may tinh', '20/12/2005', 'Null')

Alter table LOP drop constraint FK_LOP_TRGLOP, FK_LOP_GV
insert into LOP values ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07')
insert into LOP values ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09')
insert into LOP values ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14')

insert into MONHOC values ('THDC','Tin hoc dai cuong', 4, 1,'KHMT')
insert into MONHOC values ('CTRR','Cau truc roi rac', 5, 0,'KHMT')
insert into MONHOC values ('CSDL','Co so du lieu', 3, 1,'HTTT')
insert into MONHOC values ('CTDLGT','Cau truc du lieu va giai thuat', 3, 1,'KHMT')
insert into MONHOC values ('PTTKTT','Phan tich thiet ke thuat toan', 3, 0,'KHMT')
insert into MONHOC values ('DHMT','Do hoa may tinh', 3, 1,'KHMT')
insert into MONHOC values ('KTMT','Kien truc may tinh', 3, 0,'KTMT')
insert into MONHOC values ('TKCSDL','Thiet ke co so du lieu', 3, 1,'HTTT')
insert into MONHOC values ('PTTKHTTT','Phan tich thiet ke he thong thong tin', 4, 1,'HTTT')
insert into MONHOC values ('HDH','He dieu hanh', 4, 0,'KTMT')
insert into MONHOC values ('NMCNPM','Nhap mon cong nghe phan mem', 3, 0,'CNPM')
insert into MONHOC values ('LTCFW','Lap trinh C for win', 3, 1,'CNPM')
insert into MONHOC values ('LTHDT','Lap trinh huong doi tuong', 3, 1,'CNPM')

insert into DIEUKIEN values ('CSDL','CTRR')
insert into DIEUKIEN values ('CSDL','CTDLGT')
insert into DIEUKIEN values ('CTDLGT','THDC')
insert into DIEUKIEN values ('PTTKTT','THDC')
insert into DIEUKIEN values ('PTTKTT','CTDLGT')
insert into DIEUKIEN values ('DHMT','THDC')
insert into DIEUKIEN values ('LTHDT','THDC')
insert into DIEUKIEN values ('PTTKHTTT','CSDL')

insert into GIAOVIEN values ('GV01', 'Ho Thanh Son','PTS','GS','Nam','2/5/1950','11/1/2004', 5.00, 2250000,'KHMT')
insert into GIAOVIEN values ('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004', 4.50, 2025000,'HTTT')
insert into GIAOVIEN values ('GV03','Do Nghiem Phung','TS','GS','Nu','1/8/1950','23/9/2004',4.00,1800000,'CNPM')
insert into GIAOVIEN values ('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','12/1/2005',4.50,2025000,'KTMT')
insert into GIAOVIEN values ('GV05','Mai Thanh Danh','ThS','GV','Nam','12/3/1958','12/1/2005',3.00,1350000,'HTTT')
insert into GIAOVIEN values ('GV06','Tran Doan Hung','TS','GV','Nam','11/3/1953','12/1/2005',4.50,2025000,'KHMT')
insert into GIAOVIEN values ('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','1/3/2005',4.00,1800000,'KHMT')
insert into GIAOVIEN values ('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','1/3/2005',1.69,760500,'KHMT')
insert into GIAOVIEN values ('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','1/3/2005',4.00,1800000,'HTTT')
insert into GIAOVIEN values ('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','1/3/2005',1.86,837000,'CNPM')
insert into GIAOVIEN values ('GV11','Ho Thanh Tung','CN','GV','Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
insert into GIAOVIEN values ('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
insert into GIAOVIEN values ('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
insert into GIAOVIEN values ('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3.00,1350000,'MTT')
insert into GIAOVIEN values ('GV15','Le Ha Thanh','ThS','GV','Nam','4/5/1978','15/5/2005',3.00,1350000,'KHMT')

insert into KETQUATHI values ('K1101','CSDL','1','20/7/2006','10','Dat')
insert into KETQUATHI values ('K1101','CTDLGT','1','28/12/2006','9','Dat')
insert into KETQUATHI values ('K1101','THDC','1','20/5/2006','9','Dat')
insert into KETQUATHI values ('K1101','CTRR','1','13/5/2006','9.5','Dat')
insert into KETQUATHI values ('K1102','CSDL','1','20/7/2006','4','Khong Dat')
insert into KETQUATHI values ('K1102','CSDL','2','27/7/2006','4.25','Khong Dat')
insert into KETQUATHI values ('K1102','CSDL','3','10/8/2006','4.5','Khong Dat')
insert into KETQUATHI values ('K1102','CTDLGT','1','28/12/2006','4.5','Khong Dat')
insert into KETQUATHI values ('K1102','CTDLGT','2','5/1/2007','4','Khong Dat')
insert into KETQUATHI values ('K1102','CTDLGT','3','15/1/2007','6','Dat')
insert into KETQUATHI values ('K1102','THDC','1','20/5/2006','5','Dat')
insert into KETQUATHI values ('K1102','CTRR','1','13/5/2006','7','Dat')
insert into KETQUATHI values ('K1103','CSDL','1','20/7/2006','3.5','Khong Dat')
insert into KETQUATHI values ('K1103','CSDL','2','27/7/2006','8.25','Dat')
insert into KETQUATHI values ('K1103','CTDLGT','1','28/12/2006','7','Dat')
insert into KETQUATHI values ('K1103','THDC','1','20/5/2006','8','Dat')
insert into KETQUATHI values ('K1103','CTRR','1','13/5/2006','6.5','Dat')
insert into KETQUATHI values ('K1104','CSDL','1','20/7/2006','3.75','Khong Dat')
insert into KETQUATHI values ('K1104','CTDLGT','1','28/12/2006','4','Khong Dat')
insert into KETQUATHI values ('K1104','THDC','1','20/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1104','CTRR','1','13/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1104','CTRR','2','20/5/2006','3.5','Khong Dat')
insert into KETQUATHI values ('K1104','CTRR','3','30/6/2006','4','Khong Dat')
insert into KETQUATHI values ('K1201','CSDL','1','20/7/2006','6','Dat')
insert into KETQUATHI values ('K1201','CTDLGT','1','28/12/2006','5','Dat')
insert into KETQUATHI values ('K1201','THDC','1','20/5/2006','8.5','Dat')
insert into KETQUATHI values ('K1201','CTRR','1','13/5/2006','9','Dat')
insert into KETQUATHI values ('K1202','CSDL','1','20/7/2006','8','Dat')
insert into KETQUATHI values ('K1202','CTDLGT','1','28/12/2006','4','Khong Dat')
insert into KETQUATHI values ('K1202','CTDLGT','2','5/1/2007','5','Dat')
insert into KETQUATHI values ('K1202','THDC','1','20/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1202','THDC','2','27/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1202','CTRR','1','13/5/2006','3','Khong Dat')

insert into KETQUATHI values ('K1202','CTRR','2','20/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1202','CTRR','3','30/6/2006','6.25','Dat')
insert into KETQUATHI values ('K1203','CSDL','1','20/7/2006','9.25','Dat')
insert into KETQUATHI values ('K1203','CTDLGT','1','28/12/2006','9.5','Dat')
insert into KETQUATHI values ('K1203','THDC','1','20/5/2006','10','Dat')
insert into KETQUATHI values ('K1203','CTRR','1','13/5/2006','10','Dat')
insert into KETQUATHI values ('K1204','CSDL','1','20/7/2006','8.5','Dat')
insert into KETQUATHI values ('K1204','CTDLGT','1','28/12/2006','6.75','Dat')
insert into KETQUATHI values ('K1204','THDC','1','20/5/2006','4','Khong Dat')
insert into KETQUATHI values ('K1204','CTRR','1','13/5/2006','6','Dat')
insert into KETQUATHI values ('K1301','CSDL','1','20/12/2006','4.25','Khong Dat')
insert into KETQUATHI values ('K1301','CTDLGT','1','25/7/2006','8','Dat')
insert into KETQUATHI values ('K1301','THDC','1','20/5/2006','7.75','Dat')
insert into KETQUATHI values ('K1301','CTRR','1','13/5/2006','8','Dat')
insert into KETQUATHI values ('K1302','CSDL','1','20/12/2006','6.75','Dat')
insert into KETQUATHI values ('K1302','CTDLGT','1','25/7/2006','5','Dat')
insert into KETQUATHI values ('K1302','THDC','1','20/5/2006','8','Dat')
insert into KETQUATHI values ('K1302','CTRR','1','13/5/2006','8.5','Dat')
insert into KETQUATHI values ('K1303','CSDL','1','20/12/2006','4','Khong Dat')
insert into KETQUATHI values ('K1303','CTDLGT','1','25/7/2006','4.5','Khong Dat')
insert into KETQUATHI values ('K1303','CTDLGT','2','7/8/2006','4','Khong Dat')
insert into KETQUATHI values ('K1303','CTDLGT','3','15/8/2006','4.25','Khong Dat')
insert into KETQUATHI values ('K1303','THDC','1','20/5/2006','4.5','Khong Dat')
insert into KETQUATHI values ('K1303','CTRR','1','13/5/2006','3.25','Khong Dat')
insert into KETQUATHI values ('K1303','CTRR','2','20/5/2006','5','Dat')
insert into KETQUATHI values ('K1304','CSDL','1','20/12/2006','7.75','Dat')
insert into KETQUATHI values ('K1304','CTDLGT','1','25/7/2006','9.75','Dat')
insert into KETQUATHI values ('K1304','THDC','1','20/5/2006','5.5','Dat')
insert into KETQUATHI values ('K1304','CTRR','1','13/5/2006','5','Dat')
insert into KETQUATHI values ('K1305','CSDL','1','20/12/2006','9.25','Dat')
insert into KETQUATHI values ('K1305','CTDLGT','1','25/7/2006','10','Dat')
insert into KETQUATHI values ('K1305','THDC','1','20/5/2006','8','Dat')
insert into KETQUATHI values ('K1305','CTRR','1','13/5/2006','10','Dat')

insert into GIANGDAY values ('K11','THDC','GV07','1','2006','2/1/2006','12/5/2006')
insert into GIANGDAY values ('K12','THDC','GV06','1','2006','2/1/2006','12/5/2006')
insert into GIANGDAY values ('K13','THDC','GV15','1','2006','2/1/2006','12/5/2006')
insert into GIANGDAY values ('K11','CTRR','GV02','1','2006','9/1/2006','17/5/2006')
insert into GIANGDAY values ('K12','CTRR','GV02','1','2006','9/1/2006','17/5/2006')
insert into GIANGDAY values ('K13','CTRR','GV08','1','2006','9/1/2006','17/5/2006')
insert into GIANGDAY values ('K11','CSDL','GV05','2','2006','1/6/2006','15/7/2006')
insert into GIANGDAY values ('K12','CSDL','GV09','2','2006','1/6/2006','15/7/2006')
insert into GIANGDAY values ('K13','CTDLGT','GV15','2','2006','1/6/2006','15/7/2006')
insert into GIANGDAY values ('K13','CSDL','GV05','3','2006','1/8/2006','15/12/2006')
insert into GIANGDAY values ('K13','DHMT','GV07','3','2006','1/8/2006','15/12/2006')
insert into GIANGDAY values ('K11','CTDLGT','GV15','3','2006','1/8/2006','15/12/2006')
insert into GIANGDAY values ('K12','CTDLGT','GV15','3','2006','1/8/2006','15/12/2006')
insert into GIANGDAY values ('K11','HDH','GV04','1','2007','2/1/2007','18/2/2007')
insert into GIANGDAY values ('K12','HDH','GV04','1','2007','2/1/2007','20/3/2007')
insert into GIANGDAY values ('K11','DHMT','GV07','1','2007','18/2/2007','20/3/2007')

insert into HOCVIEN values ('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
insert into HOCVIEN values ('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
insert into HOCVIEN values ('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
insert into HOCVIEN values ('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
insert into HOCVIEN values ('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
insert into HOCVIEN values ('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
insert into HOCVIEN values ('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
insert into HOCVIEN values ('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
insert into HOCVIEN values ('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
insert into HOCVIEN values ('K1110','Le Hoai','Thuong','5/2/1986','Nu','Can Tho','K11')
insert into HOCVIEN values ('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
insert into HOCVIEN values ('K1201','Nguyen Van','B','11/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values ('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
insert into HOCVIEN values ('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
insert into HOCVIEN values ('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
insert into HOCVIEN values ('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
insert into HOCVIEN values ('K1206','Nguyen Thi Truc','Thanh','4/3/1986','Nu','Kien Giang','K12')
insert into HOCVIEN values ('K1207','Tran Thi Bich','Thuy','8/2/1986','Nu','Nghe An','K12')
insert into HOCVIEN values ('K1208','Huynh Thi Kim','Trieu','8/4/1986','Nu','Tay Ninh','K12')
insert into HOCVIEN values ('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values ('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values ('K1211','Do Thi','Xuan','9/3/1986','Nu','Ha Noi','K12')
insert into HOCVIEN values ('K1212','Le Thi Phi','Yen','12/3/1986','Nu','TpHCM','K12')
insert into HOCVIEN values ('K1301','Nguyen Thi Kim','Cuc','9/6/1986','Nu','Kien Giang','K13')
insert into HOCVIEN values ('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
insert into HOCVIEN values ('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
insert into HOCVIEN values ('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values ('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
insert into HOCVIEN values ('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
insert into HOCVIEN values ('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
insert into HOCVIEN values ('K1308','Nguyen Hieu','Nghia','8/4/1986','Nam','Kien Giang','K13')
insert into HOCVIEN values ('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
insert into HOCVIEN values ('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
insert into HOCVIEN values ('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values ('K1312','Nguyen Thi Kim','Yen','7/9/1986','Nu','TpHCM','K13')

--- Bài tập 4
--- Phần 1 từ câu 11 đến câu 14

--- Câu 11
alter table HOCVIEN
add constraint KT_18T CHECK ((2020-YEAR(NGSINH))>=18)

--- Câu 12
alter table GIANGDAY
add constraint KT_NGAY CHECK (TUNGAY < DENNGAY)

--- Câu 13
alter table GIAOVIEN
add constraint KT_22T CHECK ((2020 - YEAR(NGSINH))>=22)

--- Câu 14
alter table MONHOC
add constraint KT_TinChi CHECK((TCLT=3 AND TCTH >=0) OR (TCLT=4 AND TCTH >=1) OR (TCLT=5 AND TCTH >=2))

--- Bài tập 6 buổi 2
---Phan 3 từ câu 1 đến 5

--- Câu 1
select HV.HO, HV.TEN, HV.MAHV, HV.NGSINH, HV.MALOP
from LOP L, HOCVIEN HV
where L.MALOP=HV.MALOP AND L.TRGLOP=HV.MAHV

--- Câu 2
select HV.MAHV, HV.HO, HV.TEN, KQT.DIEM, KQT.LANTHI
from KETQUATHI KQT, HOCVIEN HV, LOP L, MONHOC MH
where HV.MAHV=KQT.MAHV AND HV.MALOP=L.MALOP AND MH.MAMH=KQT.MAMH AND KQT.MAMH='CTRR' AND HV.MALOP='K12' ORDER BY HV.TEN, HV.HO

--- Câu 3
select HV.MAHV, HV.HO, HV.TEN, MH.TENMH
from HOCVIEN HV,KETQUATHI KQT, MONHOC MH
where HV.MAHV=KQT.MAHV AND KQT.MAMH=MH.MAMH AND KQT.KQUA='Dat' AND KQT.LANTHI='1'

--- Câu 4
select HV.MAHV, HV.HO, HV.TEN
from HOCVIEN HV,KETQUATHI KQT, MONHOC MH, LOP L
where HV.MAHV=KQT.MAHV AND KQT.MAMH=MH.MAMH AND L.MALOP=HV.MALOP AND KQT.KQUA='Khong Dat' AND KQT.LANTHI='1' AND KQT.MAMH='CTRR' AND L.MALOP='K11'

--- Câu 5
select HV.MAHV, HV.HO, HV.TEN
from HOCVIEN HV,KETQUATHI KQT, MONHOC MH, LOP L
where HV.MAHV=KQT.MAHV AND KQT.MAMH=MH.MAMH AND L.MALOP=HV.MALOP AND KQT.KQUA='Khong Dat' AND KQT.LANTHI IN(1,2,3) AND KQT.MAMH='CTRR' AND L.MALOP IN('K11','K12','K13')

--- C�u 1
update GIAOVIEN 
set HESO = HESO*1.2
where MAGV IN(
	select TRGKHOA
	from KHOA K
	where K.TRGKHOA = GIAOVIEN.MAGV)

--- C�u 2
update HOCVIEN
set DIEMTB = (
	select AVG(DIEM)
	from KETQUATHI KQ1
	where LANTHI=(	select MAX(LANTHI)
					from KETQUATHI KQ2
					where KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH) AND HOCVIEN.MAHV = KQ1.MAHV)

--- C�u 3
update HOCVIEN
set GHICHU='Cam thi'
where MAHV IN(
		select MAHV
		from KETQUATHI
		where LANTHI = 3 AND DIEM < 5)

--- C�u 4
update HOCVIEN
set XEPLOAI= case
		when DIEMTB >= 9 then 'XS'
		when DIEMTB >=8 and DIEMTB <9 then 'G'
		when DIEMTB >=6.5 and DIEMTB <8 then 'K'
		when DIEMTB >=5 and DIEMTB <6.5 then 'TB'
		when DIEMTB < 5 then 'Y'
		end

--- C�u 6
select MH.TENMH
from MONHOC MH
where MH.MAMH IN(
	select GD.MAMH
	from GIANGDAY GD, GIAOVIEN GV
	where GD.MAGV = GV.MAGV AND GV.HOTEN = 'Tran Tam Thanh' AND GD.NAM=2006 AND GD.HOCKY=1)

--- C�u 7
select MH.MAMH, MH.TENMH
from MONHOC MH
where MH.MAMH IN(
	select GD.MAMH
	from GIANGDAY GD, LOP L
	where GD.MAGV = L.MAGVCN AND GD.NAM=2006 AND GD.HOCKY=1 AND L.MALOP='K11')

--- C�u 8
select HO, TEN
from HOCVIEN
where MAHV IN (
		select L.TRGLOP
		from LOP L, GIANGDAY GD, GIAOVIEN GV, MONHOC MH
		where L.MALOP=GD.MALOP AND GD.MAGV = GV.MAGV AND GV.HOTEN = 'Nguyen To Lan' AND MH.MAMH = GD.MAMH AND MH.TENMH = 'Co so du lieu')

--- C�u 9
select MH.MAMH, MH.TENMH
from DIEUKIEN DK, MONHOC MH
where DK.MAMH IN(
	select MAMH
	from MONHOC
	where TENMH= 'Co so du lieu') AND DK.MAMH_TRUOC = MH.MAMH

--- C�u 10
select MH.MAMH, MH.TENMH
from DIEUKIEN DK, MONHOC MH
where DK.MAMH_TRUOC IN(
	select MAMH
	from MONHOC
	where TENMH= 'Cau truc roi rac') AND DK.MAMH = MH.MAMH

--- C�u 11
select HOTEN
from GIAOVIEN
where MAGV IN (
	select GD.MAGV
	from GIANGDAY GD, MONHOC MH
	where MH.MAMH = GD.MAMH AND MH.TENMH ='Cau truc roi rac' AND GD.HOCKY=1 AND GD.NAM = 2006 AND GD.MALOP='K11') AND MAGV IN (select GD.MAGV
																															from GIANGDAY GD, MONHOC MH
																															where MH.MAMH = GD.MAMH AND MH.TENMH ='Cau truc roi rac' AND GD.HOCKY=1 AND GD.NAM = 2006 AND GD.MALOP='K12')

--- C�u 12
select MAHV, HO, TEN
from HOCVIEN
where MAHV IN (
	select KQ1.MAHV
	from KETQUATHI KQ1
	where KQ1.LANTHI IN (select KQ2.LANTHI
					from KETQUATHI KQ2
					where KQ2.MAMH='CSDL' AND KQ2.DIEM < 5 AND COUNT(KQ2.MAHV) = 1 ))

--- C�u 13
select MAGV, HOTEN
from GIAOVIEN
where MAGV IN(select MAGV
			from GIAOVIEN
			EXCEPT
			select MAGV
			from GIANGDAY)

--- C�u 14
select MAGV
from GIAOVIEN
where MAGV IN(select TRGKHOA
				from KHOA
				where TRGKHOA IN(select MAGV
									from GIAOVIEN
									EXCEPT
									select MAGV
									from GIANGDAY))
--- C�u 15
select HO, TEN
from HOCVIEN
where MALOP = 'K11' AND (MAHV IN(select MAHV
								from KETQUATHI
								where (LANTHI = 3 AND KQUA= 'Khong Dat') OR (LANTHI = 2 AND MAMH = 'CTRR' AND DIEM = 5)))

--- C�u 16
select HOTEN
from GIAOVIEN GV
where MAGV IN(select MAGV
from GIANGDAY
where 2<= (select COUNT(DISTINCT GD.MALOP)
			from GIANGDAY GD
			where GD.MAGV = GV.MAGV AND GD.MAMH = 'CTRR'))

--- C�u 17
select HV.*, KQT1.DIEM
from HOCVIEN HV, KETQUATHI KQT1
where KQT1.MAMH = 'CSDL' AND KQT1.LANTHI =(select MAX(KQT2.LANTHI) AS LANTHISAUCUNG
											from KETQUATHI KQT2
											where KQT2.MAMH='CSDL' AND KQT1.MAHV = KQT2.MAHV AND KQT2.MAHV = HV.MAHV)

--- C�u 18
select HV.*, KQT1.DIEM
from HOCVIEN HV, KETQUATHI KQT1
where KQT1.MAMH = 'CSDL' AND KQT1.DIEM = (select MAX(KQT2.DIEM) AS LANTHISAUCUNG
											from KETQUATHI KQT2
											where KQT2.MAMH='CSDL' AND KQT1.MAHV = KQT2.MAHV AND KQT2.MAHV = HV.MAHV)

--- C�u 19
select TENKHOA
from KHOA
where NGTLAP = (select MIN(NGTLAP) AS NGTLAP_MIN
				from KHOA
				)

--- C�u 20
select COUNT(DISTINCT MAGV) AS SO_GV_GS_PGS
from GIAOVIEN
where HOCHAM IN('GS', 'PGS')

--- C�u 21
select  MAKHOA, HOCVI, COUNT (HOCVI) AS SO_GV
from GIAOVIEN
GROUP BY HOCVI, MAKHOA

--- C�u 22
select MAMH, COUNT(DISTINCT MAHV) AS SOHV_DAT
from KETQUATHI
where KQUA = 'Dat'
GROUP BY MAMH

select MAMH, COUNT(DISTINCT MAHV) AS SOHV_KDAT
from KETQUATHI
where KQUA = 'Khong Dat'
GROUP BY MAMH

--- C�u 23
select MAGV, HOTEN
from GIAOVIEN
where MAGV IN(	select L.MAGVCN
				from LOP L, GIANGDAY GD
				where L.MALOP = GD.MALOP AND L.MAGVCN = GD.MAGV
				GROUP BY L.MAGVCN, L.MALOP)

--- C�u 24
select HO, TEN
from HOCVIEN
where MAHV IN (	select TRGLOP
				from LOP
				where SISO = (	select MAX(SISO) AS SISOLOP
								from LOP
								))

--- C�u 26
select MAHV, HO, TEN
from HOCVIEN
where MAHV IN(select MAHV
				from KETQUATHI
				where DIEM >= 9
				GROUP BY MAHV
				HAVING COUNT(MAMH) >= ALL (select COUNT(MAMH) AS SO_MON_DIEM_CAO
											from KETQUATHI
											where DIEM >= 9
											GROUP BY MAHV))


--- C�u 28
select MAGV, NAM, HOCKY, COUNT(MAMH) AS SO_MH, COUNT(MALOP) AS SO_LOP
from GIANGDAY
GROUP BY MAGV, NAM, HOCKY

--- C�u 29
select MAGV, HOTEN
from GIAOVIEN
where MAGV IN(select MAGV
				from GIANGDAY
				GROUP BY MAGV, NAM, HOCKY
				HAVING COUNT(MAMH) >= ALL (select COUNT(MAMH) AS SO_MH
											from GIANGDAY
											GROUP BY MAGV, NAM, HOCKY))

--- C�u 30
select MAMH, TENMH
from MONHOC
where MAMH = (	select TOP 1 MAMH
				from KETQUATHI
				where LANTHI = 1 AND KQUA = 'Khong Dat'
				GROUP BY MAMH
				ORDER BY COUNT(MAHV) DESC)

--- C�u 31
select MAHV, HO, TEN
from HOCVIEN
where MAHV IN (	select MAHV
				from KETQUATHI KQ1
				where LANTHI = 1 AND KQUA = 'Dat'
				GROUP BY MAHV
				HAVING COUNT (MAMH) = (	select COUNT(DISTINCT MAMH) AS SO_MONTHI
										from KETQUATHI KQ2
										where KQ1.MAHV = KQ2.MAHV
										GROUP BY MAHV))

--- C�u 32*
select MAHV, HO, TEN
from HOCVIEN
where MAHV IN (	select MAHV	---Table1
				from KETQUATHI KQ1
				where KQUA = 'Dat' AND LANTHI = (	select MAX(LANTHI) AS LANTHI_1MON_MAX
													from KETQUATHI KQ2
													where KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH
													GROUP BY MAHV, MAMH)
				GROUP BY MAHV, MAMH) --- Of Table1