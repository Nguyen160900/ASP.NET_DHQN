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
    public partial class KhoaHoc : System.Web.UI.Page
    {
        DuLieuDataContext dl = new DuLieuDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_KhoaHoc();
                Page.DataBind();
            }
        }

        public void load_KhoaHoc()
        {
            dataKhoaHoc.DataSource = dl.load_KhoaHoc();
            dataKhoaHoc.DataBind();
        }

        public bool KiemTra(string makhoahoc)
        {
            var q = from kt in dl.KhoaHocs
                    where kt.MaKhoaHoc == txtMaKhoaHoc.Text
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

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            load_KhoaHoc();
            txtMaKhoaHoc.Text = "";
            txtNamBatDau.Text = "";
            txtNamKetThuc.Text = "";
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            dl.capnhat_KhoaHoc(txtMaKhoaHoc.Text, int.Parse(txtNamBatDau.Text), int.Parse(txtNamKetThuc.Text));
            ThongBao.Show("Cập nhật thành công");
            load_KhoaHoc();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!KiemTra(txtMaKhoaHoc.Text))
            {
                if (!(txtMaKhoaHoc.Text == "" || txtNamBatDau.Text == "" || txtNamKetThuc.Text == ""))
                {
                    dl.them_KhoaHoc(txtMaKhoaHoc.Text, int.Parse(txtNamBatDau.Text), int.Parse(txtNamKetThuc.Text));
                    ThongBao.Show("Thêm thành công");
                    load_KhoaHoc();
                }
                else
                {
                    ThongBao.Show("Không được bỏ trống!!!");
                }
            }
            else
            {
                ThongBao.Show("Mã khóa học đã tồn tại");
            }
        }

        protected void dataKhoaHoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dataKhoaHoc.PageIndex = e.NewPageIndex;
            this.load_KhoaHoc();
        }

        protected void dataKhoaHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dl.xoa_KhoaHoc(dataKhoaHoc.Rows[e.RowIndex].Cells[0].Text);
            ThongBao.Show("Xóa thành công");
            load_KhoaHoc();
        }

        protected void dataKhoaHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataKhoaHoc.SelectedRow;
            txtMaKhoaHoc.Text = HttpUtility.HtmlDecode(row.Cells[0].Text).ToString();
            txtNamBatDau.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).ToString();
            txtNamKetThuc.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).ToString();
        }

        protected void btnUpLoadFile_Click(object sender, EventArgs e)
        {
            string makhoahoc;
            int nambatdau;
            int namketthuc;
            string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));/*Nối 2 chuỗi lại vs nhau*/
            FileUploadExcel.SaveAs(path);

            string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = excelConnectionString;
            OleDbCommand cmd = new OleDbCommand("select [MaKhoaHoc], [NamBatDau], [NamKetThuc] from [Sheet1$]", connection);
            connection.Open();
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                makhoahoc = dr[0].ToString();
                nambatdau = int.Parse(dr[1].ToString());
                namketthuc = int.Parse(dr[2].ToString());
                savedata(makhoahoc, nambatdau, namketthuc);
            }
            ThongBao.Show("Thành công");
            load_KhoaHoc();
            Response.Redirect(Request.RawUrl);
        }

        private void savedata(string makhoahoc, int nambatdau, int namketthuc)
        {
            string sql = "insert into KhoaHoc (MaKhoaHoc, NamBatDau, NamKetThuc) values ('" + makhoahoc + "', '" + nambatdau + "', '" + namketthuc + "')";
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
                dataKhoaHoc.DataSource = dl.tim_KhoaHoc(txtTimKiem.Text);
                dataKhoaHoc.DataBind();
            }    
        }
    }
}