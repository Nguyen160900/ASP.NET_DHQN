create database Cong_Nghe_Net
use Cong_Nghe_Net

create table DangNhap
(TenDangNhap varchar(50) primary key,
MatKhau varchar(50), 
Quyen varchar(10))

create table Khoa
(MaKhoa varchar(100) primary key,
TenKhoa nvarchar(100),
SDT varchar(15),
DiaChi nvarchar(100))

create table Nganh
(MaNganh varchar(100) primary key,
MaKhoa varchar(100) foreign key references Khoa(MaKhoa) on delete cascade on update cascade,
TenNganh nvarchar(100))

create table KhoaHoc
(MaKhoaHoc varchar(100) primary key,
NamBatDau int,
NamKetThuc int)

create table Lop
(MaLop varchar(100) primary key,
MaNganh varchar(100) foreign key references Nganh(MaNganh) on delete cascade on update cascade,
MaKhoaHoc varchar(100) foreign key references KhoaHoc(MaKhoaHoc) on delete cascade on update cascade,
TenLop nvarchar(100))

create table ChucVu
(MaChucVu varchar(100) primary key,
TenChucVu nvarchar(100))

create table QueQuan
(MaQueQuan varchar(100) primary key,
TenQueQuan nvarchar(100))

create table TinhTrangHoc
(MaTinhTrangHoc varchar(100) primary key,
TenTinhTrangHoc nvarchar(100))

create table SinhVien
(MaSinhVien varchar(50) primary key,
HoTen nvarchar(100),
NgaySinh date,
GioiTinh bit,
DanToc nvarchar(50),
SoCMND varchar(20),
TonGiao nvarchar(20),
MaQueQuan varchar(100) foreign key references QueQuan(MaQueQuan) on delete cascade on update cascade,
SDT varchar(20),
Email varchar(150),
MaChucVu varchar(100) foreign key references ChucVu(MaChucVu) on delete cascade on update cascade,
MaLop varchar(100) foreign key references Lop(MaLop) on delete cascade on update cascade,
MaTinhTrangHoc varchar(100) foreign key references TinhTrangHoc(MaTinhTrangHoc) on delete cascade on update cascade)

insert into DangNhap
values ('admin', 'admin', 'Admin')

insert into Khoa
values('CNTT', N'Công nghệ thông tin','','')

insert into Nganh
values('7480201','CNTT', N'Công nghệ thông tin')

insert into KhoaHoc
values('K41','2018','2023')

insert into Lop
values('CNTTK41A', '7480201', 'K41', N'Công nghệ thông tin K41A')
insert into Lop
values('CNTTK41B', '7480201', 'K41', N'Công nghệ thông tin K41B')
insert into Lop
values('CNTTK41C', '7480201', 'K41', N'Công nghệ thông tin K41C')

insert into ChucVu
values('LOPTRUONG', N'Lớp trưởng')
insert into ChucVu
values('LOPPHOHOCTAP', N'Lớp phó học tập')
insert into ChucVu
values('LOPPHOVANTHE', N'Lớp phó văn thể')
insert into ChucVu
values('BITHU', N'Bí thư')
insert into ChucVu
values('PHOBITHU', N'Phó bí thư')
insert into ChucVu
values('UYVIENDOAN', N'Ủy viên đoàn')
insert into ChucVu
values('CHIHOITRUONG', N'Chi hội trưởng')
insert into ChucVu
values('CHIHOIPHO', N'Chi hội phó')
insert into ChucVu
values('UYVIENHOI',N'Ủy viên chi hội')
insert into ChucVu
values('THUKY', N'Thư ký')
insert into ChucVu
values('THUQUY', N'Thủ quỹ')
insert into ChucVu
values('NHIEUCHUCVU', N'Nhiều chức vụ')
insert into ChucVu
values ('', N'Không')

