create database QLBH

--- BUỔI 1 ---

--- Câu 1
create table KHACHHANG
(
	MAKH char(4) NOT NULL,
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	NGDK smalldatetime,
	DOANHSO money
)

alter table KHACHHANG ADD
constraint PK_KH PRIMARY KEY (MAKH)

create table NHANVIEN
(
	MANV char(4) NOT NULL,
	HOTEN	varchar(40),
	SODT varchar(20),
	NGVL smalldatetime
	constraint PK_NV primary key (MANV)
)

create table SANPHAM
(
	MASP char(4) NOT NULL,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money
	constraint PK_MASP primary key (MASP)
)

create table HOADON
(
	SOHD int NOT NULL,
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money
	constraint PK_HD primary key (SOHD)
)

create table CTHD
(
	SOHD int,
	MASP char(4),
	SL int
	constraint PK_CTHD primary key (SOHD, MASP)
)
--- Tạo khoá ngoại 

alter table HOADON add 
constraint FK_HD_KH foreign key (MAKH) references KHACHHANG (MAKH)
alter table HOADON add
constraint FK_HD_NV foreign key (MANV) references NHANVIEN (MANV)

alter table CTHD add 
constraint FK_CTHD_SOHD foreign key (SOHD) references HOADON (SOHD)
alter table CTHD add
constraint FK_CTHD_MASP foreign key (MASP) references SANPHAM (MASP)

--- Câu 2
alter table SANPHAM 
add GHICHU varchar(20)

--- Câu 3
alter table KHACHHANG 
add LOAIKH tinyint

--- Câu 4
alter table SANPHAM
alter column GHICHU varchar(100)

--- Câu 5
alter table SANPHAM
drop column GHICHU

--- Câu 6
alter table KHACHHANG
alter column LOAIKH varchar(20)

--- Câu 7 
alter table SANPHAM
add constraint SANPHAM_DVT CHECK(DVT='cay' OR DVT='hop' OR DVT='cai' OR DVT='quyen' OR DVT='chuc')

--- Câu 8
alter table SANPHAM
add constraint SP_GIA CHECK (GIA>500)

--- Câu 9 
Alter table HOADON Add constraint SOHD check(SOHD>=1)

--- Câu 10
alter table KHACHHANG add
constraint CHECK_NGDK check (NGDK>NGSINH)

--- BUỔI 2

set dateformat dmy

insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)

--- QLBH Phần 2 tu cau 2 den 5
--- Bài tập 2 

--- Câu 2
select * into SANPHAM1 from SANPHAM
select * into KHACHHANG1 from KHACHHANG

--- Câu 3
update SANPHAM1
set GIA=GIA*1.05
where NUOCSX='Thai Lan'

--- Câu 4
update SANPHAM1
set GIA=GIA/1.05
where (NUOCSX='Trung Quoc') and (GIA <=10000)

--- Câu 5
update KHACHHANG1
set LOAIKH='Vip'
where (NGDK<1/1/2007 AND DOANHSO>10000000) OR (NGDK>1/1/2007 AND DOANHSO>2000000)

--- Phần 3 QLBH 
--- Bài tập 5 từ câu 1 tới câu 11

set dateformat dmy

--- Câu 1
select MASP, TENSP
from SANPHAM
where NUOCSX='Trung Quoc'

--- Câu 2
select MASP, TENSP
from SANPHAM
where DVT IN('cay', 'quyen')

--- Câu 3
select MASP, TENSP
from SANPHAM
where MASP LIKE'B%01'

--- Câu 4
select MASP, TENSP
from SANPHAM
where (NUOCSX='Trung Quoc') AND (GIA>30000 AND GIA<40000)

--- Câu 5
select MASP, TENSP
from SANPHAM
where (NUOCSX IN('Trung Quoc', 'Thai Lan')) AND (GIA BETWEEN 30000 AND 40000)

--- Câu 6
select SOHD, TRIGIA
from HOADON
where NGHD='1/1/2007' OR NGHD='2/1/2007'

--- Câu 7
select SOHD, TRIGIA
from HOADON
where YEAR(NGHD)=2007 AND MONTH(NGHD)=1 ORDER BY NGHD ASC, TRIGIA DESC

--- Câu 8
select KHACHHANG.MAKH, HOTEN
from KHACHHANG, HOADON
where KHACHHANG.MAKH=HOADON.MAKH AND HOADON.NGHD='1/1/2007'

