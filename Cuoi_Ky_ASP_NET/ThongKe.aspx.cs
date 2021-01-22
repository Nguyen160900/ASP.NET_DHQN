using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class ThongKe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_Khoa();
                load_KhoaHoc();
                Page.DataBind();
            }    
        }

        DuLieuDataContext dl = new DuLieuDataContext();

        public void load_Khoa()
        {
            dropKhoa.DataSource = dl.load_Khoa();
            dropKhoa.DataTextField = "TenKhoa";
            dropKhoa.DataValueField = "MaKhoa";
            dropKhoa.DataBind();
        }

        public void load_nganh()
        {
            dropNganh.DataSource = dl.tim_NganhKhiBietKhoa(dropKhoa.SelectedValue);
            dropNganh.DataTextField = "TenNganh";
            dropNganh.DataValueField = "MaNganh";
            dropNganh.DataBind();
        }

        public void load_KhoaHoc()
        {
            dropKhoaHoc.DataSource = dl.load_KhoaHoc();
            dropKhoaHoc.DataValueField = "MaKhoaHoc";
            dropKhoaHoc.DataTextField = "MaKhoaHoc";
            dropKhoaHoc.DataBind();
        }

        protected void btnThongKe_Click(object sender, EventArgs e)
        {
            dataThongKe.DataSource = dl.thongke(dropKhoa.SelectedValue, dropNganh.SelectedValue, dropKhoaHoc.SelectedValue);
            dataThongKe.DataBind();
        }

        protected void dropKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_nganh();
        }

        protected void dataThongKe_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dataThongKe.SelectedRow;
            Session["malop"] = HttpUtility.HtmlDecode(row.Cells[0].Text).ToString();
            Response.Redirect("ChiTietTinhTrangHoc.aspx");
        }

        protected void dropKhoaHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataThongKe.DataSource = dl.thongke(dropKhoa.SelectedValue, dropNganh.SelectedValue, dropKhoaHoc.SelectedValue);
            dataThongKe.DataBind();
        }
    }
}