insert into QueQuan
values('1', N'An Giang')
insert into QueQuan
values('2', N'Bà Rịa - Vũng Tàu')
insert into QueQuan
values('3', N'Bạc Liêu')
insert into QueQuan
values('4', N'Bắc Giang')
insert into QueQuan
values('5', N'Bắc Cạn')
insert into QueQuan
values('6', N'Bắc Ninh')
insert into QueQuan
values('7', N'Bến Tre')
insert into QueQuan
values('8', N'Bình Dương')
insert into QueQuan
values('9', N'Bình Định')
insert into QueQuan
values('10', N'Bình Phước')
insert into QueQuan
values('11', N'Bình Thuận')
insert into QueQuan
values('12', N'Cà Mau')
insert into QueQuan
values('13', N'Cao Bằng')
insert into QueQuan
values('14', N'Cần Thơ')
insert into QueQuan
values('15', N'Đà Nẵng')
insert into QueQuan
values('16', N'Đắk Lắk')
insert into QueQuan
values('17', N'Đắk Nông')
insert into QueQuan
values('18', N'Điện Biên')
insert into QueQuan
values('19', N'Đồng Nai')
insert into QueQuan
values('20', N'Đồng Tháp')
insert into QueQuan
values('21', N'Gia Lai')
insert into QueQuan
values('22', N'Hà Giang')
insert into QueQuan
values('23', N'Hà Nam')
insert into QueQuan
values('24', N'Hà Nội')
insert into QueQuan
values('25', N'Hà Tĩnh')
insert into QueQuan
values('26', N'Hải Dương')
insert into QueQuan
values('27', N'Hải Phòng')
insert into QueQuan
values('28', N'Hậu Giang')
insert into QueQuan
values('29', N'Hòa Bình')
insert into QueQuan
values('30', N'Thành phố Hồ Chí Minh')
insert into QueQuan
values('31', N'Hưng Yên')
insert into QueQuan
values('32', N'Khánh Hòa')
insert into QueQuan
values('33', N'Kiên Giang')
insert into QueQuan
values('34', N'Kon Tum')
insert into QueQuan
values('35', N'Lai Châu')
insert into QueQuan
values('36', N'Lạng Sơn')
insert into QueQuan
values('37', N'Lào Cai')
insert into QueQuan
values('38', N'Lâm Đồng')
insert into QueQuan
values('39', N'Long An')
insert into QueQuan
values('40', N'Nam Định')
insert into QueQuan
values('41', N'Nghệ An')
insert into QueQuan
values('42', N'Ninh Bình')
insert into QueQuan
values('43', N'Ninh Thuận')
insert into QueQuan
values('44', N'Phú Thọ')
insert into QueQuan
values('45', N'Phú Yên')
insert into QueQuan
values('46', N'Quãng Bình')
insert into QueQuan
values('47', N'Quãng Nam')
insert into QueQuan
values('48', N'Quãng Ngãi')
insert into QueQuan
values('49', N'Quãng Ninh')
insert into QueQuan
values('50', N'Quãng Trị')
insert into QueQuan
values('51', N'Sóc Trăng')
insert into QueQuan
values('52', N'Sơn La')
insert into QueQuan
values('53', N'Tây Ninh')
insert into QueQuan
values('54', N'Thái Bình')
insert into QueQuan
values('55', N'Thái Nguyên')
insert into QueQuan
values('56', N'Thanh Hóa')
insert into QueQuan
values('57', N'Thừa Thiên - Huế')
insert into QueQuan
values('58', N'Tiền Giang')
insert into QueQuan
values('59', N'Trà Vinh')
insert into QueQuan
values('60', N'Tuyên Quang')
insert into QueQuan
values('61', N'Vĩnh Long')
insert into QueQuan
values('62', N'Vĩnh Phúc')
insert into QueQuan
values('63', N'Yên Bái')
insert into QueQuan
values('64', N'Lào')

insert into TinhTrangHoc
values('CONHOC', N'Còn học')
insert into TinhTrangHoc
values('CANHBAO', N'Cảnh báo')
insert into TinhTrangHoc
values('BUOCTHOIHOC', N'Buộc thôi học')
insert into TinhTrangHoc
values('THOIHOC', N'Thôi học')
insert into TinhTrangHoc
values('TOTNGHIEP', N'Tốt nghiệp')

insert into SinhVien
values('4151050060', N'Lê Anh Tài', '06/15/2000', 'TRUE', N'Kinh', '215529997', N'Không', '09', '0775084071', 'leanhtai1562000@gmail.com', 'BITHU', 'CNTTK41A', 'CONHOC')



