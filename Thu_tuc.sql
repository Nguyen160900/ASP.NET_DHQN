-- 1. Load thông tin Khoa
create proc load_Khoa
as
select * from Khoa

-- 2. Thêm thông tin Khoa
create proc them_Khoa
@maKhoa varchar(100),
@tenKhoa nvarchar(100),
@sdt varchar(15),
@diaChi nvarchar(100)
as
insert into Khoa(MaKhoa, TenKhoa, SDT, DiaChi)
values (@maKhoa, @tenKhoa, @sdt, @diaChi)

-- 3. Cập nhật thông tin Khoa
create proc capnhat_Khoa
@maKhoa varchar(100),
@tenKhoa nvarchar(100),
@sdt varchar(15),
@diaChi nvarchar(100)
as
update Khoa
set TenKhoa = @tenKhoa, 
	SDT = @sdt, 
	DiaChi = @diaChi
where MaKhoa = @maKhoa

-- 4. Xóa thông tin Khoa
create proc xoa_Khoa
@maKhoa varchar(100)
as
delete Khoa where MaKhoa = @maKhoa

-- 5. Load thông tin Ngành
create proc load_Nganh
as
select Nganh.MaNganh, Nganh.MaKhoa, Khoa.TenKhoa, Nganh.TenNganh 
from Nganh, Khoa
where Nganh.MaKhoa = Khoa.MaKhoa

-- 6. Thêm thông tin Ngành
create proc them_Nganh
@maNganh varchar(100),
@maKhoa varchar(100),
@tenNganh nvarchar(100)
as
insert into Nganh(MaNganh, MaKhoa, TenNganh)
values (@maNganh, @maKhoa, @tenNganh)

-- 7. Cập nhật thông tin Ngành
create proc capnhat_Nganh
@maNganh varchar(100),
@maKhoa varchar(100),
@tenNganh nvarchar(100)
as
update Nganh
set MaKhoa = @maKhoa, 
	TenNganh = @tenNganh
where MaNganh = @maNganh

-- 8. Xóa thông tin Ngành
create proc xoa_Nganh
@maNganh varchar(100)
as
delete Nganh where MaNganh = @maNganh

-- 9. Load thông tin Khóa học
create proc load_KhoaHoc
as
select * from KhoaHoc

-- 10. Thêm thông tin Khóa học
create proc them_KhoaHoc
@maKhoaHoc varchar(100),
@namBatDau int,
@namKetThuc int
as
insert into KhoaHoc(MaKhoaHoc, NamBatDau, NamKetThuc)
values (@maKhoaHoc, @namBatDau, @namKetThuc)

-- 11. Cập nhật thông tin Khóa học
create proc capnhat_KhoaHoc
@maKhoaHoc varchar(100),
@namBatDau int,
@namKetThuc int
as
update KhoaHoc
set NamBatDau = @namBatDau, 
	NamKetThuc = @namKetThuc
where MaKhoaHoc = @maKhoaHoc

-- 12. Xóa thông tin Khóa học
create proc xoa_KhoaHoc
@maKhoaHoc varchar(100)
as
delete KhoaHoc where MaKhoaHoc = @maKhoaHoc

-- 13. Load thông tin Lớp
create proc load_Lop
as
select Lop.MaLop, Lop.TenLop, Lop.MaNganh, Nganh.TenNganh, Lop.MaKhoaHoc, Nganh.MaKhoa, Khoa.TenKhoa
from Nganh, KhoaHoc, Lop, Khoa
where Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa
	  
-- 14. Thêm thông tin Lớp
create proc them_Lop
@maLop varchar(100),
@maNganh varchar(100),
@maKhoaHoc varchar(100),
@tenLop nvarchar(100)
as
insert into Lop(MaLop, MaNganh, MaKhoaHoc, TenLop)
values (@maLop, @maNganh, @maKhoaHoc, @tenLop)

-- 15. Cập nhật thông tin Lớp
create proc capnhat_Lop
@maLop varchar(100),
@maNganh varchar(100),
@maKhoaHoc varchar(100),
@tenLop nvarchar(100)
as
update Lop
set MaNganh = @maNganh,
	MaKhoaHoc = @maKhoaHoc,
	TenLop = @tenLop
where MaLop = @maLop

-- 16. Xóa thông tin Lớp
create proc xoa_Lop
@maLop varchar(100)
as
delete Lop where MaLop = @maLop

