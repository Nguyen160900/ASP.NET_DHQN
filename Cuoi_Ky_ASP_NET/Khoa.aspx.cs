using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class Khoa : System.Web.UI.Page
    {
        DuLieuDataContext dl = new DuLieuDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_Khoa();
                Page.DataBind();
            }    
        }

        public void load_Khoa()
        {
            dataKhoa.DataSource = dl.load_Khoa();
            dataKhoa.DataBind();
        }

        public bool KiemTra(string makhoa)
        {
            var q = from kt in dl.Khoas
                    where kt.MaKhoa == txtMaKhoa.Text
                    select kt;
            if (q.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnThemKhoa_Click(object sender, EventArgs e)
        {
            if (!KiemTra(txtMaKhoa.Text))
            {
                if (!(txtMaKhoa.Text == "" || txtTenKhoa.Text == "" || txtSDT.Text == "" || txtDiaChi.Text == ""))
                {
                    dl.them_Khoa(txtMaKhoa.Text, txtTenKhoa.Text, txtSDT.Text, txtDiaChi.Text);
                    ThongBao.Show("Thêm thành công");
                    load_Khoa();
                }
                else
                {
                    ThongBao.Show("Không được bỏ trống!!!");
                }
            }
            else
            {
                ThongBao.Show("Mã khoa đã tồn tại");
            }
        }

        protected void btnCapNhapKhoa_Click(object sender, EventArgs e)
        {
            dl.capnhat_Khoa(txtMaKhoa.Text, txtTenKhoa.Text, txtSDT.Text, txtDiaChi.Text);
            ThongBao.Show("Cập nhật thành công");
            load_Khoa();
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            load_Khoa();
            txtMaKhoa.Text = "";
            txtTenKhoa.Text = "";
            txtSDT.Text = "";
            txtDiaChi.Text = "";
        }

        protected void dataKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataKhoa.SelectedRow;
            txtMaKhoa.Text = HttpUtility.HtmlDecode(row.Cells[0].Text).ToString();
            txtTenKhoa.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).ToString();
            txtSDT.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).ToString();
            txtDiaChi.Text = HttpUtility.HtmlDecode(row.Cells[3].Text).ToString();
        }

        protected void dataKhoa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dataKhoa.PageIndex = e.NewPageIndex;
            this.load_Khoa();
        }

        protected void dataKhoa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //string makhoa = dataKhoa.Rows[e.RowIndex].Cells[0].Text;
            dl.xoa_Khoa(dataKhoa.Rows[e.RowIndex].Cells[0].Text);
            ThongBao.Show("Xóa thành công");
            load_Khoa();
        }

        protected void btnUpLoadFile_Click(object sender, EventArgs e)
        {
            if (FileUploadExcel.ToString() == "")
            {
                ThongBao.Show("Không có file excel");
            }
            else
            {
                string makhoa;
                string tenkhoa;
                string sdt;
                string diachi;
                string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));
                FileUploadExcel.SaveAs(path);

                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand cmd = new OleDbCommand("select [MaKhoa],[TenKhoa],[SDT],[DiaChi] from [Sheet1$]", connection);
                connection.Open();
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    makhoa = dr[0].ToString();
                    tenkhoa = dr[1].ToString();
                    sdt = dr[2].ToString();
                    diachi = dr[3].ToString();
                    savedata(makhoa, tenkhoa, sdt, diachi);
                }
                ThongBao.Show("Thành công");
                load_Khoa();
            }
        }

        private void savedata(string makhoa, string tenkhoa, string sdt, string diachi)
        {
            string sql = "insert into Khoa (MaKhoa, TenKhoa, SDT, DiaChi) values ('" + makhoa + "', N'" + tenkhoa + "', '" + sdt + "', N'" + diachi + "')";
            string mycon = "Data Source=LAPTOP-DN0FAVIM\\SQLEXPRESS;Initial Catalog=Cong_Nghe_Net;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            if(txtTimKiem.Text == "")
            {
                ThongBao.Show("Bạn cần nhập thông tin tìm kiếm");
            }   
            else
            {
                dataKhoa.DataSource = dl.tim_Khoa(txtTimKiem.Text);
                dataKhoa.DataBind();
            }    
        }
    }
}