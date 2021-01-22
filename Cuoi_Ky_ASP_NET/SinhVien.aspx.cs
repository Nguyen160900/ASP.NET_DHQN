using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class SinhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_Khoa();
                load_KhoaHoc();
                Page.DataBind();
            }
        }

        DuLieuDataContext dl = new DuLieuDataContext();
        public void load_Khoa()
        {
            ddlKhoa.DataSource = dl.load_Khoa();
            ddlKhoa.DataTextField = "TenKhoa";
            ddlKhoa.DataValueField = "MaKhoa";
            ddlKhoa.DataBind();
        }

        public void load_KhoaHoc()
        {
            ddlkhoahoc.DataSource = dl.load_KhoaHoc();
            ddlkhoahoc.DataTextField = "MaKhoaHoc";
            ddlkhoahoc.DataValueField = "MaKhoaHoc";
            ddlkhoahoc.DataBind();
        }

        public void load_nganh()
        {
            ddlnganh.DataSource = dl.tim_NganhKhiBietKhoa(ddlKhoa.SelectedValue);
            ddlnganh.DataTextField = "TenNganh";
            ddlnganh.DataValueField = "MaNganh";
            ddlnganh.DataBind();
        }

        public void load_lop()
        {
            ddllop.DataSource = dl.tim_LopKhiBietKhoaVaNganh(ddlkhoahoc.SelectedValue, ddlnganh.SelectedValue);
            ddllop.DataTextField = "TenLop";
            ddllop.DataValueField = "Malop";
            ddllop.DataBind();
        }

        protected void ddlKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_nganh();
        }

        protected void ddlkhoahoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_lop();
        }

        protected void ddllop_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdsinhvien.DataSource = dl.tim_SinhVienKhiBietKhoaVaNganhVaKhoaHocVaLop(ddlKhoa.SelectedValue, ddlnganh.SelectedValue, ddlkhoahoc.SelectedValue, ddllop.SelectedValue);
            grdsinhvien.DataBind();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            grdsinhvien.DataSource = dl.tim_SinhVienKhiBietKhoaVaNganhVaKhoaHocVaLop(ddlKhoa.SelectedValue, ddlnganh.SelectedValue, ddlkhoahoc.SelectedValue, ddllop.SelectedValue);
            grdsinhvien.DataBind();
        }

        protected void grdsinhvien_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grdsinhvien.SelectedRow;
            Session["masv"] = HttpUtility.HtmlDecode(row.Cells[0].Text).ToString();
            Response.Redirect("ChinhSuaSinhVien.aspx");
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            try
            {
                string masv;
                string hoten;
                string ngaysinh;
                string gioitinh;
                string dantoc;
                string socmnd;
                string tongiao;
                string maquequan;
                string sdt;
                string email;
                string machucvu;
                string malop;
                string matinhtranghoc;
                string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));
                FileUploadExcel.SaveAs(path);

                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand cmd = new OleDbCommand("select [MaSinhVien], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [SoCMND], [TonGiao], [MaQueQuan], [SDT], [Email], [MaChucVu], [MaLop], [MaTinhTrangHoc] from [Sheet1$]", connection);
                connection.Open();
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    masv = dr[0].ToString();
                    hoten = dr[1].ToString();
                    ngaysinh = dr[2].ToString();
                    gioitinh = dr[3].ToString();
                    dantoc = dr[4].ToString();
                    socmnd = dr[5].ToString();
                    tongiao = dr[6].ToString();
                    maquequan = dr[7].ToString();
                    sdt = dr[8].ToString();
                    email = dr[9].ToString();
                    machucvu = dr[10].ToString();
                    malop = dr[11].ToString();
                    matinhtranghoc = dr[12].ToString();
                    savedata(masv, hoten, ngaysinh, gioitinh, dantoc, socmnd, tongiao, maquequan, sdt, email, machucvu, malop, matinhtranghoc);
                }
                ThongBao.Show("Thành công");
                load_Khoa();
                load_KhoaHoc();
            }
            catch
            {
                Response.Redirect(Request.RawUrl);
            }
            
        }

        private void savedata(string masv, string hoten, string ngaysinh, string gioitinh, string dantoc, string socmnd, string tongiao, string maquequan, string sdt, string email, string machucvu, string malop, string matinhtranghoc)
        {
            string sql = "insert into SinhVien (MaSinhVien, HoTen, NgaySinh, GioiTinh, DanToc, SoCMND, TonGiao, MaQueQuan, SDT, Email, MaChucVu, MaLop, MaTinhTrangHoc) " +
                          "values ('" + masv + "', N'" + hoten + "', '" + ngaysinh + "', N'" + gioitinh + "', N'" + dantoc + "', '" + socmnd + "', N'" + tongiao + "', '" + maquequan + "', '" + sdt + "', '" + email + "', '" + machucvu + "', '" + malop + "', '" + matinhtranghoc + "')";
            string mycon = "Data Source=LAPTOP-DN0FAVIM\\SQLEXPRESS;Initial Catalog=Cong_Nghe_Net;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void btnThemSV_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemSV.aspx");
        }

        protected void grdsinhvien_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dl.xoa_SinhVien(grdsinhvien.Rows[e.RowIndex].Cells[0].Text);
            load_Khoa();
            load_KhoaHoc();
            ThongBao.Show("Xóa thành công");
            grdsinhvien.DataSource = dl.tim_SinhVienKhiBietKhoaVaNganhVaKhoaHocVaLop(ddlKhoa.SelectedValue, ddlnganh.SelectedValue, ddlkhoahoc.SelectedValue, ddllop.SelectedValue);
            grdsinhvien.DataBind();
        }

        protected void btnTimKiemSV_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text == "")
            {
                ThongBao.Show("Bạn cần phải nhập thông tin tìm kiếm ");
            }      
            else
            {
                grdsinhvien.DataSource = dl.tim_SinhVien(txtTimKiem.Text);
                grdsinhvien.DataBind();
            }    
        }
    }
}