-- 17. Load thông tin Sinh viên
create proc load_SinhVien
as
select SinhVien.MaSinhVien, SinhVien.HoTen, SinhVien.NgaySinh, SinhVien.GioiTinh, SinhVien.DanToc, SinhVien.SoCMND, SinhVien.TonGiao, SinhVien.SDT, SinhVien.Email, QueQuan.MaQueQuan, QueQuan.TenQueQuan, ChucVu.MaChucVu,ChucVu.TenChucVu, Lop.MaLop,Lop.TenLop,KhoaHoc.MaKhoaHoc, Khoa.TenKhoa, Nganh.TenNganh, TinhTrangHoc.MaTinhTrangHoc, TinhTrangHoc.TenTinhTrangHoc
from SinhVien,QueQuan, ChucVu, Lop, TinhTrangHoc, Nganh, Khoa, KhoaHoc
where SinhVien.MaQueQuan = QueQuan.MaQueQuan and
	  SinhVien.MaChucVu = ChucVu.MaChucVu and
	  SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
	  SinhVien.MaLop= Lop.MaLop and
	  Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa
	   
-- 18. Thêm thông tin Sinh viên
create proc them_SinhVien
@maSinhVien varchar(50),
@hoTen nvarchar(100),
@ngaySinh date,
@gioiTinh nvarchar(5),
@danToc nvarchar(50),
@soCMND varchar(20),
@tonGiao nvarchar(20),
@maQueQuan varchar(100),
@sdt varchar(20),
@email varchar(150),
@maChucVu varchar(100),
@maLop varchar(100),
@maTinhTrangHoc varchar(100) 
as
insert into SinhVien(MaSinhVien, HoTen, NgaySinh, GioiTinh, DanToc, SoCMND, TonGiao, MaQueQuan, SDT, Email,MaChucVu, MaLop, MaTinhTrangHoc)
values (@maSinhVien,@hoTen, @ngaySinh, @gioiTinh, @danToc, @soCMND, @tonGiao, @maQueQuan, @sdt, @email, @maChucVu, @maLop, @maTinhTrangHoc)

-- 19. Cập nhật thông tin Sinh viên
create proc capnhat_SinhVien
@maSinhVien varchar(50),
@hoTen nvarchar(100),
@gioiTinh nvarchar(5),
@danToc nvarchar(50),
@soCMND varchar(20),
@tonGiao nvarchar(20),
@maQueQuan varchar(100),
@sdt varchar(20),
@email varchar(150),
@maChucVu varchar(100),
@maTinhTrangHoc varchar(100) 
as
update SinhVien
set HoTen = @hoTen,
	GioiTinh = @gioiTinh,
	DanToc = @danToc,
	SoCMND = @soCMND,
	TonGiao = @tonGiao,
	MaQueQuan = @maQueQuan,
	SDT = @sdt,
	Email = @email,
	MaChucVu = @maChucVu,
	MaTinhTrangHoc = @maTinhTrangHoc
where MaSinhVien = @maSinhVien

-- 20. Xóa thông tin Sinh viên
create proc xoa_SinhVien
@maSinhVien varchar(100)
as
delete SinhVien where MaSinhVien = @maSinhVien

-- 21. Tìm thông tin Khóa học
create proc tim_KhoaHoc
@tim varchar(100)
as
select * from KhoaHoc
where MaKhoaHoc like N'%' + @tim + '%'

-- 22. Tìm thông tin Khoa
create proc tim_Khoa
@tim varchar(100)
as
select * from Khoa 
where MaKhoa like N'%' + @tim + '%'
	or TenKhoa like N'%' + @tim + '%'

-- 23. Tìm thông tin Ngành
create proc tim_Nganh
@tim varchar(100)
as
select Nganh.MaNganh, Nganh.MaKhoa, Khoa.TenKhoa, Nganh.TenNganh 
from Nganh, Khoa
where Nganh.MaKhoa = Khoa.MaKhoa and 
	(MaNganh like N'%' + @tim + '%' or TenNganh like N'%' + @tim + '%')

-- 24. Tìm thông tin Lớp 
create proc tim_Lop
@tim varchar(100)
as
select Lop.MaLop, Lop.TenLop, Lop.MaNganh, Nganh.TenNganh, Lop.MaKhoaHoc, Nganh.MaKhoa, Khoa.TenKhoa
from Nganh, KhoaHoc, Lop, Khoa
where Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa and
	  (MaLop like N'%' + @tim + '%' or TenLop like N'%' + @tim + '%')	

