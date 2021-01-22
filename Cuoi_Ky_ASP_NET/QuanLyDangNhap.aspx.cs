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
    public partial class QuanLyDangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_DangNhap();
            }
        }

        DuLieuDataContext dl = new DuLieuDataContext();

        public void load_DangNhap()
        {
            dataDangNhap.DataSource = dl.load_DangNhap();
            dataDangNhap.DataBind();
        }

        public bool KiemTra(string tentaikhoan)
        {
            var q = from kt in dl.DangNhaps
                    where kt.TenDangNhap == txtTenDangNhap.Text
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

        protected void dataDangNhap_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataDangNhap.SelectedRow;
            txtTenDangNhap.Text = HttpUtility.HtmlDecode(row.Cells[0].Text).ToString();
            txtMatKhau.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).ToString();
            //dropQuyen.Items.Add(row.Cells[2].Text);
            dropQuyen.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).ToString();
        }

        protected void dataDangNhap_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = dataDangNhap.Rows[e.RowIndex].Cells[0].Text;
            dl.xoa_DangNhap(username);
            load_DangNhap();
            ThongBao.Show("Xóa thành công");
        }

        protected void dataDangNhap_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dataDangNhap.PageIndex = e.NewPageIndex;
            this.load_DangNhap();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!KiemTra(txtTenDangNhap.Text))
            {
                if (!(txtTenDangNhap.Text == "") || !(txtMatKhau.Text == "") || !(txtReMatKhau.Text == ""))
                {
                    if (txtMatKhau.Text != txtReMatKhau.Text)
                    {
                        ThongBao.Show("Mật khẩu và Nhập lại mật khẩu không khớp");
                    }
                    else
                    {
                        dl.them_DangNhap(txtTenDangNhap.Text, txtReMatKhau.Text, dropQuyen.SelectedValue);
                        ThongBao.Show("Đăng ký thành công");
                        load_DangNhap();
                    }
                }
                else
                {
                    ThongBao.Show("Không được bỏ trống");
                }
            }
            else
            {
                ThongBao.Show("Tên đăng nhập tồn tại");
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMatKhau.Text == txtReMatKhau.Text)
            {
                dl.capnhat_DangNhap(txtTenDangNhap.Text, txtReMatKhau.Text, dropQuyen.SelectedValue);
                ThongBao.Show("Cập nhật thành công");
                load_DangNhap();
            }
            else
                ThongBao.Show("Cập nhật thất bại");
        }

        protected void btnUpLoadFile_Click(object sender, EventArgs e)
        {
            try
            {
                string tendangnhap;
                string matkhau;
                string quyen;
                string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));
                FileUploadExcel.SaveAs(path);

                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand cmd = new OleDbCommand("select * from [sheet1$]", connection);
                connection.Open();
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    tendangnhap = dr[0].ToString();
                    matkhau = dr[1].ToString();
                    quyen = dr[2].ToString();
                    savedata(tendangnhap, matkhau, quyen);
                }
                ThongBao.Show("Thành công");
                load_DangNhap();
            }
            catch
            {
                ThongBao.Show("Lỗi!!!");
            }
        }

        private void savedata(string tendangnhap, string matkhau, string quyen)
        {
            string sql = "insert into DangNhap (TenDangNhap, MatKhau, Quyen) values ('" + tendangnhap + "', '" + matkhau + "', '" + quyen + "')";
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
                ThongBao.Show("Vui lòng nhập thông tin cần tìm kiếm");
            }   
            else
            {
                dataDangNhap.DataSource = dl.tim_taikhoan(txtTimKiem.Text);
                dataDangNhap.DataBind();
            }    
            
        }
    }
}