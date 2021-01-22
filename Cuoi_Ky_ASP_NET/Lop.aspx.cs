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
    public partial class Lop : System.Web.UI.Page
    {
        DuLieuDataContext dl = new DuLieuDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_Khoa();
                load_Lop();
                load_NganhHoc();
                load_KhoaHoc();
                Page.DataBind();
            }
        }

        public void load_Lop()
        {
            dataLop.DataSource = dl.load_Lop();
            dataLop.DataBind();
        }

        public void load_Nganh()
        {
            dropNganh.DataSource = dl.tim_NganhKhiBietKhoa(dropKhoa.SelectedValue);
            dropNganh.DataValueField = "MaNganh";
            dropNganh.DataTextField = "TenNganh";
            dropNganh.DataBind();
        }

        public void load_NganhHoc()
        {
            dropNganh.DataSource = dl.load_Nganh();
            dropNganh.DataValueField = "MaNganh";
            dropNganh.DataTextField = "TenNganh";
            dropNganh.DataBind();
        }

        public void load_Khoa()
        {
            dropKhoa.DataSource = dl.load_Khoa();
            dropKhoa.DataValueField = "MaKhoa";
            dropKhoa.DataTextField = "TenKhoa";
            dropKhoa.DataBind();
        }

        public void load_KhoaHoc()
        {
            dropKhoaHoc.DataSource = dl.load_KhoaHoc();
            dropKhoaHoc.DataValueField = "MaKhoaHoc";
            dropKhoaHoc.DataTextField = "MaKhoaHoc";
            dropKhoaHoc.DataBind();
        }
        public bool KiemTra(string malop)
        {
            var q = from kt in dl.Lops
                    where kt.MaLop == txtMaLop.Text
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!KiemTra(txtMaLop.Text))
            {
                if (!(txtMaLop.Text == "" || txtTenLop.Text == ""))
                {
                    dl.them_Lop(txtMaLop.Text, dropNganh.SelectedValue.ToString(), dropKhoaHoc.SelectedValue.ToString(), txtTenLop.Text);
                    ThongBao.Show("Thêm thành công");
                    load_Lop();
                    load_NganhHoc();
                    load_KhoaHoc();
                    load_Khoa();
                }
                else
                {
                    ThongBao.Show("Không được bỏ trống!!!");
                }
            }
            else
            {
                ThongBao.Show("Mã Lớp học đã tồn tại");
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            dl.capnhat_Lop(txtMaLop.Text, dropNganh.SelectedValue.ToString(), dropKhoaHoc.SelectedValue.ToString(), txtTenLop.Text);
            ThongBao.Show("Cập nhật thành công");
            load_Lop();
            load_NganhHoc();
            load_KhoaHoc();
            load_Khoa();
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            load_Lop();
            load_NganhHoc();
            load_KhoaHoc();
            load_Khoa();
            txtMaLop.Text = "";
            txtTenLop.Text = "";
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            try
            {
                string malop;
                string manganh;
                string makhoahoc;
                string tenlop;
                string path = string.Concat(Server.MapPath("~/Files/" + FileUploadExcel.FileName));
                FileUploadExcel.SaveAs(path);

                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties= Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand cmd = new OleDbCommand("select [MaLop], [MaNganh], [MaKhoaHoc], [TenLop] from [Sheet1$]", connection);
                connection.Open();
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    malop = dr[0].ToString();
                    manganh = dr[1].ToString();
                    makhoahoc = dr[2].ToString();
                    tenlop = dr[3].ToString();
                    savedata(malop, manganh, makhoahoc, tenlop);
                }
                ThongBao.Show("Thành công");
                load_Khoa();
                load_Lop();
                load_NganhHoc();
                load_KhoaHoc();
                
            }
            catch
            {
                //ThongBao.Show("Xin chờ giây lát");
                //Response.Redirect("Lop.aspx");
                Response.Redirect(Request.RawUrl);
            }
            
        }

        private void savedata(string malop, string manganh, string makhoahoc, string tenlop)
        {
            if(malop == " " || manganh == " " || makhoahoc == " " || tenlop == " " )
            {
                ThongBao.Show("Không có dữ liệu");
            }    
            else
            {
                string sql = "insert into Lop (MaLop, MaNganh, MaKhoaHoc, TenLop) values ('" + malop + "', '" + manganh + "', '" + makhoahoc + "', N'" + tenlop + "')";
                string mycon = "Data Source=LAPTOP-DN0FAVIM\\SQLEXPRESS;Initial Catalog=Cong_Nghe_Net;Integrated Security=True";
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }    
            
        }

        protected void dropKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_Nganh();
        }

        protected void dataLop_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dataLop.PageIndex = e.NewPageIndex;
            this.load_Lop();
            this.load_NganhHoc();
            this.load_KhoaHoc();
            this.load_Khoa();
        }

        protected void dataLop_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string malop = dataLop.Rows[e.RowIndex].Cells[5].Text;
            dl.xoa_Lop(malop);
            ThongBao.Show("Xóa thành công");
            load_Lop();
            load_NganhHoc();
            load_KhoaHoc();
            load_Khoa();
        }

        protected void dataLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataLop.SelectedRow;
            dropKhoa.SelectedValue = HttpUtility.HtmlDecode(row.Cells[0].Text.ToString());
            dropNganh.SelectedValue = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());
            dropKhoaHoc.SelectedValue = HttpUtility.HtmlDecode(row.Cells[4].Text.ToString());
            //dropKhoa.Items.Add(HttpUtility.HtmlDecode(row.Cells[1].Text.ToString()));
            //dropNganh.Items.Add(HttpUtility.HtmlDecode(row.Cells[2].Text.ToString()));
            //dropKhoaHoc.Items.Add(HttpUtility.HtmlDecode(row.Cells[4].Text.ToString()));
            txtMaLop.Text = HttpUtility.HtmlDecode(row.Cells[5].Text).ToString();
            txtTenLop.Text = HttpUtility.HtmlDecode(row.Cells[6].Text).ToString();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            if(txtTimKiem.Text == "")
            {
                ThongBao.Show("Bạn cần nhập thông tin tìm kiếm");
            }
            else
            {
                dataLop.DataSource = dl.tim_Lop(txtTimKiem.Text);
                dataLop.DataBind();
            }
        }
    }
}