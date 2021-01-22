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
    public partial class NganhHoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_Khoa();
                load_NganhHoc();
                Page.DataBind();
            }
        }

        DuLieuDataContext dl = new DuLieuDataContext();

        public void load_Khoa()
        {
            ddlTenKhoa.DataSource = dl.load_Khoa();
            ddlTenKhoa.DataTextField = "TenKhoa";
            ddlTenKhoa.DataValueField = "MaKhoa";
            ddlTenKhoa.DataBind();
        }

        public void load_NganhHoc()
        {
            dataNganh.DataSource = dl.load_Nganh();
            dataNganh.DataBind();
        }

        public bool KiemTra(string manganh)
        {
            var q = from kt in dl.Nganhs
                    where kt.MaNganh == txtMaNganh.Text 
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

        protected void btnThemNganh_Click(object sender, EventArgs e)
        {
            if (txtMaNganh.Text == "") 
            {
                ThongBao.Show("Không được bỏ trống");
                
            }
            else
            {
                if (KiemTra(txtMaNganh.Text))
                {

                    ThongBao.Show("Đã tồn tại");
                }
                else
                {
                    dl.them_Nganh(txtMaNganh.Text, ddlTenKhoa.SelectedValue.ToString(), txtTenNganh.Text);
                    ThongBao.Show("Thêm thành công");
                    load_Khoa();
                    load_NganhHoc();
                }
            }
        }

        protected void btnCapNhapNganh_Click(object sender, EventArgs e)
        {
            dl.capnhat_Nganh(txtMaNganh.Text, ddlTenKhoa.SelectedValue.ToString(), txtTenNganh.Text);
            ThongBao.Show("Cập nhật thành công");
            load_Khoa();
            load_NganhHoc();
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            string manganh;
            string makhoa;
            string tennganh;
            string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));
            FileUploadExcel.SaveAs(path);

            string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = excelConnectionString;
            OleDbCommand cmd = new OleDbCommand("select [MaNganh], [MaKhoa], [TenNganh] from [Sheet1$]", connection);
            connection.Open();
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                manganh = dr[0].ToString();
                makhoa = dr[1].ToString();
                tennganh = dr[2].ToString();
                savedata(manganh, makhoa, tennganh);
            }
            ThongBao.Show("Thành công");
            load_NganhHoc();
        }

        private void savedata(string manganh, string makhoa, string tennganh)
        {
            string sql = "insert into Nganh (MaNganh, MaKhoa, TenNganh) values ('" + manganh + "', '" + makhoa + "', N'" + tennganh + "')";
            string mycon = "Data Source=LAPTOP-DN0FAVIM\\SQLEXPRESS;Initial Catalog=Cong_Nghe_Net;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void dataNganh_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataNganh.SelectedRow;
            txtMaNganh.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).ToString();
            txtTenNganh.Text = HttpUtility.HtmlDecode(row.Cells[3].Text).ToString();
            ddlTenKhoa.Items.Add(row.Cells[0].Text);
        }

        protected void dataNganh_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dl.xoa_Nganh(dataNganh.Rows[e.RowIndex].Cells[2].Text);
            load_Khoa();
            load_NganhHoc();
            ThongBao.Show("Xóa thành công");
        }

        protected void dataNganh_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dataNganh.PageIndex = e.NewPageIndex;
            this.load_Khoa();
            this.load_NganhHoc();
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.load_Khoa();
            this.load_NganhHoc();
            txtMaNganh.Text = "";
            txtTenNganh.Text = "";
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            if(txtTimKiem.Text == "")
            {
                ThongBao.Show("Cần nhập thông tin tìm kiếm");
            }
            else
            {

                dataNganh.DataSource = dl.tim_Nganh(txtTimKiem.Text);
                dataNganh.DataBind();
            }
        }
    }
}