-- 25. Tìm thông tin Sinh viên
create proc tim_SinhVien
@tim varchar(100)
as
select SinhVien.MaSinhVien, SinhVien.HoTen, SinhVien.NgaySinh, SinhVien.GioiTinh, SinhVien.DanToc, SinhVien.SoCMND, SinhVien.TonGiao, SinhVien.SDT, SinhVien.Email, QueQuan.MaQueQuan, QueQuan.TenQueQuan, ChucVu.MaChucVu,ChucVu.TenChucVu, Lop.MaLop,Lop.TenLop,KhoaHoc.MaKhoaHoc, Khoa.TenKhoa, Nganh.TenNganh, TinhTrangHoc.MaTinhTrangHoc, TinhTrangHoc.TenTinhTrangHoc
from SinhVien,QueQuan, ChucVu, Lop, TinhTrangHoc, Nganh, Khoa, KhoaHoc
where SinhVien.MaQueQuan = QueQuan.MaQueQuan and
	  SinhVien.MaChucVu = ChucVu.MaChucVu and
	  SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
	  SinhVien.MaLop= Lop.MaLop and
	  Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa and
	  (MaSinhVien like N'%' + @tim + '%' or HoTen like N'%' + @tim + '%')
  
-- 26. Load thông tin quê quán
create proc load_QueQuan
as
select * from QueQuan

-- 27. Load thông tin chức vụ
create proc load_ChucVu
as
select * from ChucVu

-- 28. Load thông tin tình trạng học
create proc load_TinhTrangHoc
as
select * from TinhTrangHoc

-- 29. Tìm ngành khi biết khóa
create proc tim_NganhKhiBietKhoa
@tim varchar(100)
as
select Nganh.MaNganh, Nganh.MaKhoa, Khoa.TenKhoa, Nganh.TenNganh 
from Nganh, Khoa
where Nganh.MaKhoa = Khoa.MaKhoa and Khoa.MaKhoa= @tim

-- 30. Tìm lớp khi biết khóa và ngành
create proc tim_LopKhiBietKhoaVaNganh
@timKhoa varchar(100), 
@timNganh varchar(100)
as
select Lop.MaLop, Lop.TenLop, Lop.MaNganh, Nganh.TenNganh, Lop.MaKhoaHoc
from Nganh, KhoaHoc, Lop
where Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  KhoaHoc.MaKhoaHoc = @timKhoa and Nganh.MaNganh = @timNganh
	  
-- 31. Tìm sinh viên khi biết khoa và khóa hoc và ngành và lớp
create proc tim_SinhVienKhiBietKhoaVaNganhVaKhoaHocVaLop
@timKhoa varchar(100), 
@timNganh varchar(100),
@timKhoaHoc varchar(100), 
@timLop varchar(100)
as
select SinhVien.MaSinhVien, SinhVien.HoTen, SinhVien.NgaySinh, SinhVien.GioiTinh, SinhVien.DanToc, SinhVien.SoCMND, SinhVien.TonGiao, SinhVien.SDT, SinhVien.Email, QueQuan.MaQueQuan, QueQuan.TenQueQuan, ChucVu.MaChucVu,ChucVu.TenChucVu, Lop.MaLop,Lop.TenLop,KhoaHoc.MaKhoaHoc, Khoa.TenKhoa, Nganh.TenNganh, TinhTrangHoc.MaTinhTrangHoc, TinhTrangHoc.TenTinhTrangHoc
from SinhVien,QueQuan, ChucVu, Lop, TinhTrangHoc, Nganh, Khoa, KhoaHoc
where SinhVien.MaQueQuan = QueQuan.MaQueQuan and
	  SinhVien.MaChucVu = ChucVu.MaChucVu and
	  SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
	  SinhVien.MaLop= Lop.MaLop and
	  Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa and
	  Khoa.MaKhoa = @timKhoa and
	  Nganh.MaNganh = @timNganh and
	  KhoaHoc.MaKhoaHoc = @timKhoaHoc and
	  Lop.MaLop = @timLop
	  
-- 32. Load thông tin đăng nhập
create proc load_DangNhap
as
select * from DangNhap