--- Câu 9
select SOHD, TRIGIA
from HOADON, NHANVIEN
where HOADON.MANV=NHANVIEN.MANV AND NHANVIEN.HOTEN='Nguyen Van B' AND HOADON.NGHD='28/10/2006'

--- Câu 10
select SANPHAM.MASP, SANPHAM.TENSP
from SANPHAM, KHACHHANG, HOADON, CTHD
where SANPHAM.MASP=CTHD.MASP AND CTHD.SOHD=HOADON.SOHD AND HOADON.MAKH=KHACHHANG.MAKH AND KHACHHANG.HOTEN='Nguyen Van A' AND YEAR(HOADON.NGHD)=2006 AND MONTH(HOADON.NGHD)=10

--- Câu 11
select SOHD
from CTHD
where MASP='BB01' OR MASP='BB02'

-- C�u 12
select SOHD
from CTHD
where (MASP IN('BB01', 'BB02')) AND (SL between 10 and 20)

--- C�u 13
select SOHD
from CTHD A
where A.MASP='BB01' AND SL BETWEEN 10 AND 20 
AND EXISTS(SELECT *
from CTHD B
where B.MASP='BB02' AND SL BETWEEN 10 AND 20 AND A.SOHD=B.SOHD
)

--- BT4 PHAN III TU CAU 14 DEN 19

--- C�u 14
SELECT DISTINCT S.MASP, S.TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC'
OR C.SOHD IN(SELECT DISTINCT C2.SOHD
FROM CTHD C2 INNER JOIN HOADON H
ON C2.SOHD = H.SOHD
WHERE H.NGHD ='1/1/2007')

--- C�u 15
SELECT SP1.MASP, SP1.TENSP
FROM SANPHAM SP1
WHERE NOT EXISTS(
SELECT *
FROM CTHD CT
WHERE CT.MASP=SP1.MASP
)

--- C�u 16
SELECT SP1.MASP, SP1.TENSP
FROM SANPHAM SP1
WHERE NOT EXISTS(
SELECT *
FROM SANPHAM SP2 INNER JOIN CTHD CT ON SP2.MASP=CT.MASP AND SP2.MASP=SP1.MASP 
WHERE EXISTS(
SELECT *
FROM CTHD, HOADON
WHERE YEAR(HOADON.NGHD)='2006'
))

--- C�u 17
select SP.MASP, TENSP
from SANPHAM SP
where NUOCSX='Trung Quoc' AND SP.MASP NOT IN(
select CT.MASP
from CTHD CT, HOADON HD
where CT.SOHD=HD.SOHD AND YEAR(HD.NGHD)='2006'
)

--- C�u 18
select H.SOHD
from HOADON H
where YEAR(NGHD)='2006' AND NOT EXISTS(
	select *
	from SANPHAM S
	where S.NUOCSX='Singapore' AND NOT EXISTS(
					select *
					from CTHD C
					where C.MASP = S.MASP AND C.SOHD = H.SOHD))

--- C�u 19
select count(*) AS SL_CHUA_DK
from HOADON H
where MAKH NOT IN(
	select MAKH
	from KHACHHANG KH
	where H.MAKH = KH.MAKH)

--- C�u 20
select COUNT(DISTINCT MASP) AS SOSANPHAM2006
from CTHD C
where SOHD IN(select SOHD
from HOADON HD
where YEAR(NGHD) = '2006' AND C.SOHD = HD.SOHD)

--- C�u 21
select MAX(TRIGIA) AS TRIGIA_MAX, MIN(TRIGIA) AS TRIGIA_MIN
from HOADON

--- C�u 22
select AVG(TRIGIA) AS TRIGIA_TB
from HOADON
where YEAR(NGHD) = '2006'

--- C�u 23
select SUM(TRIGIA) AS TONG_DOANH_THU
from HOADON
where YEAR(NGHD) = '2006'

--- C�u 24
select SOHD
from HOADON
where TRIGIA = (select MAX(TRIGIA) AS TRIGIA_MAX
				from HOADON)

--- C�u 25
select HOTEN
from KHACHHANG
where MAKH = (	select MAKH
				from HOADON
				where TRIGIA = (select MAX(TRIGIA) AS TRIGIA_MAX
								from HOADON))

--- C�u 26
select MAKH, HOTEN
from KHACHHANG KH1
where 2>=(	select COUNT(KH2.DOANHSO)
			from KHACHHANG KH2
			where KH2.DOANHSO > KH1.DOANHSO)

