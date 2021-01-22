using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class TrangChung : System.Web.UI.MasterPage
    {
        DuLieuDataContext dl = new DuLieuDataContext();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string ten = Session["tendangnhap"].ToString();
            string pass = Session["matkhau"].ToString();

            lblTenDangNhap.Text = "Mã đăng nhập: " + ten;

            if (KTraQuyen(ten))
            {
                LinkDangNhap.Visible = false;
            }    
        }

        public bool KTraQuyen(string ten)
        {
            //string ten = Session["tendangnhap"].ToString();
            var kq = from kt in dl.DangNhaps
                     where kt.Quyen == "User" && kt.TenDangNhap == ten
                     select kt.Quyen;

            if (kq.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}