using NPOI.SS.UserModel;
using NPOI.SS.Util;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class ChiTietTinhTrangHoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string malop = Session["malop"].ToString();
            var sql = from kt in dl.Lops
                      where kt.MaLop == malop
                      select kt.TenLop;
            foreach(var tmp in sql)
            {
                lblLop.Text = "Chi tiết tình trạng học lớp " + tmp.ToString();
            }    
            

            if (!IsPostBack)
            {
                load_TinhTrangHocCuaLop();
                Page.DataBind();
            }
        }
        DuLieuDataContext dl = new DuLieuDataContext();

        public void load_ConHoc()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_ConHoc(malop);
            data.DataBind();
        }

        public void load_BuocThoiHoc()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_BuocThoiHoc(malop);
            data.DataBind();
        }

        public void load_ThoiHoc()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_ThoiHoc(malop);
            data.DataBind();
        }

        public void load_CanhBao()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_CanhBao(malop);
            data.DataBind();
        }

        public void load_TotNghiep()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_TotNghiep(malop);
            data.DataBind();
        }

        public void load_TinhTrangHocCuaLop()
        {
            string malop = Session["malop"].ToString();
            data.DataSource = dl.load_tinhtranghoclop(malop);
            data.DataBind();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "TatCa")
            {
                load_TinhTrangHocCuaLop();
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "ConHoc")
            {
                load_ConHoc();
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "BuocThoiHoc")
            {
                load_BuocThoiHoc();
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "ThoiHoc")
            {
                load_ThoiHoc();
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "CanhBao")
            {
                load_CanhBao();
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "TotNghiep")
            {
                load_TotNghiep();
            }
        }

        protected void btnIn_Click(object sender, EventArgs e)
        {
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "TatCa")
            {
                string malop = Session["malop"].ToString();
                var tatca = dl.load_tinhtranghoclop(malop);

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in tatca)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "ConHoc")
            {
                string malop = Session["malop"].ToString();
                var conhoc = dl.load_ConHoc(malop); ;

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in conhoc)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "BuocThoiHoc")
            {
                string malop = Session["malop"].ToString();
                var buocthoihoc = dl.load_BuocThoiHoc(malop);

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in buocthoihoc)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "ThoiHoc")
            {
                string malop = Session["malop"].ToString();
                var thoihoc = dl.load_ThoiHoc(malop);

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in thoihoc)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "CanhBao")
            {
                string malop = Session["malop"].ToString();
                var canhbao = dl.load_CanhBao(malop);

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in canhbao)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
            if (ChonTinhTrangHoc.SelectedValue.ToString() == "TotNghiep")
            {
                string malop = Session["malop"].ToString();
                var totnghiep = dl.load_TotNghiep(malop);

                XSSFWorkbook wb = new XSSFWorkbook();

                // Tạo ra 1 sheet
                ISheet sheet = wb.CreateSheet();

                // Bắt đầu ghi lên sheet

                // Tạo row
                var row0 = sheet.CreateRow(0);
                // Merge lại row đầu 3 cột
                row0.CreateCell(0); // tạo ra cell trc khi merge
                CellRangeAddress cellMerge = new CellRangeAddress(0, 0, 0, 3);
                sheet.AddMergedRegion(cellMerge);
                row0.GetCell(0).SetCellValue("TÌNH TRẠNG HỌC SINH VIÊN LỚP " + malop);

                // Ghi tên cột ở row 1
                var row1 = sheet.CreateRow(2);
                row1.CreateCell(0).SetCellValue("STT");
                row1.CreateCell(1).SetCellValue("Mã sinh viên");
                row1.CreateCell(2).SetCellValue("Họ tên sinh viên");
                row1.CreateCell(3).SetCellValue("Tình trạng học");

                // bắt đầu duyệt mảng và ghi tiếp tục
                int rowIndex = 3;
                foreach (var item in totnghiep)
                {
                    // tao row mới
                    var newRow = sheet.CreateRow(rowIndex);

                    // set giá trị
                    newRow.CreateCell(0).SetCellValue((double)item.STT);
                    newRow.CreateCell(1).SetCellValue(item.MaSinhVien);
                    newRow.CreateCell(2).SetCellValue(item.HoTen);
                    newRow.CreateCell(3).SetCellValue(item.TenTinhTrangHoc);

                    // tăng index
                    rowIndex++;
                }

                // xong hết thì save file lại
                FileStream fs = new FileStream(@"D:\TINHTRANGHOC-" + malop + ".xlsx", FileMode.CreateNew);
                wb.Write(fs);
            }
        }

        protected void btnTroVe_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongKe.aspx");
        }
    }
}