-- 33. Thêm thông tin đăng nhập
create proc them_DangNhap
@tenDangNhap varchar(50),
@matKhau varchar(50),
@quyen varchar(10)
as
insert into DangNhap (TenDangNhap, MatKhau, Quyen)
values(@tenDangNhap, @matKhau, @quyen)

-- 34. Cập nhật thông tin đăng nhập
create proc capnhat_DangNhap
@tenDangNhap varchar(50),
@matKhau varchar(50),
@quyen varchar(10)
as
update DangNhap
set MatKhau = @matKhau,
	Quyen = @quyen
where TenDangNhap = @tenDangNhap

-- 35. Tìm thông tin đăng nhập
create proc tim_DangNhap
@tenDangNhap varchar(50)
as
select * from DangNhap where TenDangNhap = @tenDangNhap

-- 36. Xóa thông tin đăng nhập
create proc xoa_DangNhap
@tenDangNhap varchar(50)
as
delete DangNhap where TenDangNhap = @tenDangNhap
	  
-- 37. Thống kê 
create proc thongke
@maKhoa varchar(100),
@maNganh varchar(100),
@maKhoaHoc varchar(100)
as
select SinhVien.MaLop, Lop.TenLop,
	   count(case when SinhVien.MaTinhTrangHoc = 'CONHOC' then 1 else null end) as ConHoc,
	   count(case when SinhVien.MaTinhTrangHoc = 'CANHBAO' then 1 else null end) as CanhBao,
	   count(case when SinhVien.MaTinhTrangHoc = 'BUOCTHOIHOC' then 1 else null end) as BuocThoiHoc,
	   count(case when SinhVien.MaTinhTrangHoc = 'THOIHOC' then 1 else null end) as ThoiHoc,
	   count(case when SinhVien.MaTinhTrangHoc = 'TOTNGHIEP' then 1 else null end) as TotNghiep
from Khoa, Nganh, KhoaHoc, Lop, TinhTrangHoc, SinhVien	
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
	  SinhVien.MaLop= Lop.MaLop and
	  Lop.MaNganh = Nganh.MaNganh and
	  Lop.MaKhoaHoc = KhoaHoc.MaKhoaHoc and
	  Nganh.MaKhoa = Khoa.MaKhoa and
	  Khoa.MaKhoa = @maKhoa and
	  Nganh.MaNganh = @maNganh and
	  KhoaHoc.MaKhoaHoc = @maKhoaHoc 
group by SinhVien.MaLop, Lop.TenLop

-- 38. Cập nhật thông tin đăng nhập cho tài khoản
create proc capnhat_DangNhapTaiKhoan
@tenDangNhap varchar(50),
@matKhau varchar(50)
as
update DangNhap
set MatKhau = @matKhau
where TenDangNhap = @tenDangNhap

-- 39. Load tình trạng còn học
create proc load_ConHoc
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
		 SinhVien.MaTinhTrangHoc = 'CONHOC' and SinhVien.MaLop = @malop

--40. Load tình trạng cảnh báo
create proc load_CanhBao
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
		 SinhVien.MaTinhTrangHoc = 'CANHBAO' and SinhVien.MaLop = @malop

--41. Load tình trạng buộc thôi học
create proc load_BuocThoiHoc
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
		 SinhVien.MaTinhTrangHoc = 'BUOCTHOIHOC' and SinhVien.MaLop = @malop

--42. Load tình trạng tốt nghiệp
create proc load_TotNghiep
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
		 SinhVien.MaTinhTrangHoc = 'TOTNGHIEP' and SinhVien.MaLop = @malop

--43. Load tình trạng thôi học
create proc load_ThoiHoc
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and
		 SinhVien.MaTinhTrangHoc = 'THOIHOC' and SinhVien.MaLop = @malop
		 
-- 44. load tình trạng học
create proc load_tinhtranghoclop
@maLop varchar(100)
as
select ROW_NUMBER()OVER (ORDER BY MaSinhVien) AS STT, MaSinhVien, HoTen, TenTinhTrangHoc from SinhVien, TinhTrangHoc 
where SinhVien.MaTinhTrangHoc = TinhTrangHoc.MaTinhTrangHoc and SinhVien.MaLop = @malop

-- 45. Tìm tài khoản 
create proc tim_taikhoan
@tim varchar(100)
as
select * from DangNhap where TenDangNhap like N'%' + @tim + '%'