--- C�u 27
select MASP, TENSP
from SANPHAM
where GIA IN (	select GIA
				from SANPHAM SP1
				where 2 >= (select COUNT(SP2.GIA)
							from SANPHAM SP2
							where SP2.GIA > SP1.GIA))

--- C�u 28
select MASP, TENSP
from SANPHAM
where NUOCSX = 'Thai Lan' AND GIA IN (	select GIA
										from SANPHAM SP1
										where 2 >= (select COUNT(SP2.GIA)
													from SANPHAM SP2
													where SP2.GIA > SP1.GIA))

--- C�u 29
select MASP, TENSP
from SANPHAM
where NUOCSX = 'Trung Quoc' AND GIA IN (	select GIA
										from SANPHAM SP1
										where 2 >= (select COUNT(SP2.GIA)
													from SANPHAM SP2
													where SP2.GIA > SP1.GIA AND SP2.NUOCSX = 'Trung Quoc'))

--- C�u 30
select RANK() OVER(ORDER BY DOANHSO desc) AS BXH, MAKH, HOTEN
from KHACHHANG KH1
where 2>=(	select COUNT(KH2.DOANHSO)
			from KHACHHANG KH2
			where KH2.DOANHSO > KH1.DOANHSO)

--- C�u 31
select COUNT(DISTINCT MASP) AS SOSP_TQ
from SANPHAM
where NUOCSX = 'Trung Quoc'

--- C�u 32
select NUOCSX, COUNT(DISTINCT MASP) AS SOSP
from SANPHAM
GROUP BY NUOCSX

--- C�u 33
select NUOCSX, MAX(GIA) AS GIA_MAX, MIN(GIA) AS GIA_MIN, AVG(GIA) AS GIA_AVG 
from SANPHAM
GROUP BY NUOCSX

--- C�u 34
select NGHD, SUM(TRIGIA) AS TONG
from HOADON
GROUP BY NGHD

--- C�u 35
select C.MASP, SUM(C.SL) AS SOLUONG_SP
from HOADON HD, CTHD C
where MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006 AND C.SOHD = HD.SOHD
GROUP BY C.MASP

--- C�u 36
select MONTH(NGHD) AS THANG,  SUM(TRIGIA) AS DOANHTHUTHANG
from HOADON
where YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)

--- C�u 37
select C.SOHD, COUNT(DISTINCT C.MASP) AS SOSP
from CTHD C, SANPHAM SP
where C.MASP = SP.MASP
GROUP BY C.SOHD
HAVING COUNT(DISTINCT C.MASP) >= 4

--- C�u 38
select C.SOHD, COUNT(DISTINCT C.MASP) AS SOSP
from CTHD C, SANPHAM SP
where SP.NUOCSX = 'Viet Nam' AND C.MASP = SP.MASP
GROUP BY C.SOHD
HAVING COUNT(DISTINCT C.MASP) >= 3

--- C�u 39
select MAKH, HOTEN
from KHACHHANG
where MAKH IN(select HD.MAKH
				from HOADON HD
				where HD.SOHD IN(select C.SOHD
								from CTHD C
								GROUP BY C.SOHD
								HAVING COUNT(C.SOHD) >= ALL(select COUNT(SOHD)
															from CTHD
															GROUP BY SOHD)))

--- C�u 40
select TOP 1 MONTH(NGHD) AS THANG_DOANHSO_MAX
from HOADON
where YEAR(NGHD) = '2006'
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--- C�u 41
select MASP, TENSP
from SANPHAM
where MASP IN(select MASP
				from CTHD
				GROUP BY MASP
				HAVING SUM(SL) <= ALL(select SUM(SL)
										from CTHD
										GROUP BY MASP))

--- C�u 42
select MAX(GIA) AS GIA_SP_MAX
from SANPHAM
GROUP BY NUOCSX

--- C�u 43
select SP.NUOCSX, COUNT(DISTINCT SP.MASP) AS SOSPBAN, COUNT(DISTINCT SP.GIA) AS SOGIA_SP
from SANPHAM SP
where 3<= (select COUNT(DISTINCT SP1.MASP)
			from SANPHAM SP1
			where 3<= (select COUNT(DISTINCT SP2.GIA)
						from SANPHAM SP2
						where SP2.NUOCSX = SP1.NUOCSX AND SP1.NUOCSX = SP.NUOCSX))
GROUP BY NUOCSX